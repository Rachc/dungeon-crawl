defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger #Informa que esse modulo usa o contrato definido em trigger.ex
  def run(character,_), do: {character, :exit}
end
