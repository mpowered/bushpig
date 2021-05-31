
# frozen_string_literal: true

module Bushpig
  module Testing
    def self.inline!(&block)
      old = Bushpig.testing
      Bushpig.testing = true
      result = block.call
      Bushpig.testing = old
      result
    end
  end
end