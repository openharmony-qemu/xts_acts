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

#include "http_request.h"
// HTTP 请求核心头文件
#include "network/netstack/net_http.h"
// 日志头文件（调试用，适配3.2版本）
#include <hilog/log.h>
// 基础依赖
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 日志宏定义
static const int GLOBAL_HTTP_NETSTACK = 0xFF00;
static const char *HTTP_TAG = "netstack";

static void TestResponseCallback(struct Http_Response *response, uint32_t errCode)
{
    (void) response;
    (void) errCode;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "TestResponseCallback function called!");
}

void THttp_OnDataReceiveCallback(const char *data, size_t length)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttp_OnDataReceiveCallback function called!");
}

void THttp_OnProgressCallback(uint64_t totalSize, uint64_t transferredSize)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttp_OnProgressCallback function called!");
}

void (THttp_OnHeaderReceiveCallback)(Http_Headers *headers)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttp_OnHeaderReceiveCallback function called!");
}

void (THttp_OnVoidCallback)(void)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttp_OnVoidCallback function called!");
}

/**
 * 发起HTTP GET请求
 * @param url 请求URL（如"http://www.example.com/api"）
 * @return 成功返回0，失败返回-1
 */
int32_t SendHttpGetRequest(const char *url)
{
    Http_Request *request = OH_Http_CreateRequest(url);
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = TestResponseCallback;
    Http_EventsHandler handler = {0};
    
    /** Callback function when the response body is received */
    handler.onDataReceive = THttp_OnDataReceiveCallback;
      /** Callback function during uploading */
    handler.onUploadProgress= THttp_OnProgressCallback;
      /** Callback function during downloading */
    handler.onDownloadProgress = THttp_OnProgressCallback;
      /** Callback function when a header is received */
    handler.onHeadersReceive = THttp_OnHeaderReceiveCallback;
      /** Callback function at the end of the transfer */
    handler.onDataEnd = THttp_OnVoidCallback;
      /** Callback function when a request is canceled */
    handler.onCanceled = THttp_OnVoidCallback;
    
//    request->options->priority = -1;
//    request->options->priority = 2000;
//    request->options->priority = 1;
//    request->options->readTimeout = 1000;
//    request->options->connectTimeout = 1000;
    Http_Headers *header = OH_Http_CreateHeaders();
    OH_Http_SetHeaderValue(header, "Accept", "application/json");
    OH_Http_SetHeaderValue(header, "aaaaa", "11111");
    request->options->headers = header;
    auto ret = OH_Http_Request(request, callback, handler);
//    free(request->options);
//    OH_Http_DestroyHeaders(&header);
//    OH_Http_Destroy(&request);
    return ret;
}
