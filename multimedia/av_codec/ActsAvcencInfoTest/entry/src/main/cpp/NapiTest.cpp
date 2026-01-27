/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
#include <exception>
#include "napi/native_api.h"
#include "AvcencInfoCheckTest.h"
#include <cstdint>
#include <multimedia/player_framework/native_cencinfo.h>
using namespace OHOS::CencInfoUT;

namespace {
    static constexpr int ARG_INDEX = 0;
    static constexpr int DEFAULT_ARG = -1;
    static constexpr int RESULT_ERROR = -1;
}


template <typename Func>
napi_value NapiTry(napi_env env, Func &&func);
using CencTestFunc = int (OHOS::CencInfoUT::CencInfoCapiTestCase::*)();

int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[index + 1];

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }

    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }

    return result;
}

inline int32_t GetInt32Arg(napi_env env, napi_callback_info info,
                           size_t index, int32_t defaultValue)
{
    return GetInt32ArgImpl(env, info, index, defaultValue);
}

template <typename Func>
napi_value NapiTry(napi_env env, Func &&func)
{
    try {
        return func();
    }
    catch(const std::exception &e) {
        napi_throw_error(env, nullptr, e.what());
    }
    catch(...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}
static const CencTestFunc CENCINFO_CREATE_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_Create_001,
};

static const CencTestFunc CENCINFO_DESTROY_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_Destroy_001,
    &CencInfoCapiTestCase::TestCencInfo_Destroy_002,
};

static const CencTestFunc CENCINFO_SETALGORITHM_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_SetAlgorithm_001,
    &CencInfoCapiTestCase::TestCencInfo_SetAlgorithm_002,
};

static const CencTestFunc CENCINFO_SETKEYIDANDIV_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_001,
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_002,
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_003,
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_004,
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_005,
    &CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_006,
};

static const CencTestFunc CENCINFO_SETSUBSAMPLEINFO_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_001,
    &CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_002,
    &CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_003,
    &CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_004,
};

static const CencTestFunc CENCINFO_SETMODE_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_SetMode_001,
    &CencInfoCapiTestCase::TestCencInfo_SetMode_002,
};

static const CencTestFunc CENCINFO_SETAVBUFFER_FUNCS[] = {
    &CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_001,
    &CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_002,
    &CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_003,
};

napi_value CencInfo_Create(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = RESULT_ERROR;
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_CREATE_FUNCS) / sizeof(CENCINFO_CREATE_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_CREATE_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_DESTROY_FUNCS) / sizeof(CENCINFO_DESTROY_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_DESTROY_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETALGORITHM_FUNCS) / sizeof(CENCINFO_SETALGORITHM_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_SETALGORITHM_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETKEYIDANDIV_FUNCS) / sizeof(CENCINFO_SETKEYIDANDIV_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_SETKEYIDANDIV_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT =
            sizeof(CENCINFO_SETSUBSAMPLEINFO_FUNCS) / sizeof(CENCINFO_SETSUBSAMPLEINFO_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_SETSUBSAMPLEINFO_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETMODE_FUNCS) / sizeof(CENCINFO_SETMODE_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_SETMODE_FUNCS[caseNum])();
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
        CencInfoCapiTestCase testObj;
        constexpr size_t FUNC_COUNT = sizeof(CENCINFO_SETAVBUFFER_FUNCS) / sizeof(CENCINFO_SETAVBUFFER_FUNCS[0]);
        if (caseNum >= 0 && static_cast<size_t>(caseNum) < FUNC_COUNT) {
            result = (testObj.*CENCINFO_SETAVBUFFER_FUNCS[caseNum])();
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