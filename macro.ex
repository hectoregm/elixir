defmodule MyMacros do
  defmacro newfunc(name, do: block) do
    quote do
      def unquote(name)() do
        unquote(block)
      end
    end
  end
end
