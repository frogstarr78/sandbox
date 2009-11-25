#!/usr/bin/env ruby

require 'qtruby'
include Qt

a = Qt::Application.new(ARGV)
hello = Qt::PushButton.new("Hello World!")
hello.resize(100, 30)
hello.show
a.exec
