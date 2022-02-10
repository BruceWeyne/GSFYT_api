class HomeController < ApplicationController

    require "net/http"

    # def index
    #     array = [1,2,3,4,5,6,7]
    #     render json: { data: array }
    # end

    def index
        zipcode = "1620053"
        uri = URI.parse("https://zipcloud.ibsnet.co.jp/api/search")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme === "https"
        
        headers = { "Content-Type" => "application/json" }
        response = http.get(uri.path + "?zipcode=" + zipcode, headers)
        
        # response.code # status code
        render json: response.body # response body
    end
    

end
