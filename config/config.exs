# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, HolonetRelay.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "5MPAw+2yoB9/KDYxyY8RNipH5UxJZ15GaO36hzPavMvayA0Fg32wpE3z+iwCshTXVQdivciwdzLhcyt/ObZT6Q==",
  catch_errors: true,
  debug_errors: false,
  error_controller: HolonetRelay.ErrorController

# Session configuration
config :phoenix, HolonetRelay.Router,
  session: [store: :cookie,
            key: "_holonet_relay_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
