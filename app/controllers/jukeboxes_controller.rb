class JukeboxesController < ApplicationController
  def now_playing
    jukebox = Jukebox.find(params[:id])
    @song = Song.find(jukebox.now_playing)

    respond_to do |format|
      format.html { render :partial => "songs/song", :locals => { :song => @song } }
      format.xml  { render :xml => @song }
      format.json  { render :json => @song }
    end
  end

  def songsForVote
    jukebox = Jukebox.find(params[:id])
    voting_round = VotingRound.where(:jukebox_id => jukebox.id).last
    song_ids = [voting_round.song_id_1, voting_round.song_id_2, voting_round.song_id_3]
    @songs = Song.where(:id => song_ids)
    @votes = Vote.where(:voting_round_id => params[:voting_round_id])
    respond_to do |format|
      format.html { render :partial => "songs/songs_for_vote" }
      format.json { render :json => { :songs => @songs, 
                                      :votes => @votes, 
                                      :voting_round_id => voting_round.id } }
    end
  end

  # GET /jukeboxes
  # GET /jukeboxes.xml
  def index
    @jukeboxes = Jukebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jukeboxes }
      format.json  { render :json => @jukeboxes }
    end
  end

  # GET /jukeboxes/1
  # GET /jukeboxes/1.xml
  def show
    @jukebox = Jukebox.find_by_url(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jukebox }
      format.json  { render :json => @jukebox }
    end
  end

  # GET /jukeboxes/new
  # GET /jukeboxes/new.xml
  def new
    @jukebox = Jukebox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jukebox }
      format.json  { render :json => @jukebox }
    end
  end

  # GET /jukeboxes/1/edit
  def edit
    @jukebox = Jukebox.find_by_url(params[:id])
  end

  # POST /jukeboxes
  # POST /jukeboxes.xml
  def create
    @jukebox = Jukebox.new(params[:jukebox])

    respond_to do |format|
      if @jukebox.save
        format.html { redirect_to(@jukebox, :notice => 'Jukebox was successfully created.') }
        format.xml  { render :xml => @jukebox, :status => :created, :location => @jukebox }
        format.json  { render :json => @jukebox, :status => :created, :location => @jukebox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jukebox.errors, :status => :unprocessable_entity }
        format.json  { render :json => @jukebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jukeboxes/1
  # PUT /jukeboxes/1.xml
  def update
    @jukebox = Jukebox.find_by_url(params[:id])

    respond_to do |format|
      if @jukebox.update_attributes(params[:jukebox])
        format.html { redirect_to(@jukebox, :notice => 'Jukebox was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jukebox.errors, :status => :unprocessable_entity }
        format.json  { render :xml => @jukebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jukeboxes/1
  # DELETE /jukeboxes/1.xml
  def destroy
    @jukebox = Jukebox.find_by_url(params[:id])
    @jukebox.destroy

    respond_to do |format|
      format.html { redirect_to(jukeboxes_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
