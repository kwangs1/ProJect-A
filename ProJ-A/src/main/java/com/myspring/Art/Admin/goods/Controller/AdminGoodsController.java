package com.myspring.Art.Admin.goods.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.Art.Collectible.VO.CollectibleVO;

public interface AdminGoodsController {

	ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	ModelAndView adminGoodsMain(Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	ResponseEntity removeGoods(int goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
