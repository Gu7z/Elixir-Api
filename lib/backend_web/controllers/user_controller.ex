defmodule BackendWeb.UserController do
  use BackendWeb, :controller
  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    json(conn, getUsers(id))
  end

  def getUsers(id) do
    arrayOfMaps = [
      %{
        id: 1,
        name: "gustavo"
      },
      %{
        id: 2,
        name: "elixir"
      }
    ]

    Logger.info("Inicio")

    querry =
      Enum.find(arrayOfMaps, fn
        elem ->
          "#{elem.id}" === "#{id}"
      end)

    Logger.info("Querry response: #{querry[:name]}")

    Logger.info("Fim")

    cond do
      querry[:name] -> %{name: querry[:name]}
      !querry[:name] -> "Id invalido"
    end
  end
end
