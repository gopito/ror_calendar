class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.json { render json: @events.map { |event| event_to_calendar_format(event) } }
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1
  def show
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:url, :title, :date, :price)
  end

  # Convert event to FullCalendar format
  def event_to_calendar_format(event)
    {
      id: event.id,
      title: event.title,
      start: event.date,
      extendedProps: {
        url: event.url,
        price: event.price },
      color: event.color # Use the color method from the model
    }
  end
end
