defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all, do: [
    %Character{
      name: "Ogre",
      description: "A large creature. Big muscles. Angry and Hungry",
      hit_points: 12,
      max_hit_points: 12,
      damage_range: 3..5,
      attack_description: "A hammer"
    },
    %Character{
      name: "Orc",
      description: "A green evil creature. Wears armor and an axe.",
      hit_points: 8,
      max_hit_points: 8,
      damage_range: 2..4,
      attack_description: "An axe"
    },
    %Character{
      name: "Goblin",
      description: "A small green creature. Wears dirty clothes and a dagger",
      hit_points: 4,
      max_hit_points: 4,
      damage_range: 1..2,
      attack_description: "A dagger"
    },
  ]
end
