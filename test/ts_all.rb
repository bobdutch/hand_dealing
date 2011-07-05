#!/usr/bin/env ruby
test_cases = Dir.glob(File.join(File.dirname(__FILE__), 'tc_*.rb'))
test_cases.each do |tc|
  require File.expand_path(tc)
end

