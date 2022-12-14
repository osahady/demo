defmodule DemoWeb.LevelController do
  use DemoWeb, :controller

  alias Demo.School
  alias Demo.School.Level

  def index(conn, _params) do
    levels = School.list_levels()
    render(conn, "index.html", levels: levels)
  end

  def new(conn, _params) do
    changeset = School.change_level(%Level{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"level" => level_params}) do
    case School.create_level(level_params) do
      {:ok, level} ->
        conn
        |> put_flash(:info, "Level created successfully.")
        |> redirect(to: Routes.level_path(conn, :show, level))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    level = School.get_level!(id)
    render(conn, "show.html", level: level)
  end

  def edit(conn, %{"id" => id}) do
    level = School.get_level!(id)
    changeset = School.change_level(level)
    render(conn, "edit.html", level: level, changeset: changeset)
  end

  def update(conn, %{"id" => id, "level" => level_params}) do
    level = School.get_level!(id)

    case School.update_level(level, level_params) do
      {:ok, level} ->
        conn
        |> put_flash(:info, "Level updated successfully.")
        |> redirect(to: Routes.level_path(conn, :show, level))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", level: level, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    level = School.get_level!(id)
    {:ok, _level} = School.delete_level(level)

    conn
    |> put_flash(:info, "Level deleted successfully.")
    |> redirect(to: Routes.level_path(conn, :index))
  end
end
