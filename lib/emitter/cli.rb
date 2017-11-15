require "thor"
require "emitter"

module Emitter
  class CLI < Thor
    option :config, :required => true, :aliases => :c
    option :data, :required => true, :aliases => :d
    option :zip, :type => :boolean, :default => false, :aliases => :z
    desc "emitter", "AWS Kinesis Stream testing data producer"
    def emit()
      puts options[:config]
      puts options[:data]
      puts options[:zip]
      Emitter.emit(options)
    end
  end
end