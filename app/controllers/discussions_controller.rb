class DiscussionsController < ApplicationController
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
    @group = Group.find(params[:group_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = Discussion.new
    @group = Group.find(params[:group_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    # @discussion = Discussion.new(params[:discussion])
    # @discussion.group_id = params[:group_id]
    params[:discussion][:user_id] = current_user.id
    @group = Group.find(params[:group_id])
    
    @discussion = @group.discussions.build(params[:discussion])
    respond_to do |format|
      if @discussion.save
         format.html { redirect_to group_path(@discussion.group), :notice => 'Thank you for your post.' }
        #format.json { render json: @discussion, status: :created, location: @discussion }
        format.js   
      else
         format.html { render action: "new" }
        # format.json { render json: @discussion.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end
end
