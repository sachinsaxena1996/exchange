class Calender
 extend self

 def calenders(token)
 	resp = Resclient.get("http://microsoftexhange/calenders/token/#{token}")
 	binding.pry
 	if resp.code == 200 || resp.code == 201
 		respond_to resp.body[:calenders]
 	elsif resp.code == 400
 		respond_to 'Invalid token'
 	end
 end
end