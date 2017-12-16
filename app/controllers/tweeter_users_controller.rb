class TweeterUsersController < ApplicationController

	def show
		@data = {}
		@data[:user_id] = current_user.id
		@data[:tweet_count] = current_user.tweets.count
		@data[:profile_photo] = Attachment.find(current_user.attachments_id).data if current_user.attachments_id.present?
		@data[:follow_count] = current_user.followers.count
		@data[:tweets] = Tweet.last(10)
		@data[:liked_tweet_ids] = TweetAction.where("action_by_id = #{current_user.id} and type = 'LIKE'").pluck(:tweet_id)
		Rails.logger.debug("id => #{@data.inspect}")
		render :action => "show" 
	end

	def update_profile
		return if params[:attachment].blank?
	    @attachment = Attachment.new
	    @attachment.uploaded_file = params[:attachment]

	    if @attachment.save
	        flash[:notice] = "Thank you for your submission..."
	        current_user.attachments_id = @attachment.id
	        current_user.save!
	        redirect_to :action => "show"
	    else
	        flash[:error] = "There was a problem submitting your attachment."
	        render :action => "update_profile"
	    end
	end

	def tweet
		begin
			return if params[:tweet_message].blank?
			tw = Tweet.new
			tw.user_id = current_user.id
			tw.tweet_message = params[:tweet_message]
			if params[:attachment].present?
				@attachment = Attachment.new
		    	@attachment.uploaded_file = params[:attachment]
		    	tw.attachment = @attachment
			end
			tw.save!
			flash[:notice] = "Sucessfully tweeted"
			render :action => "show"
		rescue => e
			Rails.logger.debug("#{params.inspect}")
			Rails.logger.debug("#{e.backtrace}")
			flash[:error] = "Not Sucessfully tweeted"
			render :action => "tweet"
		end

	end

	def like
		tw = TweetAction.new
		tw.tweet_id = params[:id]
		tw.action_by_id = current_user.id
		tw.type = "LIKE"
		tw.save!
		redirect_to :controller => "tweeter_users", :action => "show"
	end

	def retweet

	end

	def follow

	end

end
