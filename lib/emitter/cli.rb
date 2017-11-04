require "thor"
require "emitter"

module Emitter
  class CLI < Thor
    desc "emitter", "AWS Kinesis Stream testing data producer"
    def hello
      puts Emitter.hello
    end
  end
end