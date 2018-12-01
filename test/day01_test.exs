defmodule Day01Test do
  use ExUnit.Case

  test "greets the world" do
    assert Day01.solve_a() == 510
  end

  test "greets the world b" do
    assert Day01.solve_b() == 69074
  end

end
