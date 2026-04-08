#include <map>
#include "callback.h"
#include <iostream>
#include <sstream>
#include <mutex>
#include <queue>
#include "napi/native_api.h"
#include <hilog/log.h>

static const int GLOBAL_NETSTACK = 0xFF00;
static const char *TAG = "[netstack]";


static std::mutex g_queueMutex;
static std::queue<CallbackData> g_callbackQueue;
static std::map<std::string, ThreadSafeCallback > g_threadSafeCallbackMap = {};

static void ExecuteCallback(napi_env env, napi_value jsCallback, void* context, void* data) {
    if (!data) {
        return;
    }
    CallbackData* callbackData = static_cast<CallbackData*>(data);
    napi_value jsJsonData;
    napi_create_string_utf8(env, callbackData->jsonData.c_str(), NAPI_AUTO_LENGTH, &jsJsonData);
    napi_value jsInterceptorName;
    napi_create_string_utf8(env, callbackData->interceptorName.c_str(), NAPI_AUTO_LENGTH, &jsInterceptorName);
    napi_value args[2] = {jsJsonData, jsInterceptorName};
    napi_value jsResult;
    napi_call_function(env, nullptr, jsCallback, 2, args, &jsResult);
    delete callbackData;
}

static void CleanupCallback(napi_env env, void* data, void* hint) {
}

void RegisterThreadSafeCallback(std::string callbackName, napi_env env, napi_value jsCallback) {
    if (callbackName.empty() || !env || !jsCallback) {
        return;
    }
    napi_threadsafe_function tsfn = nullptr;
    napi_value async_resource_name = nullptr;
    napi_status status = napi_create_string_utf8(env, "InterceptorCallback", NAPI_AUTO_LENGTH, &async_resource_name);
    if (status != napi_ok) {
        printf("napi_create_string_utf8 failed: %d\n", status);
        return;
    }
    status = napi_create_threadsafe_function(
        env, jsCallback, nullptr, async_resource_name, 0, 1, nullptr, 
        CleanupCallback, nullptr, ExecuteCallback, &tsfn);
    if (status != napi_ok) {
        printf("napi_create_threadsafe_function failed: %d\n", status);
        return;
    }
    if (tsfn) {
        g_threadSafeCallbackMap[callbackName] = {env, jsCallback, tsfn};
    }
}

void UnregisterThreadSafeCallback(std::string callbackName) {
    if (callbackName.empty()) {
        return;
    }
    auto result = g_threadSafeCallbackMap.find(callbackName);
    if (result != g_threadSafeCallbackMap.end()) {
        if (result->second.tsfn) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "11111111111111111111111111111 33");
            napi_release_threadsafe_function(result->second.tsfn, napi_tsfn_release);
        }
        g_threadSafeCallbackMap.erase(callbackName);
    }
}

ThreadSafeCallback GetThreadSafeCallback(std::string callbackName) {
    if (callbackName.empty()) {
        return {nullptr, nullptr, nullptr};
    }
    auto result = g_threadSafeCallbackMap.find(callbackName);
    if (result != g_threadSafeCallbackMap.end()) {
        return result->second;
    }
    return {nullptr, nullptr, nullptr};
}

void InitMainThreadRunner() {
    printf("InitMainThreadRunner called\n");
}

void CallJsCallbackOnMainThread(const CallbackData &data) {
    ThreadSafeCallback callback = GetThreadSafeCallback(data.callbackName);
    if (callback.tsfn) {
        CallbackData* callbackData = new CallbackData(data);
        napi_status status = napi_call_threadsafe_function(callback.tsfn, callbackData, napi_tsfn_blocking);
        if (status != napi_ok) {
            printf("napi_call_threadsafe_function failed: %d\n", status);
            delete callbackData;
        }
    } else {
        printf("Thread-safe callback not initialized, cannot call JS callback\n");
    }
}

