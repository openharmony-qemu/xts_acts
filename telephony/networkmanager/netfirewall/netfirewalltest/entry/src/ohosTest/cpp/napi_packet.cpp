#include "napi/native_api.h"
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <arpa/inet.h>
#include "hilog/log.h"
#include "network/netmanager_ext/net_trafficfilter.h"


using namespace std;
const int BUFFER_SIZE = 128;
map<int, OH_TrafficFilter_PacketController*> controllerMap_;
int g_controllerId = 1;

const int CONTROLLER_NULL_ERROR_CODE = 29410101;

const int MAX_COUNT = 16;
const int MAX_NUM = 65535;
const size_t MAX_PORT_LIST_LENGTH = 128;
const int ID_NUM = 100;

static const int GLOBAL_NETSTACK = 0xFF00;
static const char *TAG = "[packet]";

static OH_TrafficFilter_Config ParsePacketControllerArgs(
    napi_env env, napi_callback_info info, uint32_t& groupId, uint32_t& priority)
{
    enum CreatePacketControllerArgIndex {
        GROUP_ID_ARG_INDEX = 0,
        PRIORITY_ARG_INDEX,
        PACKET_COPY_LEN_ARG_INDEX,
        NFQUEUE_MAX_LEN_ARG_INDEX,
        NFQUEUE_FLAGS_ARG_INDEX,
        PACKET_COPY_MODE_ARG_INDEX,
        CREATE_PACKET_CONTROLLER_ARG_COUNT
    };

    size_t argc = CREATE_PACKET_CONTROLLER_ARG_COUNT;
    napi_value args[CREATE_PACKET_CONTROLLER_ARG_COUNT] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    groupId = ID_NUM;
    priority = ID_NUM;
    uint32_t packetCopyLen = 0xFFFF;
    uint32_t nfqueueMaxlen = 1024;
    uint32_t nfqueueFlags = 1;
    uint32_t packetCopyMode = 2;

    if (argc > GROUP_ID_ARG_INDEX) {
        napi_get_value_uint32(env, args[GROUP_ID_ARG_INDEX], &groupId);
    }
    if (argc > PRIORITY_ARG_INDEX) {
        napi_get_value_uint32(env, args[PRIORITY_ARG_INDEX], &priority);
    }
    if (argc > PACKET_COPY_LEN_ARG_INDEX) {
        napi_get_value_uint32(env, args[PACKET_COPY_LEN_ARG_INDEX], &packetCopyLen);
    }
    if (argc > NFQUEUE_MAX_LEN_ARG_INDEX) {
        napi_get_value_uint32(env, args[NFQUEUE_MAX_LEN_ARG_INDEX], &nfqueueMaxlen);
    }
    if (argc > PACKET_COPY_MODE_ARG_INDEX) {
        napi_get_value_uint32(env, args[PACKET_COPY_MODE_ARG_INDEX], &packetCopyMode);
    }
    OH_TrafficFilter_Config config;
    config.size = sizeof(OH_TrafficFilter_Config);
    config.packetCopyLen = packetCopyLen;
    config.nfqueueMaxlen = nfqueueMaxlen;
    config.nfqueueFlags = nfqueueFlags;
    config.packetCopyMode = packetCopyMode;
    return config;
}

static napi_value CreatePacketControllerNapi(napi_env env, napi_callback_info info)
{
    uint32_t groupId;
    uint32_t priority;
    OH_TrafficFilter_Config config = ParsePacketControllerArgs(env, info, groupId, priority);
    OH_TrafficFilter_PacketController* controller = nullptr;
    int32_t ret = OH_TrafficFilter_CreatePacketController(groupId, priority, &config, &controller);
    controllerMap_[g_controllerId] = controller;
    napi_value resultObj;
    napi_create_object(env, &resultObj);
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    napi_set_named_property(env, resultObj, "ret", retValue);
    napi_value id;
    napi_create_int32(env, g_controllerId, &id);
    napi_set_named_property(env, resultObj, "id", id);
    g_controllerId++;
    return resultObj;
}

