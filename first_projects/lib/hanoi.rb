class Hanoi

  attr_reader :stacks

  def initialize(state = [[3, 2, 1], [], []])
    @stacks = state
  end

  def render
    result = ''
    @stacks.each do |stack|
      if stack.empty?
        result += '*'
      else
        stack.each do |el|
          result = el.to_s + result
        end
      end
      result += '___'
    end

    result
  end

  def move(from, to)
    raise ArgumentError.new "cannot move from empty stack" if @stacks[from].empty?
    @stacks[to].push(@stacks[from].pop)
  end

  def won?
    @stacks[1..2].include?([3, 2, 1])
  end

end
