/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
#include "napi/native_api.h"
#include "include/AvcencInfoCheckTest.h"
#include <cstdint>
#include "include/OhosCommonTest.h"
using namespace OHOS::CencInfoUT;

namespace {
    static constexpr int ARG_INDEX = 0;
    static constexpr int DEFAULT_ARG = -1;
    static constexpr int RESULT_ERROR = -1;
}

using AudioTestFn = int (*)();

static const AudioTestFn CENCINFO_CREATE_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_Create_001,
};

static const AudioTestFn CENCINFO_DESTROY_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_Destroy_001,
    OHOS::CencInfoUT::TestCencInfo_Destroy_002,
};

static const AudioTestFn CENCINFO_SETALGORITHM_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_SetAlgorithm_001,
    OHOS::CencInfoUT::TestCencInfo_SetAlgorithm_002,
};

static const AudioTestFn CENCINFO_SETKEYIDANDIV_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_001,
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_002,
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_003,
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_004,
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_005,
    OHOS::CencInfoUT::TestCencInfo_SetKeyIdAndIv_006,
};

static const AudioTestFn CENCINFO_SETSUBSAMPLEINFO_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_SetSubsampleInfo_001,
    OHOS::CencInfoUT::TestCencInfo_SetSubsampleInfo_002,
    OHOS::CencInfoUT::TestCencInfo_SetSubsampleInfo_003,
    OHOS::CencInfoUT::TestCencInfo_SetSubsampleInfo_004,
};

static const AudioTestFn CENCINFO_SETMODE_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_SetMode_001,
    OHOS::CencInfoUT::TestCencInfo_SetMode_002,
};

static const AudioTestFn CENCINFO_SETAVBUFFER_FUNCS[] = {
    OHOS::CencInfoUT::TestCencInfo_SetAVBuffer_001,
    OHOS::CencInfoUT::TestCencInfo_SetAVBuffer_002,
    OHOS::CencInfoUT::TestCencInfo_SetAVBuffer_003,
};

napi_value CencInfo_Creater(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_CREATE_FUNCS) / sizeof(CENCINFO_CREATE_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_CREATE_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_Destroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_DESTROY_FUNCS) / sizeof(CENCINFO_DESTROY_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_DESTROY_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_SetAlgorithm(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETALGORITHM_FUNCS) / sizeof(CENCINFO_SETALGORITHM_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_SETALGORITHM_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_SetKeyIdAndIv(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETKEYIDANDIV_FUNCS) / sizeof(CENCINFO_SETKEYIDANDIV_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_SETKEYIDANDIV_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_SetSubsampleInfo(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT =
            sizeof(CENCINFO_SETSUBSAMPLEINFO_FUNCS) / sizeof(CENCINFO_SETSUBSAMPLEINFO_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_SETSUBSAMPLEINFO_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_SetMode(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETMODE_FUNCS) / sizeof(CENCINFO_SETMODE_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_SETMODE_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value CencInfo_SetAVBuffer(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETAVBUFFER_FUNCS) / sizeof(CENCINFO_SETAVBUFFER_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = CENCINFO_SETAVBUFFER_FUNCS[caseNum]();
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}
EXTERN_C_START

napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"cencInfoCreate", nullptr, CencInfo_Creater, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoDestroy", nullptr, CencInfo_Destroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoSetAlgorithm", nullptr, CencInfo_SetAlgorithm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoSetKeyIdAndIv", nullptr, CencInfo_SetKeyIdAndIv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoSetSubsampleInfo", nullptr, CencInfo_SetSubsampleInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoSetMode", nullptr, CencInfo_SetMode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cencInfoSetAVBuffer", nullptr, CencInfo_SetAVBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_define_properties(env, exports,
                           sizeof(desc) / sizeof(desc[0]), desc);

    return exports;
}
EXTERN_C_END

static napi_module g_cencinfotestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "cencinfotest",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterCencinfotestModule(void)
{
    napi_module_register(&g_cencinfotestModule);
}