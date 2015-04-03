require 'rspec'
require 'array'

describe 'Array#my_uniq' do
  it "removes duplicates" do
    expect([1, 2, 3, 3].my_uniq).to eq([1, 2, 3])
  end

  it "returns a new array" do
    expect([1, 2, 3, 3].my_uniq).not_to eq([1, 2, 3, 3])
  end

  it "returns elements in order they appeared" do
    expect([4, 2, 3, 3].my_uniq).to eq([4, 2, 3])
  end
end

describe 'Array#two_sum' do
  it "returns an array" do
    expect([1, 2, 3].two_sum).to be_a(Array)
  end

  it "returns indices of pairs of elements that sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe 'Array#my_transpose' do
  subject(:arr) { [
    [0, 1],
    [3, 4],
    [6, 7]] }

  it "returns an array with transposed dimensions" do
    expect(arr.my_transpose.size).to eq(2)
    expect(arr.my_transpose.first.size).to eq(3)
  end

  it "returns a transposed array" do
    expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7]])
  end

end

describe 'Array#stock_picker' do
  subject(:arr) { [23, 66, 757, 456] }

  it "returns a two-item array" do
    expect(arr.stock_picker.count).to eq(2)
  end

  it "returns a buy date that is before the sell date" do
    expect(arr.stock_picker.first).to be < arr.stock_picker.last
  end

  it "returns date indices that yield the greatest profit" do
    expect(arr.stock_picker).to eq([0, 2])
  end
end

describe 'Hanoi' do
  describe 'inital game' do
    subject(:game) { Hanoi.new }

    describe '#render' do
      it "renders the initial game state" do
        expect(game.render).to eq('123___*___*___')
      end
    end

    describe '#move' do

      it "raises error when attempting to move piece from empty stack" do
        expect { game.move(1, 2) }.to raise_error("cannot move from empty stack")
      end

      it "performs the move if allowed" do
        game.move(0, 2)
        expect(game.stacks).to eq([[3, 2], [], [1]])
      end
    end

    describe '#won?' do
      it "returns false for initial game state" do
        expect(game.won?).to be false
      end
    end
  end

  describe 'won game' do
    subject(:won_game) { Hanoi.new([[], [3, 2, 1], []]) }

    describe '#won?' do
      it "returns true if stacks 2 or 3 has all the discs" do
        expect(won_game.won?).to be true
      end
    end
  end

end
