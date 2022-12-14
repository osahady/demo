defmodule Demo.SchoolTest do
  use Demo.DataCase

  alias Demo.School

  describe "levels" do
    alias Demo.School.Level

    import Demo.SchoolFixtures

    @invalid_attrs %{name: nil}

    test "list_levels/0 returns all levels" do
      level = level_fixture()
      assert School.list_levels() == [level]
    end

    test "get_level!/1 returns the level with given id" do
      level = level_fixture()
      assert School.get_level!(level.id) == level
    end

    test "create_level/1 with valid data creates a level" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Level{} = level} = School.create_level(valid_attrs)
      assert level.name == "some name"
    end

    test "create_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = School.create_level(@invalid_attrs)
    end

    test "update_level/2 with valid data updates the level" do
      level = level_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Level{} = level} = School.update_level(level, update_attrs)
      assert level.name == "some updated name"
    end

    test "update_level/2 with invalid data returns error changeset" do
      level = level_fixture()
      assert {:error, %Ecto.Changeset{}} = School.update_level(level, @invalid_attrs)
      assert level == School.get_level!(level.id)
    end

    test "delete_level/1 deletes the level" do
      level = level_fixture()
      assert {:ok, %Level{}} = School.delete_level(level)
      assert_raise Ecto.NoResultsError, fn -> School.get_level!(level.id) end
    end

    test "change_level/1 returns a level changeset" do
      level = level_fixture()
      assert %Ecto.Changeset{} = School.change_level(level)
    end
  end
end
