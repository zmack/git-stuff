#!/usr/bin/env ruby

require 'open-uri'

commits = ARGV[0].to_i


commits.times do |index|
  File.open('content.txt', 'a') do |f|
    f.write("#{index}\n")
  end
  `git add content.txt && git commit -m "#{open('http://whatthecommit.com/index.txt').read}"`
end

puts "Spawned #{commits} commits"
