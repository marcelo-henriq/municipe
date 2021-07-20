module CitizenHelper

  def cities_list(city)
    return [[city, city]] if city.present?

    [['', 'Selecione um estado']]
  end

  def state_list
    [
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
