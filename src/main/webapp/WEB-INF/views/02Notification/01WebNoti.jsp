<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.css" />
<script src="../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
	<script type="text/javascript">
	
		// HTML문서가 로드되었을때 Notification를 통해 권한을 확인한다.
		window.onload = function() {
			if(window.Notification) { 
				
				// 권한 요청 알림창 띄워줌.
				Notification.requestPermission();
			}
			else {
				alert("웹노티를 지원하지 않습니다.");
			}
		}	
		
		// notify()를 1초 후에 딱 한번 호출한다.
		function calculate() {
			setTimeout(function() {
				notify();
			}, 1000);
		}
		
		function notify() {
			// 실행전 권한을 확인하다.
			if(Notification.permission !== 'granted') {
				alert("웹노티를 지원하지 않습니다.");
			}
			else {
				/*
					Notification객체를 생성하여 제목, 내용과 아이콘을 설정한다.
				*/
				var notification = new Notification(
					'title 입니다.',
					{
						icon: 'http://cfile201.uf.daum.net/image/235BFD3F5937AC17164572',
						body: '여긴내용입니다. 클릭하면 KOSMO로 이동합니다.'
					}
				);
				
				// 알림창을 클릭했을때 이동할 URL을 이벤트 핸들러에 등록한다.
				notification.onclick = function() {
					window.open('http://www.ikosmo.co.kr');
				};
			}
		}
	</script>
</head>
<body>
	<div class="container">
		<h2>Web Notification01</h2>
		<button onclick="calculate();">
			버튼을 누르면 1초후에 WebNotification이 뜹니다.
		</button>
		<ul>
		   	 <li>웹노티 Browser compatibility -> https://developer.mozilla.org/ko/docs/Web/API/notification</li>
		   	 <li>Chrome, Firefox지원됨. IE지원안됨</li>
		</ul>
	</div>
</body>
</html>