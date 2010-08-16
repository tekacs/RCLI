require 'rubygems'
require 'haml'
require 'digest/sha1'
require 'sinatra/base'

require 'stringio'

SALT = 'ytlas-123'

module Kernel
  def capture_stdout(setup, command)
    out = StringIO.new
    begin
      x = eval(setup + "$stdout = out\n" + command)
      @returnable = "S#{out.string}=> #{x.inspect || 'nil'}"
    rescue Exception => e
      if e.class == SyntaxError && e.to_s =~ /unexpected \$end/
        @returnable = "I"
      else
        @returnable =
          "E#{e.to_s.gsub(/\#\<Sinatra::Application:.+\>/,"main:Object")}"
      end
    end
  ensure
    $stdout = STDOUT
    return @returnable || "E"
  end
end

class RCLI < Sinatra::Base
  include Rack::Utils

  set :environment,   ENV['RACK_ENV'].to_sym
  set :root,          File.dirname(__FILE__)
  enable              :static

  # Use password.rb to generate the credentials and store them in environment
  # variables.
  CREDENTIALS = [ENV['USERNAME'], ENV['PASSWORD']]

  helpers do
    def protected!
      unless authorised?
        response['WWW-Authenticate'] = %(Basic realm="Protected Area")
        throw(:halt, [401, "Unauthorised\n"])
      end
    end

    def authorised?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      if @auth.provided? && @auth.basic? && @auth.credentials
        username = @auth.credentials[0]
        password = Digest::SHA1.hexdigest(SALT + @auth.credentials[1])
        return [username, password] == CREDENTIALS
      else
        return false
      end
    end
  end

  before do
    protected!
  end

  get '/style.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :style
  end

  get '/' do
    haml :index
  end

  post '/update' do
    capture_stdout(params[:pre_input], params[:input])
  end
end