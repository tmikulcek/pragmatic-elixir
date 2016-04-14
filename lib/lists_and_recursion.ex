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
    if fun.(head), do: [head|filter(tail, fun)],
    else: filter(tail, fun)
  end
end