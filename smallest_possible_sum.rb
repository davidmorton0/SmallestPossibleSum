require "test/unit/assertions"
include Test::Unit::Assertions

def solution(numbers)
  min_value = numbers.min
  result = transform(numbers, min_value)
  while result.min < min_value
    min_value = result.min
    result = transform(numbers, min_value)
  end
  return result.sum
end

def transform(arr, min)
  res = []
  arr.map do |n|
    x = n % min
    res.append(x == 0 ? min : x)
  end
  return res
end

assert_equal(solution([1, 21, 55]), 3)
assert_equal(solution([3, 13, 23, 7, 83]), 5)
assert_equal(solution([4, 16, 24]), 12)
assert_equal(solution([30, 12]), 12)
assert_equal(solution([60, 12, 96, 48, 60, 24, 72, 36, 72, 72, 48]), 132)
assert_equal(solution([71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71]), 923)
assert_equal(solution([11, 22]), 22)
assert_equal(solution([9]), 9)
