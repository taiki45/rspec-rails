require 'rails/generators/named_base'

module Rspec
  module Generators
    class Base < ::Rails::Generators::NamedBase
      def self.source_root
        @_rspec_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'rspec', generator_name, 'templates'))
      end

      if Gem::Requirement.new('< 3.1').satisfied_by?(Gem::Version.new(::Rails.version.to_s))
        def module_namespacing
          yield if block_given?
        end
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute
      def input_type
        @input_type ||= if type == :text
          "textarea"
        else
          "input"
        end
      end
    end
  end
end
