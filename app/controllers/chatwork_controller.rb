class ChatworkController < ApplicationController
 protect_from_forgery :except => [:create_task]
　　　def create_task
	if request.body.read.present?
            # Githubot
            ChatWork.api_key = ENV["CHATWORK_API_KEY"]

            json_request = JSON.parse(request.body.read)
            if json_request.dig("action") == "opened"
                body = "[To:#{ENV["OPEND_ID"]}] 〇〇〇さん\n"
                body += "プルリクが作成されました。お手すきで対応お願い致します。\n"
                body += "create_by：#{json_request.dig("sender","login")}\n"
                body += "#{json_request.dig("pull_request","html_url")}"
            elsif json_request.dig("action") == "closed"
                body = "[To:#{ENV["CLOSED_ID"]}] 〇〇〇さん\n"
                body += "マージされました。ご確認お願い致します。 \n"
                body += "marged_by：#{json_request.dig("sender","login")}\n"
                body += "#{json_request.dig("pull_request","html_url")}"
            end

            ChatWork::Message.create(
                room_id: ENV["CHATWORK_ROOM_ID"],
		body:    body
            )
        end
　　　end
end
