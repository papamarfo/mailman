defmodule Mailman.Repo do
  use Ecto.Repo,
    otp_app: :mailman,
    adapter: Ecto.Adapters.Postgres
end
