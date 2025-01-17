package admin.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pagination.SearchDTO;
import shop.cart.ShopCartDTO;

@Mapper
@Repository
public interface OrderDAO {
	List<OrderDTO> getOrdersPaging(SearchDTO dto);
	int getCount (SearchDTO dto);
	int getCountWait();
	
	//주문상품정보
	List<OrderProductDTO> getOrderDetail(String order_id);
}
