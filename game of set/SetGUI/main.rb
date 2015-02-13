#!/usr/bin/ruby

require 'vrlib'

# Make program output in real time so errors visible in VR.
STDOUT.sync = true
STDERR.sync = true

# Everything in these directories will be included.
my_path = File.expand_path(File.dirname(__FILE__))
require_all Dir.glob(my_path + "/bin/**/*.rb") 

# Perform execution of My.Class.rb
MyClass.new.show

