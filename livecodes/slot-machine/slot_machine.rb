class SlotMachine
  ITEMS = %w[🤩 ⭐️ 🛎 7️⃣ 🍒].reverse
  
  def initialize(reels = %w[🤩 🤩 🤩])
    @reels = reels
  end

  def play
    60.times do
      shuffle_reels
      print @reels.join("\t") + "\r"
      # \r is the 'return carriage' character to return to the beginning of the line
      $stdout.flush # clears the line in the terminal
      sleep(0.03)
    end
    sleep(0.5)
    shuffle_reels
  end

  def score
    if three_of_the_same?
      # all items are the same, we can pick any of them
      unique_item = @reels[0]
      10 * item_value(unique_item)
    elsif two_of_the_same_plus_joker?
      # [⭐️, 🤩, ⭐️].sort => [⭐️, ⭐️, 🤩]
      # [🤩, ⭐️, ⭐️].sort => [⭐️, ⭐️, 🤩]
      # [⭐️, ⭐️, 🤩].sort => [⭐️, ⭐️, 🤩]
      # [⭐️, ⭐️, 🤩].sort.reverse => [🤩, ⭐️, ⭐️]
      # 💡 The item in the middle is always the double item!
      repeated_item = @reels.sort[1]
      5 * item_value(repeated_item)
    else
      0
    end
  end

  private

  def shuffle_reels
    @reels = @reels.map { ITEMS.sample }
  end

  def item_value(item)
    # get the index of the item in the ITEMS array
    ITEMS.index(item) + 1
  end

  def three_of_the_same?
    # There should be only one element left after removing the duplicates
    @reels.uniq.length == 1
  end

  def two_of_the_same_plus_joker?
    @reels.uniq.length == 2 && @reels.include?('🤩')
  end
end