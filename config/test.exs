use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :get_a_job_ex, GetAJobEx.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :get_a_job_ex, GetAJobEx.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "get_a_job",
  hostname: "127.0.0.1",
  password: "password",
  database: "get_a_job_ex_test",
  size: 1,
  max_overflow: 0
