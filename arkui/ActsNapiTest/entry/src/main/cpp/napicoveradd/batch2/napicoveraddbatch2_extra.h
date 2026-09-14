/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef NAPI_COVER_ADD_BATCH2_EXTRA_H
#define NAPI_COVER_ADD_BATCH2_EXTRA_H

#include "napi/native_api.h"

napi_value InitNapiCoverAddBatch2Extra(napi_env env, napi_value exports);

void SendableRemoveWrapFinalizer(napi_env env, void *data, void *hint);

#endif // NAPI_COVER_ADD_BATCH2_EXTRA_H
