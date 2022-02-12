module Common
  extend ActiveSupport::Concern
  
  require "net/http"
  
  included do

  end

  def http_request_get(url_string)
    url = URI.parse(url_string)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = url.scheme === "https"
    
    headers = { "Content-Type" => "application/json" }
    response = http.get(url, headers)
    
    return response.body
  end
  
end