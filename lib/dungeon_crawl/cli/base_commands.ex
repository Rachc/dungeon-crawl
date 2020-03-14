defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def ask_for_option(options) do
    index = ask_for_index(options)
    chosen_option = Enum.at(options, index)
    chosen_option || (display_invalid_option() && ask_for_option(options))
  end

  def ask_for_index(options) do
    answer =
      options
      |> display_options
      |> generate_question
      |> Shell.prompt
      |> Integer.parse

    case answer do
      :error ->
        display_invalid_option()
        ask_for_index(options)
      {option,_} ->
        option - 1
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

  def display_invalid_option do
    Shell.cmd("clear")
    Shell.error("invalid option.")
    Shell.prompt("Press enter to try again")
    Shell.cmd("clear")
  end
end
