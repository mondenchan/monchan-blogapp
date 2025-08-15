class ProfilesController < ActionController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end
  def edit
  end

end
