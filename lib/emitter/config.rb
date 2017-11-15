require 'yaml'

class Config

    attr_reader :kinesis_stream_name, :kinesis_stream_partition_key, :aws_region_name, :aws_access_key_id, :aws_secret_access_key, :use_default_credential

    def initialize(config_file_path)
        config = YAML.load_file(config_file_path)

        @kinesis_stream_name = config['kinesis_stream_name']
        @kinesis_stream_partition_key = config['kinesis_stream_partition_key']
        @aws_region_name = config['aws_region_name']
        @aws_access_key_id = config['aws_access_key_id']
        @aws_secret_access_key = config['aws_secret_access_key']
    end

    def validate?
        if !@kinesis_stream_name
            puts 'Invalid Kinesis stream name'
            return false
        end

        if !@kinesis_stream_partition_key
            puts 'Use default stream partition key'
            @kinesis_stream_partition_key = 'default-partition'
        end

        if !@aws_region_name || !@aws_access_key_id || !@aws_secret_access_key
            puts 'Use default AWS credential'
        end

        return true
    end
end