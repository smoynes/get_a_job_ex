defmodule GetAJobEx.JobView do
  use GetAJobEx.Web, :view

  def render("api.json", _) do
    %{job: %{number_one: nil,
             number_two: nil,
             status: nil,
             links: [
               %{href: "/api/jobs",
                 rel: "index"}
             ],
            }
     }
  end
  
  def render("index.json", %{jobs: jobs}) do
    %{data: jobs}
  end

  def render("show.json", %{job: job}) do
    %{job: job}
  end

end
