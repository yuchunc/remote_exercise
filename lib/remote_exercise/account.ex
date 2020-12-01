defmodule RemoteExercise.Account do
  use GenServer

  alias RemoteExercise.Repo
  alias RemoteExercise.Account
  alias Account.User

  # 1 min
  @interval 60 * 1000

  def start_link(_) do
    state = %{
      max_number: gen_number(),
      last_query_at: nil
    }

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def update_point(point) do
    Repo.update_all(User, set: [point: point])
  end

  @impl true
  def init(state) do
    send(self(), :update_point)
    {:ok, state}
  end

  @impl true
  def handle_info(:update_point, state) do
    %{max_number: point} = state
    update_point(point)
    Process.send_after(self(), :update_point, @interval)
    {:noreply, %{state | max_number: gen_number()}}
  end

  defp gen_number do
    Enum.random(0..100)
  end
end
