nested = %{
    buttercup: %{ 
      actor: %{
        first: "Robin",
        last:  "Wright"
      },
      role: "princess"
    },
    westley: %{
      actor: %{
        first: "Carey",
        last:  "Ewes"     # typo!
      },
      role: "farm boy"
    }
}

IO.inspect get_in(nested, [:buttercup, :actor])
IO.inspect get_in(nested, [:buttercup, :actor, :first])

IO.inspect put_in(nested, [:westley, :actor, :last], "Elwes")
