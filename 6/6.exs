defmodule AOC do

    def task1(input) do
        Enum.sum Enum.map(input, fn group ->
                                 MapSet.size MapSet.new String.to_charlist String.replace(group, "\n", "")
                          end)
    end                   

    def groupCount(group) do
        people = String.split(group, "\n", trim: true)
        pcounts = Enum.map(people, fn person ->
                Map.new(String.to_charlist(person), fn c -> {c, 1} end)
        end)
        gcounts = Enum.reduce(pcounts, fn a, b -> Map.merge(a, b, fn _k, v1, v2 -> v1+v2 end) end)
        Enum.sum Enum.map(gcounts, fn {_k, v} -> if v == length(people), do: 1, else: 0  end )
    end

    def task2(input) do
        Enum.sum Enum.map(input, fn group -> groupCount(group) end)
    end
end




input = String.split(File.read!("in.txt"), "\n\n")
IO.puts(AOC.task1(input))
IO.puts(AOC.task2(input))

