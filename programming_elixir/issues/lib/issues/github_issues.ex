defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixir hector@hectoregm.com "}]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end
  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    { :ok, body }
  end
  def handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    { :error, reason }
  end
end
