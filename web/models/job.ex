defmodule GetAJobEx.Job do
  use GetAJobEx.Web, :model

  schema "jobs" do
    field :number_one, :integer
    field :number_two, :integer
    field :status, :string

    timestamps
  end

  @required_fields ~w(number_one number_two status)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
