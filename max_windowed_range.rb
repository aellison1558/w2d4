def max_windowed_range_naive(array, window)
  current_max_range = nil
  i = 0
  while i + window <= array.length
    max = array[i...i + window].max
    min = array[i...i + window].min
    current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
    i += 1
  end
  current_max_range
end
p max_windowed_range_naive([1, 2, 3, 5], 3)
p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range_naive([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range_naive([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyStack

  def initialize(store = [])
    @store = store
    @maximums = []
    @minimums = []
  end

  def pop
    popped = @store.pop
    @maximums.pop if popped == @maximums.last
    @minimums.pop if popped == @minimums.last
    popped
  end

  def push(element)
    @store << element
    if @maximums.empty? || element > @maximums.last
      @maximums << element
    end
    if @minimums.empty? || element < @minimums.last
      @minimums << element
    end
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def max
    @maximums.last
  end

  def min
    @minimums.last
  end
end

class StackQueue


  def initialize
    @queue_in = MyStack.new
    @queue_out = MyStack.new
  end

  def enqueue(element)
    @queue_in.push(element)
  end

  def dequeue
    unless @queue_out.empty?
      @queue_out.pop
    else
      @queue_in.size.times do
        @queue_out.push(@queue_in.pop)
      end
      @queue_out.pop
    end
  end

  def max
    return @queue_in.max if @queue_out.empty?
    return @queue_out.max if @queue_in.empty?
    @queue_in.max >= @queue_out.max ? @queue_in.max : @queue_out.max
  end

  def min
    return @queue_in.min if @queue_out.empty?
    return @queue_out.min if @queue_in.empty?
    @queue_in.min <= @queue_out.min ? @queue_in.min : @queue_out.min
  end

end

stackqueue = StackQueue.new
