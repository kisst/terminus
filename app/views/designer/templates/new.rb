# frozen_string_literal: true

require "core"

module Terminus
  module Views
    module Designer
      module Templates
        # The new view.
        class New < Terminus::View
          expose :models
          expose :screen_template
          expose :fields, decorate: false, default: Core::EMPTY_HASH
          expose :errors, default: Core::EMPTY_HASH
        end
      end
    end
  end
end
