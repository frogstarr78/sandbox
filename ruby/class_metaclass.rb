#!/usr/bin/env ruby

# from http://ola-bini.blogspot.com/2006/09/ruby-metaprogramming-techniques.html

def R(*urls); Class.new(R) { meta_def(:urls) { urls } }; end

class View < R '/view/(\d+)'
  def get post_id
  end
end
