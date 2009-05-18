class Newsletter < ActiveRecord::Base

  validates_presence_of :subject, :content


  def content_html(variables = nil)
    BlueCloth.new(replace_var(variables)).to_html
  end

  def content_plain(variables = nil)
    replace_var(variables)
  end

  def replace_var(variables = nil)
    if variables
      for key,value in variables
        content.gsub!(/\{\{#{key}\}\}/, value)
      end
    end
    content
  end
  
end
