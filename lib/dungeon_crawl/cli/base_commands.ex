defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def ask_for_option(options) do
    try do
      options
      |> display_options
      |> generate_question
      |> Shell.prompt
      |> parse_answer!
      |> find_option_by_index!(options)
    rescue
      e in DungeonCrawl.CLI.InvalidOptionError ->
        display_error(e)
        ask_for_option(options)
    end
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

  def parse_answer!(answer) do
    case Integer.parse(answer) do
      :error -> raise DungeonCrawl.CLI.InvalidOptionError
      {option, _} -> option - 1
    end
  end

  def find_option_by_index!(index, options) do
    Enum.at(options, index) || raise DungeonCrawl.CLI.InvalidOptionError
  end

  def display_error(e) do
    Shell.cmd("clear")
    Shell.error(e.message)
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")
  end
end
