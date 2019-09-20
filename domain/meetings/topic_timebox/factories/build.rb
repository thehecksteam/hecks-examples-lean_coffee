module LeanCoffee
  module Domain
    module Meetings
      class TopicTimebox
        module Factories
          class Build
            def self.factory(args)
              TopicTimebox.new(
                duration: args[:duration],
                extension: args[:extension].is_a?(Hash) ? Extension.build(args[:extension]) : args[:extension],
              )
            end
          end
        end
      end
    end
  end
end
