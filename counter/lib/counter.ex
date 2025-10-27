defmodule Counter do
  # This "imports" all the standard GenServer behaviors
  use GenServer

  # =======================================================
  # 1. CLIENT API (The functions we call)
  # =======================================================

  # This is how we start our server
  def start_link(_opts) do
    # It will start the GenServer, which calls the `init` function below.
    # We "name" the server :counter so we can find it easily.
    GenServer.start_link(__MODULE__, 0, name: :counter)
  end

  @doc "Gets the current value of the counter"
  def get_value do
    # This is a SYNCHRONOUS call. We send a message
    # (:get_value) and *wait* for a reply.
    GenServer.call(:counter, :get_value)
  end

  @doc "Adds 1 to the counter"
  def increment do
    # This is an ASYNCHRONOUS cast. We send a message
    # (:increment) and *don't* wait for a reply.
    GenServer.cast(:counter, :increment)
  end

  # =======================================================
  # 2. SERVER CALLBACKS (The functions the GenServer runs)
  # =======================================================

  @doc "This runs ONCE when the server starts."
  # The '0' from start_link becomes the 'start_value' here.
  def init(start_value) do
    # We set the bot's "state" (its memory) to 0.
    {:ok, start_value}
  end

  @doc "Handles 'call' messages (from get_value)"
  # The GenServer gets the message :get_value.
  # 'state' is the bot's current memory (the number).
  def handle_call(:get_value, _from, state) do
    # We must send a reply back.
    # The reply is the state (the current count).
    # We also pass back the state, unchanged.
    {:reply, state, state}
  end

  @doc "Handles 'cast' messages (from increment)"
  # The GenServer gets the message :increment.
  # 'state' is the current count.
  def handle_cast(:increment, state) do
    # We create a NEW state
    new_state = state + 1

    # We don't send a reply.
    # We just return the NEW state.
    {:noreply, new_state}
  end
end
