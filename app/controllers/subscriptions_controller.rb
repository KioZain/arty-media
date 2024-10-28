class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.turbo_stream { render :show }
        # format.html { redirect_to root_path, notice: "Вы стали подписчиком! :)" }
      else
        format.html { redirect_to root_path, notice: "Кринж. Ошибка! :)" }
      end
    end
  end

    def subscription_params
      params.require(:subscription).permit(:email)
    end
end
