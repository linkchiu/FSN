class MicropostsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  skip_before_action :verify_authenticity_token


  def ninja
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      return "ok"
    else
      return "error"
    end
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    # render plain: params[:micropost].inspect
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content,:image, :user_id)
  end

end
