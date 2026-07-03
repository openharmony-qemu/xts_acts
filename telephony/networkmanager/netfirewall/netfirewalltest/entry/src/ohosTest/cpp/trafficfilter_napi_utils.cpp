/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "trafficfilter_napi_utils.h"
#include "hilog/log.h"
#include <cstring>
#include "cstdio"

static const int GLOBAL_NETSTACK = 0xFF00;
static const char *TAG = "[trafficfilter_utils]";

OH_TrafficFilter_Redirector* TrafficFilterNapiUtils::GetRedirectorFromJs(napi_env env, napi_value jsObj)
{
    napi_value handleValue;
    napi_status status = napi_get_named_property(env, jsObj, "redirector", &handleValue);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "GetRedirectorFromJs: failed to get redirector property");
        return nullptr;
    }

    int64_t ptr;
    status = napi_get_value_int64(env, handleValue, &ptr);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "GetRedirectorFromJs: failed to get redirector value");
        return nullptr;
    }

    return reinterpret_cast<OH_TrafficFilter_Redirector*>(ptr);
}

bool TrafficFilterNapiUtils::ParseIPAddress(napi_env env, napi_value jsObj, OH_TrafficFilter_IPAddress &ipAddr)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    napi_value familyValue;
    napi_get_named_property(env, jsObj, "family", &familyValue);
    uint32_t family;
    napi_get_value_uint32(env, familyValue, &family);
    ipAddr.family = static_cast<OH_TrafficFilter_IPFamily>(family);

    napi_value addrValue;
    napi_get_named_property(env, jsObj, "addr", &addrValue);
    
    bool isArray;
    napi_is_array(env, addrValue, &isArray);
    if (!isArray) {
        return false;
    }

    uint32_t length;
    napi_get_array_length(env, addrValue, &length);

    for (uint32_t i = 0; i < length; i++) {
        napi_value elem;
        napi_get_element(env, addrValue, i, &elem);
        uint32_t val;
        napi_get_value_uint32(env, elem, &val);
        ipAddr.addr[i] = static_cast<uint8_t>(val);
    }

    return true;
}

bool TrafficFilterNapiUtils::ParseIPCidr(napi_env env, napi_value jsObj, OH_TrafficFilter_IPCidr &cidr)
{
    napi_value baseValue;
    napi_get_named_property(env, jsObj, "base", &baseValue);
    if (!ParseIPAddress(env, baseValue, cidr.base)) {
        return false;
    }

    napi_value prefixLenValue;
    napi_get_named_property(env, jsObj, "prefixLen", &prefixLenValue);
    uint32_t prefixLen;
    napi_get_value_uint32(env, prefixLenValue, &prefixLen);
    cidr.prefixLen = static_cast<uint8_t>(prefixLen);

    return true;
}

bool TrafficFilterNapiUtils::ParseIPRange(napi_env env, napi_value jsObj, OH_TrafficFilter_IPRange &range)
{
    napi_value startValue;
    napi_get_named_property(env, jsObj, "start", &startValue);
    if (!ParseIPAddress(env, startValue, range.start)) {
        return false;
    }

    napi_value endValue;
    napi_get_named_property(env, jsObj, "end", &endValue);
    if (!ParseIPAddress(env, endValue, range.end)) {
        return false;
    }

    return true;
}

bool TrafficFilterNapiUtils::ParseIPMulti(napi_env env, napi_value jsObj, OH_TrafficFilter_IPMulti &multi)
{
    napi_value ipsValue;
    napi_get_named_property(env, jsObj, "ips", &ipsValue);

    bool isArray;
    napi_is_array(env, ipsValue, &isArray);
    if (!isArray) {
        return false;
    }

    uint32_t length;
    napi_get_array_length(env, ipsValue, &length);
    if (length > OH_TRAFFICFILTER_MAX_MULTI_IP_COUNT) {
        return false;
    }

    multi.ipCount = length;
    for (uint32_t i = 0; i < length; i++) {
        napi_value elem;
        napi_get_element(env, ipsValue, i, &elem);
        if (!ParseIPAddress(env, elem, multi.ips[i])) {
            return false;
        }
    }

    return true;
}

