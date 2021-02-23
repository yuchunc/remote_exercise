defmodule RandGen.Randomizer do
  use GenServer

  alias RandGen.Account

  @interval 60 * 1000

  def start_link(_) do
    state = %{
      max_number: rand_number(),
      last_query_at: nil
    }

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get_users() do
    GenServer.call(__MODULE__, :get_users)
  end

  @impl true
  def init(state) do
    unless Mix.env() == :test do
      send(self(), :update_points)
    end

    {:ok, state}
  end

  @impl true
  def handle_info(:update_points, state) do
    update_points()

    unless Mix.env() == :test do
      Process.send_after(self(), :update_points, @interval)
    end

    {:noreply, %{state | max_number: rand_number()}}
  end

  @impl true
  def handle_call(:get_users, _from, state) do
    %{max_number: max, last_query_at: last_query_at} = state

    users = Account.get_users_by_max(max, limit: 2)
    new_state = %{state | last_query_at: NaiveDateTime.utc_now()}

    {:reply, {users, last_query_at}, new_state}
  end

  defp update_points() do
    Account.get_users()
    |> Enum.map(&Account.update_user(&1, %{points: rand_number()}))
  end

  defp rand_number do
    Enum.random(0..100)
  end
end
