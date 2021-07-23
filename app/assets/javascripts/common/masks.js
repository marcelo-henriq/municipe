$(document).ready(function () {
  Inputmask({ "mask": "999.999.999-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cpf-masked');
  Inputmask({ "mask": "(99)99999-9999", clearIncomplete: false, removeMaskOnSubmit: true }).mask('.phonenumber-masked');
  Inputmask({ "mask": "999 9999 9999 99-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cns-masked');
  Inputmask({ "mask": "99999-999", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.zipcode-masked');

  //custom
  $('.text-masked').on('paste keyup keypress', function(){
    this.value = this.value.replace(/[^a-zA-Z@]/g, '');
  });

  $('.positivenumbers-masked').on('paste keyup keypress', function(){
    this.value = this.value.replace(/[^0-9@]/g, '');
  });
});