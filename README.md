Simple demo that uses Kafka as the pub-sub broker. Demo simply sends a stream of words from a novel (ex: Count of Monte Cristo). Last message produced is 'END-OF-STREAM'; this lets the consumer know that no more messages will be coming. 
The consumer processes each word and keeps tally of the most frequent word it's seen thus far.
**NOTE: This is a Apache Kafka demo only. This use-case is probably not best solve be the publish-subscriber pattern. Only meant to demostrate Kafka's ruby api.



To see in action do following:
- Install Kafka + Zookeeper locally (see their respective documentation for further details).
- Modify Procfile so it references the correct location of your local Kafka server
- foreman start
- ruby kafka-demo.rb

 
