module PagesHelper

  def formatted_body(body)
    BlueCloth.new(body).to_html
  end
end
