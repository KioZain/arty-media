class LikeController < ApplicationController
  before_action :authenticate_user!

  def toggle
    likable = Object.const_get(params[:type]).find(params[:id])
    likes = likable.likes.where(user_id: current_user.id)

    if likes && likes.count > 0
      likes.each do |like|
        like.destroy!
      end
    else
      current_user.likes.create!(likable_type: params[:type], likable_id: params[:id])
    end
  end
end
