require "aws-sdk-kinesis"

class Kinesis

  attr_reader :stream_name, :partition_key

  def initialize(stream_name, partition_key)
    @stream_name = stream_name
    @partition_key = partition_key
  end

  def push(data)
    client.put_record({
      stream_name: stream_name,
      data: data,
      partition_key: partition_key
    })
  end

  private

  def client
    Aws::Kinesis::Client.new
  end

end