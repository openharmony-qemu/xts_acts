/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *
 * http://www.apache.org/licenses/LICENSE-2.0
 * *
 * * Unless required by applicable law or agreed to in writing, software
 * * distributed under the License is distributed on an "AS IS" BASIS,
 * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * * See the License for the specific language governing permissions and
 * * limitations under the License.
 * */
#include "rawfile_request.h"
#include "threads.h"
#include "hilog/log.h"
#include "rawfile/raw_file.h"
#include "rawfile/raw_file_manager.h"
#include <thread>

#undef LOG_TAG
#define LOG_TAG "ss-handler"


namespace {


uint8_t buffer[1024];
cnd_t http_body_cnd;
mtx_t http_body_mtx;
uint8_t* readBuffer;

int32_t setAsyncReadCallback_ = -1;
int32_t asyncRead_ = -1;
int32_t asyncReadMore_ = -1;
int32_t asyncReadCallback_ = -1;

int g_workerPid = -1;
int g_asyncPid = -1;
bool g_httpBodyStreamNullptr = false;
int g_bufLen = 10;

// HttpBodyStream的读回调。
void ReadCallback(const ArkWeb_HttpBodyStream  *httpBodyStream, uint8_t* buffer, int bytesRead)
{
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_asyncPid = static_cast<int>(hashValue);
    OH_LOG_INFO(LOG_APP, "ReadCallback async thread id :%{public}d", g_asyncPid);
    OH_LOG_INFO(LOG_APP, "ReadCallback read http body back.");
    OH_LOG_INFO(LOG_APP, "ReadCallback data :%{public}s", (char *)buffer);
    readBuffer = buffer;
    asyncReadCallback_ = 1;
    OH_LOG_INFO(LOG_APP, "ReadCallback asyncReadCallback :%{public}d", asyncReadCallback_);
    bool isEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream);
    if (!isEof && bytesRead != 0) {
        memset(buffer, 0, 10);
        OH_LOG_INFO(LOG_APP, "ReadCallback OH_ArkWebHttpBodyStream_AsyncRead start");
        OH_ArkWebHttpBodyStream_AsyncRead(httpBodyStream, buffer, 10);
        asyncReadMore_ = 1;
        OH_LOG_INFO(LOG_APP, "ReadCallback asyncReadMore :%{public}d", asyncReadMore_);
        OH_LOG_INFO(LOG_APP, "ReadCallback OH_ArkWebHttpBodyStream_AsyncRead end");
    } else {
        OH_LOG_INFO(LOG_APP, "ReadCallback RawfileRequest OH_ArkWebHttpBodyStream_GetUserData");
        RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebHttpBodyStream_GetUserData(httpBodyStream);
        if (rawfileRequest) {
            OH_LOG_INFO(LOG_APP, "ReadCallback RawfileRequest ReadDataOnWorkerThread start");
            rawfileRequest->ReadDataOnWorkerThread();
            cnd_signal(&http_body_cnd);
        }
    }
}


int ReadHttpBodyOnWorkerThread(void* userData)
{
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread start.");
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_workerPid = static_cast<int>(hashValue);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread thread id :%{public}d", g_workerPid);
    memset(buffer, 0, 10);
    ArkWeb_HttpBodyStream *httpBodyStream = (ArkWeb_HttpBodyStream *)userData;

    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread g_httpBodyStreamNullptr :%{public}d", g_httpBodyStreamNullptr);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread g_bufLen :%{public}d", g_bufLen);
    if (g_httpBodyStreamNullptr) {
        OH_ArkWebHttpBodyStream_AsyncRead(nullptr, buffer, 10);
    } else {
        OH_ArkWebHttpBodyStream_AsyncRead(httpBodyStream, buffer, g_bufLen);
    }
    asyncRead_ = 1;
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread asyncRead :%{public}d", asyncRead_);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread OH_ArkWebHttpBodyStream_AsyncRead end");
    cnd_init(&http_body_cnd);
    mtx_init(&http_body_mtx, mtx_plain);
    cnd_wait(&http_body_cnd, &http_body_mtx);
    return 0;
}


int ReadRawfileOnWorkerThread(void* userData)
{
    OH_LOG_INFO(LOG_APP, "ReadRawfileOnWorkerThread start.");
    RawfileRequest * rawfileRequest = (RawfileRequest *)userData;
    if (rawfileRequest) {
        rawfileRequest->ReadRawfileDataOnWorkerThread();
    }
    return 0;
}


