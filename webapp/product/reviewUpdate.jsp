<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String reviewContent = (String) request.getAttribute("review");
%>
<!DOCTYPE html>
<head>
<!-- 팝업을 여닫는 자바스크립트 -->
<script>
window.onload = function() {
    var reviewBtn = document.getElementById("reviewBtn");
    if (reviewBtn) {
      reviewBtn.onclick = function() {
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];

        modal.style.display = "block";

        span.onclick = function() {
          modal.style.display = "none";
        }

        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
      }
    }
}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성 팝업</title>
<style>
    /* 팝업 스타일 */
    .modal {
        display: none;  /* 우선 안보이게 */
        position: fixed;  /* 화면 상단에 위치 */
        z-index: 1;  /* 다른 요소 위에 위치 */
        padding-top: 100px;  /* 팝업 상단 여백 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;  /* 팝업이 너무 길 경우 스크롤바 */
        background-color: rgba(0,0,0,0.4);  /* 검은 배경 반투명 */
    }

    /* 팝업 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
    }

    /* 팝업 닫기 버튼 스타일 */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

</style>
</head>
<body>
  <h1>리뷰 수정</h1>
  <form method="post" action="/talkdog/ReviewUpdate.do">
    <input type="hidden" name="pId" value="<%=request.getParameter("pId")%>" />
    <input type="hidden" name="rNo" value="<%=request.getParameter("rNo")%>" />
    <div>
      <label for="review">리뷰 작성:</label>
<textarea name="review" id="review" rows="4" cols="40"><%=reviewContent != null ? reviewContent : "" %></textarea>
    </div>
    <div>
      <input type="submit" value="수정하기" />
      <input type="button" value="취소" onclick="window.close();" />
    </div>
  </form>
</body>


</body>
</html>