static napi_value DestoryPacketControllerNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t id;
    if (argc >= 1) napi_get_value_uint32(env, args[0], &id);
    int ret = CONTROLLER_NULL_ERROR_CODE;
    
    OH_TrafficFilter_PacketController* controller = controllerMap_[id];
    if (controller != nullptr) {
        ret = OH_TrafficFilter_DestroyPacketController(controller);
        controllerMap_[id] = nullptr;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

// 读取布尔值
static bool GetObjBool(napi_env env, napi_value obj, const char* key, bool def)
{
    bool has;
    if (napi_has_named_property(env, obj, key, &has) != napi_ok || !has) {
        return def;
    }
    napi_value val;
    bool res = def;
    napi_get_named_property(env, obj, key, &val);
    napi_get_value_bool(env, val, &res);
    return res;
}

// 读取uint32枚举
static uint32_t GetObjU32(napi_env env, napi_value obj, const char* key, uint32_t def)
{
    bool has;
    if (napi_has_named_property(env, obj, key, &has) != napi_ok || !has) {
        return def;
    }
    napi_value val;
    uint32_t res = def;
    napi_get_named_property(env, obj, key, &val);
    napi_get_value_uint32(env, val, &res);
    return res;
}

// 判断属性是否存在
static bool ObjHasProp(napi_env env, napi_value obj, const char* key)
{
    bool has = false;
    napi_has_named_property(env, obj, key, &has);
    return has;
}

// 读取字符串数组 IPAddress.addr
static int ReadStrArray(napi_env env, napi_value arr, char out[][46], int maxCnt)
{
    uint32_t len = 0;
    napi_get_array_length(env, arr, &len);
    int copy = len > maxCnt ? maxCnt : len;
    for (uint32_t i = 0; i < copy; i++) {
        napi_value item;
        char buf[46] = {0};
        size_t strLen;
        napi_get_element(env, arr, i, &item);
        napi_get_value_string_utf8(env, item, buf, sizeof(buf), &strLen);
        strcpy(out[i], buf);
    }
    return copy;
}

// 读取数字数组（端口数组专用）
static int ReadPortArray(napi_env env, napi_value arr, uint16_t out[], int maxCnt)
{
    uint32_t len = 0;
    napi_get_array_length(env, arr, &len);
    int copy = len > maxCnt ? maxCnt : len;
    
    for (uint32_t i = 0; i < copy; i++) {
        napi_value item;
        uint32_t num = 0;
        napi_get_element(env, arr, i, &item);
        napi_get_value_uint32(env, item, &num);
        out[i] = static_cast<uint16_t>(num);
    }
    
    return copy;
}

static int IpStrToBin(const char* str, uint8_t* binaryBuf, OH_TrafficFilter_IPFamily family)
{
    memset(binaryBuf, 0, sizeof(in6_addr));
    if (family == OH_TRAFFICFILTER_IP_FAMILY_V4) {
        return inet_pton(AF_INET, str, binaryBuf);
    } else if (family == OH_TRAFFICFILTER_IP_FAMILY_V6) {
        return inet_pton(AF_INET6, str, binaryBuf);
    }
    return -1;
}

static void ParseIPAddress(napi_env env, napi_value obj, OH_TrafficFilter_IPAddress* out)
{
    memset(out, 0, sizeof(*out));
    out->family = static_cast<OH_TrafficFilter_IPFamily>(
        GetObjU32(env, obj, "family", OH_TRAFFICFILTER_IP_FAMILY_UNSPEC));
    if (ObjHasProp(env, obj, "addr")) {
        napi_value arr;
        napi_get_named_property(env, obj, "addr", &arr);
        uint32_t arrLen = 0;
        napi_get_array_length(env, arr, &arrLen);
        if (arrLen == 0) {
            return;
        }
        napi_value strItem;
        napi_get_element(env, arr, 0, &strItem);
        char ipStr[46] = {0};
        size_t strLen;
        napi_get_value_string_utf8(env, strItem, ipStr, sizeof(ipStr), &strLen);
        IpStrToBin(ipStr, out->addr, out->family);
    }
}

static void ParseIPCidr(napi_env env, napi_value obj, OH_TrafficFilter_IPCidr* out)
{
    memset(out, 0, sizeof(*out));
    if (ObjHasProp(env, obj, "base")) {
        napi_value baseObj;
        napi_get_named_property(env, obj, "base", &baseObj);
        ParseIPAddress(env, baseObj, &out->base);
    }
    out->prefixLen = GetObjU32(env, obj, "prefixLen", 0);
}

static void ParseIPRange(napi_env env, napi_value obj, OH_TrafficFilter_IPRange* out)
{
    memset(out, 0, sizeof(*out));
    if (ObjHasProp(env, obj, "start")) {
        napi_value sObj;
        napi_get_named_property(env, obj, "start", &sObj);
        ParseIPAddress(env, sObj, &out->start);
    }
    if (ObjHasProp(env, obj, "end")) {
        napi_value eObj;
        napi_get_named_property(env, obj, "end", &eObj);
        ParseIPAddress(env, eObj, &out->end);
    }
}

static void ParseIPMulti(napi_env env, napi_value obj, OH_TrafficFilter_IPMulti* out)
{
    memset(out, 0, sizeof(*out));
    if (!ObjHasProp(env, obj, "ips")) {
        return;
    }
    napi_value arr;
    uint32_t arrLen;
    napi_get_named_property(env, obj, "ips", &arr);
    napi_get_array_length(env, arr, &arrLen);
    int copy = arrLen > 8 ? 8 : arrLen;
    out->ipCount = copy;
    for (int i = 0; i < copy; i++) {
        napi_value item;
        napi_get_element(env, arr, i, &item);
        ParseIPAddress(env, item, &out->ips[i]);
    }
}

static void ParseIPMatch(napi_env env, napi_value matchObj, OH_TrafficFilter_IPMatch* out)
{
    memset(out, 0, sizeof(*out));
    // 1. 顶层固定字段
    out->type = static_cast<OH_TrafficFilter_IPMatchType>(
        GetObjU32(env, matchObj, "type", 0));
    out->invert = GetObjBool(env, matchObj, "invert", false);

    // ANY 无 value，直接返回
    if (out->type == 0) {
        return;
    }
        
    // 不存在 value 直接返回
    if (!ObjHasProp(env, matchObj, "value")) {
        return;
    }

    napi_value valObj;
    napi_get_named_property(env, matchObj, "value", &valObj);

    // 2. 根据 type 分支解析 value 多态对象
    switch (out->type) {
        case OH_TRAFFICFILTER_IP_MATCH_SINGLE:
            ParseIPAddress(env, valObj, &out->value.single);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_CIDR:
            ParseIPCidr(env, valObj, &out->value.cidr);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_RANGE:
            ParseIPRange(env, valObj, &out->value.range);
            break;
        case OH_TRAFFICFILTER_IP_MATCH_MULTI:
            ParseIPMulti(env, valObj, &out->value.multi);
            break;
        default:
            break;
    }
}

static void ParsePortRange(napi_env env, napi_value obj, OH_TrafficFilter_PortRange* out)
{
    memset(out, 0, sizeof(*out));
    out->startPort = (uint16_t)GetObjU32(env, obj, "startPort", 0);
    out->endPort = (uint16_t)GetObjU32(env, obj, "endPort", MAX_NUM);
}

static void ParsePortMulti(napi_env env, napi_value obj, OH_TrafficFilter_PortMulti* out)
{
    memset(out, 0, sizeof(*out));
    if (!ObjHasProp(env, obj, "ports")) {
        return;
    }
    napi_value arr;
    napi_get_named_property(env, obj, "ports", &arr);
    ReadPortArray(env, arr, out->ports, MAX_COUNT);
}

static void ParsePortMultiFromString(napi_env env, napi_value strObj, OH_TrafficFilter_PortMulti* out)
{
    size_t bufLen = 0;
    if (napi_get_value_string_utf8(env, strObj, nullptr, 0, &bufLen) != napi_ok ||
        bufLen == 0 || bufLen > MAX_PORT_LIST_LENGTH) {
        return;
    }

    const size_t bufferSize = bufLen + 1;
    char* buf = static_cast<char*>(malloc(bufferSize));
    if (buf == nullptr) {
        return;
    }
    
    size_t resultLen = 0;
    if (napi_get_value_string_utf8(env, strObj, buf, bufferSize, &resultLen) != napi_ok) {
        free(buf);
        return;
    }
    buf[resultLen] = '\0';

    uint32_t count = 0;
    char* token = strtok(buf, ",， ");
    while (token != nullptr && count < MAX_COUNT) {
        int portVal = atoi(token);
        if (portVal >= 0 && portVal <= MAX_NUM) {
            out->ports[count] = (uint16_t)portVal;
            count++;
        }
        token = strtok(nullptr, ",， ");
    }

    out->portCount = count;
    free(buf);
}

static void ParsePortMatchValue(napi_env env, napi_value obj, OH_TrafficFilter_PortMatch* out)
{
    napi_value dataTargetObj = obj;
    if (ObjHasProp(env, obj, "value")) {
        napi_get_named_property(env, obj, "value", &dataTargetObj);
    }
    switch (out->type) {
        case OH_TRAFFICFILTER_PORT_MATCH_SINGLE: {
            if (ObjHasProp(env, dataTargetObj, "single")) {
                out->value.single = static_cast<uint16_t>(GetObjU32(env, dataTargetObj, "single", 0));
            }
            break;
        }
        case OH_TRAFFICFILTER_PORT_MATCH_RANGE: {
            out->value.range.startPort =
                static_cast<uint16_t>(GetObjU32(env, dataTargetObj, "rangeStart", 0));
            out->value.range.endPort =
                static_cast<uint16_t>(GetObjU32(env, dataTargetObj, "rangeEnd", MAX_NUM));
            break;
        }
        case OH_TRAFFICFILTER_PORT_MATCH_MULTI: {
            if (ObjHasProp(env, dataTargetObj, "ports")) {
                napi_value portsObj;
                napi_get_named_property(env, dataTargetObj, "ports", &portsObj);
                napi_valuetype propType;
                napi_typeof(env, portsObj, &propType);
                if (propType == napi_object) {
                    out->value.multi.portCount =
                        ReadPortArray(env, portsObj, out->value.multi.ports, MAX_COUNT);
                } else if (propType == napi_string) {
                    ParsePortMultiFromString(env, portsObj, &out->value.multi);
                }
            }
            break;
        }
        case OH_TRAFFICFILTER_PORT_MATCH_ANY:
        default:
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, "fz ANY Mode or Unknown.");
            break;
    }
}

