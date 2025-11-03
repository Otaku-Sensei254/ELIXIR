defmodule ClassRegister.Repo.Migrations.Students do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :admission_no, :integer
      add :class, :string

      timestamps()
    end
  end
end
