#!/usr/bin/env python
import time, sys, tty
import os

lineCount = 100000
line = "this is a test"
summary = ""

cmd = "print"
startTime_s = time.time()
for x in range(lineCount):
	print line
t = time.time() - startTime_s
summary += "%-30s:%6.3f s\n" % (cmd, t)

#Add a newline to match line outputs above...
line += "\n"

cmd = "write to file (+fsync)"
fp = file("out.txt", "w")
startTime_s = time.time()
for x in range(lineCount):
	fp.write(line)
os.fsync(fp.fileno())
t = time.time() - startTime_s
summary += "%-30s:%6.3f s\n" % (cmd, t)

cmd = "print with stdout = /dev/null"
sys.stdout = file(os.devnull, "w")
startTime_s = time.time()
for x in range(lineCount):
	fp.write(line)
t = time.time() - startTime_s
summary += "%-30s:%6.3f s\n" % (cmd, t)

print >> sys.stderr, "-----"
print >> sys.stderr, "timing summary (100k lines each)"
print >> sys.stderr, "-----"
print >> sys.stderr, summary
