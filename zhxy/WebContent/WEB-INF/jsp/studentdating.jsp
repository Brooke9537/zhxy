<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
  	<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
      <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">心理咨询预约 </strong> / <small>Date</small> 
      </div>
    </div>
    <hr>

    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">基本信息</a></li>
      </ul>
       <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
        <form class="am-form" action="/zhxy/user/date.do" method="POST">
          <div class="am-g am-margin-top">
          
	            <div class="am-form-group">
			      <label for="DateDay">预约日期</label>
			      <input type="date" class="" id="DateDay" name="DateDay">
			    </div>
		    
		        <div class="am-form-group">
			      <label for="DateTime">预约时间段</label>
			      <select name="DateTime" id="DateTime">
			        <option value="8：00 --9：40">8：00 --9：40</option>
			        <option value="10：00 --11：40">10：00 --11：40</option>
			        <option value="14：00 --15：40">14：00 --15：40</option>
			        <option value="16：00 --17：40">16：00 --17：40</option>
			      </select>
			      <span class="am-form-caret"></span>
			    </div>
			    <input type="hidden" name="stuId" value="${userSession.userId } ">
			    <input type="hidden" name="stuName" value="${userSession.userName } ">
			    <input type="hidden" name="telephone" value="${userSession.telephone } ">
			    
    	</div>
    	
      <div class="am-margin">
      	<p><button type="submit" class="am-btn am-btn-default">提交</button></p>
      </div></form>
       </div>
            </div>
  	</div>
	</div>
   </div>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
