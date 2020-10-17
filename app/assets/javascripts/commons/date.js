  $(document).ready(function() {
    $('.datepicker').datepicker({
      language: 'pt-BR',
      autoclose: true,
      endDate: new Date('3000-01-01'),
      format: 'dd/mm/yyyy'
    });
  })