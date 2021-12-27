package com.myspring.Art.Collectible.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.Art.Collectible.VO.CollectibleVO;

public interface CollectibleDAO {

	List<CollectibleVO> selectGoodsList(String goodsStatus) throws DataAccessException;

}
