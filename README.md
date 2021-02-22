# RemoteExercise

## Prerequisit

Make sure you have the following installed on your machine:

* Postgres
* asdf

## Setup

1. Clone the project `git clone git@github.com:yuchunc/remote_exercise.git`
2. `cd` into project directory
3. run `asdf install` to install Erlang and Elixir
4. run `mix deps.get` to install required dependencies
5. run `mix ecto.setup` to create development db, run migrations, and insert seed data

> If you want to recreate the DB environment, run: `mix ecto.reset`

## Running Server

In terminal, run `mix phx.server`.
Now you should get be getting response from `http://localhost:4000/`.
