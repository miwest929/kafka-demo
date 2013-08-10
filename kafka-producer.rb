require 'rubygems'
require 'kafka'

module Producer
  extend self

  def run
    producer = Kafka::Producer.new
    puts 'Start producing messages about Count of Monte Cristo'
    start_time = Time.now
    msg_count = 0
    File.open('count_of_monte_cristo.txt').each_line do |line|
      line.split(' ').each do |word|
        msg = Kafka::Message.new(word.delete(' .!?:,'))
        msg_count += 1
        producer.push(msg)
      end

    end

    # Send a END-OF-STREAM message
    producer.push(Kafka::Message.new("END-OF-STREAM"))
    puts "Finished producing #{msg_count} messages"
    puts "Took #{Time.now - start_time} seconds"
  end
end
