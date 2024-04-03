defmodule LivePressWeb.PluginsController do
  use LivePressWeb, :controller

  def index(conn, _params) do
    render(conn, :plugins)
  end
end
