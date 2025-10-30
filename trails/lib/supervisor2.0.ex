defmodule MySupervisor do
  alias Task.Supervised
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, name: :my_supervisor)
  end

  @impl true
  def init(_opts) do
    children = [
      # Give each child a unique :id
      Supervisor.child_spec({Counter2, 0}, id: :counter_a),
      Supervisor.child_spec({Counter2, 100}, id: :counter_b)
    ]


    #tell the supervisor how to handle and manage the children
    Supervisor.init(children, strategy: :one_for_one)
  end
end
