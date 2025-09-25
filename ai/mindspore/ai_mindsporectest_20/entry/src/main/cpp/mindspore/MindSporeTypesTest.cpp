/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "MindSporeTypesTest.h"
#include <mindspore/model.h>
#include <mindspore/types.h>
#include <inttypes.h>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <ctime>
#include <cstdio>
#include <fstream>

namespace MindSporeTypesTest {
napi_value DeviceTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_GPU);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", device_type);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, device_type == OH_AI_DEVICETYPE_GPU ? 0 : 1, &retValue);
    return retValue;
}
char *ReadFile(const char *file, size_t* size) {
  printf("[common.cpp] Loading data from: %s\n", file);

  std::ifstream ifs(file);
  if (!ifs.good()) {
    return nullptr;
  }

  if (!ifs.is_open()) {
    ifs.close();
    return nullptr;
  }

  ifs.seekg(0, std::ios::end);
  *size = ifs.tellg();

  char *buf = new char[*size];
  if (buf == nullptr) {
    ifs.close();
    return nullptr;
  }

  ifs.seekg(0, std::ios::beg);
  ifs.read(buf, *size);
  ifs.close();
  printf("[common.cpp]Read Binary Data Over, get tensorSize as: %" PRId64 ".\n", static_cast<int64_t>(*size));

  return buf;
}

const void* LoadModelData(const char* filename, size_t* out_size) {
    if (!filename || !out_size) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111LoadModelData",
                     "Invalid parameters");
        return nullptr;
    }
    
    FILE* file = fopen(filename, "rb");
    if (!file) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111LoadModelData",
                     "Failed to open file: %{public}s, errno: %{public}d", filename, errno);
        return nullptr;
    }

    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    rewind(file);

    if (file_size <= 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111LoadModelData",
                     "Invalid file size: %{public}ld", file_size);
        fclose(file);
        return nullptr;
    }

    void* buffer = malloc(file_size);
    if (!buffer) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111LoadModelData",
                     "Memory allocation failed for %{public}ld bytes", file_size);
        fclose(file);
        return nullptr;
    }

    size_t bytes_read = fread(buffer, 1, file_size, file);
    fclose(file);

    if (bytes_read != static_cast<size_t>(file_size)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111LoadModelData",
                     "Read incomplete: %{public}zu of %{public}ld bytes", bytes_read, file_size);
        free(buffer);
        return nullptr;
    }

    *out_size = file_size;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "111111LoadModelData",
                 "Successfully loaded %{public}zu bytes from %{public}s", file_size, filename);
    return buffer;
}

napi_value ModelTypetest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptr_size = &size;
    const void* model_data = LoadModelData(graphPath, ptr_size);
    if (model_data == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "model_data: %{public}p,"
                 "size:%{public}d", &model_data, size);
    OH_AI_ModelType model_type = OH_AI_MODELTYPE_INVALID;
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, model_type, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret1 == OH_AI_STATUS_LITE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value NNRTDeviceTypetest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t type = 0;
    napi_get_value_uint32(env, argv[0], &type);
    OH_AI_NNRTDeviceType checkType;
    int ret = -1;
    if (type == OH_AI_NNRTDEVICE_OTHERS) {
        ret = 0;
    } else if(type == OH_AI_NNRTDEVICE_CPU) {
        ret = 0;
    } else if(type == OH_AI_NNRTDEVICE_GPU) {
        ret = 0;
    } else if(type == OH_AI_NNRTDEVICE_ACCELERATOR) {
        ret = 0;
    };
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO0);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO0 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO2);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO3);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO3 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KAUTO);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KAUTO? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KOPTIMIZATIONTYPE);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KOPTIMIZATIONTYPE ? 0 : 1, &retValue);
    return retValue;
}
}