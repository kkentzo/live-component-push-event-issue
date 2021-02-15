# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_component_js_issue, LiveComponentJsIssueWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VnhVWTWL5331j6H2h1lLk6KdBChfIEGp3xfkBs+AzjIKomKCjMMy+vhh340biQFi",
  render_errors: [view: LiveComponentJsIssueWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveComponentJsIssue.PubSub,
  live_view: [signing_salt: "r6y+EK8l"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
