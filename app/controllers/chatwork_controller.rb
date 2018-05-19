class ChatworkController < ApplicationController
 protect_from_forgery :except => [:create_task]
	def create_task
		if request.body.read.present?
            json_request = JSON.parse(request.body.read)
        
            ChatWork.api_key = "4fd3ff0947b7bcf450adcff1310fe618"
            unix_time_limit = Time.parse(Date.tomorrow.to_s).to_i
            room_id         = 60381054
            to_ids          = "2119717" # 2894903
            body            = "【Pull request自動通知】お手すきで対応お願い致します。\n"
            body           += "  sender：#{json_request.dig("sender","login")}\n"
            body           += "  #{json_request.dig("pull_request","html_url")}"

            ChatWork::Task.create(
            room_id: room_id,
            body:    body,
            to_ids:  to_ids,
            limit:   unix_time_limit
            )
        end
	end
end
