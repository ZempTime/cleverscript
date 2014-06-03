module Cleverscript
  class Client
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options = {})
      merged_options = Cleverscript.options.merge(options)

      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end
  end
end
