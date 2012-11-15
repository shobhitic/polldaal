class VotesController < ApplicationController

  http_basic_authenticate_with :name => "shobhit", :password => "bakal", :except => [:create, :update]
  
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    
    @vote = Vote.new
    choice = Choice.find(params[:choice_id])
    @vote.choice = choice
    
    if current_user == nil
      respond_to do |format|
        format.html { redirect_to show_polls_path(choice.question_id), :notice => 'You need to be logged in to cast your vote.'}
        format.json { render :json => choice.question, :status => :unprocessable_entity }
      end
    else

      @vote.user = current_user
  
      respond_to do |format|
        if @vote.save
          format.html { redirect_to choice.question, :notice => 'Vote was successfully cast.' }
          format.json { render :json => choice.question, :status => :created, :location => choice.question }
        else
          format.html { render :action => "new" }
          format.json { render :json => @vote.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])
    choice = Choice.find(params[:choice_id])
    @vote.choice = choice

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to choice.question, :notice => 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end
end
