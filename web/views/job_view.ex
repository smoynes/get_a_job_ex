defmodule GetAJobEx.JobView do
  use GetAJobEx.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: jobs}
  end

end
