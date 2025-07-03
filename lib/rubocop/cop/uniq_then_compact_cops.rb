# frozen_string_literal: true

module RuboCop
  module Cop
    module Classi
      class NewMyCop < Base # rubocop:disable Style/Documentation
        MSG = 'DO NOT USE `#current_user`!'

        RESTRICT_ON_SEND = %i[current_user].freeze

        def on_send(node)
          add_offense(node)
        end
        alias on_csend on_send
      end
    end
  end
end
