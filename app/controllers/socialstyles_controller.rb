class SocialstylesController < ApplicationController
  before_action :set_ransack
  before_action :set_alart

    def new
     @socialstyle = Socialstyle.new
    end

    def create
     @socialstyle = Socialstyle.new(socialstyle_params)
     if @socialstyle.save
         redirect_to socialstyles_path
     else
       render 'socialstyles/new'
     end
    end
    
    def destroy
        @socialstyle = Socialstyle.find(params[:id])
        if @socialstyle.delete
         flash[:success] = "deleted"
        end
        redirect_to :back
    end
    
    def index
      @socialstyles = Socialstyle.all
    end
    
    def show
      @socialstyles = Socialstyle.all
      @socialstyle = Socialstyle.find(params[:id])
    end
    
    def edit
        @socialstyle = Socialstyle.find(params[:id])
    end
    
    def update
        @socialstyle = Socialstyle.find(params[:id])
        if @socialstyle.update(socialstyle_params)
            redirect_to @socialstyle
        else
            render 'socialstyles/edit'
        end
    end
    
      private
      
        def socialstyle_params
          params.require(:socialstyle).permit(:name, :characteristic, :celebrities, :weakness, :compatibility, :relationship)
        end
end
