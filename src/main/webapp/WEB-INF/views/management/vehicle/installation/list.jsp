<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<keta:paginationForm action="${contextPath }/management/vehicle/installation/list" page="${page }" onsubmit="return navTabSearch(this);">
	<input type="hidden" name="search_LIKE_license" value="${LIKE_license}"/>
</keta:paginationForm>

<form method="post" action="${contextPath }/management/vehicle/installation/list" onsubmit="return navTabSearch(this);">
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
			<%-- <shiro:hasPermission name="Vehicle:edit"> --%>
				<li><a iconClass="page_white_edit" target="dialog" max="true" mask="true" href="${contextPath }/management/vehicle/installation/record/{slt_uid}"><span>录入加装信息</span></a></li>
			<%-- </shiro:hasPermission> --%>
			<%-- <shiro:hasPermission name="Vehicle:delete"> --%>
				<li><a iconClass="magnifier" target="dialog" max="true" mask="true" href="${contextPath}/management/vehicle/installation/view/{slt_uid}"><span>查看加装信息</span></a></li>
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
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${vehicles}">
			<tr target="slt_uid" rel="${item.id}">
				<td>${item.license}</td>
				<td>${item.type}</td>
				<td>${item.configuration}</td>
				<td>${item.displacement}</td>
				<td><fmt:formatDate value="${item.buyingTime}" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<keta:pagination page="${page }"/>
	
</div>
