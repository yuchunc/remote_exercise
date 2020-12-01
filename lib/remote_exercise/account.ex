defmodule RemoteExercise.Account do
  use GenServer

  def start_link(_) do
    state = %{
      max_number: Enum.random(0..100),
      last_query_at: nil
    }

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end
end
