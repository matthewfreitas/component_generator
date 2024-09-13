class CodegenController < ApplicationController
  def new
    @prompt = params[:prompt]
    @component_type = params[:component_type]
    @html_code = params[:html_code]
  end

  def create
    @prompt = params[:prompt]
    @component_type = params[:component_type]
    @html_code = chatgpt.send_message(@prompt, template(@component_type))
    render :new
  end

  private

  def chatgpt
    @chatgpt ||= ChatGptHelper.new
  end

  def template(type)
    # You could modify this to use the class you wrote
    return card_template if type == "card"
    return form_template if type == "form"
    return table_template if type == "table"
  end

  def card_template
    <<~HTML
      // Matt, insert html for the template here
    HTML
  end

  def table_template
    <<~HTML

    HTML
  end

  def form_template
    <<~HTML
      
    HTML
  end


end