static void ParsePortMatch(napi_env env, napi_value obj, OH_TrafficFilter_PortMatch* out)
{
    if (obj == nullptr || out == nullptr) {
        return;
    }
    memset(out, 0, sizeof(*out));
    if (ObjHasProp(env, obj, "invert")) {
        napi_value invertVal;
        napi_get_named_property(env, obj, "invert", &invertVal);
        napi_get_value_bool(env, invertVal, &out->invert);
    }
    if (!ObjHasProp(env, obj, "type")) {
        return;
    }
    napi_value typeObj;
    napi_get_named_property(env, obj, "type", &typeObj);
    uint32_t typeVal = 0;
    napi_get_value_uint32(env, typeObj, &typeVal);
    out->type = static_cast<OH_TrafficFilter_PortMatchType>(typeVal);
    ParsePortMatchValue(env, obj, out);
}

static void ParseInterfaceMatch(napi_env env, napi_value obj, OH_TrafficFilter_InterfaceMatch* out)
{
    memset(out, 0, sizeof(*out));

    // 1. 读取三个布尔字段，默认 false
    out->enabled = GetObjBool(env, obj, "enabled", false);
    out->invert = GetObjBool(env, obj, "invert", false);
    out->isPrefix = GetObjBool(env, obj, "isPrefix", false);

    // 2. 读取 ifName 字符串
    if (ObjHasProp(env, obj, "ifName")) {
        napi_value strVal;
        size_t strLen;
        napi_get_named_property(env, obj, "ifName", &strVal);
        // 读取字符串，自动截断防止缓冲区溢出
        napi_get_value_string_utf8(env, strVal, out->ifName, sizeof(out->ifName), &strLen);
    }
}

