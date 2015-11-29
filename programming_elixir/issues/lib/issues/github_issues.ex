defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixir hector@hectoregm.com "}]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  @github_url Application.get_env(:issues, :github_url)
  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    { :ok, :jsx.decode(body) }
  end
  def handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    { :error, :jsx.decode(reason) }
  end
end
