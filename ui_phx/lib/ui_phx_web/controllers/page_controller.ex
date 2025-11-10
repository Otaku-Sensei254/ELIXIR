defmodule UiPhxWeb.PageController do
  use UiPhxWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
