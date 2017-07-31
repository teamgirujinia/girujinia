class TagsController < ApplicationController
  before_action :set_ransack
  before_action :set_tag, only: [:destroy, :edit, :update]
  before_action :set_alart
  http_basic_authenticate_with name: "sgirujinia", password: "sgirujinia"

    def new
     @tag = Tag.new
    end

    def create
     @tag = Tag.new(tag_params)
     if @tag.save
         redirect_to tags_path
     else
       render 'tags/new'
     end
    end
    
    def destroy
        if @tag.delete
         flash[:success] = "deleted"
        end
        redirect_to tags_path
    end
    
    def index
      @tags = Tag.all
    end
    
    
    def edit
    end
    
    def update
        if @tag.update(tag_params)
           redirect_to tags_path
        else
            render 'tags/edit'
        end
    end
    
      private

        # Recruitテーブルから値をとってきて変数にいれる
        def set_tag
          @tag = Tag.find(params[:id])
        end
    
        def tag_params
          params.require(:tag).permit(:name, :characteristic, :celebrities, :weakness, :compatibility, :relationship)
        end
end