// ArkWeb_HttpBodyStream的初始化回调。
void InitCallback(const ArkWeb_HttpBodyStream *httpBodyStream, ArkWeb_NetError result)
{
    OH_LOG_INFO(LOG_APP, "init http body stream done %{public}d.", result);
    bool isChunked = OH_ArkWebHttpBodyStream_IsChunked(httpBodyStream);
    OH_LOG_INFO(LOG_APP, "http body stream is chunked %{public}d.", isChunked);
    thrd_t th;
    if (thrd_create(&th, ReadHttpBodyOnWorkerThread, (void *)httpBodyStream) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "create thread failed.");
        return;
    }


    if (thrd_detach(th) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "detach thread failed.");
    }
}


const int blockSize = 1024 * 8;


}  // namespace


RawfileRequest::RawfileRequest(const ArkWeb_ResourceRequest *resourceRequest,
                               const ArkWeb_ResourceHandler *resourceHandler,
                               const NativeResourceManager* resourceManager)
        : resourceRequest_(resourceRequest),
          resourceHandler_(resourceHandler),
          resourceManager_(resourceManager) {}


RawfileRequest::~RawfileRequest() {}

int RawfileRequest::SetAsyncReadCallback()
{
    return setAsyncReadCallback_;
}

int RawfileRequest::AsyncRead()
{
    return asyncRead_;
}

int RawfileRequest::AsyncReadMore()
{
    return asyncReadMore_;
}

int RawfileRequest::AsyncReadCallback()
{
    return asyncReadCallback_;
}

std::string RawfileRequest::ReadBufferValue()
{
    if (readBuffer) {
        return std::string((char *)readBuffer);
    }
    return "";
}

int RawfileRequest::ThreadIdEqual()
{
    if (g_workerPid == g_asyncPid) {
        return -1;
    }
    return 1;
}

void RawfileRequest::Start()
{
    OH_LOG_INFO(LOG_APP, "RawfileRequest start a rawfile request.");
    setAsyncReadCallback_ = -1;
    asyncRead_ = -1;
    asyncReadMore_ = -1;
    asyncReadCallback_ = -1;
    readBuffer = nullptr;
    g_workerPid = -1;
    g_asyncPid = -1;
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  httpBodyStreamNullptr_ :%{public}d", httpBodyStreamNullptr_);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  bufLen :%{public}d", bufLen_);
    g_httpBodyStreamNullptr = httpBodyStreamNullptr_;
    g_bufLen = bufLen_;
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  g_httpBodyStreamNullptr :%{public}d", g_httpBodyStreamNullptr);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  g_bufLen :%{public}d", g_bufLen);

    char* url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest_, &url);
    std::string urlStr(url);
    std::size_t position = urlStr.rfind('/');
    if (position != std::string::npos) {
        rawfilePath_ = urlStr.substr(position + 1);
    }
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  url :%{public}s", url);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  rawfilePath_ :%{public}s", rawfilePath_.c_str());
    OH_ArkWeb_ReleaseString(url);

    OH_ArkWeb_CreateResponse(&response_);
    OH_ArkWebResourceRequest_GetHttpBodyStream(resourceRequest(), &stream_);
    if (stream_) {
        OH_LOG_ERROR(LOG_APP, "RawfileRequest Start have http body stream");
        OH_ArkWebHttpBodyStream_SetUserData(stream_, this);
        OH_ArkWebHttpBodyStream_SetAsyncReadCallback(stream_, ReadCallback);
        setAsyncReadCallback_ = 1;
        OH_LOG_INFO(LOG_APP, "RawfileRequest Start  setAsyncReadCallback :%{public}d", setAsyncReadCallback_);
        OH_LOG_INFO(LOG_APP, "RawfileRequest Start OH_ArkWebHttpBodyStream_SetAsyncReadCallback end");
        OH_ArkWebHttpBodyStream_Init(stream_, InitCallback);
    } else {
        OH_LOG_ERROR(LOG_APP, "RawfileRequest ReadRawfileOnWorkerThread start.");
        thrd_t th;
        if (thrd_create(&th, ReadRawfileOnWorkerThread, (void *)this) != thrd_success) {
            OH_LOG_ERROR(LOG_APP, "RawfileRequest Start ReadRawfileOnWorkerThread create thread failed.");
            return;
        }


        if (thrd_detach(th) != thrd_success) {
            OH_LOG_ERROR(LOG_APP, "RawfileRequest Start detach thread failed.");
        }
    }
}

