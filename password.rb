#!/usr/bin/env ruby

SALT = 'ytlas-123'

if __FILE__ == $0
  require 'digest/sha1'

  if ARGV.size < 1
    warn 'No password given!'
    warn 'Usage: password.rb <password>'
    exit 1
  end

  password = ARGV[0]
  puts Digest::SHA1.hexdigest(SALT + password)
end