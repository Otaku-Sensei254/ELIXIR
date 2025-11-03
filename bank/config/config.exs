import Config

config :bank, BankApp.Repo,
  database: "bank_repo",
  username: "dtech",
  password: "dtechpsql",
  hostname: "localhost",
  port: 5432

config :bank, ecto_repos: [BankApp.Repo]
