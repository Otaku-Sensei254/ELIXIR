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

#======================SIMPLE COUNTER======================
  #Build a GenServer that holds a single number as its state
  #include module SimpleCounter that has start_link(start_value)

defmodule SimpleCounter do
  use GenServer

  def start_link(start_value) do
    #pass the start_value as the second arguement
    #it will be sent to the init/1 callback
    GenServer.start_link(__MODULE__, start_value)
  end

  #server callbacks (what GenServer runs)
  @impl true
  @doc "this will tell the init what to do once it starts"
  def init(start_value)do
    #the start value from _ start_link arrives here and set it as the server's state/ memory
    {:ok, start_value}
  end

  #now the get count
  #CLIENT API
    def get_count(pid) do
      #this is synchronous.....sends message :get_count: to the `pid` and WAITS for reply
      GenServer.call(pid, :get_count)
    end

    #-------------SERVER CALLBACK CONTINUED------------------
    @impl true
    def handle_call(:get_count, _from, state) do
      #this one receives the message from get_count and the state within its memory
      #and reply with the state and the new state is just the same state unchanged
      {:reply, state, state}
    end

    #------------------CLIENT API CONTINUED-------------------
    def increment(pid) do
      #this is asynchronous thus send message but doesn't wait for reply
      GenServer.cast(pid, :increment)
    end
    #----SERVER CALLBACKS CONTINUED
    @impl true
    def handle_cast(:increment, state) do
      #this captures the message from the above function (increment) and its state
      new_state = state + 1

      #no need to reply but return a value of the new_state as NEW state
      {:noreply, new_state}
    end
end