bool TrafficFilterNapiUtils::ParseIPMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_IPMatch &ipMatch)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    napi_value typeValue;
    napi_get_named_property(env, jsObj, "type", &typeValue);
    uint32_t matchType;
    napi_get_value_uint32(env, typeValue, &matchType);
    ipMatch.type = static_cast<OH_TrafficFilter_IPMatchType>(matchType);

    napi_value invertValue;
    napi_get_named_property(env, jsObj, "invert", &invertValue);
    napi_get_value_bool(env, invertValue, &ipMatch.invert);

    napi_value valueObj;
    napi_get_named_property(env, jsObj, "value", &valueObj);

    switch (ipMatch.type) {
        case OH_TRAFFICFILTER_IP_MATCH_SINGLE:
            return ParseIPAddress(env, valueObj, ipMatch.value.single);
        case OH_TRAFFICFILTER_IP_MATCH_CIDR:
            return ParseIPCidr(env, valueObj, ipMatch.value.cidr);
        case OH_TRAFFICFILTER_IP_MATCH_RANGE:
            return ParseIPRange(env, valueObj, ipMatch.value.range);
        case OH_TRAFFICFILTER_IP_MATCH_MULTI:
            return ParseIPMulti(env, valueObj, ipMatch.value.multi);
        case OH_TRAFFICFILTER_IP_MATCH_ANY:
        default:
            return true;
    }
}

bool TrafficFilterNapiUtils::ParsePortRange(napi_env env, napi_value jsObj, OH_TrafficFilter_PortRange &range)
{
    napi_value startValue;
    napi_get_named_property(env, jsObj, "startPort", &startValue);
    uint32_t startPort;
    napi_get_value_uint32(env, startValue, &startPort);
    range.startPort = static_cast<uint16_t>(startPort);

    napi_value endValue;
    napi_get_named_property(env, jsObj, "endPort", &endValue);
    uint32_t endPort;
    napi_get_value_uint32(env, endValue, &endPort);
    range.endPort = static_cast<uint16_t>(endPort);

    return true;
}

bool TrafficFilterNapiUtils::ParsePortMulti(napi_env env, napi_value jsObj, OH_TrafficFilter_PortMulti &multi)
{
    napi_value portsValue;
    napi_get_named_property(env, jsObj, "ports", &portsValue);

    bool isArray;
    napi_is_array(env, portsValue, &isArray);
    if (!isArray) {
        return false;
    }

    uint32_t length;
    napi_get_array_length(env, portsValue, &length);
    if (length > OH_TRAFFICFILTER_MAX_MULTI_PORT_COUNT) {
        return false;
    }

    multi.portCount = length;
    for (uint32_t i = 0; i < length; i++) {
        napi_value elem;
        napi_get_element(env, portsValue, i, &elem);
        uint32_t val;
        napi_get_value_uint32(env, elem, &val);
        multi.ports[i] = static_cast<uint16_t>(val);
    }

    return true;
}

bool TrafficFilterNapiUtils::ParsePortMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_PortMatch &portMatch)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    napi_value typeValue;
    napi_get_named_property(env, jsObj, "type", &typeValue);
    uint32_t matchType;
    napi_get_value_uint32(env, typeValue, &matchType);
    portMatch.type = static_cast<OH_TrafficFilter_PortMatchType>(matchType);

    napi_value invertValue;
    napi_get_named_property(env, jsObj, "invert", &invertValue);
    napi_get_value_bool(env, invertValue, &portMatch.invert);

    napi_value valueObj;
    napi_get_named_property(env, jsObj, "value", &valueObj);

    switch (portMatch.type) {
        case OH_TRAFFICFILTER_PORT_MATCH_SINGLE: {
            uint32_t port;
            napi_get_value_uint32(env, valueObj, &port);
            portMatch.value.single = static_cast<uint16_t>(port);
            return true;
        }
        case OH_TRAFFICFILTER_PORT_MATCH_RANGE:
            return ParsePortRange(env, valueObj, portMatch.value.range);
        case OH_TRAFFICFILTER_PORT_MATCH_MULTI:
            return ParsePortMulti(env, valueObj, portMatch.value.multi);
        case OH_TRAFFICFILTER_PORT_MATCH_ANY:
        default:
            return true;
    }
}

