defmodule LivePressWeb.PanelController do
  use LivePressWeb, :controller

  def panel(conn, _params) do
    render(conn, :panel)
  end
end
