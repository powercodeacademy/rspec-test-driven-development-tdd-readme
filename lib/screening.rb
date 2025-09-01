class Screening
  attr_reader :time, :theater

  def initialize(time, theater)
    @time = time
    @theater = theater
  end
end
