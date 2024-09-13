class ChatGptHelper
  def initialize(api_key = Rails.application.credentials.dig(:openai, :api_key))
    @client = OpenAI::Client.new(
      access_token: api_key,
      log_errors: true
    )
  end

  def send_message(content, template)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: messages(content, template),
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  def messages(content, template)
    [
      { role: "system", content: system_prompt(template) },
      { role: "user", content: }
    ]
  end

  def system_prompt(template)
    "You are an assistant that generates HTML snippets based on user prompts that conforms to a template. " \
      "The template is as follows: #{template}. Output new HTML code that conforms to the template outline." \
      "You should only generate HTML code. Do not apply additional formatting to the HTML code."
  end
end