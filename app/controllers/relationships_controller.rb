class RelationshipsController < ApplicationController

 def follow
  current_user.follow(params[:id])
  redirect_to user_path, notice: "フォローしました！"
 end

 def unfollow
  current_user.unfollow(params[:id])
  redirect_to user_path, notice: "フォローを解除しました"
 end

end
