class TweetsController < ApplicationController
    
    before_action :move_to_index, except: :index
    
    def index
        @tweet = Tweet.all.order("id ASC")
                                #("テーブルのカラム名",ASC or DESC  )
        # ASC...昇順
        #DESC...降順
    end
    
    def new
        
    end
    
    def create
        Tweet.create(tweet_params)
    end
    
    private
    def tweet_params
        params.permit(:name, :iamge, :text)
    end
    
    def move_to_index
        # ログインしていない時、「index」アクションを実行
        unless user_signed_in?  
            redirect_to action: :index
        end
    end
    
    
    
    
end
