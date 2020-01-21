class PinsController < ApplicationController
    def index
        @pins = Pin.all
    end

    def new
        @pin = Pin.new
    end

    def create
        pin = Pin.new(pin_params) 
        pin.user = current_user

        if pin.save
            redirect_to root_path
        else 
            render :new
        end
    end

    def show 
        pin = Pin.find(params[:id])
    end

    def edit 
        pin = Pin.find(params[:id])
    end

    def update 
        @pin = Pin.find(params[:id])
        if @pin.update(pin_params)
            redirect_to pins_path, notice: "actualizado"
        end
    end

    def destroy 
        pin = Pin.find(params[:id])
        pin.destroy

        redirect_to pins_path, notice: "elimnado"
    end

    private 
        def pin_params
            params.require(:pin).permit(:title, :image_url, :id)
        end
        
end
