package com.jhta.finalproject.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.jobvo.JobVo;
import com.jhta.finalproject.security.CustomMemberDetail;
import com.jhta.finalproject.vo.AuthoritiesVo;
import com.jhta.finalproject.vo.MemberVo;

import data.mybatis.mapper.MemberMapper;

@Service
public class MemberService {
	@Autowired private MemberMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	@Inject private MemberService manager;
	
	  public CustomMemberDetail getAuths(String m_id) {
		  return mapper.getAuths(m_id);
	  }
	
	  public int addUser(MemberVo vo) { 
		 String pwd=vo.getM_pwd();
		 
		 vo.setM_pwd(passwordEncoder.encode(pwd));
		 int result = mapper.addUser(vo);
		 if (result != 1) {
			 return 0;
		 }else {		
			 //성공후에
			 AuthoritiesVo auth=new AuthoritiesVo();
			 auth.setM_id(vo.getM_id());
			 if(vo.getM_id().equals("admin")) {
				 auth.setAuthority("ROLE_ADMIN");
				 mapper.addAuth(auth);
				 
			 }else {
				 auth.setAuthority("ROLE_MEMBER");
				 mapper.addAuth(auth);
			 }
			 return 1;
		 }
	  }
	  public int addAuth(AuthoritiesVo vo) {
		  return mapper.addAuth(vo);
	  }

	
	public MemberVo isMember(String mid) {
		return mapper.isMember(mid);
	}

	public MemberVo isNick(String mnick) {
		return mapper.isNick(mnick);
	}
	
	public List<MemberVo> selectAll(){
		return mapper.selectAll();
	}
	public MemberVo isId(String memail) {
		return mapper.isId(memail);
	}

	public MemberVo findPassword(MemberVo vo) {
		// TODO Auto-generated method stub
		return mapper.findPassword(vo);
	}

	public void updatePassword(MemberVo vo) {
	 String pwd=vo.getM_pwd();
	 vo.setM_pwd(passwordEncoder.encode(pwd));{
		
		 mapper.updatePassword(vo);
	}
	 
	}

	public MemberVo selectUser(String m_id) {
	
		return mapper.selectUser(m_id);
	}

	public String findPwdChk(String m_id, String m_email) {
		return mapper.findPwdChk(m_id, m_email);
		
	}

	public int findPwd(MemberVo vo) {
		return mapper.findPwd(vo);
		
	}
	

	
	
	}
	
	
	


	

	
	

//	  HashMap<Object, Object> map=new HashMap<Object, Object>(); 
//	  if(vo.getM_id().equals("admin")) {
//		  map.put("m_id", vo.getM_id());
//		  
//		  map.put("authority","ROLE_ADMIN");
//		  mapper.authInsert(map); 
//	  }else {
//		  map.put("m_id", vo.getM_id());
//		  	map.put("authority","ROLE_MEMBER");
//		  mapper.authInsert(map);
//	  }
//	  
//	  
//	  return 1; 
//	  }
	 
	  
	

