class Newsletter < ActiveRecord::Base

  validates_presence_of :subject, :content


  def formatted_content(variables = nil)
    r = BlueCloth.new(content)
    if variables
      for key,value in variables
        r.gsub!(/\{\{#{key}\}\}/, value)
      end
    end
    r.to_html
  end
  
end
