module Voicepartner
  class Configurator

    def initialize
      @api_key = nil
    end

    attr_accessor :api_key

    def config
      raise 'Initialization Error: you must specify the api_key when configuring' if api_key.nil?

      {
        api_key: api_key
      }
    end

  end

  private_constant :Configurator
end
