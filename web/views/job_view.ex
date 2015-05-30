defmodule GetAJobEx.JobView do
  import GetAJobEx.Router.Helpers

  use GetAJobEx.Web, :view

  def render("api.json", %{conn: conn}) do
    job(conn)
  end

  def render("index.json", %{jobs: jobs, conn: conn}) do
    jobs = for job <- jobs, do: job(conn, job)
    %{data: jobs}
  end

  def render("show.json", %{job: job, conn: conn}) do
    %{job: job(conn, job)}
  end

  defp job(conn, job) do
    job
    |> Map.take([:number_one, :number_two, :status])
    |> Map.put(:links, links(conn, job))
  end

  defp job(conn) do
    %{number_one: nil,
      number_two: nil,
      status: nil,
      links: links(conn)}
  end

  defp links(conn) do
    [%{href: job_path(conn, :index),
       rel: "index"}]
  end

  defp links(conn, job) do
    [%{href: job_path(conn, :index),
       rel: "index"},
     %{href: job_path(conn, :show, job),
       rel: "self"}]
  end
end
