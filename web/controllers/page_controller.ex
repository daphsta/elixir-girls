defmodule Slackir.PageController do
  use Slackir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
