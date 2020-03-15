defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def ask_for_option(options) do
    answer =
    options
    |> display_options
    |> generate_question
    |> Shell.prompt

    with {option, _} <- Integer.parse(answer),
      chosen when chosen != nil <- Enum.at(options,option - 1) do chosen
    else
      :error -> retry(options)
      nil -> retry(options)
    end
  end

  def retry(options) do
    display_error("invalid option")
    ask_for_option(options)
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Wich one? [#{options}]\n"
  end

  def display_error(message) do
    Shell.cmd("clear")
    Shell.error(message)
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")
  end
end
