$(document).ready(function() {
  $('#proponent_state_id').on('change', function () {
    var state_id = $(this).val();
    if (state_id != '') {
      $.ajax({
        type: 'GET',
        url: `/api/v1/states/${state_id}/cities/`,
        dataType: 'json',
        success: function (data) {
          city_field = $('#proponent_city_id')
          city_field.html('');

          $.each(data.cities, function () {
            city_field.append("<option value='" + this.id + "'>" + this.name + "</option>");
          });
        }
      });
    }
  });

  $("#proponent_salary").change(function(){
    var val = $(this).val().trim();

    $.ajax({
      url:'/api/v1/inss_calculator',
      type: 'GET',
      dataType: "json",
      data: { salary: val }
    }).done(function(data) {
      $('#proponent_inss_discount').val(data.inss_value.toFixed(2));
    });
  });
})