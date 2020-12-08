class NinjaController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      return "ok"
    else
      return "error"
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content,:image, :user_id)
  end
end
