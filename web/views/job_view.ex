defmodule GetAJobEx.JobView do
  use GetAJobEx.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: jobs}
  end

  def render("show.json", %{job: job}) do
    %{job: job}
  end

end
