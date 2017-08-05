class SendCreateWorker

	@queue = :send_create

	def self.perform article_id
		CreateArticle.send_create_mail(article_id).deliver_now
	end

end
