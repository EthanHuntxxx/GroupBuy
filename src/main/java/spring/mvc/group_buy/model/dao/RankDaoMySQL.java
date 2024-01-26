package spring.mvc.group_buy.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.mvc.group_buy.model.entity.Rank;

@Repository
public class RankDaoMySQL implements RankDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Rank> findAllRanks() {
		String sql = "select productId, productName, price, unit, total_quantity from v_rank";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Rank.class));
	}

	
	// 新增方法來取得已售出數量
//    @Override
//    public int getTotalQuantityForProduct(int productId) {
//        String sql = "SELECT total_quantity FROM v_rank WHERE productId = ?";
//        return jdbcTemplate.queryForObject(sql, new Object[]{productId}, Integer.class);
//    }

    @Override
    public Integer getTotalQuantityForProduct(int productId) {
        String sql = "SELECT total_quantity FROM v_rank WHERE productId = ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, productId);
    }
}