bool TrafficFilterNapiUtils::ParseInterfaceMatch(napi_env env, napi_value jsObj,
    OH_TrafficFilter_InterfaceMatch &ifMatch)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    napi_value enabledValue;
    napi_get_named_property(env, jsObj, "enabled", &enabledValue);
    napi_get_value_bool(env, enabledValue, &ifMatch.enabled);

    napi_value invertValue;
    napi_get_named_property(env, jsObj, "invert", &invertValue);
    napi_get_value_bool(env, invertValue, &ifMatch.invert);

    napi_value isPrefixValue;
    napi_get_named_property(env, jsObj, "isPrefix", &isPrefixValue);
    napi_get_value_bool(env, isPrefixValue, &ifMatch.isPrefix);

    napi_value ifNameValue;
    napi_get_named_property(env, jsObj, "ifName", &ifNameValue);
    
    char ifName[OH_TRAFFICFILTER_IFNAMSIZ];
    size_t result;
    napi_get_value_string_utf8(env, ifNameValue, ifName, OH_TRAFFICFILTER_IFNAMSIZ, &result);

    int ret = snprintf(ifMatch.ifName, sizeof(ifMatch.ifName), "%s", ifName);
    if (ret < 0) {
        return false;
    }
    return true;
}

bool ParseRedirectRuleMatch(napi_env env, napi_value jsObj, OH_TrafficFilter_RedirectRule &rule)
{
    napi_value value;

    napi_get_named_property(env, jsObj, "priority", &value);
    uint32_t priority;
    napi_get_value_uint32(env, value, &priority);
    rule.priority = priority;

    napi_get_named_property(env, jsObj, "hookPoint", &value);
    uint32_t hookPoint;
    napi_get_value_uint32(env, value, &hookPoint);
    rule.hookPoint = static_cast<OH_TrafficFilter_HookPoint>(hookPoint);

    napi_get_named_property(env, jsObj, "protocol", &value);
    uint32_t protocol;
    napi_get_value_uint32(env, value, &protocol);
    rule.protocol = static_cast<uint8_t>(protocol);

    napi_get_named_property(env, jsObj, "srcIp", &value);
    if (!TrafficFilterNapiUtils::ParseIPMatch(env, value, rule.srcIp)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "srcPort", &value);
    if (!TrafficFilterNapiUtils::ParsePortMatch(env, value, rule.srcPort)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "dstIp", &value);
    if (!TrafficFilterNapiUtils::ParseIPMatch(env, value, rule.dstIp)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "dstPort", &value);
    if (!TrafficFilterNapiUtils::ParsePortMatch(env, value, rule.dstPort)) {
        return false;
    }

    return true;
}

bool ParseRedirectRuleAction(napi_env env, napi_value jsObj, OH_TrafficFilter_RedirectRule &rule)
{
    napi_value value;

    napi_get_named_property(env, jsObj, "inInterface", &value);
    if (!TrafficFilterNapiUtils::ParseInterfaceMatch(env, value, rule.inInterface)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "outInterface", &value);
    if (!TrafficFilterNapiUtils::ParseInterfaceMatch(env, value, rule.outInterface)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "uidStart", &value);
    {
        napi_valuetype type;
        napi_status status = napi_typeof(env, value, &type);
        if (status == napi_ok && type != napi_undefined) {
            uint32_t uidStart;
            napi_get_value_uint32(env, value, &uidStart);
            rule.uidStart = uidStart;
        }
    }

    napi_get_named_property(env, jsObj, "uidEnd", &value);
    {
        napi_valuetype type;
        napi_status status = napi_typeof(env, value, &type);
        if (status == napi_ok && type != napi_undefined) {
            uint32_t uidEnd;
            napi_get_value_uint32(env, value, &uidEnd);
            rule.uidEnd = uidEnd;
        }
    }

    napi_get_named_property(env, jsObj, "proxyIp", &value);
    if (!TrafficFilterNapiUtils::ParseIPAddress(env, value, rule.proxyIp)) {
        return false;
    }

    napi_get_named_property(env, jsObj, "proxyPort", &value);
    uint32_t proxyPort;
    napi_get_value_uint32(env, value, &proxyPort);
    rule.proxyPort = static_cast<uint16_t>(proxyPort);

    return true;
}

