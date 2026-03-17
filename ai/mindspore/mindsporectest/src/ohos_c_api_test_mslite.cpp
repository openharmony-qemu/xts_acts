/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <thread>
#include <random>
#include <inttypes.h>
#include <securec.h>
#include "ohos_common.h"
#include "gtest/gtest.h"
#include "include/c_api/context_c.h"
#include "include/c_api/model_c.h"
#include "include/c_api/types_c.h"
#include "include/c_api/status_c.h"
#include "include/c_api/data_type_c.h"
#include "include/c_api/tensor_c.h"
#include "include/c_api/format_c.h"
#include "syspara/parameter.h"

using namespace testing::ext;

class MSLiteTest: public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

// function before callback
bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info) {
    std::cout << "Before forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// function after callback
bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info) {
    std::cout << "After forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// add cpu device info
void AddContextDeviceCPU(OH_AI_ContextHandle context) {
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
}

bool IsNNRTAvailable() {
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        return false;
    }
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    if (type != 1) {
        return false;
    }
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return true;
}

bool IsNPU() {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            return true;
        }
    }
    return false;
}

OH_AI_Status OH_AI_Test_GetDeviceID(char *nnrtDevice, size_t len)
{
    const std::string nullHardwareName = "default";
    const std::string hardwareName = "const.ai.nnrt_deivce";
    constexpr size_t hardwareNameMaxLength = 128;

    if (nnrtDevice == nullptr || len == 0) {
        std::cout << "nnrtDevice is nullptr or len is 0." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }

    char cName[hardwareNameMaxLength] = {0};
    int ret = GetParameter(hardwareName.c_str(), nullHardwareName.c_str(), cName, hardwareNameMaxLength);
    // 如果成功获取返回值为硬件名称的字节数
    if (ret <= 0) {
        std::cout << "GetNNRtDeviceName failed, failed to get parameter." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }

    auto secureRet = strcpy_s(nnrtDevice, len, cName);
    if (secureRet != EOK) {
        std::cout << "GetNNRtDeviceName failed, failed to get name." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }
    return OH_AI_STATUS_SUCCESS;
}


// add nnrt device info
void AddContextDeviceNNRT(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }
    NNRTDeviceDesc *desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info
void AddContextDeviceNNRTWithCache(OH_AI_ContextHandle context, const char *cache_path, const char *cache_version) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }
    NNRTDeviceDesc *desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info by type
void AddContextDeviceNNRTByType(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (descs == nullptr) {
        return;
    }
    
    NNRTDeviceDesc *desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);

    std::cout << "NNRT device: id = " << id << std::endl;
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc_1);
    ASSERT_EQ(type, OH_AI_NNRTDEVICE_ACCELERATOR);
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(type);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_NE(nnrt_device_info, nullptr);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrt_device_info), id);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info by name
void AddContextDeviceNNRTByName(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (descs == nullptr) {
        return;
    }

    NNRTDeviceDesc *desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_1);
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(name);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_NE(nnrt_device_info, nullptr);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrt_device_info), id);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// fill data to inputs tensor
void FillInputsData(OH_AI_TensorHandleArray inputs, string model_name, bool is_transpose) {
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        printf("==========ReadFile==========\n");
        size_t size1;
        size_t *ptr_size1 = &size1;
        string input_data_path = "/data/test/" + model_name + "_" + std::to_string(i) + ".input";
        const char *imagePath = input_data_path.c_str();
        char *imageBuf = ReadFile(imagePath, ptr_size1);
        ASSERT_NE(imageBuf, nullptr);
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
        float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(inputs.handle_list[i]));
        ASSERT_NE(input_data, nullptr);
        if (is_transpose) {
            printf("==========Transpose==========\n");
            size_t shape_num;
            const int64_t *shape = OH_AI_TensorGetShape(tensor, &shape_num);
            auto imageBuf_nhwc = new char[size1];
            PackNCHWToNHWCFp32(imageBuf, imageBuf_nhwc, shape[0], shape[1] * shape[2], shape[3]);
            memcpy_s(input_data, size1, imageBuf_nhwc, size1);
            delete[] imageBuf_nhwc;
        } else {
            memcpy_s(input_data, size1, imageBuf, size1);
        }
        printf("input data after filling is: ");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%f ", input_data[j]);
        }
        printf("\n");
        delete[] imageBuf;
    }
}

