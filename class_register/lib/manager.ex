defmodule ClassRegister.Manager do
  alias ClassRegister.{Repo, Student}

  def add_student(attrs) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  def list_students do
    Repo.all(Student)
  end

  def remove_student(admission_no) do
    Repo.get_by(Student, admission_no: admission_no)
    |> Repo.delete()
  end

  def update_student(admission_no, attrs) do
    Repo.get_by(Student, admission_no: admission_no)
    |> Student.changeset(attrs)
    |> Repo.update()
  end
end
