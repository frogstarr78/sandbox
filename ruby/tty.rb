#!/usr/bin/env ruby

#require 'pty'

fname = '/dev/pts/7'

def non_block fname
  begin
    File.open fname, (File::RDWR | File::NONBLOCK) do |io|
      puts io.sysread(4096) # throws exception
    end
  rescue EOFError
  rescue IOError => e
    puts e.exception
  rescue Errno::ENOENT
    puts "no such file #{fname}"
  end
end

# return nil on EOF
def non_block2 fname
  begin
    File.open fname, (File::RDWR | File::NONBLOCK) do |io|
      io.puts 'Hello?'
      while s = io.read !~ /\n/
        puts s
      end
      puts 'done'
    end
  rescue Errno::ENOENT
    puts "no such file #{fname}"
  end
end

def io_select fname
  require 'stringio'
  fh1 = File.new fname
  res = ''
  nfound = select([$stdin, fh1], [$stdout, fh1], [$stderr], 0)
  nfound[0].each do |file|
    case file
      when fh1
        fh1.puts "What are you working on?"
        res << fh1.gets
        # do something with fh1
      when fh2
        # do something with fh2
      when fh3
        # do something with fh3
    end
  end
  puts res.inspect
end

def rw_no_ruby_block fname
  res = []
  io = File.open fname, 'r+'
  io.write 'What are you working on?'
#    io.close_write
  res << io.gets
  io.close
  puts res.inspect
end

def io_wait fname
  require 'io/wait'
 
  IO.nonblock do |io|
    File.open fname, 'r+' do |f|
      f.puts "What are you working on?"
      puts f.gets
    end
  end

end

def cp_rw fname
  require 'stringio'

  res = StringIO.new ''
  io = File.open fname, 'a+'# do |io|
  io.puts 'What are you working on?'
  IO.copy_stream io, res
  res.readline
  io.close
  res.close
  puts res.string
end

def rw fname
  res = ''
  File.open fname, 'a+' do |f|
    f.puts "What are you working on?"
    `stty -echo`
    res << f.gets
    `stty echo`
  end
  puts res.inspect
end

def pipe_read fname
  fh = Kernel.open("|" + fname, "r+")
  fh.puts "here's your input\n"
  output = fh.gets()
  fh.close()
  puts output.inspect
end

def pipe_read2 fname
  `echo 'What?' >> #{fname}`
  fh = Kernel.open("| #{fname}", "r")
#  fh.puts "here's your input\n"
  output = fh.gets()
  fh.close()
  puts output.inspect
end

def rw_while fname
  require 'termios'

  res = ''
  io = File.open fname, 'a+'
  io.puts "what are you doing?"
#  `stty -echo`
#  io.rewind
  old_term = Termios.tcgetattr $stdin
  new_term = old_term.dup
  new_term.lflag &= ~Termios::ECHO
  Termios.tcsetattr $stdin, Termios::TCSANOW, new_term
  while char = io.readchar
    res << char
    break if char == "\n"
  end
  Termios.tcsetattr $stdin, Termios::TCSANOW, old_term
#  `stty echo`
  io.close
  puts res.inspect
end

def rnw fname
  res = ''
  File.open fname, 'a' do |io|
    io.puts "what are you doing?"
  end

  io = File.open fname, 'r'
  `stty -echo`
  res << io.gets
  while char = io.readchar
    res << char
    break if char == "\n"
  end
  `stty echo`
  io.close

  puts res
end

def rw_fcntl fname
  require 'fcntl'
  res = ''

  fd = IO::sysopen(fname, Fcntl::O_APPEND | Fcntl::O_NOCTTY | Fcntl::O_NONBLOCK | Fcntl::O_RDWR)
  io = IO.open(fd)
  io.syswrite("What are you working on?")
  `stty -echo`
  res = io.sysread 16
  `stty echo`
  io.close

  puts res.inspect
end

#non_block fname
#non_block2 fname
#io_select fname
#io_wait fname
#cp_rw fname
#rw fname

#pipe_read fname
#pipe_read2 fname

#rw_while '/tmp/file'
rw_while fname
#rnw fname
