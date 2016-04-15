defmodule Lists_and_recursionTest do
    use ExUnit.Case
    use ExCheck

    import ExUnit.CaptureIO

    doctest PragmaticElixir

    def is_even(num), do: rem(num, 2) == 0

    property :all? do
        for_all to_check in list(int) do
            assert Enum.all?(to_check, &is_even/1) == Lists_and_recursion.all?(to_check, &is_even/1)
        end
    end

    test "each" do
        testable_side_effects = fn -> assert :ok == Lists_and_recursion.each([1, 2, 3], &IO.puts/1) end
        assert capture_io(testable_side_effects) == "1\n2\n3\n"
    end

    property :filter do
        for_all to_filter in list(int) do
            assert Enum.filter(to_filter, &is_even/1) == Lists_and_recursion.filter(to_filter, &is_even/1)
        end
    end

    property :split do
        for_all {to_split, count} in {list(any), int} do
            assert Enum.split(to_split, count) == Lists_and_recursion.split(to_split, count)
        end
    end

    property :take do
        for_all {to_take, count} in {list(any), int} do
            assert Enum.take(to_take, count) == Lists_and_recursion.take(to_take, count)
        end
    end
end
