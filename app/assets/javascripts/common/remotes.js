//Put all initializers and common JS functions here
$(document).ready(function () {
  $('.zipcode').on('blur', function() {
    let cep = this.value;
    let defaultStates = $('.states_select').children();

    if(cep.length < 8)
      return

    $.ajax({
      type: 'GET',
      url: `https://viacep.com.br/ws/${cep}/json`, //viacep
      dataType: 'json',
      success: function (data, status) {
        if( status == "success" ){
          $('.city_select').children().remove().end()
              .append(`<option value="${data.localidade}">${data.localidade}</option>`);
          $('.address_street')[0].value = data.logradouro;
          $('.district')[0].value = data.bairro;
          $('.ibge_code')[0].value = data.ibge;
          
          defaultStates.each(function (index, item) {
            if( item.value == data.uf ) {
              item.selected = true;
            }
          });
          
        }else {
          clearFields();
        }
      }
    })

  });
  $('.states_select').on('load click', function(){
    let state = this.value;
    $.ajax({
      type: 'GET',
      url: `https://servicodados.ibge.gov.br/api/v1/localidades/estados/${state}/municipios`,
      dataType: 'json',
      success: function (data, status) {
        if( status == "success" ){
          $('.city_select').children().remove().end();
          data.forEach(function(item){
            $('.city_select')
                 .append(`<option value="${item.nome}">${item.nome}</option>`);
          });
        }else {
          clearFields();
        }
      }
    })
  });
  
});

function clearFields(){
  $('.address_street')[0].value = '';
  $('.district')[0].value = '';
  $('.city_select').children().remove().end()
      .append('<option value="">Selecione um estado</option>');
  $('.states_select').children().remove().end()
      .append('<option value="">Selecione um estado</option>');
}