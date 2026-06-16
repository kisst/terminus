# frozen_string_literal: true

module Terminus
  module Repositories
    # The screen template repository.
    class ScreenTemplate < DB::Repository[:screen_template]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        screen_template.combine(:model)
                       .order { created_at.desc }
                       .to_a
      end

      def all_by_model id
        screen_template.where(model_id: id)
                       .order { created_at.desc }
                       .to_a
      end

      def find(id) = (screen_template.combine(:model).by_pk(id).one if id)
    end
  end
end
