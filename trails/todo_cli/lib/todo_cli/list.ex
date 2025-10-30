defmodule TodoCli.List do
  use GenServer

  # Client API
  def start_link() do
    start_link([])
  end

  def start_link(default) do
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  def add_task(task) do
    GenServer.cast(__MODULE__, {:add_task, task})
  end

  def tasks do
    GenServer.call(__MODULE__, :tasks)
  end

  def complete_task(index) do
    GenServer.cast(__MODULE__, {:complete_task, index})
  end

  # Server Callbacks
  @impl true
  def init(tasks) do
    {:ok, tasks}
  end

  @impl true
  def handle_cast({:add_task, task}, tasks) do
    new_tasks = tasks ++ [task]
    {:noreply, new_tasks}
  end

  @impl true
  def handle_cast({:complete_task, index}, tasks) do
    # This is a placeholder, we will implement this later
    new_tasks = tasks
    {:noreply, new_tasks}
  end

  @impl true
  def handle_call(:tasks, _from, tasks) do
    {:reply, tasks, tasks}
  end
end
