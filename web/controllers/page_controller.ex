defmodule GetAJobEx.PageController do
  use GetAJobEx.Web, :controller
  alias GetAJobEx.Job

  plug :action

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render conn, "index.html", jobs: jobs
  end

end
