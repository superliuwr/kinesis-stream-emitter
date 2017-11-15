class Reader

  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read
      File.read(file_path)
  end

  def validate?
    if !File.exist?(file_path)
      puts 'Invalid data file'
      return false
    end

    return true
  end

end