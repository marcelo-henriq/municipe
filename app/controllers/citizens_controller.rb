class CitizensController < ApplicationController
  before_action :set_states, only: [:new, :edit]
  
  def index
    @citizens = Citizen.order(:id).decorate
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

  def edit
    @citizen = Citizen.find_by(id: params[:id])
  end
  
  def update
    @citizen = Citizen.find(params[:id])

    respond_to do |format|
      if @citizen.update(permitted_params)
        format.html { redirect_to root_path, notice: 'Atualizado com sucesso.' }
      else
        format.html { render :new, error: 'Erro ao atualizar.', status: :unprocessable_entity }
      end
    end
  end
  
  private

  def permitted_params
    params.require(:citizen)
    .permit(:id, :name, :cpf, :cns, :photo, :birth_date, :phonenumber, :status, address_attributes: [
      :id, :zipcode, :ibge_code, :address, :street, :complement, :neighborhood, :city, :state, :_destroy
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