#!/usr/bin/env ruby

require 'rubygems'
require 'crack'
require 'chronic'
require 'pp'

input = %q|
Finished:       Snapshot:   Size:   Scheduled Task:   Actions:
Finished  Incremental 21  Mon Nov 29 2010 23:00:01 PST  170 bytes   Nightly Backup  Lock Lock    Verify Verify   
Finished  Incremental 20  Sun Nov 28 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 19  Sat Nov 27 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 18  Fri Nov 26 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 17  Thu Nov 25 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 16  Wed Nov 24 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 15  Tue Nov 23 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 14  Mon Nov 22 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 13  Sun Nov 21 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 12  Sat Nov 20 2010 23:00:01 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 11  Fri Nov 19 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 10  Thu Nov 18 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 9   Wed Nov 17 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 8   Tue Nov 16 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 7   Mon Nov 15 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 6   Sun Nov 14 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 5   Sat Nov 13 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 4   Fri Nov 12 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 3   Thu Nov 11 2010 23:00:02 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 2   Wed Nov 10 2010 23:00:01 PST  170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 1   Tue Nov 9 2010 23:00:02 PST   170 bytes   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 0   Tue Nov 9 2010 01:49:30 PST   19.14 MB  initial   Delete Delete    Lock Lock    Verify Verify    
Finished:       Snapshot:   Size:   Scheduled Task:   Actions:
Finished  Incremental 5   Sat Nov 13 2010 23:00:03 PST  7.52 GB   Nightly Backup  Lock Lock    Verify Verify   
Finished  Incremental 4   Fri Nov 12 2010 23:00:03 PST  7.52 GB   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 3   Thu Nov 11 2010 23:00:03 PST  7.32 GB   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 2   Wed Nov 10 2010 23:00:03 PST  7.69 GB   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 1   Tue Nov 9 2010 23:00:04 PST   7.23 GB   Nightly Backup  Delete Delete    Lock Lock    Verify Verify   
Finished  Incremental 0   Tue Nov 9 2010 01:49:41 PST   53.48 GB  initial   Delete Delete    Lock Lock    Verify Verify    
|

input_lines = input.split "\n"
split_lines = input_lines.inject [] do |memo, line|
  aline = line.split(/\ \ /)
  aline.collect(&:strip!).compact!
  aline.reject!(&:empty?)
  memo << aline
  memo
end

puts split_lines.collect(&:inspect)
