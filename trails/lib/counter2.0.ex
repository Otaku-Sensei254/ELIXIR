defmodule Counter2 do
  use GenServer
  def start_link(start_value) do
    GenServer.start_link(__MODULE__, start_value)
  end

  @imple true
  def init (start_value) do
    {:ok, start_value}
  end

  #========clieny api==========
    def increment(pid) do
      increment(pid, 1)
    end

    def increment(pid, amount) do
      GenServer.cast(pid, {:increment, amount})
    end

    def get_value(pid) do
      GenServer.call(pid, :get_value)
    end

    #=========callbacks=================
      @impl true
      def handle_cast({:increment, amount}, state) do
        {:noreply, state + amount }
      end
      @impl true
  def handle_call(:get_value, _from, state) do
    {:reply, state, state}
  end

end