require 'active_support'

class Interceptor

  attr_reader :compressed

  def initialize(compressed)
    @compressed = compressed
  end

  def output(input_string)
    if @compressed
      ActiveSupport::Gzip.compress(input_string)
    else
      input_string
    end
  end

end