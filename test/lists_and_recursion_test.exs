defmodule Lists_and_recursionTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PragmaticElixir

  test "all? all are even" do
    assert Enum.all?([2, 4, 6, 8], &(rem(&1, 2) == 0)) == Lists_and_recursion.all?([2, 4, 6, 8], &(rem(&1, 2) == 0))
  end

  test "all? not all are even" do
    assert Enum.all?([1, 2, 3], &(rem(&1, 2) == 0)) == Lists_and_recursion.all?([1,2,3], &(rem(&1, 2) == 0))
  end

  test "each" do
    testable_side_effects = fn -> assert :ok == Lists_and_recursion.each([1, 2, 3], &IO.puts/1) end
    assert capture_io(testable_side_effects) == "1\n2\n3\n"
  end
end
