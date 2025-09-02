require_relative '../lib/movie'
require_relative '../lib/screening'

RSpec.describe Movie do
  # TDD Cycle 1: Title
  it "has a title (Red)" do
    expect(Movie.new("Inception", 148).title).to eq("Inception")
  end

  # TDD Cycle 2: Duration
  it "has a duration in minutes (Red)" do
    expect(Movie.new("Inception", 148).duration).to eq(148)
  end

  # TDD Cycle 3: Add screening
  it "can add a screening (Red)" do
    movie = Movie.new("Inception", 148)
    screening = Screening.new(Time.new(2025, 9, 1, 19, 0), "Theater 1")
    movie.add_screening(screening)
    expect(movie.screenings).to include(screening)
  end

  # TDD Cycle 4: Upcoming screenings
  it "returns upcoming screenings (Red)" do
    movie = Movie.new("Inception", 148)
    past = Screening.new(Time.now - 3600, "Theater 1")
    future = Screening.new(Time.now + 3600, "Theater 2")
    movie.add_screening(past)
    movie.add_screening(future)
    expect(movie.upcoming_screenings(Time.now)).to eq([future])
  end

  # TDD Cycle 5: No screenings by default
  it "has no screenings by default (Red)" do
    expect(Movie.new("Inception", 148).screenings).to eq([])
  end

  # TDD Cycle 6: Multiple screenings
  it "can have multiple screenings (Red)" do
    movie = Movie.new("Inception", 148)
    s1 = Screening.new(Time.now + 1000, "A")
    s2 = Screening.new(Time.now + 2000, "B")
    movie.add_screening(s1)
    movie.add_screening(s2)
    expect(movie.screenings.size).to eq(2)
  end

  # TDD Cycle 7: Screening knows its theater
  it "screening has a theater (Red)" do
    screening = Screening.new(Time.now, "Theater 3")
    expect(screening.theater).to eq("Theater 3")
  end

  # TDD Cycle 8: Screening knows its time
  it "screening has a time (Red)" do
    t = Time.now
    screening = Screening.new(t, "Theater 3")
    expect(screening.time).to eq(t)
  end

  # TDD Cycle 9: Movie title is readable
  it "returns the movie title as a string (Red)" do
    expect(Movie.new("Arrival", 116).title).to be_a(String)
  end

  # TDD Cycle 10: Movie duration is an integer
  it "returns the movie duration as an integer (Red)" do
    expect(Movie.new("Arrival", 116).duration).to be_a(Integer)
  end

  # Pending specs for students (TDD Red step)
  it "returns all screenings for a given date" do
    current_time = Time.now
    movie = Movie.new("Inception", 148)
    current_screening = Screening.new(current_time, "Theater 1")
    movie.add_screening(current_screening)
    expect(movie.screenings_on(current_time)).to eq([current_screening])
  end 

  it "can cancel a screening by time and theater" do
    current_time = Time.now
    movie = Movie.new("Inception", 148)
    screening = Screening.new(current_time, "Theater 2")
    movie.add_screening(screening)
    movie.cancel_screening(current_time, "Theater 2")
    expect(movie.screenings).not_to include(screening)
  end

end
