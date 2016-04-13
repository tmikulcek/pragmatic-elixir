defmodule Lists_and_recursionTest do
  use ExUnit.Case
  doctest PragmaticElixir

  test "all are even" do
    assert true == Lists_and_recursion.all?([2, 4, 6, 8], &(rem(&1, 2) == 0))
  end

  test "not all are even" do
    assert false == Lists_and_recursion.all?([1,2,3], &(rem(&1, 2) == 0))
  end
end
