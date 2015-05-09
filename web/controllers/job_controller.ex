defmodule GetAJobEx.JobController do
  use GetAJobEx.Web, :controller
  alias GetAJobEx.Repo
  alias GetAJobEx.Job

  plug :action

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render conn, jobs: jobs
  end
end
