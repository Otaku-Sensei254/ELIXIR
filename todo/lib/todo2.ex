defmodule ListUp do
  defstruct [:id, :title, act: false ]

  def new_do(), do: []

  def add_act(kazi, title) when is_list(kazi) and  is_binary(title) do
    id = length(kazi) + 1
    fanya = %ListUp{id: id, title: title, act: false}
    kazi ++ [fanya]
  end

  def get_acts(kazi) when is_list(kazi) do
    Enum.each(kazi, fn mboka ->
    cheki = if mboka.act, do: "[ ✅ DONE]", else: "[ X ]"
    IO.puts("Marked #{inspect(mboka.title)}, #{cheki}")
  end)
  kazi
  end

  #===========mark done=========
    def mark_done(kazi, id) when is_list(kazi) and is_integer(id) do
      Enum.map(kazi, fn mboka ->
        if mboka.id == id do
          IO.puts("Marked #{inspect(mboka.title)} as Done")
          %{mboka | act: true}
        else
          mboka
        end
      end)
    end

end
