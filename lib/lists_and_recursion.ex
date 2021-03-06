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

    def split(list, count) when count < 0, do: _split(Enum.reverse(list), 0 - count, [], false)
    def split(list, count), do: _split(list, count, [], true)

    defp _split([], _, acc, true), do: {Enum.reverse(acc), []}
    defp _split(list, 0, acc, true), do: {Enum.reverse(acc), list}
    defp _split([], _, acc, false), do: {[], acc}
    defp _split(list, 0, acc, false), do: {Enum.reverse(list), acc}
    defp _split([head|tail], count, acc, reverse?), do: _split(tail, count - 1, [head|acc], reverse?)

    def take(list, count) when count > 0, do: _take(list, count, [], true)
    def take(list, count), do: _take(Enum.reverse(list), 0 - count, [], false)

    defp _take([], _, acc, true), do: Enum.reverse(acc)
    defp _take(_, 0, acc, true), do: Enum.reverse(acc)
    defp _take([], _, acc, false), do: acc
    defp _take(_, 0, acc, false), do: acc
    defp _take([head|tail], count, acc, reverse?), do: _take(tail, count - 1, [head|acc], reverse?)

    def flatten(list), do: _flatten(list, [])

        defp _flatten([], acc), do: acc
        defp _flatten([head|tail], acc) when is_list(head), do: _flatten(head, _flatten(tail, acc))
        defp _flatten([head|tail], acc), do: [head|_flatten(tail, acc)]

    def span([], _), do: []
    def span(list, range) do
        [start|rangeTail] = Enum.into(range, [])
        [rangeEnd|_] = Enum.reverse(rangeTail)
        diff = rangeEnd - start + 1
        Enum.drop(list, start) |> take(diff)
    end

    def calculate_total() do
        tax_rates = [NC: 0.075, TX: 0.08]
        orders = [
            [id: 123, ship_to: :NC, net_amount: 100.00],
            [id: 124, ship_to: :OK, net_amount: 35.50],
            [id: 125, ship_to: :TX, net_amount: 24.00],
            [id: 126, ship_to: :TX, net_amount: 44.80],
            [id: 127, ship_to: :NC, net_amount: 25.00],
            [id: 128, ship_to: :MA, net_amount: 10.00],
            [id: 129, ship_to: :CA, net_amount: 102.00],
            [id: 120, ship_to: :NC, net_amount: 50.00],
        ]

        total(tax_rates, orders)
    end

    def total(tax_rates, orders) do
        for order <- orders do
            case Keyword.fetch(tax_rates, order[:ship_to]) do
                {:ok, tax_rate} -> [{:total_amount, order[:net_amount] + order[:net_amount] * tax_rate}| order]
                _ -> [{:total_amount, order[:net_amount]}| order]
            end
        end

    end
end
