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
  def hello do
    :world
  end

  def fetch_html(url) do
    resp = HTTPoison.get! url
    resp.body
  end

  def parse_html(html) do
  end

  def main(args) do
    url = "http://kaeru-dayo.com/numbers3/numbers3-ichiran.php?kaisuu=all"
    html = fetch_html(url)
  end

end
