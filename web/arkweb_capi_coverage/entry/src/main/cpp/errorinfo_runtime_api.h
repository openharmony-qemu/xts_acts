/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef ERRORINFO_RUNTIME_API_H
#define ERRORINFO_RUNTIME_API_H

#include <cstdint>
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"

struct ErrorInfoRuntimeApi {
    void (*createErrorInfo)(ArkWeb_ErrorInfo **) = nullptr;
    void (*destroyErrorInfo)(ArkWeb_ErrorInfo *) = nullptr;
    int32_t (*setCompleteIfNoResponse)(ArkWeb_ErrorInfo *, bool) = nullptr;
    bool (*getCompleteIfNoResponse)(const ArkWeb_ErrorInfo *) = nullptr;
    int32_t (*setCustomErrorCode)(ArkWeb_ErrorInfo *, int32_t) = nullptr;
    int32_t (*getCustomErrorCode)(const ArkWeb_ErrorInfo *) = nullptr;
    int32_t (*setErrorCode)(ArkWeb_ErrorInfo *, ArkWeb_NetError) = nullptr;
    ArkWeb_NetError (*getErrorCode)(const ArkWeb_ErrorInfo *) = nullptr;
    int32_t (*responseSetErrorInfo)(ArkWeb_Response *, ArkWeb_ErrorInfo *) = nullptr;
    ArkWeb_ErrorInfo *(*responseGetErrorInfo)(const ArkWeb_Response *) = nullptr;
    int32_t (*didFailWithErrorInfo)(const ArkWeb_ResourceHandler *,
        const ArkWeb_ErrorInfo *) = nullptr;
};

bool LoadErrorInfoRuntimeApi();
const ErrorInfoRuntimeApi &GetErrorInfoRuntimeApi();

#endif // ERRORINFO_RUNTIME_API_H
