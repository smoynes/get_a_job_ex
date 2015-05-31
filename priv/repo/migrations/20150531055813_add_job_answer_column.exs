
defmodule GetAJobEx.Repo.Migrations.AddJobAnswerColumn do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :answer, :integer
    end
  end
end
