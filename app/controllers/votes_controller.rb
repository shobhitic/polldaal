class VotesController < ApplicationController
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
    if current_user.id == nil
      format.html { redirect_to choice.question, :notice => 'You need to be logged in to cast your vote.'}
      //format.json something here...
      return
    end
    @vote = Vote.new
    choice = Choice.find(params[:choice_id])
    @vote.choice = choice

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
