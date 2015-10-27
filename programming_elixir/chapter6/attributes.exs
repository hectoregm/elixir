defmodule Example do
  @author "Dave Thromas"
  def get_author do
    @author
  end
end

IO.puts "Example was writen by #{Example.get_author}"
