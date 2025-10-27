defmodule Reminder do

  def start do
    spawn(Reminder, :loop, [])
  end

  # --- NEW HELPER FUNCTION ---
  # This function does all the math for us!
  # It uses pattern matching on the 'unit'
  defp to_milliseconds(number, :seconds) do
    number * 1000
  end

  defp to_milliseconds(number, :minutes) do
    number * 60 * 1000
  end

  defp to_milliseconds(number, :hours) do
    number * 60 * 60 * 1000
  end

  defp to_milliseconds(number, :days) do
    number * 24 * 60 * 60 * 1000
  end

  # --- UPDATED LOOP ---
  def loop do
    receive do
      # 1. The message pattern is now different:
      {:add, task, number, unit} ->

        # 2. We call our new helper function
        ms = to_milliseconds(number, unit)

        IO.puts("Bot: OK! I'll remind you to '#{task}' in #{number} #{unit}.")

        # 3. We use the calculated milliseconds
        Process.send_after(self(), {:remind, task}, ms)

        loop()

      {:remind, task} ->
        IO.puts("")
        IO.puts("-------------------------")
        IO.puts("🔔 REMINDER: #{task} 🔔")
        IO.puts("-------------------------")
        loop()
    end
  end
end
