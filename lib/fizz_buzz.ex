defmodule FizzBuzz do
    @moduledoc false

    #using case
    def upto_case(n) when n > 0 do
        for num <- 1..n do
            a = {rem(num, 3), rem(num, 5)}
            case a do
               {0, 0} -> "FizzBuzz"
               {0, _} -> "Fizz"
               {_, 0} -> "Buzz"
               _ -> num
            end
        end
    end

    #using cond
    def upto_cond(n) when n > 0 do
        for num <- 1..n do
            cond do
                rem(num, 3) == 0 and rem(num, 5) == 0 -> "FizzBuzz"
                rem(num, 3) == 0 -> "Fizz"
                rem(num, 5) == 0 -> "Buzz"
                true -> num
            end
        end
    end

    #using separate functions
    def upto_fun(n) when n > 0, do: upto_fun(n, [])

    defp upto_fun(0, acc), do: acc
    defp upto_fun(n, acc) when rem(n, 3) == 0 and rem(n, 5) == 0, do: upto_fun(n - 1, ["FizzBuzz" | acc])
    defp upto_fun(n, acc) when rem(n, 3) == 0, do: upto_fun(n - 1, ["Fizz" | acc])
    defp upto_fun(n, acc) when rem(n, 5) == 0, do: upto_fun(n - 1, ["Buzz" | acc])
    defp upto_fun(n, acc), do: upto_fun(n - 1, [n | acc])
end
