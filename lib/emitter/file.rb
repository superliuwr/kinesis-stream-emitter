class Reader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read
    if File.exist?("/users/marvin/playground/test.json")
      data = File.read("/users/marvin/playground/test.json")
      puts data
    end
  end
end