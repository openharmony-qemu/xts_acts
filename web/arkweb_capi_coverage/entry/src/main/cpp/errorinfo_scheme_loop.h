/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef ERRORINFO_SCHEME_LOOP_H
#define ERRORINFO_SCHEME_LOOP_H

#include "napi/native_api.h"

napi_value RegisterErrorInfoCustomSchemes(napi_env env, napi_callback_info info);
napi_value SetupErrorInfoSchemeHandler(napi_env env, napi_callback_info info);
napi_value ResetDidFailWithErrorInfoLiveResult(napi_env env, napi_callback_info info);
napi_value GetDidFailWithErrorInfoLiveResult(napi_env env, napi_callback_info info);
napi_value GetErrorInfoSchemeWebTag(napi_env env, napi_callback_info info);

#endif // ERRORINFO_SCHEME_LOOP_H
