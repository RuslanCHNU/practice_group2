class PagesController < ApplicationController
    def index
        @user = User.order(Arel.sql('RANDOM()')).first#User.first
        @spend = Spend.where("User_id = '1'")
        #cur_user = @user.id
    end

    def new
        #@spend_new = Spend.new
        #render plain: params
    end

    def create
        @spend_new = Spend.new(post_par)
        @spend_new.User_id = 1
        @spend_new.save
        redirect_to :controller => 'pages', :action => 'index'
        #@render plain: params
    end

    private

    #cur_user = 0

    def post_par
        params.require(:post).permit(:spended, :cost, :date_spend)
    end
end