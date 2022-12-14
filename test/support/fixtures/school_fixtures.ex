defmodule Demo.SchoolFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.School` context.
  """

  @doc """
  Generate a level.
  """
  def level_fixture(attrs \\ %{}) do
    {:ok, level} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Demo.School.create_level()

    level
  end
end
