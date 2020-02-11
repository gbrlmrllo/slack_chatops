# frozen_string_literal: true

require 'slack-ruby-client'

module Slack
  # Slack message implementation
  class Message
    attr_reader :channel, :message

    def initialize(channel:, message:)
      @channel = channel
      @message = message
    end

    def send
      slack_client
        .chat_postMessage(channel: channel, text: message, as_user: true)
    end

    private

    def slack_client
      @slack_client ||= Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
    end
  end
end
