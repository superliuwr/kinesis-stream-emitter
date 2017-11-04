require "thor"
require "emitter"

module Emitter
  class CLI < Thor
    option :stream, :required => true, :aliases => :s
    option :data, :required => true, :aliases => :d
    option :zip, :type => :boolean, :default => false, :aliases => :z
    desc "emitter", "AWS Kinesis Stream testing data producer"
    def emit()
      puts options[:stream]
      puts options[:data]
      puts options[:zip]
      puts Emitter.emit
    end
  end
end