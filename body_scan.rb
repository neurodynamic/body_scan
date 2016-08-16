#!/usr/bin/env ruby

require_relative 'round'

duration = ARGV.find { |arg| arg =~ /^\d+s?$/ }
start_at = ARGV.find { |arg| arg =~ /^(top)|(bottom)/ }

Round.new(duration, start_at).run
