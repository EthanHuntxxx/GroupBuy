package spring.mvc.group_buy.model.dao;

import java.util.List;

import spring.mvc.group_buy.model.entity.Rank;

public interface RankDao {

	List<Rank> findAllRanks();
	
	int getTotalQuantityForProduct(int productId);
}
