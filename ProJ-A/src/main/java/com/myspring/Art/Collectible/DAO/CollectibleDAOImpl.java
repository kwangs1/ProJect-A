package com.myspring.Art.Collectible.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.Art.Collectible.VO.CollectibleVO;

@Repository("collectibleDAO")
public class CollectibleDAOImpl implements CollectibleDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CollectibleVO> selectGoodsList(String goodsStatus) throws DataAccessException{
		List<CollectibleVO> goodsList = (ArrayList)sqlSession.selectList("mapper.collectible.selectGoodsList",goodsStatus);
	
	return goodsList;
	}
}
