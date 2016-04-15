defmodule Lists_and_recursion do
    @moduledoc false

    def all?([], _fun), do: true
    def all?([head | tail], is_true?) do
        if is_true?.(head), do: all?(tail, is_true?), else: false
    end

    def each([], _fun), do: :ok
    def each([head | tail], fun) do
        fun.(head)
        each(tail, fun)
    end

    def filter([], _fun), do: []
    def filter([head | tail], fun) do
        if fun.(head) do
            [head|filter(tail, fun)]
        else
            filter(tail, fun)
        end
    end

    def split([], _), do: {[], []}

    def split(list, count) when count < 0 do
        _split(Enum.reverse(list), 0 - count, {[], []}, true)
    end

    def split(list, count) do
        _split(list, count, {[], []}, false)
    end

    def _split([], _, {l1, l2}, reverse?) when reverse?, do: {Enum.reverse(l2), Enum.reverse(l1)}
    def _split([], _, acc, _), do: acc
    def _split(list, 0, {l1, l2}, reverse?) when reverse?, do: {Enum.reverse(list), Enum.reverse(l1)}
    def _split(list, 0, {l1, _}, _), do: {l1, list}
    def _split(list = [head | tail], count, {l1, l2}, reverse?) do
        _split(tail, count - 1, {l1 ++ [head], l2}, reverse?)
  end
end
