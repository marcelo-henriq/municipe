class CitizensController < ApplicationController
  before_action :set_states, only: :new
  def index
    @citizens = Citizen.all.order(:id)
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def create
    
    @citizen = Citizen.new(permitted_params)
    respond_to do |format|
      if @citizen.save
        format.html { redirect_to root_path, notice: "Incluido com sucesso." }
      else
        format.html { render :new, error: "Erro ao incluir", status: :unprocessable_entity }
      end
    end
  end
  
  private

  def permitted_params
    params.require(:citizen)
    .permit(:name, :cpf, :cns, :photo, :birth_date, :phonenumber, :status, address_attributes: [
      :zipcode, :ibge_code, :address, :street, :complement, :neighborhood, :city, :state
    ] )
  end

  def set_states
    @states = [
      ['AC', 'Acre'],
      ['AL', 'Alagoas'],
      ['AM', 'Amazonas'],
      ['AP', 'Amapá'],
      ['BA', 'Bahia'],
      ['CE', 'Ceará'],
      ['DF', 'Distrito Federal'],
      ['ES', 'Espírito Santo'],
      ['GO', 'Goiás'],
      ['MA', 'Maranhão'],
      ['MG', 'Minas Gerais'],
      ['MS', 'Mato Grosso do Sul'],
      ['MT', 'Mato Grosso'],
      ['PA', 'Pará'],
      ['PB', 'Paraíba'],
      ['PE', 'Pernambuco'],
      ['PI', 'Piauí'],
      ['PR', 'Paraná'],
      ['RJ', 'Rio de Janeiro'],
      ['RN', 'Rio Grande do Norte'],
      ['RO', 'Rondônia'],
      ['RR', 'Roraima'],
      ['RS', 'Rio Grande do Sul'],
      ['SC', 'Santa Catarina'],
      ['SE', 'Sergipe'],
      ['SP', 'São Paulo'],
      ['TO', 'Tocantins']
    ]
  end
end