// 在worker线程中读取rawfile，并通过ResourceHandler返回给Web内核。
void RawfileRequest::ReadDataOnWorkerThread()
{
    OH_LOG_INFO(LOG_APP, "ReadDataOnWorkerThread read rawfile in worker thread.");
    OH_ArkWebResponse_SetError(response(), ARKWEB_NET_OK);
    OH_ArkWebResponse_SetStatus(response(), 200);
    OH_ArkWebResponse_SetCharset(response(), "UTF-8");
    OH_ArkWebResponse_SetMimeType(response(), "text/html");
    DidReceiveResponse();
    DidReceiveData(readBuffer, 100);
    DidFinish();
}

// 在worker线程中读取rawfile，并通过ResourceHandler返回给Web内核。
void RawfileRequest::ReadRawfileDataOnWorkerThread()
{
    OH_LOG_INFO(LOG_APP, "ReadRawfileDataOnWorkerThread read rawfile in worker thread.");
    const struct UrlInfo {
        std::string resource;
        std::string mimeType;
    } urlInfos[] = {
        {"test.html", "text/html"},
        {"video.html", "text/html"},
        {"isolated.html", "text/html"},
        {"csp_bypassing.html", "text/html"},
        {"post_data.html", "text/html"},
        {"chunked_post_stream.html", "text/html"},
        {"local.html", "text/html"},
        {"service_worker.html", "text/html"},
        {"csp_script.js", "text/javascript"},
        {"sw.js", "text/javascript"},
        {"isolated_script.js", "text/javascript"},
        {"local_script.js", "text/javascript"},
        {"test.mp4", "video/mp4"},
        {"xhr", "application/json"}
    };

    if (!resourceManager()) {
        OH_LOG_ERROR(LOG_APP, "read rawfile error, resource manager is nullptr.");
        return;
    }

    RawFile *rawfile = OH_ResourceManager_OpenRawFile(resourceManager(), rawfilePath().c_str());
    if (!rawfile) {
        OH_LOG_INFO(LOG_APP, "ReadRawfileDataOnWorkerThread OH_ArkWebResponse_SetStatus 404.");
        OH_ArkWebResponse_SetStatus(response(), 404);
    } else {
        OH_LOG_INFO(LOG_APP, "ReadRawfileDataOnWorkerThread OH_ArkWebResponse_SetStatus 200.");
        OH_ArkWebResponse_SetStatus(response(), 200);
    }

    for (auto &urlInfo : urlInfos) {
        if (urlInfo.resource == rawfilePath()) {
            OH_ArkWebResponse_SetMimeType(response(), urlInfo.mimeType.c_str());
            break;
        }
    }
    OH_ArkWebResponse_SetCharset(response(), "UTF-8");

    long len = OH_ResourceManager_GetRawFileSize(rawfile);
    OH_ArkWebResponse_SetHeaderByName(response(), "content-length", std::to_string(len).c_str(), false);
    DidReceiveResponse();

    long consumed = 0;
    uint8_t buffer[blockSize];
    while (true) {
        int ret = OH_ResourceManager_ReadRawFile(rawfile, buffer, blockSize);
        OH_LOG_INFO(LOG_APP, "read rawfile %{public}d bytes.", ret);
        if (ret == 0) {
            break;
        }
        consumed += ret;
        OH_ResourceManager_SeekRawFile(rawfile, consumed, 0);
        DidReceiveData(buffer, ret);
        memset(buffer, 0, blockSize);
    }


    OH_ResourceManager_CloseRawFile(rawfile);
    DidFinish();
}


void RawfileRequest::Stop()
{
    OH_LOG_INFO(LOG_APP, "stop the rawfile request.");
    std::lock_guard<std::mutex> guard(mutex_);
    stopped_ = true;
    if (response_) {
        OH_ArkWeb_DestroyResponse(response_);
    }
    OH_ArkWebResourceRequest_Destroy(resourceRequest_);
    OH_ArkWebResourceHandler_Destroy(resourceHandler_);
}


void RawfileRequest::DidReceiveResponse()
{
    OH_LOG_INFO(LOG_APP, "did receive response.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidReceiveResponse(resourceHandler_, response_);
    }
}


void RawfileRequest::DidReceiveData(const uint8_t *buffer, int64_t bufLen)
{
    OH_LOG_INFO(LOG_APP, "did receive data.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidReceiveData(resourceHandler_, buffer, bufLen);
    }
}


void RawfileRequest::DidFinish()
{
    OH_LOG_INFO(LOG_APP, "did finish.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidFinish(resourceHandler_);
    }
}


void RawfileRequest::DidFailWithError(ArkWeb_NetError errorCode)
{
    OH_LOG_INFO(LOG_APP, "did finish with error %{public}d.", errorCode);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidFailWithError(resourceHandler_, errorCode);
    }
}