require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

def assert_not(object)
  assert(!object)
end

def assert_not_equal(expected, actual)
  assert(expected != actual)
end
