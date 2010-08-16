#!/usr/bin/env ruby
require 'digest/sha1'
require 'app'

if ARGV.size < 1
  warn 'No password given!'
  warn 'Usage: password.rb <password>'
  exit 1
end

password = ARGV[0]
puts Digest::SHA1.hexdigest(SALT + password)