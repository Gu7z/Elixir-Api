defmodule BackendWeb.DocController do
  use BackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
