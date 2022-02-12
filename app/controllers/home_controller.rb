class HomeController < ApplicationController
    include Common

    # require "net/http"

    # def index
    #     array = [1,2,3,4,5,6,7]
    #     render json: { data: array }
    # end

    def index
        # url_string = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=1620053"
        endpoint = 'captions/' + '2m4oZcL-eMlyi3A-aadfsOc9JjEO8lGgyCXNDHAaLNU%3D'
        uri_params = {
            scope: 'https://www.googleapis.com/auth/youtube',
            access_type: 'offline',
            include_granted_scope: true,
            response_type: 'code',
            redirect_uri: 'http://localhost/home',
            client_id: '690945713736-e8nj5sm7tvrbhhslusldp2eam5l7rvct.apps.googleusercontent.com',
        }
        # uri_params = {
        #     # part: 'snippet',
        #     # videoId: 'm7EwniabkPw',
        #     key: YOUTUBE_API_KEY
        # }
        param_string = '?'
        count = 0
        uri_params.each do |key, value|
            count += 1
            param_part = key.to_s + '=' + value.to_s
            if count < uri_params.length
                param_part += '&'
            end
            param_string += param_part
        end
        # url_string = YOUTUBE_API_REQUIESTPATH + endpoint + param_string
        url_string = 'https://accounts.google.com/o/oauth2/v2/auth' + param_string
        response = http_request_get(url_string)
        
        # render json: url_string # response body
        render json: response # response body
    end


    # def index
    #     zipcode = "1620053"
    #     uri = URI.parse("https://zipcloud.ibsnet.co.jp/api/search")
    #     http = Net::HTTP.new(uri.host, uri.port)
    #     http.use_ssl = uri.scheme === "https"
        
    #     headers = { "Content-Type" => "application/json" }
    #     response = http.get(uri.path + "?zipcode=" + zipcode, headers)
        
    #     # response.code # status code
    #     render json: response.body # response body
    # end

end
