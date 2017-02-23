$(function() {
  $("#datepicker-checkin").datepicker({
    numberOfMonths: [1, 2],
    minDate: +1,
    dateFormat: "dd-mm-yy",
    altField: "#altfield-checkin"
  });

  $("#datepicker-checkout").datepicker({
    numberOfMonths: [1, 2],
    minDate: +1,
    dateFormat: "dd-mm-yy",
    altField: "#altfield-checkout"
  });
});