static void ParseMacMatch(napi_env env, napi_value macObj, OH_TrafficFilter_MACMatch* out)
{
    memset(out, 0, sizeof(*out));

    // 读取布尔字段
    out->enable = GetObjBool(env, macObj, "enable", false);
    out->invert = GetObjBool(env, macObj, "invert", false);

    // 读取srcMac数组（可选字段，不存在则macCount=0）
    if (ObjHasProp(env, macObj, "srcMac")) {
        napi_value macArr;
        napi_get_named_property(env, macObj, "srcMac", &macArr);
        bool isArray = false;
        napi_is_array(env, macArr, &isArray);
        
        if (isArray) {
            uint32_t arrayLength = 0;
            napi_get_array_length(env, macArr, &arrayLength);
            
            // 2. 如果数组不为空，取第一个元素（index = 0）
            if (arrayLength > 0) {
                napi_value firstElement;
                napi_get_element(env, macArr, 0, &firstElement);
                
                // 3. 将第一个元素作为字符串解析到 out->srcMac 中
                size_t strLen = 0;
                napi_get_value_string_utf8(env, firstElement, out->srcMac, sizeof(out->srcMac), &strLen);
            }
        } else {
            // 兜底：如果前端不小心传了普通字符串而非数组，也能兼容解析
            size_t strLen = 0;
            napi_get_value_string_utf8(env, macArr, out->srcMac, sizeof(out->srcMac), &strLen);
        }
    }
}

