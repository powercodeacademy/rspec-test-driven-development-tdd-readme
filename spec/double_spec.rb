require_relative '../double' # Make sure to require the file with your method!

RSpec.describe "#double_number" do
  it "returns twice the input number" do
    expect(double_number(2)).to eq(4)
  end

  it "works for the other numbers too" do
    expect(double_number(5)).to eq(10)
  end
end