bool TrafficFilterNapiUtils::ParseRedirectRule(napi_env env, napi_value jsObj,
    OH_TrafficFilter_RedirectRule &rule)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    rule.size = sizeof(OH_TrafficFilter_RedirectRule);

    if (!ParseRedirectRuleMatch(env, jsObj, rule)) {
        return false;
    }

    if (!ParseRedirectRuleAction(env, jsObj, rule)) {
        return false;
    }

    return true;
}

bool TrafficFilterNapiUtils::ParseConnectionInfo(napi_env env, napi_value jsObj,
    OH_TrafficFilter_ConnectionInfo &connInfo)
{
    napi_valuetype type;
    napi_typeof(env, jsObj, &type);
    if (type != napi_object) {
        return false;
    }

    connInfo.size = sizeof(OH_TrafficFilter_ConnectionInfo);

    napi_value srcIpValue;
    napi_get_named_property(env, jsObj, "srcIp", &srcIpValue);
    if (!TrafficFilterNapiUtils::ParseIPAddress(env, srcIpValue, connInfo.srcIp)) {
        return false;
    }

    napi_value srcPortValue;
    napi_get_named_property(env, jsObj, "srcPort", &srcPortValue);
    uint32_t srcPort;
    napi_get_value_uint32(env, srcPortValue, &srcPort);
    connInfo.srcPort = static_cast<uint16_t>(srcPort);

    napi_value dstIpValue;
    napi_get_named_property(env, jsObj, "dstIp", &dstIpValue);
    if (!TrafficFilterNapiUtils::ParseIPAddress(env, dstIpValue, connInfo.dstIp)) {
        return false;
    }

    napi_value dstPortValue;
    napi_get_named_property(env, jsObj, "dstPort", &dstPortValue);
    uint32_t dstPort;
    napi_get_value_uint32(env, dstPortValue, &dstPort);
    connInfo.dstPort = static_cast<uint16_t>(dstPort);

    napi_value protocolValue;
    napi_get_named_property(env, jsObj, "protocol", &protocolValue);
    uint32_t protocol;
    napi_get_value_uint32(env, protocolValue, &protocol);
    connInfo.protocol = static_cast<uint8_t>(protocol);

    return true;
}

napi_value TrafficFilterNapiUtils::CreateIPAddress(napi_env env, const OH_TrafficFilter_IPAddress &ipAddr)
{
    napi_value obj;
    napi_create_object(env, &obj);

    napi_value familyValue;
    napi_create_uint32(env, static_cast<uint32_t>(ipAddr.family), &familyValue);
    napi_set_named_property(env, obj, "family", familyValue);

    napi_value addrArray;
    napi_create_array_with_length(env, OH_TRAFFICFILTER_IP_ADDRLEN, &addrArray);
    for (uint32_t i = 0; i < OH_TRAFFICFILTER_IP_ADDRLEN; i++) {
        napi_value elem;
        napi_create_uint32(env, ipAddr.addr[i], &elem);
        napi_set_element(env, addrArray, i, elem);
    }
    napi_set_named_property(env, obj, "addr", addrArray);

    return obj;
}

napi_value TrafficFilterNapiUtils::CreateProcessInfo(napi_env env, const OH_TrafficFilter_ProcessInfo &processInfo)
{
    napi_value obj;
    napi_create_object(env, &obj);

    napi_value pidValue;
    napi_create_uint32(env, processInfo.pid, &pidValue);
    napi_set_named_property(env, obj, "pid", pidValue);

    napi_value uidValue;
    napi_create_uint32(env, processInfo.uid, &uidValue);
    napi_set_named_property(env, obj, "uid", uidValue);

    return obj;
}
