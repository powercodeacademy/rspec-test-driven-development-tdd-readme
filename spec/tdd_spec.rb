# Example RSpec file for TDD
#
# Instructions:
# 1. Try writing a failing spec first, then implement the code to make it pass!
# 2. Add your own TDD cycles below.

RSpec.describe 'TDD Example' do
  it 'returns the square of a number' do
    # Implement the method below to make this pass
    expect(square(3)).to eq(9)
  end
end

# Uncomment and implement this method to pass the test
# def square(x)
#   x * x
# end
