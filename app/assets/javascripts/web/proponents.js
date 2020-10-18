$(document).ready(function() {
  $("#proponent_salary").change(function(){
    var val = $(this).val().trim();

    $.ajax({
      url:'/inss_calculator',
      type: 'GET',
      dataType: "json",
      data: { salary: val }
    }).done(function(data) {
      $('#proponent_inss_discount').val(data.inss_value.toFixed(2));
    });
  });
})