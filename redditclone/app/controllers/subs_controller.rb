class SubsController < ApplicationController
    before_action :ensure_logged_in, except: %i(edit update show)
    before_action :ensure_is_owner, only: %i(update edit)

    def index
        @subs = Sub.all
        render :index
    end

    def new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.owner_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.new[:error] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end     

    private
    def ensure_is_owner
        redirect_to subs_url unless current_user.subs.find_by(id: params[:id])
    end


    def sub_params
        params.require(:sub).require(:title, :description)
    end
end