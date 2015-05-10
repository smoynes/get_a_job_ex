defmodule GetAJobEx.JobController do
  use GetAJobEx.Web, :controller
  alias GetAJobEx.Repo
  alias GetAJobEx.Job

  plug :action

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render conn, jobs: jobs
  end

  def create(conn, %{"job" => job_params}) do
    changeset = Job.changeset(%Job{}, job_params)

    if changeset.valid? do
      id = Repo.insert(changeset)
      redirect conn, to: job_path(conn, :show, id)
    else
      conn
      |> put_status(400)
      |> text "invalid"
    end
  end

end
