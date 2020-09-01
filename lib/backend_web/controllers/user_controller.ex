defmodule BackendWeb.UserController do
  use BackendWeb, :controller
  require Logger

  def index(conn, _params) do
    json(conn, data())
  end

  def create(conn, params) do
    Logger.info(params["user"]["name"])
    json(conn, %{success: true})
  end

  def show(conn, %{"id" => id}) do
    json(conn, getUsers(id))
  end

  def data do
    [
      %{
        id: 1,
        name: "gustavo"
      },
      %{
        id: 2,
        name: "elixir"
      }
    ]
  end

  def getUsers(id) do
    Logger.info("Inicio")

    querry =
      Enum.find(data(), fn
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
