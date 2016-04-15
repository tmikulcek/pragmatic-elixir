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
        _split(Enum.reverse(list), 0 - count, [], true)
    end

    def split(list, count) do
        _split(list, count, [], false)
    end

    def _split([], _, acc, reverse?) when reverse?, do: {[], Enum.reverse(acc)}
    def _split([], _, acc, _), do: {acc, []}
    def _split(list, 0, acc, reverse?) when reverse?, do: {Enum.reverse(list), Enum.reverse(acc)}
    def _split(list, 0, acc, _), do: {acc, list}
    def _split([head | tail], count, acc, reverse?) do
        _split(tail, count - 1, acc ++ [head], reverse?)
  end
end
