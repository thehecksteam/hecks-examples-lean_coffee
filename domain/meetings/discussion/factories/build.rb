module LeanCoffee
  module Domain
    module Meetings
      class Discussion
        module Factories
          class Build
            def self.factory(args)
              Discussion.new(
                id: args[:id],
                discussing: args[:discussing].is_a?(Hash) ? Discussion.build(args[:discussing]) : args[:discussing],
                discussed: (args[:discussed] || []).map do |object|
                  object.is_a?(Hash) ? Discussion.build(object) : object
                end,
                topics: (args[:topics] || []).map do |object|
                  object.is_a?(Hash) ? Topic.build(object) : object
                end,
              )
            end
          end
        end
      end
    end
  end
end
