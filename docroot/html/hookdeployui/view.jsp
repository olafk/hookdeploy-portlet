<%@page import="com.liferay.portal.kernel.util.ClassResolverUtil"%>
<%@page import="com.liferay.portal.kernel.util.MethodKey"%>
<%@page import="com.liferay.portal.kernel.util.PortalClassInvoker"%>
<%@page import="java.util.Collection"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<portlet:defineObjects />

<%
	MethodKey getRejectionProtocol = new MethodKey(
			ClassResolverUtil.resolveByPortalClassLoader(
					"de.olafkock.liferay.deploy.hot.delegating.CheckingHookHotDeployListener"),
					"getRejectionProtocol"); 
	Collection<String> list = (Collection<String>) PortalClassInvoker.invoke(
			false, getRejectionProtocol, new Object[]{});
	if(list==null || list.isEmpty()) {
		%><liferay-ui:message key="no-rejected-hooks-yet"/><%
	} else {
		%><h1><liferay-ui:message key="rejected-hooks-and-jsps"/></h1><%
		for(String item:list) {
			%><%=item %><br/><%
		}
	}
%>
<div style="background: #cccccc; margin-top:20px;">
<p>
	<a href="https://www.liferay.com/web/olaf.kock/blog/-/blogs/overriding-jsps-from-multiple-hooks-promising-the-cure"><liferay-ui:message key="read-more"/></a>
</p>
<portlet:actionURL name="clearHistory" var="clearHistoryURL" />
<p>
	ToDo: Implement permission check for <a href="<%=clearHistoryURL %>">Clear</a> operation
</p>
</div>