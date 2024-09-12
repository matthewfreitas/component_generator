class TestController < ApplicationController

  def index
  end

  def generate_component
    @generated_code = chatgpt.send_message(params[:user_query])
    render :index
  end

  private

  def chatgpt
    @chatgpt ||= ChatGptHelper.new
  end
end
