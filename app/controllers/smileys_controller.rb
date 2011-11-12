class SmileysController < ApplicationController
  # GET /smileys
  # GET /smileys.xml
  def index
    @smileys = Smiley.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @smileys }
    end
  end

  def current_happiness
    render :json => {:current_happiness => Smiley.current_happiness}
  end

  # GET /smileys/1
  # GET /smileys/1.xml
  def show
    @smiley = Smiley.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smiley }
    end
  end

  # GET /smileys/new
  # GET /smileys/new.xml
  def new
    @smiley = Smiley.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smiley }
    end
  end

  # GET /smileys/1/edit
  def edit
    @smiley = Smiley.find(params[:id])
  end

  # POST /smileys
  # POST /smileys.xml
  def create
    @smiley = Smiley.new(params[:smiley])

    respond_to do |format|
      if @smiley.save
        format.html { redirect_to(@smiley, :notice => 'Smiley was successfully created.') }
        format.xml  { render :xml => @smiley, :status => :created, :location => @smiley }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @smiley.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /smileys/1
  # PUT /smileys/1.xml
  def update
    @smiley = Smiley.find(params[:id])

    respond_to do |format|
      if @smiley.update_attributes(params[:smiley])
        format.html { redirect_to(@smiley, :notice => 'Smiley was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @smiley.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smileys/1
  # DELETE /smileys/1.xml
  def destroy
    @smiley = Smiley.find(params[:id])
    @smiley.destroy

    respond_to do |format|
      format.html { redirect_to(smileys_url) }
      format.xml  { head :ok }
    end
  end
end
