defmodule CircleTestWeb.PageController do
  use CircleTestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
