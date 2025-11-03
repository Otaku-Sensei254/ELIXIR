defmodule ClassRegister.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :name, :string
    field :admission_no, :integer
    field :class, :string
    timestamps()
  end

  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :admission_no, :class])
    |> validate_required([:name, :admission_no, :class])
  end
end
