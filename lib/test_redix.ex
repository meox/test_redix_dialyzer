defmodule TestRedix do
  @moduledoc """
  Documentation for TestRedix.
  """

  @spec update_redis(String.t()) :: integer | :error
  defp update_redis(redis_key) do
    expires_in = 7200

    case Redix.pipeline(:redix, [["EXPIRE", redis_key, expires_in], ["INCR", redis_key]]) do
      {:ok, [_previuos, counter]} ->
        counter

      {:ok, _} ->
        :error

      e ->
        e
    end
  end
end
