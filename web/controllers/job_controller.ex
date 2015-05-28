defmodule GetAJobEx.JobController do
  use GetAJobEx.Web, :controller
  alias GetAJobEx.Repo
  alias GetAJobEx.Job

  plug :action

  def api(conn, _params) do
    render conn, :api
  end
  
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
      |> put_status(:bad_request)
      |> text "invalid"
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get Job, id
    if job do
      render conn, job: job
    else
      conn
      |> put_status(:not_found)
      |> text "not found"
    end
  end

end
