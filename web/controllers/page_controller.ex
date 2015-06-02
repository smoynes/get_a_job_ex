defmodule GetAJobEx.PageController do
  use GetAJobEx.Web, :controller
  alias GetAJobEx.Job

  plug :action

  def index(conn, _params) do
    query = from j in Job, order_by: [desc: j.id]
    jobs = Repo.all(query)
    render conn, "index.html", jobs: jobs
  end

end
