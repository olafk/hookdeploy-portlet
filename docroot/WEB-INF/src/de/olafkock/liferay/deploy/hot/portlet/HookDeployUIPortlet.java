package de.olafkock.liferay.deploy.hot.portlet;

import com.liferay.portal.kernel.util.ClassResolverUtil;
import com.liferay.portal.kernel.util.MethodKey;
import com.liferay.portal.kernel.util.PortalClassInvoker;
import com.liferay.util.bridges.mvc.MVCPortlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

/**
 * Portlet implementation class HookDeployUIPortlet
 */
public class HookDeployUIPortlet extends MVCPortlet {
 
	public void clearHistory(ActionRequest request, ActionResponse response) {
		
		// ToDo: Check permissions
		
		MethodKey clearRejectionProtocol = new MethodKey(
				ClassResolverUtil.resolveByPortalClassLoader(
						"de.olafkock.liferay.deploy.hot.delegating.CheckingHookHotDeployListener"),
						"clearRejectionProtocol"); 
		try {
			PortalClassInvoker.invoke(false, clearRejectionProtocol, new Object[]{});
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
