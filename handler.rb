load 'slack/message.rb'
require 'json'

def lambda_handler(event:, context:)
  body = JSON.parse(event["body"])

  Slack::Message
    .new(channel: body["channel_name"], message: body["message"])
    .send

  { statusCode: 200, body: JSON.generate('Message sent successfully') }
end
