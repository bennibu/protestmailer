class Newsletter < ActiveRecord::Base

  validates_presence_of :subject, :content


  def parse_content(variables = nil)
    if variables
      for key,value in variables
        content.gsub!(/\{\{#{key}\}\}/, value)
      end
    end
    content
  end
  
end
