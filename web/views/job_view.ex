defmodule GetAJobEx.JobView do
  import GetAJobEx.Router.Helpers

  use GetAJobEx.Web, :view

  def render("api.json", %{conn: conn}) do
    job(conn)
  end

  def render("index.json", %{jobs: jobs}) do
    %{data: jobs}
  end

  def render("show.json", %{job: job}) do
    %{job: job}
  end

  defp job(conn) do
    %{number_one: nil,
      number_two: nil,
      status: nil,
      links: links(conn)}
  end

  defp links(conn) do
    %{href: job_path(conn, :index),
      rel: "index"}
  end
end
