defmodule RemoteExercise.Account do
  use GenServer

  import Ecto.Query

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

  def update_point() do
    Repo.transaction(fn repo ->
      User
      |> repo.all
      |> Enum.map(&
        &1
        |> User.changeset(%{point: gen_number()})
        |> repo.update
      )
    end)
  end

  def query_users() do
    GenServer.call(__MODULE__, :query_users)
  end

  def do_query_users(max, %{limit: limit}) do
    User
    |> where([u], u.point > ^max)
    |> limit(^limit)
    |> Repo.all()
  end

  @impl true
  def init(state) do
    send(self(), :update_point)
    {:ok, state}
  end

  @impl true
  def handle_info(:update_point, state) do
    update_point()
    Process.send_after(self(), :update_point, @interval)
    {:noreply, %{state | max_number: gen_number()}}
  end

  @impl true
  def handle_call(:query_users, _from, state) do
    %{max_number: max, last_query_at: last_query_at} = state
    users = do_query_users(max, %{limit: 2})
    {:reply, {users, last_query_at}, %{state | last_query_at: NaiveDateTime.utc_now()}}
  end

  defp gen_number do
    Enum.random(0..100)
  end
end
