#!/usr/bin/env ruby

require 'open-uri'

commits = ARGV[0].to_i
noconflict = ARGV[1] == 'noconflict'


def commit_noconflict(index)
  filename = Time.now.to_f
  `touch #{filename} && git add #{filename}`
end

def commit_conflict(index)
  File.open('content.txt', 'a') do |f|
    f.write("#{index}\n")
  end
  `git add content.txt`
end

commits.times do |index|
  if noconflict 
    commit_noconflict(index)
  else
    commit_conflict(index)
  end
  `git commit -m "#{open('http://whatthecommit.com/index.txt').read}"`
end

puts "Spawned #{commits} commits"
