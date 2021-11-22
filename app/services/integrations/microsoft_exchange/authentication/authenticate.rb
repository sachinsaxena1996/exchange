class Authenticate
 extend self

 def sign_up(sign_up_params)
 	user = User.new(email: sign_up_params[:email], sign_up_params[:email])
 	if user.valid?
 		resp = Resclient.post('http://microsoftexchange/sign_up')
 		if resp.code == 200
 			user.save!
 		else
 			respond_to 'user is creation is invalid'
 		end
 	end
 end

 def sign_in(user_params)
 	resp = Resclient.get("http://microsoftexchange/sign_in?email=#{user_params[:email]}&password=#{user_params[:password]}")
 	if resp.code == 200
 		respond_to 'logged in successfully'
 	else
 		respond_to 'Invalid user'
 	end
 end

end