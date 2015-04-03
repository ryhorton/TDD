require 'hanoi'

class Array
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }

    result
  end

  def two_sum
    result = []
    0.upto(size - 2) do |i|
      (i + 1).upto(size - 1) do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end

    result
  end

  def my_transpose
    dim1 = self.first.count
    dim2 = self.count
    cols = Array.new(dim1) { Array.new(dim2) }

    dim1.times do |i|
      dim2.times do |j|
        cols[i][j] = self[j][i]
      end
    end

    # 0.upto(count - 1) do |i|
    #   0.upto(dim1 - 1) do |j|
    #     cols[j] << self[i][j]
    #   end
    # end

    cols
  end

  def stock_picker
    result = []
    greatest_profit = 0

    self.count.times do |i|
      (i + 1).upto(count - 1) do |j|
        diff = self[j] - self[i]
        if diff > greatest_profit
          greatest_profit = diff
          result = [i, j]
        end
      end
    end

    result
  end
end
