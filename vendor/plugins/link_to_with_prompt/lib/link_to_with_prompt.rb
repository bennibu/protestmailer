module LinkToWithPrompt

  def convert_options_to_javascript!(html_options, url = '')
    prompt, confirm, popup = html_options.delete("prompt"), html_options.delete("confirm"), html_options.delete("popup")
    method, href = html_options.delete("method"), html_options['href']

    html_options["onclick"] = case
      when popup && method
        raise ActionView::ActionViewError, "You can't use :popup and :method in the same link"
      when confirm && popup
        "if (#{confirm_javascript_function(confirm)}) { #{popup_javascript_function(popup)} };return false;"
      when confirm && method
        "if (#{confirm_javascript_function(confirm)}) { #{method_javascript_function(method)} };return false;"
      when confirm
        "return #{confirm_javascript_function(confirm)};"
      when prompt
        method ||= :post
        "#{prompt_javascript_function(prompt)}"+
        "if(prompt_reply) { #{send_prompt_javascript_function(method, url, href)} }; return false;"
      when method
        "#{method_javascript_function(method, url, href)}return false;"
      when popup
        "#{popup_javascript_function(popup)} return false;"
      else
        html_options["onclick"]
    end
  end
  
  def prompt_javascript_function(prompt)
      "var prompt_reply = prompt('#{escape_javascript(prompt)}');"
  end
  
  def send_prompt_javascript_function(method, url = '', href = nil)
    action = (href && url.size > 0) ? "'#{url}'" : 'this.href'
    submit_function =
      "var f = document.createElement('form'); f.style.display = 'none'; " +
      "this.parentNode.appendChild(f); f.method = 'POST'; f.action = #{action}; "+
      "var p = document.createElement('input'); p.setAttribute('type', 'hidden'); p.setAttribute('name', 'prompt_reply'); p.setAttribute('value', prompt_reply); f.appendChild(p);"

    unless method == :post
      submit_function << "var m = document.createElement('input'); m.setAttribute('type', 'hidden'); "
      submit_function << "m.setAttribute('name', '_method'); m.setAttribute('value', '#{method}'); f.appendChild(m);"
    end

    if protect_against_forgery?
      submit_function << "var s = document.createElement('input'); s.setAttribute('type', 'hidden'); "
      submit_function << "s.setAttribute('name', '#{request_forgery_protection_token}'); s.setAttribute('value', '#{escape_javascript form_authenticity_token}'); f.appendChild(s);"
    end
    
    submit_function << "f.submit();"
  end
  
end