# frozen_string_literal: true

require 'lint_roller'

module RuboCop
  module UniqThenCompact
    # A plugin that integrates rubocop-uniq_then_compact with RuboCop's plugin system.
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: 'rubocop-uniq_then_compact',
          version: VERSION,
          homepage: 'https://github.com/lowput/rubocop-uniq_then_compact',
          description: 'A RuboCop plugin for detecting uniq.compact patterns and similar code improvements.'
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        LintRoller::Rules.new(
          type: :path,
          config_format: :rubocop,
          value: Pathname.new(__dir__).join('../../../config/default.yml')
        )
      end
    end
  end
end
