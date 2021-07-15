//Put all initializers and common JS functions here
//https://ws.apicep.com/cep/64049-610.json
$(document).ready(function () {
  $('.zipcode').on('blur', function() {
    var cep = this.value;
    var default_states = $('.states_select').children();
    console.log( cep );

    $.ajax({
      type: 'GET',
      url: "https://ws.apicep.com/cep/"+cep+".json", //vviacep
      dataType: 'json',
      success: function (data) {
        if(data.status == 200 ){
          console.table(data);
          $('.city')[0].value = data.city;
          $('.address_street')[0].value = data.address;
          $('.district')[0].value = data.district;
          default_states.each(function (index, item) {
            if( item.value == data.state ) {
              $('.states_select').children().remove().end()
                .append(item);
            }else{
              $('.states_select').children().remove().end()
                .append('<option value="'+data.state+'">'+data.state+'</option>');
            }
          });
          
        }else {
          $('.city')[0].value = '';
          $('.address_street')[0].value = '';
          $('.district')[0].value = '';
          $('.states_select').children().remove().end()
              .append('<option value="">Selecione um estado</option>');
        }
      }
    })

  });
});
