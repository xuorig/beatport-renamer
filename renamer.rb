#!/usr/bin/env ruby

# Script to Rename the annoying ID_track_name_artist format
# for BeatPort tracks into a chosen format
#

require 'beatport'
require 'parseconfig'
require 'htmlentities'

bp_folder = ARGV[0]
format_style = ARGV[1]
config_file = ARGV[2]

config = ParseConfig.new(config_file)

Beatport.consumer_key = config['consumer_key']
Beatport.consumer_secret = config['consumer_secret']
Beatport.access_token_key = config['token_key']
Beatport.access_token_secret = config['token_secret']

Dir.glob(bp_folder + "*").sort.each do |f|
  filename = File.basename(f, File.extname(f))
  id, *rest = filename.split("_")
  puts "Renaming id:#{id}"
  query = Beatport::Catalog::Track.find(id.to_i)
  key = HTMLEntities.new.decode query.key.short_name
  bpm = query.bpm
  remix = query.mix_name
  name = query.name

  new_name = format_style % { :key => key, :bpm => bpm, :name => name, :remix => remix }
  File.rename(f, bp_folder + new_name + File.extname(f))
end

puts "Renaming Complete"

# code here...
