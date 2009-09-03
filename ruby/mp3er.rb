#!/usr/bin/ruby

require "mp3info"

def read_and_display_infos_and_tags file
  # read and display infos & tags
  Mp3Info.open(file) do |mp3info|
    max = mp3info.instance_variables.inject(0) {|m,a| m+= a.length if a.length > m; m }
    mp3info.instance_variables.sort.each do |var| 
      puts " %#{max}.#{max}s : %s"% [var, mp3info.instance_variable_get("#{var}").inspect]
    end
  end
end

def read_write_tag1_and_tag2_with_Mp3Info_tag_attribute file
  # read/write tag1 and tag2 with Mp3Info#tag attribute
  # when reading tag2 have priority over tag1
  # when writing, each tag is written.
  Mp3Info.open(file) do |mp3|
    puts mp3.tag.title
    puts mp3.tag.artist
    puts mp3.tag.album
    puts mp3.tag.tracknum
    mp3.tag.title = "track title"
    mp3.tag.artist = "artist name"
  end
end

def open file
  Mp3Info.open(file) do |mp3|
    # you can access four letter v2 tags like this
    puts mp3.tag2.TIT2
    mp3.tag2.TIT2 = "new TIT2"
    # or like that
    mp3.tag2["TIT2"]
    # at this time, only COMM tag is processed after reading and before writing
    # according to ID3v2#options hash
    mp3.tag2.options[:lang] = "FRE"
    mp3.tag2.COMM = "my comment in french, correctly handled when reading and writing"
  end
end

# tags v2 will be read and written according to the :encoding settings
#mp3 = Mp3Info.open("myfile.mp3", :encoding => 'utf-8')

read_and_display_infos_and_tags ARGV.first
