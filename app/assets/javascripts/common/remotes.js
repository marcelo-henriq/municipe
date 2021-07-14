//Put all initializers and common JS functions here
//https://ws.apicep.com/cep/64049-610.json
$(document).ready(function () {
  $('.zipcode').on('keyup', function() {
    var cep = this.value;
    console.log( cep );

    $.ajax({
      type: 'GET',
      url: "https://ws.apicep.com/cep/"+cep+".json",
      dataType: 'json',
      success: function (data) {
        alert('busca efetuada');
        if(data.status == 200 ){
          console.table(data);
          $('.city')[0].value = data.city;
          $('.address_street')[0].value = data.address;
          $('.district')[0].value = data.district;
          $('.states_select').children().remove().end()
            .append('<option selected value="'+data.state+'">'+data.state+'</option>') ;
        }
      }
    })

  });
});
