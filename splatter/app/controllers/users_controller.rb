 class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params))

	    if @user.save
 		render json: @user, status: :created, location: @user
	    else
	        render json: @user.errors, status: :unprocessable_entity
   	 end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

   	 if @user.update(user_params(params))
     	    head :no_content
   	 else
   	   render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

  	@user = User.find(params[:id])
  	@user.destroy

    head :no_content
  end

  def splatts

	@user = User.find(params[:id])

	render json: @user.splatts
  end

  def show_follows

	@user = User.find(params[:id])
	render json: @user.follows
  end

  def show_followers

	@user = User.find(params[:id])
	render json: @user.followed_by
  end

  def add_follows
	@user = User.find(params[:id])
	@follows = User.find(params[:follows_id])
	if @user.follows << @follows and @follows.followers << @user
		render json: @user.follows
	else
		render json: @user.errors, status: :unprocessable_entity
	end
  end

  def delete_follows

	@user = User.find(params[:id])
        @follows = User.find(params[:follows_id])
        if @user.follows << @follows and @follows.followers << @user
                render json: @user.follows
        else
                render json: @user.errors, status: :unprocessable_entity
        end

  end

  #GET /users/splatts-feed/1
  def splatts_feed

	@feed = Splatt.find_by_sql("select user_id, body from splatts
	join follows
	on follows.followed_id = splatts.user_id
	where follows.follower_id = #{params[:id]}
	order by splatts.created_at DESC")

	render json: @feed
  end
	        def splattCounter
                map = %Q{ function() {
                var length = 0;
                if(this.splatts) {
                        length = this.splatts.length
                }
                emit ("count", length);
        }
        }
                reduce = %Q{ function(key, val) {
                var data = 0;
                val.forEach(function(v) {
                        data += v;
                })
                return data;
        }
        }
                User.map_reduce(map.reduce).out(inline: true)
        end

private

  def user_params(params)
	params.permit(:email, :passsword, :name, :blurb)
  end

end
