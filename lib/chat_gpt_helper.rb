class ChatGptHelper
  def initialize(api_key = Rails.application.credentials.dig(:openai, :api_key))
    @api_key = api_key
  end

  def send_message(message)
    message = { role: "user", content: message }
    client = OpenAI::Client.new(
      access_token: @api_key,
      log_errors: true
    )
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [message],
        temperature: 0.7,
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end