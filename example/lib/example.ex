defmodule Example do
  @moduledoc """
  Documentation for Example.
  """

  def ssh_check_pass(_provided_username, provided_password) do
    correct_password = Application.get_env(:example, :password, "kiosk")

    provided_password == to_charlist(correct_password)
  end

  def ssh_show_prompt(_peer, _username, _service) do
    {:ok, name} = :inet.gethostname()

    msg = """
    ssh kiosk@#{name}.local # Use password "kiosk"
    """

    {~c"Kiosk", to_charlist(msg), ~c"Password: ", false}
  end
end
