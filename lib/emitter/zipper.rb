require 'active_support'

class Zipper

  def output(input_string)
    ActiveSupport::Gzip.compress(input_string)
  end

end