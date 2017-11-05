require "emitter/version"
require "aws-sdk-kinesis"

module Emitter
  def self.emit
    puts "Hello!"

    if File.exist?("/users/marvin/playground/test.json")
      data = File.read("/users/marvin/playground/test.json")
      puts data
    end

    client = Aws::Kinesis::Client.new
    resp = client.put_record({
      stream_name: "StreamName", # required
      data: "data", # required
      partition_key: "PartitionKey", # required
      explicit_hash_key: "HashKey",
      sequence_number_for_ordering: "SequenceNumber",
    })
  end
end
