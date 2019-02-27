<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
    @import url('resources/css/headerFooter.css');
    @import url('resources/css/main.css');
</style>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var arr;
		$.ajax("myBoardlist.do",{success:function(data){
			arr =  eval("("+data+")");
			$.each(arr,function(i,m){
				var tr = $("<tr></tr>");
				$(tr).append($("<td></td>").html(m.b_no));
				$(tr).append($("<td></td>").html(m.b_region));
				$(tr).append($("<td></td>").html(m.b_startday+" ~ "+m.b_endday));	
				$(tr).append($("<td></td>").html(m.b_title));			
				$(tr).append($("<td></td>").html(m.m_name));
				$(".board-table").append(tr);
			});
		}});
		
		$.ajax("myPlanlist.do",{success:function(data){
			arr =  eval("("+data+")");
			$.each(arr,function(i,p){	
				var a = $("<a></a>").attr("href","#");	
				var div1 = $("<div></div>").addClass("city");
				var img = $("<img></img>").attr({src:"resources/img/"+p.plan_image});
				var div2 = $("<div></div>").addClass("plan-info");
				var span1 = $("<span></span>").attr("id","plan-title").html(p.plan_name);		
				$(div2).append(span1,"여행일정 : "+p.plan_startday+" ~"+p.plan_endday+"<br>","여행기간 : 3박 4일"+"<br>","여행장소 : "+p.city_name);
				$(div1).append(img,div2);
				$(a).append(div1);
				$("#myPlist").append(a);
			});			
		}});
		
		$.ajax("myLike.do",{success:function(data){
			arr = eval("("+data+")");
			$.each(arr,function(i,l){
				var div1 = $("<div></div>").addClass("card-column");
				var a = $("<a></a>").attr("href","#");
				var div2 = $("<div></div>").addClass("card-figure");
				var img1 = $("<img></img>").attr({src:"resources/image/"+l.pointview_image1});
				var div3 = $("<div></div>").addClass("card-content");
				var img2 = $("<img></img>").addClass("like").attr({src:"resources/img/heart.png"});
				var div4 = $("<div></div>").addClass("viewname").html(l.pointview_name);
				var div5 = $("<div></div>").addClass("text").html(l.pointview_topinfo);
				var div6 = $("<div></div>").addClass("hashtag").html(l.pointview_hashtag);
				
				$(div3).append(img2,div4,div5,div6);
				$(div2).append(img1,div3);
				$(div1).append(a,div2);
				$("#MyList").append(div1);
			});
		}});
	});
</script>
</head>	
<body>
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
	<div class="top-img-sect" style="margin-bottom:50px;">
		<img alt="" src="resources/img/beach.jpg"> 
		<div class="img_content">
			<h1>마이페이지</h1>
			<p>즐거운 여행을 확인할 수 있습니다 :D</p>
			
			<div class="my-btn">
				<button type="button" onclick="location.href='#myP'">여행일정</button>
				<button type="button" onclick="location.href='#myL'">좋아요 목록</button>
				<button type="button" onclick="location.href='#myBlist'">내가 쓴글 </button>
			</div>
		</div>			
	</div>
	
	<div class="center">
		<div class="recommend-sec" id="myP" style="padding-top: 70px">
			<h2 class="country-cityname">여행일정</h2>
			<div class="recommend-wrapper-two" id="myPlist">	
			</div>
		</div>		
	</div>
	
<div class="center"  style="padding-top: 70px" id="myL">
		<h2>좋아요 목록</h2> 
		<div class="card-list" id="MyList"></div>
		
	<div class="my-writer" id="myBlist" style="padding-top: 70px">
		<h2>내가 쓴 글</h2>
		<table class="board-table">
			<tr class="table_top">
				<td>NO.</td>
				<td>지역</td>
				<td>여행기간</td>
				<td>제목</td>
				<td>작성자</td>
			</tr>
		</table>
	</div>
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