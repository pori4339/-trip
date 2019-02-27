<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//아이디 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$("#m_email").blur(function(){
			if(mailJ.test($("#m_email").val())){
				console.log("true");
				$("#id_check").text("");
			}else{
				console.log("false");
				$("#id_check").text("이메일 형식이 아닙니다.");
				$("#id_check").css('color','red');
				
			}		
		});
		
		//이메일 중복검사
		$("#m_email").blur(function(){
	        var m_email = $("#m_email").val();
	        if(m_email != null || m_email != ""){	       
	        	
				$.ajax({
					url:"checkMail",data:{m_email:m_email}, type :'post',
					success:function(data){
						if (data == "true") {
							$("#id_check").text("사용중인 아이디입니다 :p");
							$("#id_check").css("color", "red");
						}else {
							$("#id_check").text("사용가능한 아이디입니다 :p");
							$("#id_check").css("color", "blue");
						}
					}, error : function() {
						console.log("실패");
					}
				});
	        }
		});	
		
		// 비밀번호 정규식
		var pwJ = /^[A-Za-z0-9]{4,12}$/; 
		
		// 비밀번호 검사
		$("#m_pwd").blur(function(){
			if(pwJ.test($("#m_pwd").val())){
				console.log("true");
				$("#pwd_check").text("");
			}else{
				console.log("false");
				$("#pwd_check").text("비밀번호를 입력해주세요.");
				$("#pwd_check").css('color','red');
			}		
		});
		
		$("#psw_repeat").blur(function(){
			if($("#m_pwd").val() != $("#psw_repeat").val()){
				$("#psw_check").text("비밀번호가 일치하지 않습니다.");
				$("#psw_check").css('color','red');
			}else{
				$("#psw_check").text('');
			}		
		});
	});
</script>
<style type="text/css">
    @import url('resources/css/headerFooter.css');
    @import url('resources/css/main.css');
</style>
</head>
<body style="background: url('resources/img/sunrise.jpg')">
<header>
	<button onclick="topFunction()" id="top-bnt" title="Go to top">Top</button>
	<div class="topnav">
	  <div class="logo-top"><img src="resources/img/logo_top2.png"></div>
	  <div class="logo-topM"><img src="resources/img/logo_top_m.png"></div>

	   <form>
	  		<input class="search_input" type="text" name="search" placeholder="Search..">
	  		<button type="submit" class="search-bnt" ><img id="search-img" src="resources/img/search_icon (3).png" ></button>
		</form>
	  <div class="topnav-right">
		 <button class="openbtn" onclick="openNav()">☰</button>
	  </div>
	</div>
	
	<div id="mySidepanel" class="sidepanel">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	  <a class="s-a" href="#">추천 여행지</a>
	  <a class="s-a" href="#">여행 일정 계획</a>
	  <a class="s-a" href="#">동행게시판</a>
	  <br>
	  	<div class="before-login">
		  <a href="#"><input type="button" class="sidepanel-bnt" value="로그인"></a>
		  <a href="#"><input type="button" class="sidepanel-bnt" value="회원가입"></a>
	  	</div>
	  	<div class="after-login">
	  		<hr id="login-hr">
	  		<a class="s-a" href="#">마이페이지</a>
	  		<a class="s-a" href="#">좋아요 목록</a>
		    <a href="#"><input class="sidepanel-bnt-a" type="button"value="로그아웃"></a>
	  	</div>
	  <br>
	  <p>최근 본 목록</p>
		  <div class=row>
			<div class="recent-col">
		  		<img src="resources/img/sunrise.jpg">
		  		<span>이탈리아 피렌체</span>
			</div>
			<div class="recent-col">
		  		<img src="resources/img/beach.jpg">
		  		<span>베트남 나트랑</span>
			</div>
		  </div>
		  <div class=row>
		     <div class="recent-col">
		  		<img src="resources/img/beach2.jpg">
		  		<span>일본 오키나와</span>
			 </div>
			 <div class="recent-col">
		  		<img src="resources/img/airballoon.jpg">
		  		<span>체코 프라하</span>
			 </div>
		  </div>
	</div>
