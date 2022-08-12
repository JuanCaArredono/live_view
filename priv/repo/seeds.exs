# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewStudio.Repo.insert!(%LiveViewStudio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveViewStudio.Repo
alias LiveViewStudio.Servers.Server

%Server{
  name: "QA-Server",
  status: "dawn",
  deploy_count: 12,
  size: 24.0,
  framework: "Elixir/Phoenix",
  git_repo: "http://git.argo",
  last_commit_id: "125ass5a",
  last_commit_message: "hotfix_230",
}
|>Repo.insert!()


%Server{
  name: "server_Argo",
  status: "up",
  deploy_count: 12,
  size: 24.0,
  framework: "Elixir/Phoenix",
  git_repo: "http://git.argo",
  last_commit_id: "125ass5a",
  last_commit_message: "hotfix_230",
}
|>Repo.insert!()


%Server{
  name: "mercurio",
  status: "up",
  deploy_count: 20,
  size: 30.0,
  framework: "Golang",
  git_repo: "http://git.mercurio",
  last_commit_id: "125ass5a",
  last_commit_message: "hotfix_230",
}
|>Repo.insert!()


%Server{
  name: "Bemus",
  status: "up",
  deploy_count: 30,
  size: 24.0,
  framework: "Elixir/Phoenix",
  git_repo: "http://git.bemous",
  last_commit_id: "125ass5a",
  last_commit_message: "hotfix_230",
}
|>Repo.insert!()
