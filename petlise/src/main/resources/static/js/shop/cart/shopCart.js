$(document).ready(function(){
	
	//전체 체크 버튼
	$('#allcheck').click(function(){
		$('.product_check').prop('checked', $(this).prop('checked'));
	}); // allcheck
	
    $('#all_check_button').click(function(){
        var allChecked = $(this).prop('checked');
        if (allChecked) {
            $(this).prop('checked', false);
            $('.product_check').prop('checked', false);
            $('#allcheck').prop('checked', false);
        } else {
            $(this).prop('checked', true);
            $('.product_check').prop('checked', true);
            $('#allcheck').prop('checked', true);
        }
    }); // all_check_button
	
	//상품 개별삭제 버튼
    $('.each_delete').click(function(){
    	var container = $(this).closest('.cart_product_container');
        var productName = $(this).data('product_name');
        
        $.ajax({
            url: 'deletecartlist',
            type: 'GET',
            data: { product_name: productName },
            success: function(response) {
                container.remove();
                location.href = "/shopcart";
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
    	}); // ajax
    }); // each_delete
    
    //선택 삭제 버튼
    $('#checked_delete_button').click(function() {
        var checkedItems = $('.product_check:checked');
        checkedItems.each(function() {
            var container = $(this).closest('.cart_product_container');
            
            $.ajax({
                url: 'deletecartlist',
                type: 'GET',
                data: { product_name: container.find('.cart_info a').text().trim() },
                success: function(response) {
                    container.remove();
                    location.href = "/shopcart";
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            }); // ajax
        }); // each
    }); // checked_delete	    
    
    // 상품가격 부분
    var price = 0;
    $('.cart_product_container').each(function(){
        var productPrice = parseInt($(this).find('[data-product_price]').data('product_price'));
        price += productPrice;
    }); 

    var formatPrice = price.toLocaleString();
    var payment = '상품가격 ' + formatPrice + ' point + 배송비 3,000 point =&nbsp;&nbsp;';
    $('#payment').html(payment);

	// 상품 총합계 부분
    var subTotal = 0;
    var total = 0;
    $('.cart_product_container').each(function(){
        var priceTotal = parseInt($(this).find('[data-price_total]').data('price_total'));
        subTotal += priceTotal;
        total = subTotal + 3000;
    });

    var formattedPriceTotal = total.toLocaleString();
    var totalPrice = '총 합계 ' + formattedPriceTotal + ' point';
    $('#totalPrice').html(totalPrice);
    
    // 상품가격, 총합계 표시 부분
    if (price === 0 && subTotal === 0) {
        $('#payment').empty();
        $('#totalPrice').empty();
    }
    
    // 주문하러가기 버튼
	$('#order_button').click(function() {
	    $('.product_check:checked').each(function() {
	    	var user_id = 'petlise';
	        var container = $(this).closest('.cart_product_container');
	    	var product_id =  container.find('[data-product_id]').data('product_id');
	        var product_name = container.find('.cart_info a').text().trim();
	        var product_image = container.find('.cart_product_image').attr('src');
	        var product_price = parseInt(container.find('[data-product_price]').data('product_price'));
	        var quantity = parseInt(container.find('.cart_quantity').text().trim());
	        var price_total = parseInt(container.find('[data-price_total]').data('price_total'));
	
	        var dto = {
	        	user_id: user_id,
	        	product_id: product_id,
	            product_name: product_name,
	            product_image: product_image,
	            product_price: product_price,
	            quantity: quantity,
	            price_total: price_total
	        };
	
	        $.ajax({
	            url: '/savecartlist',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(dto),
	            success: function(response) {
	                location.href = "/payment";
	            },
	            error: function(xhr, status, error) {
	                console.error(error);
	            }
	        });
	    });
	});

}); // ready

// 모두선택, 선택삭제 버튼 표시
function shop_button(){
	location.href = '#';
} // empty_shop 버튼