</header>
<section>
	<div class="join-content" >
		<form action="join.do" method="POST" style="border:1px solid #ccc">
		  <div class="container">
		    <h1>회원가입</h1>
		    <p>서비스 이용을 위한 정보 입력해 주세요 :D</p>
		    <br>
		    <hr>
		    <p class="subTitle">필수</p>
		    <label for="email"><b>Email</b></label>
		  		<input type="text" placeholder="아이디로 사용할 이메일 입력" name="m_email" id="m_email" required>
		   	<div class="check_font" id="id_check"></div>
			<br>	
		    <label for="psw"><b>Password</b></label>
		    	<input type="password" placeholder="비밀번호 입력" name="m_pwd"  id="m_pwd" required>
			<div class="check_font" id="pwd_check"></div>
			<br>	
		    <label for="psw-repeat"><b>Repeat Password</b></label>
		    	<input type="password" placeholder="비밀번호 재입력" name="psw_repeat"  id="psw_repeat" required>
		    <div class="check_font" id="psw_check"></div>
		    
		    <br>
		    <hr class="dot">
		    <p class="subTitle">선택</p>
		    <div id="checkBoxAll">
			    <h3>관심 여행지</h3>
				   <div class="check_box">
					<label class="ch_container">유럽
					  <input type="checkbox" name="citycheck" id="citycheck" value="유럽">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">일본
					  <input type="checkbox" name="citycheck" id="citycheck" value="일본">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">중국
					  <input type="checkbox" name="citycheck" id="citycheck" value="중국">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">베트남
					  <input type="checkbox" name="citycheck" id="citycheck" value="베트남">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">태국
					  <input type="checkbox" name="citycheck" id="citycheck" value="태국">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">필리핀
					  <input type="checkbox" name="citycheck" id="citycheck" value="필리핀">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">말레이시아
					  <input type="checkbox" name="citycheck" id="citycheck" value="말레이시아">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">대만
					  <input type="checkbox" name="citycheck" id="citycheck" value="대만">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">		
					<label class="ch_container">홍콩
					  <input type="checkbox" name="citycheck" id="citycheck" value="홍콩">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">싱가포르
					  <input type="checkbox" name="citycheck" id="citycheck" value="싱가포르">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">미국
					  <input type="checkbox" name="citycheck" id="citycheck" value="미국">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">호주
					  <input type="checkbox" name="citycheck" id="citycheck" value="호주">
					  <span class="checkmark"></span>
					</label>
			      </div>
			  </div>
			  
		    <div id="checkBoxAll">
			    <h3>여행 스타일</h3>
				   <div class="check_box">
					<label class="ch_container">휴양지
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="휴양지">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">스포츠
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="스포츠">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">미식여행
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="미식여행">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">문화역사
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="문화역사">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">쇼핑
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="쇼핑">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">유흥
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="유흥">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">하이킹
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="하이킹">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">액티비티
					  <input type="checkbox" name="stylecheck" id="stylecheck" value="액티비티">
					  <span class="checkmark"></span>
					</label>
				  </div>
			  </div>	    
		  
	
		    <div id="privateCheck">
			    <label>
			      <input type="checkbox" name="agree" style="margin-bottom:15px"> 개인정보 수집 이용 동의
			    </label>
		    </div>
	    	<input type="hidden" id="insert_value" name="insert_value">
	    	<input type="hidden" id="style_value" name="style_value">
		    <div class="clearfix">
			
			      <input type="reset" class="cancelbtn" value="취소">
			      <input type="submit" class="signupbtn" value="가입">		    	
		    </div>
		  </div>
		</form>
	</div>
</section>
<footer>
	<div class="footer-center">
		<div class="menu-footer">
			<div class="list-footer">
				<ul>
					<li>탐색</li>
					<li><a href="#">추천 여행지</a></li>
					<li><a href="#">여행지 순위</a></li>
					<li><a href="#">About @Trip </a></li>
				</ul>
			</div>
			<div class="list-footer">
				<ul>
					<li>계획</li>
					<li><a href="#">여행 동선 계획</a></li>
					<li><a href="#">동행 찾기</a></li>
				</ul>
			</div>
		</div>
		<img class="logo-footer" src="resources/img/logo.png">
		<p>Copyright ⓒ 2019 @trip</p>
		<p>KKH ㅣ KDH ㅣ LPS ㅣ JYM</p>
	</div>
</footer>
</body>
</html>

