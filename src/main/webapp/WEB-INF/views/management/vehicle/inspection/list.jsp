<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<keta:paginationForm action="${contextPath }/management/vehicle/inspection/list" page="${page }" onsubmit="return navTabSearch(this);">
	<input type="hidden" name="search_LIKE_annualCycle" value="${LIKE_annualCycle}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/vehicle/inspection/list" onsubmit="return navTabSearch(this);">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>车牌号：</label>
					<input type="text" name="search_LIKE_license" value="${LIKE_license}"/>
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</form>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<%-- <shiro:hasPermission name="Vehicle:save"> --%>
				<li id='inspectionAdd'><a iconClass="page_white_add" target="dialog" max="true" mask="true" width="530" height="250" href="${contextPath }/management/vehicle/inspection/create/{slt_uid}"><span>录入年审信息</span></a></li>
			<%-- </shiro:hasPermission> --%>
			<%-- <shiro:hasPermission name="Vehicle:edit"> --%>
				<li id='inspectionEdit'><a iconClass="page_white_edit" target="dialog" mask="true" width="530" height="250" href="${contextPath }/management/vehicle/inspection/update/{slt_uid}"><span>编辑年审信息</span></a></li>
			<%-- </shiro:hasPermission> --%>
			<%-- <shiro:hasPermission name="Vehicle:delete"> --%>
				<li><a iconClass="magnifier" target="dialog" max=true mask="true" href="${contextPath}/management/vehicle/inspection/view/{slt_uid}"><span>查看年审信息</span></a></li>
			<%-- </shiro:hasPermission> --%>
		</ul>
	</div>
	
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th>车牌号</th>
				<th>车辆型号</th>
				<th>车辆配置</th>
				<th>排量</th>
				<th>购买时间</th>
				<th>年审信息状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${vehicles}">
			<tr target="slt_uid" rel="${item.id}" onclick="displayButton('${item.inspectionStatus}')">
				<td>${item.license}</td>
				<td>${item.type}</td>
				<td>${item.configuration}</td>
				<td>${item.displacement}</td>
				<td><fmt:formatDate value="${item.buyingTime}" pattern="yyyy-MM-dd"/></td>
				<td>
				<c:if test="${item.inspectionStatus==1}">已录入</c:if>
				<c:if test="${item.inspectionStatus==0}">未录入</c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 分页 -->
	<keta:pagination page="${page }"/>
	
</div>

<script type="text/javascript">
function displayButton(status) {
	if(status=='1') {
		$("#inspectionAdd").hide();
		$("#inspectionEdit").show();
	} else if(status=='0') {
		$("#inspectionAdd").show();
		$("#inspectionEdit").hide();
	}
}
</script>