class VotesController < ApplicationController
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
      format.json  { render :json => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
      format.json  { render :json => @votes }
    end
  end

  # GET /votes/new
  # GET /votes/new.xml
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
      format.json  { render :json => @votes }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.xml
  def create
    @vote = Vote.new(params[:vote])
    voting_round = VotingRound.find(@vote.voting_round_id)
    expire_page(songsForVoting_jukeboxes_path(voting_round.jukebox_id))
    expire_page(songsForVoting_jukeboxes_path(voting_round.jukebox_id, :json))
    expire_page(songsForVotingMobile_jukeboxes_path(voting_round.jukebox_id))
    expire_page(songsForVotingMobile_jukeboxes_path(voting_round.jukebox_id, :json))
    logger.info("Cleared cache for jukebox id #{voting_round.jukebox_id}")

    respond_to do |format|
      if @vote.save
        format.html { redirect_to(@vote, :notice => 'Vote was successfully created.') }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
        format.json  { render :json => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        format.json  { render :json => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to(@vote, :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        format.json  { render :json => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(votes_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
