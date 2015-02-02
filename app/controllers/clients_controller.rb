class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @filterrific = initialize_filterrific(
      Client,
      params[:filterrific],
      select_options: {
        sorted_by: Client.options_for_sorted_by,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :sorted_by],
    ) or return
    @clients = @filterrific.find.page(params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    respond_with(@client)
  end

  def new
    @client = Client.new
    respond_with(@client)
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.save
    respond_with(@client)
  end

  def update
    @client.update(client_params)
    respond_with(@client)
  end

  def destroy
    @client.destroy
    respond_with(@client)
  end

  def csv
    @clients = Client.all
    respond_to do |format|
      format.csv { send_data @clients.to_csv }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :phone)
    end
end
