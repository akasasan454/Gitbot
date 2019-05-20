class ChatworkController < ApplicationController
 protect_from_forgery :except => [:create_task]
　　　def create_task
	if request.body.read.present?
            json_request = JSON.parse(request.body.read)
            
            # oogaito
            #ChatWork.api_key = "４4fd3ff0947b7bcf450adcff1310fe618"

            # Githubot
            ChatWork.api_key = "ｆf99400e7e1ef2524e83fa709b14e1cad"
            room_id         = 108309047

            if json_request.dig("action") == "opened"
                body            = "[To:2894903] 山崎 友弘さん\n"
                body           += "プルリクが作成されました。お手すきで対応お願い致します。\n"
                body           += "create_by：#{json_request.dig("sender","login")}\n"
                body           += "#{json_request.dig("pull_request","html_url")}"
            elsif json_request.dig("action") == "closed"
                body            = "[To:2119717] 大垣内 貴文さん\n"
                body           += "マージされました。ご確認お願い致します。 \n"
                body           += "marged_by：#{json_request.dig("sender","login")}\n"
                body           += "#{json_request.dig("pull_request","html_url")}"
            end

            ChatWork::Message.create(
            room_id: room_id,
            body:    body
            )
        end
　　　end
end
