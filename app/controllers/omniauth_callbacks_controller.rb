class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  
  def google_oauth2
    if request.env["omniauth.auth"].info["email"] =~/[a-zA-Z_.1-9]*@crypsis.net/
      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
 
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to :user_omniauth_authorize
      end

    else
      reset_session
      redirect_to :root
      flash[:alert]= "Looks like you are out of crypsis network. Access is denied"
    end

  end
end