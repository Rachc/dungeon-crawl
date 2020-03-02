defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action

  #com "@callback" definimos que qualquer modulo que implementar esse contrato deve ter um método chamado run que recebe um character e/ou uma action
  # de qualquer tipo, e ela retorna qualquer tipo
  # @callback run(character::any, action::any)::any

  #Depois de definirmis um tipo em Character e em Action, definimos qual o tipo que esse contrato deve ter, e como deverá ser seu retorno
  @callback run(Character.t, Action.t)::{Character.t, atom}
end
