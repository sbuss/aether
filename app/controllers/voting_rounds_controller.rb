class VotingRoundsController < ApplicationController
  def current_round
    jukebox = params[:jukebox_id]
    @voting_round = VotingRound.where(:jukebox_id => jukebox).last

    respond_to do |format|
      format.json  { render :json => @voting_round }
    end
  end

  # GET /voting_rounds
  # GET /voting_rounds.xml
  def index
    @voting_rounds = VotingRound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @voting_rounds }
    end
  end

  # GET /voting_rounds/1
  # GET /voting_rounds/1.xml
  def show
    @voting_round = VotingRound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @voting_round }
    end
  end

  def newRandomVotingRound
    @voting_round = VotingRound.new
    song_ids = Song.all.map(&:id).shuffle()[0..2]
    @voting_round.song_id_1 = song_ids[0]
    @voting_round.song_id_2 = song_ids[1]
    @voting_round.song_id_3 = song_ids[2]
    @voting_round.jukebox_id = params[:jukebox_id]

    respond_to do |format|
      if @voting_round.save
        format.html { redirect_to(@voting_round, :notice => 'Voting round was successfully created.') }
        format.xml  { render :xml => @voting_round, :status => :created, :location => @voting_round }
        format.json  { render :json => @voting_round, :status => :created, :location => @voting_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voting_round.errors, :status => :unprocessable_entity }
        format.json  { render :json => @voting_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /voting_rounds/new
  # GET /voting_rounds/new.xml
  def new
    @voting_round = VotingRound.new
    song_ids = Song.all.map(&:id).shuffle()[0..2]
    @voting_round.song_id_1 = song_ids[0]
    @voting_round.song_id_2 = song_ids[1]
    @voting_round.song_id_3 = song_ids[2]
    @voting_round.jukebox_id ||= params[:jukebox_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @voting_round }
      format.json  { render :json => @voting_round }
    end
  end

  # GET /voting_rounds/1/edit
  def edit
    @voting_round = VotingRound.find(params[:id])
  end

  # POST /voting_rounds
  # POST /voting_rounds.xml
  def create
    @voting_round = VotingRound.new(params[:voting_round])

    respond_to do |format|
      if @voting_round.save
        format.html { redirect_to(@voting_round, :notice => 'Voting round was successfully created.') }
        format.xml  { render :xml => @voting_round, :status => :created, :location => @voting_round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voting_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /voting_rounds/1
  # PUT /voting_rounds/1.xml
  def update
    @voting_round = VotingRound.find(params[:id])

    respond_to do |format|
      if @voting_round.update_attributes(params[:voting_round])
        format.html { redirect_to(@voting_round, :notice => 'Voting round was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @voting_round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_rounds/1
  # DELETE /voting_rounds/1.xml
  def destroy
    @voting_round = VotingRound.find(params[:id])
    @voting_round.destroy

    respond_to do |format|
      format.html { redirect_to(voting_rounds_url) }
      format.xml  { head :ok }
    end
  end
end
