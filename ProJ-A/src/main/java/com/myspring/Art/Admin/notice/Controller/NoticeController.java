package com.myspring.Art.Admin.notice.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.Art.Admin.notice.VO.Criteria;
import com.myspring.Art.Admin.notice.VO.NoticeVO;

public interface NoticeController {

	ModelAndView NoticeList(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView addNewNotice(NoticeVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView NoticeDetail(int bno, Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView removerNotice(int bno, Criteria cri, RedirectAttributes redAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView modifyNotice(NoticeVO vo, Criteria cri,RedirectAttributes redAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
