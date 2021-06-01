defmodule Califa.Repo do
  use Ecto.Repo,
    otp_app: :califa,
    adapter: Ecto.Adapters.Postgres
end
