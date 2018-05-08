class ChatworkController < ApplicationController
	def send
        ChatWork.api_key = "4fd3ff0947b7bcf450adcff1310fe618"
        unix_time_limit = Time.parse(Date.today.to_s).to_i
        room_id         = "60381054"
        to_ids          = "akasasan454"

        ChatWork::Task.create(
        room_id: room_id,
        body:    "【自動投稿】出勤しなさい",
        to_ids:  to_ids,
        limit:   unix_time_limit
        )
	end
end