// compare result after predict
void CompareResult(OH_AI_TensorHandleArray outputs, string model_name, float atol = 0.01, float rtol = 0.01, bool isquant = false) {
    printf("==========GetOutput==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s .\n", OH_AI_TensorGetName(tensor));
        float *output_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%f ", output_data[j]);
        }
        printf("\n");
        printf("==========compFp32WithTData==========\n");
        string output_file = "/data/test/" + model_name + std::to_string(i) + ".output";
        bool result = compFp32WithTData(output_data, output_file, atol, rtol, isquant);
        EXPECT_EQ(result, true);
    }
}

// model build and predict
void ModelPredict(OH_AI_ModelHandle model, OH_AI_ContextHandle context, string model_name,
            OH_AI_ShapeInfo shape_infos, bool build_by_graph, bool is_transpose, bool is_callback) {
    string model_path = "/data/test/" + model_name + ".ms";
    const char *graphPath = model_path.c_str();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (build_by_graph) {
        printf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t *ptr_size = &size;
        char *graphBuf = ReadFile(graphPath, ptr_size);
        ASSERT_NE(graphBuf, nullptr);
        ret = OH_AI_ModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context); 
        delete[] graphBuf;
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_ModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context);
    }
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (shape_infos.shape_num != 0) {
        printf("==========Resizes==========\n");
        OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
        printf("==========Resizes return code:%d\n", resize_ret);
        ASSERT_EQ(resize_ret, OH_AI_STATUS_SUCCESS);
    }

    FillInputsData(inputs, model_name, is_transpose);
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_STATUS_SUCCESS;
    if (is_callback) {
        printf("==========Model Predict Callback==========\n");
        OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
        OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
        predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    }else {
        printf("==========Model Predict==========\n");
        predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    }
    printf("==========Model Predict End==========\n");
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("=========CompareResult===========\n");
    CompareResult(outputs, model_name);
    printf("=========OH_AI_ContextDestroy===========\n");
    OH_AI_ContextDestroy(&context);
    printf("=========OH_AI_ContextDestroy End===========\n");
    printf("=========OH_AI_ModelDestroy===========\n");
    OH_AI_ModelDestroy(&model);
    printf("=========OH_AI_ModelDestroy End===========\n");
}

// model build and predict
void ModelTrain(OH_AI_ModelHandle model, OH_AI_ContextHandle context, string model_name,
            OH_AI_ShapeInfo shape_infos, bool build_by_graph, bool is_transpose, bool is_callback) {
    string model_path = "/data/test/" + model_name + ".ms";
    const char *graphPath = model_path.c_str();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (build_by_graph) {
        printf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t *ptr_size = &size;
        char *graphBuf = ReadFile(graphPath, ptr_size);
        ASSERT_NE(graphBuf, nullptr);
        ret = OH_AI_TrainModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context, train_cfg); 
        delete[] graphBuf;
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    }
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (shape_infos.shape_num != 0) {
        printf("==========Resizes==========\n");
        OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
        printf("==========Resizes return code:%d\n", resize_ret);
        ASSERT_EQ(resize_ret, OH_AI_STATUS_SUCCESS);
    }
    FillInputsData(inputs, model_name, is_transpose);
    ret = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    if (is_callback) {
        printf("==========Model RunStep Callback==========\n");
        OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
        OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
        ret = OH_AI_RunStep(model, before_call_back, after_call_back);
    }else {
        printf("==========Model RunStep==========\n");
        ret = OH_AI_RunStep(model, nullptr, nullptr);
    }
    printf("==========Model RunStep End==========\n");
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
}
char **TransStrVectorToCharArrays(const std::vector<std::string> &s) {
  char **char_arr = static_cast<char **>(malloc(s.size() * sizeof(char *)));
  for (size_t i = 0; i < s.size(); i++) {
    char_arr[i] = static_cast<char *>(malloc((s[i].size() + 1)));
    strcpy(char_arr[i], s[i].c_str());
  }
  return char_arr;
}
std::vector<std::string> TransCharArraysToStrVector(char **c, const size_t &num) {
  std::vector<std::string> str;
  for (size_t i = 0; i < num; i++) {
    str.push_back(std::string(c[i]));
  }
  return str;
}

void PrintTrainLossName(OH_AI_TrainCfgHandle trainCfg) {
    size_t num = 0;
    char **lossName = OH_AI_TrainCfgGetLossName(trainCfg, &num);
    std::vector<std::string> trainCfgLossName = TransCharArraysToStrVector(lossName, num);
    for (auto ele : trainCfgLossName) {
        std::cout << "loss_name:" << ele << std::endl;
    }
    for (size_t i = 0; i < num; i++) {
        free(lossName[i]);
    }
}