static void ParseTcpFlagsMatch(napi_env env, napi_value obj, OH_TrafficFilter_TCPFlagsMatch* out)
{
    memset(out, 0, sizeof(*out));
    // 开关
    out->enable = GetObjBool(env, obj, "enable", false);
    // 掩码枚举 FlagMask
    out->flagMask = GetObjU32(env, obj, "flagMask", 0);
    // 比较值
    out->flagComp = GetObjU32(env, obj, "flagComp", 0);
}

static void ParseConntrackMatch(napi_env env, napi_value obj, OH_TrafficFilter_ConntrackMatch* out)
{
    memset(out, 0, sizeof(*out));
    out->enable = GetObjBool(env, obj, "enable", false);
    // StateMask 状态掩码
    out->stateMask = GetObjU32(env, obj, "stateMask", 0);
}

static OH_TrafficFilter_HookPoint ParseRuleHookPoint(napi_env env, napi_value configObj)
{
    uint32_t hookPoint = GetObjU32(env, configObj, "hookPoint", OH_TRAFFICFILTER_HOOK_OUTPUT);
    switch (hookPoint) {
        case OH_TRAFFICFILTER_HOOK_INPUT:
        case OH_TRAFFICFILTER_HOOK_OUTPUT:
        case OH_TRAFFICFILTER_HOOK_FORWARD:
        case OH_TRAFFICFILTER_HOOK_PREROUTING:
        case OH_TRAFFICFILTER_HOOK_POSTROUTING:
            return static_cast<OH_TrafficFilter_HookPoint>(hookPoint);
        default:
            return OH_TRAFFICFILTER_HOOK_OUTPUT;
    }
}

static void ParseRuleBasicFields(napi_env env, napi_value configObj, OH_TrafficFilter_FilterRule* rule)
{
    rule->priority = GetObjU32(env, configObj, "priority", MAX_COUNT);
    rule->hookPoint = ParseRuleHookPoint(env, configObj);
    rule->protocol = GetObjU32(env, configObj, "protocol", OH_TRAFFICFILTER_PROTO_TCP);
}

static void ParseRuleAddressAndPortMatches(
    napi_env env, napi_value configObj, OH_TrafficFilter_FilterRule* rule)
{
    if (ObjHasProp(env, configObj, "srcIp")) {
        napi_value srcIpObj;
        napi_get_named_property(env, configObj, "srcIp", &srcIpObj);
        ParseIPMatch(env, srcIpObj, &rule->srcIp);
    }
    if (ObjHasProp(env, configObj, "dstIp")) {
        napi_value dstIpObj;
        napi_get_named_property(env, configObj, "dstIp", &dstIpObj);
        ParseIPMatch(env, dstIpObj, &rule->dstIp);
    }
    if (ObjHasProp(env, configObj, "srcPort")) {
        napi_value srcPortObj;
        napi_get_named_property(env, configObj, "srcPort", &srcPortObj);
        ParsePortMatch(env, srcPortObj, &rule->srcPort);
    }
    if (ObjHasProp(env, configObj, "dstPort")) {
        napi_value dstPortObj;
        napi_get_named_property(env, configObj, "dstPort", &dstPortObj);
        ParsePortMatch(env, dstPortObj, &rule->dstPort);
    }
}

static void ParseRuleInterfaceAndUid(
    napi_env env, napi_value configObj, OH_TrafficFilter_FilterRule* rule)
{
    if (ObjHasProp(env, configObj, "inInterface")) {
        napi_value inIfObj;
        napi_get_named_property(env, configObj, "inInterface", &inIfObj);
        ParseInterfaceMatch(env, inIfObj, &rule->inInterface);
    }
    if (ObjHasProp(env, configObj, "outInterface")) {
        napi_value outIfObj;
        napi_get_named_property(env, configObj, "outInterface", &outIfObj);
        ParseInterfaceMatch(env, outIfObj, &rule->outInterface);
    }
    rule->uidStart = GetObjU32(env, configObj, "uidStart", 0);
    rule->uidEnd = GetObjU32(env, configObj, "uidEnd", 0);
}

