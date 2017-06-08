require 'tdd'
require 'rspec'


describe "#my_uniq" do
  let(:array) {[1,2,1,3,3]}

  it "returns the uniq elements in the order in which they appear" do
    expect(array.my_uniq).to eq(array.uniq)
  end

  it "returns [] if the array is empty" do
    expect([].my_uniq).to be_empty
  end
end

describe "#two_sum" do
  let(:array) {[-1, 0, 2, -2, 1] }

  # it "find a pair" do
  #   expect(array.two_sum).to match_array([0,4])
  # end

  it "return pairs in order" do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  let(:matrix) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "returns right value at [0, 1]" do
    expect(matrix.my_transpose[0][1]).to eq(3)
  end

  it "doesn't change value on diagonal" do
    expect(matrix.my_transpose[1][1]).to eq(4)
  end

  it "return rows as columns" do
    expect(matrix.my_transpose).to eq(matrix.transpose)
  end

  it "doesn't use built-in transpose method" do
    expect(matrix).not_to receive(:transpose)
    matrix.my_transpose
  end
end

describe "#stock_picker" do
  let(:stock){[2,5,1,8,3,10,7]}
  it "picked the most profitable pair" do
    expect(stock.stock_picker).to eq([2, 5])
  end
end
