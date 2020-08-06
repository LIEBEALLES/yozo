<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

 function voice_service() {
	window.open("voice_service.jsp","레시피 읽어주기!","width=1300, height=1080, left=100, top=0") 
 }


</script> 

<style type="text/css">
	/*상단부*/
	#title_img {
		position: absolute;
		float: left;
		left: 25%;
	}
	
	#recipe_info {
		position: absolute;
		float: right;
		/* width: 512px; */
		right: 40%;
	}
	
	/*하단부*/
	.recipe_order, .add_comment {
		text-align: center;
	}
	span{
		text-align: left;
	}

</style>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// while 문으로 TextToSpeech가 SpeechToText를 감싼다 두 함수 모두 recipe_step이 끝날때까지 도는데 와일문안에 SpeechToText문의 value값을 if문으로 멈춰 || 정지 || 스탑 || , 재생||시작|| 등, 반복||다시||...,이전||전에꺼||전꺼||등..., 다음||다음꺼||담꺼||...,
	//if문이 끝나면 다시 while문이 돌면서 recipe_step부분을 끝낸다. 끝내고 난뒤에는 다시 재생할까요? 를 TextToSpeech를 통해서 출력하고 그에 대한 답이 아니야||됐어||꺼져||괜찮아||면 함수를 종료하고 응||그래||다시||한번더 면 while문을 다시돌린다.
	//하나하나 씩 speech값을 받아서 넘어간다
	function TextToSpeech(s){
/* 		let msg = document.getElementById("text-to-speech").innerHTML; */
		let msg = s;
		/*Web Speech API의 SpeechSynthesis는 음성 서비스의 컨트롤러 인터페이스로 이를 사용하여 장치에서 사용할 수 있는 합성 음성에 대한 정보를 가져오고, 음성 재생 등의 역할을 수행할 수 있게 해준다.*/
        let speech = new SpeechSynthesisUtterance();
        /*읽어줄 언어*/
        speech.lang = "ko-KR";
        /*id가 text-to-speech인 value값을 담아줌*/
        speech.text = msg;
        
        speech.volume = 100;
        /*재생속도 1 = 정상속도 */
        speech.rate = 1;
        /*읽어주는 음의 높낮이 1 ~ 100*/
        speech.pitch = 100;
        /*읽어준다*/
        window.speechSynthesis.speak(speech);
	}
	
	function SpeechToText() {
        //output의 참조값
        var output = document.getElementById("output");
        // action의 참조값
        var action = document.getElementById("action");
        // 새로운 음성 객체 생성
        var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
        var recognition = new SpeechRecognition();
    
        recognition.continuous = true;
        // 음성인식이 실행 될 때 실행됨
        recognition.onstart = function() {
            action.innerHTML = "<small>듣고 있어요...</small>";
        };
        // 음성인식이 끝나고 실행됨
        recognition.onspeechend = function() {
            action.innerHTML = "<small>더 말하시려면 버튼을 눌러주세요...</small>";
            recognition.stop();
        }
        
      //계속대기 할 수 있는걸 찾아야되고
        // 음성인식 결과를 반환할 때 사용된다.
    	  var i=0;
        recognition.onresult = function(event) {
        	//음성을 text 로 변환된 값
            var transcript = event.results[i][0].transcript;
            TextToSpeech(transcript);
            //변환된 text의 정확도
        	var confidence = event.results[0][0].confidence;
            
            output.innerHTML = "<b>Text:</b> " + transcript + "<br/> <b>Confidence:</b> " + confidence*100+"%";
            output.classList.remove("hide");
            alert(transcript.length);
            alert(i)
            i++
        };
      
         // 음성인식 시작
         recognition.start();
    }
	
</script>

</head>
<body>
<%@ include file="../../form/header.jsp" %>
<!-- 레시피 정보 --> 
	<div id="title_img">
		<img alt="title_img" src="./img/img04.png">
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="recipe_info">
		<h3>제목</h3>
		<b>작성자 : </b> <br>
		<b>재료 : </b>
		<br>
		<br>
		<br>	
        <br/>
	</div>
	
	
	
	
	
	
	

	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	
	
	
	
	
	
	
	
	
	
	


<!-- 레시피 순서  -->

	
	<div class="recipe_order">
		<h3>레시피</h3>
		<img alt="레시피1" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서1</span> 	
	</div>
	<div class="recipe_order">
		<img alt="레시피2" src="./img/img04.png">
		<br>
		<span>1. 레시피 순서2</span>		
	</div>
	<br>
	
	<div class="add_comment">
		<input type="text" id="comment" placeholder="내용을 입력하세요">
		<input type="button" id="add_comment" value="덧글 작성"	>
	</div>
	
	<br><br><br><br><br>
	<br><br><br><br><br>
	



<%@ include file="../../form/footer.jsp" %>
</body>
</html>












