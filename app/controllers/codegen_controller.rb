class CodegenController < ApplicationController
  def new
    @prompt = params[:prompt]
    @html_code = params[:html_code]
  end

  def create
    @prompt = params[:prompt]
    @html_code = chatgpt.send_message(@prompt)
    # @html_code = "<p>a paragraph</p>"
    render :new
  end

  private

  def chatgpt
    @chatgpt ||= ChatGptHelper.new
  end
end