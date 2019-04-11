require 'httparty'
require 'ostruct'

module Voicepartner
  class Client

    def initialize(config)
      @api_key = config.fetch(:api_key)
    end

    def send_vocal_message(to:, message_text:)
      res = send_request(
        phoneNumbers: to,
        text:         message_text
      )

      OpenStruct.new(
        raw_response: res.parsed_response,
        success:      res.parsed_response&.[]('success'),
        rate_limit:   {
          limit:     extract_header(res.headers['x-ratelimit-limit']),
          remaining: extract_header(res.headers['x-ratelimit-remaining']),
          resets_at: extract_header(res.headers['x-ratelimit-reset'])
        }
      )
    end

    private

    def send_request(payload)
      HTTParty.post(
        SEND_VOCAL_MESSAGE_URL,
        body: payload.merge(apiKey: @api_key).to_json,
        headers: HEADERS
      )
    end

    def extract_header(value, strategy: :to_i)
      {
        parsed: handle_strategy(value, strategy),
        raw:    value
      }
    end

    def handle_strategy(value, strategy)
      case strategy
      when :to_i
        value.to_i
      when :time_at
        Time.at(value.to_i).utc
      end
    end

    SEND_VOCAL_MESSAGE_URL = 'http://api.voicepartner.fr/v1/tts/send'.freeze

    HEADERS = {
      'Content-type' => 'application/json;charset=utf-8'
    }.freeze

    private_constant :SEND_VOCAL_MESSAGE_URL
    private_constant :HEADERS

  end
end
