# RemoteExercise

## Prerequisit

Make sure you have the following installed on your machine:

* Postgres
* Elixir
* Erlang

## Setup

Clone the project `git clone git@github.com:yuchunc/remote_exercise.git`

After cloning the project, `cd` into project directory, and run `mix deps.get` to install
required dependencies.

`mix ecto.setup` should create development postgres db, run all migrations, and insert seed data.

If you want to recreate the DB environment, run: `mix ecto.reset`.

## Running Server

In terminal, run `mix phx.server`.
Now you should get be getting response from `http://localhost:4000/`.

## Testing

To run test, follow the below command:

```
export MIX_ENV=test

mix ecto.reset

mix test
```
