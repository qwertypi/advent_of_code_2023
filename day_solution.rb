# frozen_string_literal: true

require './input_fetcher'

# Superclass for all solutions, Day must be set
class DaySolution
  DAY = 0 # Set in subclass

  # @param [nil] input
  def initialize(input = nil)
    raise 'DAY must be set' if self.class::DAY.zero?

    @input = input || InputFetcher.fetch_input(self.class::DAY)
  end

end
