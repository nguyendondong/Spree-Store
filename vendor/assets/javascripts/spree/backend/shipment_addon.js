$(document).ready(function () {  
  // handle ship click
  $('[data-hook=admin_shipment_form] a.finish').on('click', function () {
    var link = $(this);
    var shipment_number = link.data('shipment-number');
    var url = Spree.url(Spree.routes.shipments_api + '/' + shipment_number + '/finish.json');
    $.ajax({
      type: 'PUT',
      url: url
    }).done(function () {
      window.location.reload();
    }).error(function (msg) {
      console.log(msg);
    });
  });

  var toggleShipmentCostEdit = function(event) {
    event.preventDefault();
    console.log("toggle shipment cost edit");
    var link = $(this);
    link.parents('tbody').find('tr.edit-real-shipment-cost').toggle();
    link.parents('tbody').find('tr.show-real-shipment-cost').toggle();
  }

  // handle tracking edit click
  $('a.edit-real-shipment-cost').click(toggleShipmentCostEdit);
  $('a.cancel-real-shipment-cost').click(toggleShipmentCostEdit);

  // handle tracking save
  $('[data-hook=admin_shipment_form] a.save-real-shipment-cost').on('click', function (event) {
    event.preventDefault();

    var link = $(this);
    var shipment_number = link.data('shipment-number');
    var shipment_cost = link.parents('tbody').find('input#real_cost').val();
    var url = Spree.url(Spree.routes.shipments_api + '/' + shipment_number + '.json');

    $.ajax({
      type: 'PUT',
      url: url,
      data: {
        shipment: {
          real_cost: shipment_cost
        }
      }
    }).done(function (data) {
      link.parents('tbody').find('tr.edit-real-shipment-cost').toggle();

      var show = link.parents('tbody').find('tr.show-real-shipment-cost');
      show.toggle();
      show.find('.tracking-value').html($("<strong>").html("real shipment cost: ")).append(shipment_cost);
    });
  });
});