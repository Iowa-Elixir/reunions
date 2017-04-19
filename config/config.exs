# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reunions,
  ecto_repos: [Reunions.Repo]

# Configures the endpoint
config :reunions, Reunions.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JihBlF8D5jcejBtc9usP9PObHx0JToUxtVqvnOzAok4YS8KOmqLmx6aj+GDFFmuh",
  render_errors: [view: Reunions.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Reunions.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Reunions.User,
  repo: Reunions.Repo,
  module: Reunions,
  logged_out_url: "/",
  email_from_name: "Reunions",
  email_from_email: "hi@reunionsandmore.com",
  layout: {Reunions.LayoutView, :app},
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

# %% End Coherence Configuration %%
