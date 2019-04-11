require 'voicepartner/version'
require 'voicepartner/configurator'
require 'voicepartner/client'

module Voicepartner
  class << self

    def configure
      raise 'You need to provide a block to configure' unless block_given?

      configurator = Configurator.new
      yield configurator
      self.configuration = configurator.config
      self.client = Client.new(self.configuration)
    end

    attr_accessor :configuration

    attr_accessor :client

    def send_vocal_message(to:, message_text:)
      if client.nil?
        raise 'Initialization Error: ' \
        'You must call Voicepartner.configure before calling send_vocal_message'
      end

      client.send_vocal_message(to: to, message_text: message_text)
    end

  end
end
