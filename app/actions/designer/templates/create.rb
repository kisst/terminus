# frozen_string_literal: true

module Terminus
  module Actions
    module Designer
      module Templates
        # The create action.
        class Create < Terminus::Action
          include Deps[
            :htmx_layout,
            repository: "repositories.screen_template",
            model_repository: "repositories.model"
          ]

          params do
            required(:screen_template).hash do
              required(:model_id).filled :integer
              required(:label).filled :string
              required(:code).filled :string
            end
          end

          def handle request, response
            parameters = request.params

            if parameters.valid?
              save parameters[:screen_template]
              response.render view, models: model_repository.all, layout: htmx_layout.call(request)
            else
              error response, parameters
            end
          end

          private

          def save attributes
            repository.create attributes
          end

          def error response, parameters
            response.render view,
                            models: model_repository.all,
                            screen_template: nil,
                            fields: parameters[:screen_template],
                            errors: parameters.errors[:screen_template]
          end
        end
      end
    end
  end
end
