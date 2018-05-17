class ChatworkController < ApplicationController
 protect_from_forgery :except => [:create_task]
 skip_before_filter :verify_authenticity_token
	def create_task
json_request = JSON.parse(request.body.read)


        ChatWork.api_key = "4fd3ff0947b7bcf450adcff1310fe618"
        unix_time_limit = Time.parse(Date.today.to_s).to_i
        room_id         = 60381054
        to_ids          = "2119717"

        ChatWork::Task.create(
        room_id: room_id,
        body:    "【自動投稿】出勤さい\n#{json_request}",
        to_ids:  to_ids,
        limit:   unix_time_limit
        )

        render text: "success", status: 200

	end
end
