defmodule TestBugWeb.MainLive do
  @moduledoc false

  use TestBugWeb, :live_view

  def mount(_, _, socket) do
    form = to_form(%{"element_one" => "", "element_two" => ""}, as: :test)

    {:ok, assign(socket, form: form)}
  end

  def handle_event("validate", %{"test" => params}, socket) do
    params = change_params(params) |> IO.inspect()

    {:noreply, assign(socket, form: to_form(params, as: :test))}
  end

  def render(assigns) do
    ~H"""
    <.form :let={f} for={@form} phx-change="validate" phx-submit="save">
      <.input field={f[:element_one]} label="Element 1" phx-hook="MyHook" />
      <.input field={f[:element_two]} label="Element 2" />

      <input type="submit" value="Save" />
    </.form>
    """
  end

  defp change_params(%{"element_one" => my_input} = params) do
    %{params | "element_one" => String.capitalize(my_input)}
  end

end
