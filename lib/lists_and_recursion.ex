defmodule Lists_and_recursion do
  @moduledoc false

  def all?(list, is_true?) do
    _all?(list, is_true?)
  end

  defp _all?([], _fun), do: true

  defp _all?([head|tail], is_true?) do
    if is_true?.(head), do: _all?(tail, is_true?), else: false
  end
end