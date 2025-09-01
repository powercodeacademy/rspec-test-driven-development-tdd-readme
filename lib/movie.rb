class Movie
  attr_reader :title, :duration, :screenings

  def initialize(title, duration)
    @title = title
    @duration = duration # in minutes
    @screenings = []
  end

  def add_screening(screening)
    @screenings << screening
  end

  def upcoming_screenings(current_time)
    screenings.select { |s| s.time > current_time }
  end
end
