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
#include <array>
#include "include/ActsMindSporeTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"


// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
static constexpr size_t TRAIN_EXPORT_MODEL_HANDLER_COUNT = 14;
static constexpr size_t CONTEXT_CREATE_HANDLER_COUNT = 66;
static constexpr size_t MODEL_CREATE_HANDLER_COUNT = 37;
static constexpr size_t TENSOR_CREATE_HANDLER_COUNT = 50;
static constexpr size_t HIAI_OFFLINEMODEL_HANDLER_COUNT = 15;
static constexpr size_t OHOS_CONTEXT_CPU_HANDLER_COUNT = 20;
static constexpr size_t OHOS_TENSOR_CREATE_HANDLER_COUNT = 16;

using MindSporeFn = int (*)();

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65
};

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<MindSporeFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

// Train related functions
static napi_value SUB_AI_MindSpore_Train_UpdateWeights(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetLearningRate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetLearningRate0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetLearningRate0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetupVirtualBatch(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetupVirtualBatch0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetOptimizationLevel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetOptimizationLevel0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_TrainCfg(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ModelBuild(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ExportModel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, TRAIN_EXPORT_MODEL_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0001, Acts::MindSpore::SUBAIMindSporeTrainExportModel0002,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0003, Acts::MindSpore::SUBAIMindSporeTrainExportModel0004,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0005, Acts::MindSpore::SUBAIMindSporeTrainExportModel0006,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0007, Acts::MindSpore::SUBAIMindSporeTrainExportModel0008,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0009, Acts::MindSpore::SUBAIMindSporeTrainExportModel0010,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0011, Acts::MindSpore::SUBAIMindSporeTrainExportModel0012,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0013, Acts::MindSpore::SUBAIMindSporeTrainExportModel0014,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ExportWeights(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Context related functions
static napi_value SUB_AI_MindSpore_ContextCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, CONTEXT_CREATE_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeContextCreate0001, Acts::MindSpore::SUBAIMindSporeContextCreate0002,
            Acts::MindSpore::SUBAIMindSporeContextCreate0003, Acts::MindSpore::SUBAIMindSporeContextCreate0004,
            Acts::MindSpore::SUBAIMindSporeContextCreate0005, Acts::MindSpore::SUBAIMindSporeContextCreate0006,
            Acts::MindSpore::SUBAIMindSporeContextCreate0007, Acts::MindSpore::SUBAIMindSporeContextCreate0008,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_mindsporeDescriptors[] = {
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_UpdateWeights),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetLearningRate),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetupVirtualBatch),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetOptimizationLevel),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_TrainCfg),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ModelBuild),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ExportModel),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ExportWeights),
    DECL_NAPI_DESC(SUB_AI_MindSpore_ContextCreate),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_mindsporeDescriptors) / sizeof(g_mindsporeDescriptors[CASE_NUM_0]),
                           g_mindsporeDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module mindsporeModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "mindspore",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&mindsporeModule);
}
