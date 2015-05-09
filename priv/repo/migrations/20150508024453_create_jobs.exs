defmodule GetAJobEx.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :number_one, :integer
      add :number_two, :integer
      add :status

      timestamps
    end
  end
end
