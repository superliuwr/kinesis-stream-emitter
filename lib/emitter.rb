require_relative "emitter/version"
require_relative 'emitter/kinesis'
require_relative 'emitter/interceptor'
require_relative 'emitter/config'
require_relative 'emitter/file'

module Emitter

  def self.emit(options)
    configuaration = Config.new(options[:config])
    if !configuaration.validate?
      return
    end

    data = Reader.new(options[:data])
    if !data.validate?
      return
    end

    interceptor = Interceptor.new(options[:zip])
    
    processedData = interceptor.output(data)

    client = Kinesis.new(configuaration)

    client.push(processedData)
  end
  
end
