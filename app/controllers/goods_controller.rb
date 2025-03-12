class GoodsController < ApplicationController
    def create
        good = current_user.goods.create(comment_id: params[:comment_id]) 
        redirect_back(fallback_location: root_path)
    end
    
      def destroy
        good = Good.find_by(comment_id: params[:comment_id], user_id: current_user.id)  # ✅ `Good` モデルを参照
        if good.present?
          good.destroy
        end
        redirect_back(fallback_location: root_path)
      end
      
end
