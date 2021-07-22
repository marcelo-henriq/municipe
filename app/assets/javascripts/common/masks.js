$(document).ready(function () {
  Inputmask({ "mask": "999.999.999-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cpf-masked');
  Inputmask({ "mask": "(99)99999-9999", clearIncomplete: false, removeMaskOnSubmit: true }).mask('.phonenumber-masked');
  Inputmask({ "mask": "999 9999 9999 99-99", clearIncomplete: true, removeMaskOnSubmit: true }).mask('.cns-masked');
});