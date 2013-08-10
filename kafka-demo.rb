require 'rubygems'
require 'thread'
require_relative 'kafka-producer'
require_relative 'kafka-consumer'

threads = []

#Start message consumer thread
threads << Thread.new do
  Producer.run
end

# Start message producer thread
threads << Thread.new do
  Consumer.run
end

threads.each {|t| t.join }
