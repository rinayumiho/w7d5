class SubsController < ApplicationController
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
        if @sub.atrributes_update?
    end     

    private

    def sub_params
        params.require(:sub).require(:title, :description)
    end
end