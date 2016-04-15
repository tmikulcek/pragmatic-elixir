defmodule Lists_and_recursionTest do
    use ExUnit.Case
    import ExUnit.CaptureIO
    doctest PragmaticElixir

    def is_even(num), do: rem(num, 2) == 0

    test "all? all are even" do
        assert Enum.all?([2, 4, 6, 8], &is_even/1) == Lists_and_recursion.all?([2, 4, 6, 8], &is_even/1)
    end

    test "all? not all are even" do
        assert Enum.all?([1, 2, 3], &is_even/1) == Lists_and_recursion.all?([1,2,3], &is_even/1)
    end

    test "each" do
        testable_side_effects = fn -> assert :ok == Lists_and_recursion.each([1, 2, 3], &IO.puts/1) end
        assert capture_io(testable_side_effects) == "1\n2\n3\n"
    end

    test "filter" do
        assert Enum.filter([1, 2, 3, 4], &is_even/1) == Lists_and_recursion.filter([1, 2, 3, 4], &is_even/1)
    end

    test "split" do
        to_split = [1, 2, 3, 4]
        assert Enum.split(to_split, 3) == Lists_and_recursion.split(to_split, 3)
        assert Enum.split(to_split, -1) == Lists_and_recursion.split(to_split, -1)
        assert Enum.split(to_split, -2) == Lists_and_recursion.split(to_split, -2)
        assert Enum.split(to_split, 4) == Lists_and_recursion.split(to_split, 4)
        assert Enum.split(to_split, 5) == Lists_and_recursion.split(to_split, 5)
        assert Enum.split(to_split, -5) == Lists_and_recursion.split(to_split, -5)
        assert Enum.split(to_split, 0) == Lists_and_recursion.split(to_split, 0)
    end
end