// 正常场景：更新权重
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0001
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0001
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
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
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    GenRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void ModelUpdateWeightsTest(OH_AI_ModelHandle model)
{
    OH_AI_TensorHandleArray get_update_weights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < get_update_weights.handle_num; ++i) {
        OH_AI_TensorHandle weights_tensor = get_update_weights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weights_tensor), "fc3.bias") == 0) {
            float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(weights_tensor));
            std::cout << "fc3.bias:" << input_data[0] << std::endl;
        }
    }
    auto genRandomData = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
            [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        createShapeNum, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    OH_AI_ModelUpdateWeights(model, update_weights);
}

// 正常场景：更新权重后导出训练图，再获取权重
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0002
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0002
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR,
        context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ModelUpdateWeightsTest(model);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT,
        true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray export_update_weights = OH_AI_ModelGetWeights(model);
    ASSERT_NE(export_update_weights.handle_list, nullptr);
    ASSERT_NE(export_update_weights.handle_num, 0);
    for (size_t i = 0; i < export_update_weights.handle_num; ++i) {
        OH_AI_TensorHandle weights_tensor = export_update_weights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weights_tensor), "fc3.bias") == 0){
            float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(weights_tensor));
            std::cout << "fc3.bias:" << input_data[0] << std::endl;
        }
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor name错误
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0003
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0003
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("aaaaa", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor type错误
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0004
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0004
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor name全部错误
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0005
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0005
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray get_weights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle>  feature_maps;
    for (size_t i = 0; i < get_weights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(get_weights.handle_list[i]);
        size_t shape_num;
        auto shape = OH_AI_TensorGetShape(get_weights.handle_list[i], &shape_num);
        OH_AI_DataType data_type = OH_AI_TensorGetDataType(get_weights.handle_list[i]);
        auto data = OH_AI_TensorGetData(get_weights.handle_list[i]);
        auto data_size = OH_AI_TensorGetDataSize(get_weights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, data_type, shape, shape_num, data, data_size);
        OH_AI_TensorSetName(tensor, "AAAA");
        feature_maps.push_back(tensor);
    }
    printf("==========OH_AI_TrainModel updateWeights==========\n");
    status = OH_AI_ModelUpdateWeights(model, {feature_maps.size(), feature_maps.data()});
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
void RunStepErrorCodeTest(){
    // OH_AI_RunStep异常测试
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context01 = OH_AI_ContextCreate();
    ASSERT_NE(context01, nullptr);
    AddContextDeviceCPU(context01);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model01 = OH_AI_ModelCreate();
    ASSERT_NE(model01, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model01, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context01);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    auto status01 = OH_AI_RunStep(model01, nullptr, nullptr);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_INPUT_TENSOR_ERROR);
    auto status02 = OH_AI_RunStep(nullptr, nullptr, nullptr);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_PARAM_INVALID);
    auto status03 = OH_AI_ModelSetLearningRate(model01, 1000.0f);
    ASSERT_EQ(status03, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context01);
    OH_AI_ModelDestroy(&model01);
}
// 异常场景：更新权重tensor name错误一个
/**
 * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0006
 * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0006
 * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray get_weights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle>  feature_maps;
    for (size_t i = 0; i < get_weights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(get_weights.handle_list[i]);
        size_t shape_num;
        auto shape = OH_AI_TensorGetShape(get_weights.handle_list[i], &shape_num);
        OH_AI_DataType data_type = OH_AI_TensorGetDataType(get_weights.handle_list[i]);
        auto data = OH_AI_TensorGetData(get_weights.handle_list[i]);
        auto data_size = OH_AI_TensorGetDataSize(get_weights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, data_type, shape, shape_num, data, data_size);
        feature_maps.push_back(tensor);
    }
    printf("==========OH_AI_TrainModel updateWeights==========\n");
    OH_AI_TensorSetName(feature_maps.at(1), "AAAA");
    status = OH_AI_ModelUpdateWeights(model, {feature_maps.size(), feature_maps.data()});
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    auto status01 = OH_AI_ModelUpdateWeights(nullptr, { feature_maps.size(), feature_maps.data() });
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    RunStepErrorCodeTest();
}
// 正常场景：设置学习率为0.01
/**
 * @tc.name   SUB_AI_MindSpore_Train_SetLearningRate_0001
 * @tc.number SUB_AI_MindSpore_Train_SetLearningRate_0001
 * @tc.desc   SUB_AI_MindSpore_Train_SetLearningRate_0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_SetLearningRate_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learing_rate:" << learing_rate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, 0.01f);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learing_rate << std::endl;
    ASSERT_EQ(learing_rate, 0.01f);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}