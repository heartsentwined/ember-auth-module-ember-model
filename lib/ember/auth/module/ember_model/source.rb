module Ember
  module Auth
    module Module
      module EmberModel
        module Source
          def self.bundled_path
            path = File.join '..', '..', '..', '..', '..', '..', \
              'dist', 'ember-auth-module-ember-model.js'
            File.expand_path path, __FILE__
          end
        end
      end
    end
  end
end
