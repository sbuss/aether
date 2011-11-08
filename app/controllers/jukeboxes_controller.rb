class JukeboxesController < ApplicationController
  # GET /jukeboxes
  # GET /jukeboxes.xml
  def index
    @jukeboxes = Jukebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jukeboxes }
    end
  end

  # GET /jukeboxes/1
  # GET /jukeboxes/1.xml
  def show
    @jukebox = Jukebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jukebox }
    end
  end

  # GET /jukeboxes/new
  # GET /jukeboxes/new.xml
  def new
    @jukebox = Jukebox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jukebox }
    end
  end

  # GET /jukeboxes/1/edit
  def edit
    @jukebox = Jukebox.find(params[:id])
  end

  # POST /jukeboxes
  # POST /jukeboxes.xml
  def create
    @jukebox = Jukebox.new(params[:jukebox])

    respond_to do |format|
      if @jukebox.save
        format.html { redirect_to(@jukebox, :notice => 'Jukebox was successfully created.') }
        format.xml  { render :xml => @jukebox, :status => :created, :location => @jukebox }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jukebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jukeboxes/1
  # PUT /jukeboxes/1.xml
  def update
    @jukebox = Jukebox.find(params[:id])

    respond_to do |format|
      if @jukebox.update_attributes(params[:jukebox])
        format.html { redirect_to(@jukebox, :notice => 'Jukebox was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jukebox.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jukeboxes/1
  # DELETE /jukeboxes/1.xml
  def destroy
    @jukebox = Jukebox.find(params[:id])
    @jukebox.destroy

    respond_to do |format|
      format.html { redirect_to(jukeboxes_url) }
      format.xml  { head :ok }
    end
  end
end
