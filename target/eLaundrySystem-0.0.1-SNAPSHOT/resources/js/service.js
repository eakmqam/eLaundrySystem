$(document).ready(function() {
	
	loadServiceItems = function(serviceId) {
		var $table = $("table#item-table");
		$table.empty().append("<tr>"
					+ "<th>ID</th>"
					+ "<th>Name</th>"
					+ "<th>Description</th>"
					+ "<th>Price</th>"
					+ "<th>Status</th>"
				+ "</tr>");
		$.ajax({
			url: '/eLaundrySystem/services/items/' + serviceId,
			type: 'GET',
			dataType: "json",
			success : function(items) {
				if(items == null || items == undefined || items.length == 0)
					$table.append("<tr><td colspan='5'>No items found...</td></tr>")
				
				$.each(items, function(index, item){
					$table.append("<tr>" 
								+ "<td>" + item.itemId + "</td>" 
								+ "<td>" + item.name + "</td>" 
								+ "<td>" + item.description + "</td>" 
								+ "<td>$" + item.price + "</td>" 
								+ "<td>" + item.status + "</td>" 
							+ "</tr>")
				});
			}
		});
	};
});