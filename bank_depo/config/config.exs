# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
import Config

# Configure your database
config :bank_depo, BankDepo.Repo,
  username: "dtech",
  password: "dtechpsql",
  hostname: "localhost",
  database: "bank_depo_#{Mix.env()}",
  pool_size: 10
config :bank_depo, ecto_repos: [BankDepo.Repo]

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
