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

#include "MindSporeStatusTest.h"
#include <mindspore/model.h>
#include <string>

namespace MindSporeStatusTest {

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

napi_value StatusTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
     
    auto ret = OH_AI_TensorSetUserData(tensor, data, 6 * 4);
//    auto ret = OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", "/data/local/tmp/", 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111kernel_Info", "ret: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_STATUS_LITE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value StatusTest_002(napi_env env, napi_callback_info info)
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

napi_value StatusTest_008(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status1 = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms",
                                                 OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    auto GenRandomData = [](size_t size, void *data) {
      auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
      std::mt19937 random_engine_;
      size_t elements_num = size / sizeof(float);
      (void)std::generate_n(static_cast<float *>(data), elements_num,
                            [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   create_shape, create_shape_num, nullptr, 0);
    GenRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    auto status2 = OH_AI_ModelSetTrainMode(model, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status2);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status2 == OH_AI_STATUS_LITE_UNINITIALIZED_OBJ ? 0 : 1, &retValue);
    return retValue;
}
}