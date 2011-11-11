class DashboardsController < ApplicationController
  def nearby
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    rad = params[:radius].to_f # in feet
    logger.info "rad is #{rad}"
    # appx 69 miles per degree latitude
    lat_err = rad * (1.0/(5280 * 69))
    logger.info "lat_err is #{lat_err}"
    lat_min = lat - lat_err
    lat_max = lat + lat_err
    # length of longitude will vary by latitude
    lng_err = lat_err / Math.cos(lat * Math::PI / 180)
    lng_min = lng - lng_err
    lng_max = lng + lng_err
    
    @dashboards = Dashboard.where("(dashboards.lat BETWEEN ? AND ?) AND (dashboards.lng BETWEEN ? AND ?)", lat_min, lat_max, lng_min, lng_max)

    render :index
  end

  # GET /dashboards
  # GET /dashboards.xml
  def index
    @dashboards = Dashboard.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dashboards }
      format.json  { render :json => @dashboards }
    end
  end


  # GET /dashboards/1
  # GET /dashboards/1.xml
  def show
    sign_out
    @dashboard = Dashboard.find_by_url(params[:id])
#    @songs = Song.all
    @jukebox = Jukebox.where(:dashboard_id => @dashboard)[0]
    @songs = Song.where(:jukebox_id => @jukebox)

    render :mobile if @browser == "mobile"
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @dashboard }
    #   format.json  { render :json => @dashboards }
    # end
  end

  # GET /dashboards/new
  # GET /dashboards/new.xml
  def new
    @dashboard = Dashboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dashboard }
      format.json  { render :json => @dashboards }
    end
  end

  # GET /dashboards/1/edit
  def edit
    @dashboard = Dashboard.find_by_url(params[:id])
  end

  # POST /dashboards
  # POST /dashboards.xml
  def create
    @dashboard = Dashboard.new(params[:dashboard])

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to(@dashboard, :notice => 'Dashboard was successfully created.') }
        format.xml  { render :xml => @dashboard, :status => :created, :location => @dashboard }
        format.json  { render :json => @dashboard, :status => :created, :location => @dashboard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dashboard.errors, :status => :unprocessable_entity }
        format.json  { render :json => @dashboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dashboards/1
  # PUT /dashboards/1.xml
  def update
    @dashboard = Dashboard.find_by_url(params[:id])

    respond_to do |format|
      if @dashboard.update_attributes(params[:dashboard])
        format.html { redirect_to(@dashboard, :notice => 'Dashboard was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dashboard.errors, :status => :unprocessable_entity }
        format.json  { render :json => @dashboard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.xml
  def destroy
    @dashboard = Dashboard.find_by_url(params[:id])
    @dashboard.destroy

    respond_to do |format|
      format.html { redirect_to(dashboards_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
