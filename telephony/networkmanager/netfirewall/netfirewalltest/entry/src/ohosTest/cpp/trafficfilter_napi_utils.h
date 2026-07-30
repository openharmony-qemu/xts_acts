
#ifndef TRAFFICFILTER_NAPI_UTILS_H
#define TRAFFICFILTER_NAPI_UTILS_H

#include "napi/native_api.h"
#include "network/netmanager_ext/net_trafficfilter_type.h"

class TrafficFilterNapiUtils {
public:
    static OH_TrafficFilter_Redirector* GetRedirectorFromJs(napi_env env, napi_value jsObj);
    static bool ParseRedirectRule(napi_env env, napi_value jsObj, OH_TrafficFilter_RedirectRule &rule);
    static bool ParseConnectionInfo(napi_env env, napi_value jsObj, OH_TrafficFilter_ConnectionInfo &connInfo);
    static bool ParseIPMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_IPMatch &ipMatch);
    static bool ParsePortMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_PortMatch &portMatch);
    static bool ParseInterfaceMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_InterfaceMatch &ifMatch);
    static bool ParseIPAddrElement(napi_env env, napi_value element, int32_t family,
                                   OH_TrafficFilter_IPAddress &ipAddr);
    static bool ParseIPAddress(napi_env env, napi_value jsObj, OH_TrafficFilter_IPAddress &ipAddr);
    static bool ParseIPCidr(napi_env env, napi_value jsObj, OH_TrafficFilter_IPCidr &cidr);
    static bool ParseIPRange(napi_env env, napi_value jsObj, OH_TrafficFilter_IPRange &range);
    static bool ParseIPMulti(napi_env env, napi_value jsObj, OH_TrafficFilter_IPMulti &multi);
    static bool ParsePortRange(napi_env env, napi_value jsObj, OH_TrafficFilter_PortRange &range);
    static bool ParsePortMulti(napi_env env, napi_value jsObj, OH_TrafficFilter_PortMulti &multi);
    static napi_value CreateIPAddress(napi_env env, const OH_TrafficFilter_IPAddress &ipAddr);
    static napi_value CreateProcessInfo(napi_env env, const OH_TrafficFilter_ProcessInfo &processInfo);
};

#endif // TRAFFICFILTER_NAPI_UTILS_H
