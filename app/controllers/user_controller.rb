class UserController < ApplicationController
	def index
	@conversation = Conversation.find_by_id(cookies[:conversation_id])
	@quotation = Quotation.new		
	unless cookies[:conversation_id]&&@conversation
	 	@conversation=Conversation.new
	 end 
	 @messages=@conversation.messages.all
	 @message=@conversation.messages.new

	end
end
