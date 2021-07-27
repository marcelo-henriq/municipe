class CitizensController < AdminController
  before_action :find_citizen, only: [:show, :edit, :update]
  
  def index
    @citizens = CitizenPresenter.new(citizens: Citizen.order(:id).page(params[:page]), query: params[:q])
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def create
    @citizen = Citizen.new(permitted_params)
    respond_to do |format|
      if @citizen.save
        CitizenMailer.notify_new_citizen(@citizen.id).deliver_later
        format.html { redirect_to citizens_path, notice: t('notices.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @citizen.update(permitted_params)
        CitizenMailer.notify_update_citizen(@citizen.id).deliver_later
        format.html { redirect_to citizens_path, notice: t('notices.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def permitted_params
    params.require(:citizen)
    .permit(:id, :name, :email, :cpf, :cns, :photo, :birth_date, :country_code, :phonenumber, :status, address_attributes: [
      :id, :zipcode, :ibge_code, :address, :residencial_number, :street, :complement, :neighborhood, :city, :state, :_destroy
    ])
  end

  def find_citizen
    @citizen = Citizen.find(params[:id])
    redirect_to citizens_path unless @citizen.present?
  end

end
