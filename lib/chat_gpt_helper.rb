class ChatGptHelper
  def initialize(api_key = Rails.application.credentials.dig(:openai, :api_key))
    @client = OpenAI::Client.new(
      access_token: api_key,
      log_errors: true
    )
  end

  def send_message(content, template, image_url = nil)
    response = @client.chat(
      parameters: {
        model: "gpt-4o",
        messages: messages(content, template, image_url),
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  def messages(content, template, image_url)

    full_content = [
      { type: "text", text: content || "Create a card using the image"},
    ]

    if image_url
      full_content << { type: "image_url", image_url: { url: image_url } }
    end

    messages = [
      { role: "system", content: system_prompt(template) },
      { role: "user", content: full_content }
    ]

    messages
  end

  def system_prompt(template)
    <<~PROMPT
      You are an assistant that generates snippets of HTML + TailwindCSS code based on user prompts that conforms to a template.
      The template is as follows: #{template}. Output an HTML snippet that uses the template.
      Return just the raw snippet code; do not apply additional formatting to the response. For example, do not include triple backticks or other formatting.
    PROMPT
  end
end