import Config

config :class_register, ClassRegister.Repo,
  database: "class_register_repo",
  username: "dtech",
  password: "dtechpsql",
  hostname: "localhost"

  config :class_register,
  ecto_repos: [ClassRegister.Repo]
