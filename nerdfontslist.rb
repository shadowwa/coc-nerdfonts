#!/usr/bin/env ruby


require 'open-uri'
require 'json'

File.open('nerdfonts.txt', 'w') do |out|
  URI.open(ARGV[1] || 'https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json') do |f|
    JSON.parse(f.read).each do |(name, subkey)|
      next unless subkey['char']
      out.puts "nf-#{name}:#{subkey['char']}"
    end
  end
end
