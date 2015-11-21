$(document).ready(function() {
	var items = [];
	loadServiceItems = function(serviceId) {
		var $orderItems = $("select#serviceItem");
		$orderItems.empty();
		$.ajax({
			url: '/eLaundrySystem/services/items/' + serviceId,
			type: 'GET',
			dataType: "json",
			success : function(items) {				
				$.each(items, function(index, item){
					$orderItems.append("<option value=" + item.itemId + ">" + item.name + "</option>");
				});
			}
		});
	};
	
	addToList = function() {
		var serviceName = $("select#service option:selected").text(),
			itemId = $("select#serviceItem option:selected").val(),
			quantity = parseInt($("input#quantity").val());
		
		if(quantity <= 0) return false;
		
		$.ajax({
			url: '/eLaundrySystem/services/item/' + itemId,
			type: 'GET',
			dataType: "json",
			success : function(item) {				
				var $table = $("table#order-items"),
					$footerRow = $table.find("tr.footer-row"), 
					$existingRow = $table.find("tr[class='body-row'][itemId='" + item.itemId + "']");
				var newQuantity = 0, newPrice = 0;
				
				if($existingRow != null && $existingRow != undefined && $existingRow.length > 0) {
					var $quantity = $existingRow.find("td.qty"),
						$price = $existingRow.find("td.price"),
						newQuantity = parseInt($quantity.text()) + quantity,
						newPrice = newQuantity * item.price;
					
					$quantity.text(newQuantity);
					$price.text("$" + newPrice);
				} else {
					newQuantity = quantity;
					var $newRow = $("<tr itemId='" + item.itemId + "' class='body-row'>" 
							+ "<td>" + item.name + "</td>" 
							+ "<td>" + serviceName + "</td>" 
							+ "<td class='qty'>" + newQuantity + "</td>" 
							+ "<td class='price'>$" + (quantity * item.price) + "</td>"
						+ "</tr>");
					$newRow.insertBefore($table.find("tr.footer-row"));
				}
				refreshTotal();
				deleteJsonObjectValue(items, item.itemId);	//remove item first
				populateOrderItems(item.itemId, newQuantity);	//now insert new one
			}
		});
	};
	
	populateOrderItems = function (itemId, quantity) {
		items.push({itemId:itemId, quantity:quantity});
		$('#itemList').val(JSON.stringify(items));
	};
	
	deleteJsonObjectValue = function (items, deletedId) {
		$.grep(items, function(e){ 
		     return e.itemId != deletedId; 
		});
	};
	
	removeFromList = function($item) {
		$("table#order-items tr[itemid=" + $item.attributes["itemid"].value + "]").fadeOut();
		refreshTotal();
	};
	
	refreshTotal = function() {
		var $table = $("table#order-items"),
			$footerRow = $table.find("tr.footer-row"),
			$qtys = $table.find("tr.body-row td.qty"),
			$prices = $table.find("tr.body-row td.price"),
			totalQty = 0, totalPrice = 0;
			
		$qtys.each(function(index, $qt) {
			totalQty += parseInt($qt.textContent);
		});
		$prices.each(function(index, $pr) {
			totalPrice += parseFloat($pr.textContent.replace("$", ""));
		});
		$footerRow.find("td.qty-total").text(totalQty);
		$("#totalPrice")[0].value=totalQty;
		$footerRow.find("td.price-total").text("$" + totalPrice);
	};
});