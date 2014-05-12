module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token								#create a new token
    cookies.permanent[:remember_token] = remember_token 					#place token in a cookie
    user.update_attribute(:remember_token, User.digest(remember_token)) 	#save hashed token in database
    self.current_user = user 												#sets current user to the given user
  end

  def current_user=(user)
    @current_user = user
  end

  #Find current user using 'remember_token'
  def current_user
    remember_token = User.digest(cookies[:remember_token])			#decrypting hashed token
    @current_user ||= User.find_by(remember_token: remember_token)	#find_by is called once, then uses @current_user
  end

end