static void ParseRuleOptionalMatches(
    napi_env env, napi_value configObj, OH_TrafficFilter_FilterRule* rule)
{
    if (ObjHasProp(env, configObj, "macMatch")) {
        napi_value macObj;
        napi_get_named_property(env, configObj, "macMatch", &macObj);
        ParseMacMatch(env, macObj, &rule->macMatch);
    }
    if (ObjHasProp(env, configObj, "tcpFlagsMatch")) {
        napi_value tcpObj;
        napi_get_named_property(env, configObj, "tcpFlagsMatch", &tcpObj);
        ParseTcpFlagsMatch(env, tcpObj, &rule->tcpFlagsMatch);
    }
    if (ObjHasProp(env, configObj, "conntrackMatch")) {
        napi_value ctObj;
        napi_get_named_property(env, configObj, "conntrackMatch", &ctObj);
        ParseConntrackMatch(env, ctObj, &rule->conntrackMatch);
    }
}

static napi_value AddPacketRuleNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    uint32_t id = -1;
    napi_get_value_uint32(env, args[0], &id);
    OH_TrafficFilter_PacketController* controller = controllerMap_[id];
    if (controller == nullptr) {
        napi_value result;
        napi_create_int32(env, CONTROLLER_NULL_ERROR_CODE, &result);
        return result;
    }

    OH_TrafficFilter_FilterRule rule = {0};
    rule.size = sizeof(OH_TrafficFilter_FilterRule);
    napi_value configObj = args[1];
    ParseRuleBasicFields(env, configObj, &rule);
    ParseRuleAddressAndPortMatches(env, configObj, &rule);
    ParseRuleInterfaceAndUid(env, configObj, &rule);
    ParseRuleOptionalMatches(env, configObj, &rule);

    int ret = OH_TrafficFilter_AddPacketRule(controller, &rule);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value ClearPacketRuleNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t id;
    if (argc >= 1) napi_get_value_uint32(env, args[0], &id);
    int ret = CONTROLLER_NULL_ERROR_CODE;
    OH_TrafficFilter_PacketController* controller = controllerMap_[id];
    if (controller != nullptr) {
        ret = OH_TrafficFilter_ClearPacketRule(controller);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

OH_TrafficFilter_PacketDecision MyPacketHandler(
    const OH_TrafficFilter_PacketDesc* packet, void* userData)
{
    // 读取packet报文信息做过滤
    // 返回放行/丢弃
    return OH_TRAFFICFILTER_DECISION_ACCEPT;
}

static napi_value RegisterPacketCallbackNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    uint32_t id = -1;
    napi_get_value_uint32(env, args[0], &id);
    OH_TrafficFilter_PacketController* controller = controllerMap_[id];
    if (controller == nullptr) {
        napi_value result;
        napi_create_int32(env, CONTROLLER_NULL_ERROR_CODE, &result);
        return result;
    }

    size_t copyLen = 0;
    char buf[BUFFER_SIZE] = {0};
    napi_get_value_string_utf8(env, args[1], buf, BUFFER_SIZE, &copyLen);
    void* userData = static_cast<void*>(buf);
    int ret = OH_TrafficFilter_RegisterPacketCallback(controller, MyPacketHandler, userData);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value UnregisterPacketCallbackNapi(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t id;
    if (argc >= 1) napi_get_value_uint32(env, args[0], &id);
    int ret = CONTROLLER_NULL_ERROR_CODE;
    OH_TrafficFilter_PacketController* controller = controllerMap_[id];
    if (controller != nullptr) {
        ret = OH_TrafficFilter_UnregisterPacketCallback(controller);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createPacketController", nullptr, CreatePacketControllerNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "destroyPacketController", nullptr, DestoryPacketControllerNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "addPacketRule", nullptr, AddPacketRuleNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "clearPacketRule", nullptr, ClearPacketRuleNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "registerPacketCallback", nullptr, RegisterPacketCallbackNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "unregisterPacketCallback", nullptr, UnregisterPacketCallbackNapi, nullptr, nullptr, nullptr,
            napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "packet",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
