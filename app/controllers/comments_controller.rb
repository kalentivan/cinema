class CommentsController < ApplicationController
    def create
        if params[:comment][:comment] != ""
            item = Comment.create(
                comment: params[:comment][:comment],
                film_id: session[:film_id],
                user_id: session[:user_id]
            )
            flash[:notice] = 'Комментарий добавлен!'
            redirect_back_or_to({ action: "show", id: session[:film_id] })
        else
            flash[:alert] = 'Введите текст комментария!'
            redirect_back_or_to({ action: "show", id: session[:film_id] })
        end
    end

    def new
        @comment = Comment.new
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment!= nil && comment.user_id == session[:user_id]
            comment.delete
            flash[:notice] = 'Комментарий удален!'
            redirect_back_or_to({ action: "show", id: session[:film_id] })
        else
            redirect_to root_path
        end
    end
end
