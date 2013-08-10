require 'rubygems'
require 'kafka'

module Consumer
  extend self

  def run
    word_list = {}
    most_frequent_word = nil
    msg_count = 0

    consumer = Kafka::Consumer.new
    consumer.loop do |messages|
      messages.each do |msg|
        if msg.payload == 'END-OF-STREAM'
          puts "Consumed #{msg_count} messages!"
          puts "Word stream complete. Closing connection."
          exit
        end

        msg_count += 1
        current_word_count = word_list[msg.payload]
        word_list[msg.payload] = current_word_count ? current_word_count+1 : 1

        if msg.payload.length >= 4

          if most_frequent_word
            current_most_frequent_count = word_list[most_frequent_word]
            if word_list[msg.payload] > current_most_frequent_count
              most_frequent_word = msg.payload
              puts "Most common word that is at least 5 letters long in text: #{msg.payload} #{word_list[msg.payload]} count"
            end
          else
            most_frequent_word = msg.payload
            puts "Most common word that is at least 5 letters long in text: #{msg.payload} #{word_list[msg.payload]} count"
          end
        end
      end
    end
  end
end
