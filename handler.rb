# frozen_string_literal: true

load 'slack/message.rb'
require 'json'

def lambda_handler(event:, context:)
  body = JSON.parse(event['body'])

  Slack::Message
    .new(channel: body['channel_name'], message: body['message'])
    .send

  { statusCode: 200, body: JSON.generate('Message sent successfully') }
end

def production_status(event:, context:)
  Slack::Message
    .new(channel: 'general', message: "Production it's ok!")
    .send

  { statusCode: 200, body: JSON.generate('Message sent successfully') }
end