InterceptorCallbackResult CallJsFunctionWithRequest(std::string &callbackName, OH_Http_Interceptor_Request *request, const char *interceptorName) {
    InterceptorCallbackResult result;
    result.interceptorName = interceptorName;
    std::stringstream jsonStream;
    jsonStream << "{";
    if (request && request->url.buffer) {
        jsonStream << "\"url\":{\"buffer\":\"" << request->url.buffer;
        jsonStream << "\",\"length\":" << request->url.length << "}";
    }
    if (request && request->method.buffer) {
        if (request->url.buffer) jsonStream << ",";
        jsonStream << "\"method\":{\"buffer\":\"" << request->method.buffer;
        jsonStream << "\",\"length\":" << request->method.length << "}";
    }
    if (request && request->body.buffer) {
        if (request->url.buffer || request->method.buffer) jsonStream << ",";
        jsonStream << "\"body\":{\"buffer\":\"" << request->body.buffer;
        jsonStream << "\",\"length\":" << request->body.length << "}";
    }
    if (request && request->headers) {
        bool hasPrevious = request->url.buffer || request->method.buffer || request->body.buffer;
        if (hasPrevious) jsonStream << ",";
        jsonStream << "\"headers\":[";
        bool firstHeader = true;
        OH_Http_Interceptor_Headers* header = request->headers;
        while (header != nullptr) {
            if (header->data) {
                if (!firstHeader) jsonStream << ",";
                jsonStream << "{\"data\":\"" << header->data << "\"}";
                firstHeader = false;
            }
            header = header->next;
        }
        jsonStream << "]";
    }
    jsonStream << "}";
    result.requestJson = jsonStream.str();
    CallbackData data;
    data.callbackName = callbackName;
    data.jsonData = result.requestJson;
    data.interceptorName = result.interceptorName;
    data.isRequest = true;
    CallJsCallbackOnMainThread(data);
    return result;
}

InterceptorCallbackResult CallJsFunctionWithResponse(std::string &callbackName, OH_Http_Interceptor_Response *response, const char *interceptorName) {
    InterceptorCallbackResult result;
    result.interceptorName = interceptorName;
    std::stringstream jsonStream;
    jsonStream << "{";
    if (response) {
        jsonStream << "\"responseCode\":" << response->responseCode;
    }
    if (response && response->body.buffer) {
        jsonStream << ",\"body\":{\"buffer\":\"" << response->body.buffer;
        jsonStream << "\",\"length\":" << response->body.length << "}";
    }
    if (response && response->headers) {
        if (response->body.buffer) jsonStream << ",";
        jsonStream << "\"headers\":[";
        bool firstHeader = true;
        OH_Http_Interceptor_Headers* header = response->headers;
        while (header != nullptr) {
            if (header->data) {
                if (!firstHeader) jsonStream << ",";
                jsonStream << "{\"data\":\"" << header->data << "\"}";
                firstHeader = false;
            }
            header = header->next;
        }
        jsonStream << "]";
    }
    if (response) {
        bool hasHeadersOrBody = response->headers || response->body.buffer;
        if (hasHeadersOrBody) jsonStream << ",";
        jsonStream << "\"performanceTiming\":{";
        jsonStream << "\"dnsTiming\":" << response->performanceTiming.dnsTiming << ",";
        jsonStream << "\"tcpTiming\":" << response->performanceTiming.tcpTiming << ",";
        jsonStream << "\"tlsTiming\":" << response->performanceTiming.tlsTiming << ",";
        jsonStream << "\"firstSendTiming\":" << response->performanceTiming.firstSendTiming << ",";
        jsonStream << "\"firstReceiveTiming\":" << response->performanceTiming.firstReceiveTiming << ",";
        jsonStream << "\"totalFinishTiming\":" << response->performanceTiming.totalFinishTiming << ",";
        jsonStream << "\"redirectTiming\":" << response->performanceTiming.redirectTiming;
        jsonStream << "}";
    }
    jsonStream << "}";
    result.responseJson = jsonStream.str();
    CallbackData data;
    data.callbackName = callbackName;
    data.jsonData = result.responseJson;
    data.interceptorName = result.interceptorName;
    data.isRequest = false;
    CallJsCallbackOnMainThread(data);
    return result;
}