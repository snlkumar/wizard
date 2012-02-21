class ChartsController < ApplicationController
  # GET /charts
  # GET /charts.json
  def index
    @charts = Chart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charts }
    end
  end
  def view
   
    @graph = open_flash_chart_object(500,250, '/charts/pie_chart', false, '/') 
     puts "i am in view#{@graph}"
  end
  
  def pie_chart
data = []
links = []
5.times do |t|
temp = rand(10) + 5
data << temp
links << "javascript:alert('temp')"
end

g = Graph.new
g.pie(60, '#505050', '{font-size: 12px; color: #404040;}')
g.pie_values(data, %w(IE FireFox Opera Wii Other), links)
g.pie_slice_colors(%w(#d01fc3 #356aa0 #c79810))
g.set_tool_tip("#val#%")
g.title("Pie Chart with links", '{font-size:18px; color: #d01f3c}' )
render :text => g.render
end 

  # GET /charts/1
  # GET /charts/1.json
  def show
    @chart = Chart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chart }
    end
  end

  # GET /charts/new
  # GET /charts/new.json
  def new
    @chart = Chart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chart }
    end
  end

  # GET /charts/1/edit
  def edit
    @chart = Chart.find(params[:id])
  end

  # POST /charts
  # POST /charts.json
  def create
    @chart = Chart.new(params[:chart])

    respond_to do |format|
      if @chart.save
        format.html { redirect_to @chart, notice: 'Chart was successfully created.' }
        format.json { render json: @chart, status: :created, location: @chart }
      else
        format.html { render action: "new" }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /charts/1
  # PUT /charts/1.json
  def update
    @chart = Chart.find(params[:id])

    respond_to do |format|
      if @chart.update_attributes(params[:chart])
        format.html { redirect_to @chart, notice: 'Chart was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.json
  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy

    respond_to do |format|
      format.html { redirect_to charts_url }
      format.json { head :ok }
    end
  end
end
