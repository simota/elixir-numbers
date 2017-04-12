defmodule Numbers do
  @moduledoc """
  Documentation for Numbers.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Numbers.hello
      :world

  """

  def fetch_html(url) do
    resp = HTTPoison.get! url
    resp.body
  end

  def is_valid_integer(x) do
    Integer.parse(x) != :error
  end

  def parse_html(html) do
    html
    |> Floki.find("td.number")
    |> Enum.map(fn(x) -> Floki.text(x) end)
    |> Enum.filter(fn(x) -> is_valid_integer(x) end)
  end

  def preparation(url) do
    url
    |> fetch_html
    |> parse_html
  end

  def sum_occurrences(data) do
    data
    |> Enum.group_by(fn(x) -> x end)
    |> Enum.map(fn({k, v}) -> {k, length(v)} end)
    |> Enum.sort(fn(a, b) -> elem(a, 1) < elem(b, 1) end)
    |> Enum.each(fn({k,v}) -> IO.puts("#{k} => #{v}") end)
  end

  def main(args) do
    num = List.first(args)
    url = "http://kaeru-dayo.com/numbers#{num}/numbers#{num}-ichiran.php?kaisuu=all"
    data = preparation(url)
    sum_occurrences(data)
  end

end
