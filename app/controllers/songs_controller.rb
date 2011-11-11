class SongsController < ApplicationController
  # GET /songs
  # GET /songs.xml
  def index
    @songs = Song.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @songs }
      format.json  { render :json => @songs }
    end
  end

  def songsForVote
    voting_round = VotingRound.find(params[:voting_round_id])
    song_ids = [voting_round.song_id_1, voting_round.song_id_2, voting_round.song_id_3]
    @songs = Song.where(:id => song_ids)
    respond_to do |format|
      format.html { render :partial => "songs/songs_for_vote" }
      format.json { render :json => @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find_by_url(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
      format.json  { render :json => @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
      format.json  { render :json => @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find_by_url(params[:id])
  end

  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
        format.json  { render :json => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
        format.json  { render :json => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find_by_url(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
        format.json  { render :json => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find_by_url(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
