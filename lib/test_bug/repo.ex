defmodule TestBug.Repo do
  use Ecto.Repo,
    otp_app: :test_bug,
    adapter: Ecto.Adapters.Postgres
end
