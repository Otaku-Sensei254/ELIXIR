defmodule TodoList do
  use GenServer

  # =======================================================
  # 1. CLIENT API
  # =======================================================

  def start_link(_opts) do
    # Call init/1 with an empty list as the argument
    GenServer.start_link(__MODULE__, [])
  end

  def get_tasks(pid) do
    GenServer.call(pid, :get_tasks)
  end

  def add_task(pid, task) do
    # Send the task to the server in the message
    GenServer.cast(pid, {:add_task, task})
  end

  # =======================================================
  # 2. SERVER CALLBACKS
  # =======================================================

  @impl true
  def init(_args) do
    # Start with an empty list as our state
    {:ok, []}
  end

  @impl true
  def handle_call(:get_tasks, _from, list_state) do
    # Reply with the current list, and keep the state the same
    {:reply, list_state, list_state}
  end

  @impl true
  def handle_cast({:add_task, task}, list_state) do
    # 'task' is the string (e.g., "Buy milk")
    # 'list_state' is the old list (e.g., ["Learn Elixir"])

    # Create the new list
    new_list_state = [task | list_state]

    # Return the new state
    {:noreply, new_list_state}
  end
end
