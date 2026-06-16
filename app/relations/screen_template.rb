# frozen_string_literal: true

module Terminus
  module Relations
    # The screen template relation.
    class ScreenTemplate < DB::Relation
      schema :screen_template, infer: true do
        associations { belongs_to :model, relation: :model }
      end
    end
  end
end
