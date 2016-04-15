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
    def split(list, 0), do: {[], list}

    def split(list, count) when count < 0 do
        _split(Enum.reverse(list), 0 - count, [], false)
    end

    def split(list, count) do
        _split(list, count, [], true)
    end

    def _split([], _, acc, reverse?) when reverse?, do: {Enum.reverse(acc), []}
    def _split([], _, acc, _), do: {[], acc}
    def _split(list, 0, acc, reverse?) when reverse?, do: {Enum.reverse(acc), list}
    def _split(list, 0, acc, _), do: {Enum.reverse(list), acc}
    def _split([head | tail], count, acc, reverse?) do
        _split(tail, count - 1, [head|acc], reverse?)
    end

    def take([], _), do: []
    def take(_, 0), do: []
    def take([head|tail], count) when count > 0, do: _take(tail, count - 1, [head], true)
    def take(list, count) do
         [head|tail] = Enum.reverse(list)
        _take(tail, 0 - count - 1, [head], false)
    end

    defp _take([], _, acc, reverse?) when reverse?, do: Enum.reverse(acc)
    defp _take([], _, acc, _), do: acc
    defp _take(_, 0, acc, reverse?) when reverse?, do: Enum.reverse(acc)
    defp _take(_, 0, acc, _), do: acc
    defp _take([head|tail], count, acc, reverse?), do: _take(tail, count - 1, [head|acc], reverse?)
end
