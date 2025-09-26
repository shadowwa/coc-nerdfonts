#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open-uri'
require 'json'

File.open('nerdfonts.txt', 'w') do |out|
  URI.parse(ARGV[1] || 'https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json').open do |f|
    JSON.parse(f.read).each do |(name, subkey)|
      next unless subkey['char']

      out.puts "nf-#{name}:#{subkey['char']}"
    end
  end
end
