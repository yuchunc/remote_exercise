defmodule RandGen.Factory do
  use ExMachina.Ecto, repo: RandGen.Repo

  alias RandGen.Account

  def user_factory do
    %Account.User{
      points: Enum.random(0..100)
    }
  end
end
