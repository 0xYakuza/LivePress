defmodule LivePress.Repo do
  use Ecto.Repo,
    otp_app: :livePress,
    adapter: Ecto.Adapters.Postgres
end
