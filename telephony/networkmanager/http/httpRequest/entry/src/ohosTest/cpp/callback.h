#include <string>
#include <map>
#include "napi/native_api.h"
#include "network/netstack/http_interceptor.h"

// 回调数据结构体
typedef struct CallbackData {
    std::string callbackName;
    std::string jsonData;
    std::string interceptorName;
    bool isRequest;
} CallbackData;

// 线程安全回调结构体
typedef struct ThreadSafeCallback {
    napi_env env{nullptr};
    napi_value jsCallback{nullptr};
    napi_threadsafe_function tsfn{nullptr};
} ThreadSafeCallback;

typedef struct Callback {
    napi_env env{nullptr};
    napi_value jsCallback{nullptr};
} Callback;

void RegisterCallback(std::string callbackName, Callback callback);
void UnregisterCallback(std::string callbackName);
Callback GetCallback(std::string callbackName);
void CallJsFunction(std::string &callbackName);

// 线程安全回调相关函数
void RegisterThreadSafeCallback(std::string callbackName, napi_env env, napi_value jsCallback);
void UnregisterThreadSafeCallback(std::string callbackName);
ThreadSafeCallback GetThreadSafeCallback(std::string callbackName);

// 定义返回结构
typedef struct InterceptorCallbackResult {
    std::string requestJson;
    std::string responseJson;
    std::string interceptorName;
} InterceptorCallbackResult;

// 初始化主线程 EventRunner 和 EventHandler
void InitMainThreadRunner();

// 在主线程中调用 JS 回调函数
void CallJsCallbackOnMainThread(const CallbackData &data);

InterceptorCallbackResult CallJsFunctionWithRequest(std::string &callbackName, OH_Http_Interceptor_Request *request, const char *interceptorName);
InterceptorCallbackResult CallJsFunctionWithResponse(std::string &callbackName, OH_Http_Interceptor_Response *response, const char *interceptorName);
