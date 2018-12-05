import flatpickr from 'flatpickr';

const dateinput = document.getElementById('appointment_date');

function datePicker() {
if (dateinput) {
  flatpickr(dateinput, {
  minDate: 'today',
  dateFormat: 'd-m-Y',
  onChange: function(_, selectedDate) {
  }
});
}
}

export { datePicker };
