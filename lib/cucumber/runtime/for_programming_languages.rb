require 'forwardable'
require 'cucumber/core/ast/doc_string'
require 'cucumber/core/ast/data_table'

module Cucumber
  class Runtime
    # This is what a programming language will consider to be a runtime.
    #
    # It's a thin class that directs the handul of methods needed by the
    # programming languages to the right place.
    class ForProgrammingLanguages
      extend Forwardable

      def initialize(support_code, user_interface)
        @support_code, @user_interface = support_code, user_interface
      end

      def_delegators :@user_interface,
        :embed,
        :ask,
        :puts,
        :features_paths,
        :step_match

      def_delegators :@support_code,
        :invoke_dynamic_steps,
        :invoke_dynamic_step,
        :load_programming_language
    end
  end
end
