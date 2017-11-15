require "aws-sdk-kinesis"

class Kinesis

  attr_reader :stream_config

  def initialize(stream_config)
    @stream_config = stream_config
  end

  def push(data)
    client.put_record({
      stream_name: @stream_config.kinesis_stream_name,
      data: data,
      partition_key: @stream_config.kinesis_stream_partition_key
    })
  end

  private

  def client
    if @stream_config.use_default_credential
      Aws::Kinesis::Client.new
    else
      Aws::Kinesis::Client.new(
        region: @stream_config.aws_region_name,
        access_key_id: @stream_config.aws_access_key_id,
        secret_access_key: @stream_config.aws_secret_access_key
      )
  end

end