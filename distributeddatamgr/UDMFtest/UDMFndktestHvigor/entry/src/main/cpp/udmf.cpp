333333333333333333333333333333333333333333333333#include "hilog/log.h"
#include "napi/native_api.h"
#include <unistd.h>
#include "database/udmf/udmf.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include "database/udmf/udmf_err_code.h"
#include "database/udmf/udmf_meta.h"
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <iostream>
#include "common.h"
#include <string>
#include <iostream>
#include <string>

#define PARAM_0 0
#define PARAM_1 1

static napi_value OH_UdmfData_Udmf_ListenerStatus_0001(napi_env env, napi_callback_info info)
{
    int result = 0;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_FINISHED, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0002(napi_env env, napi_callback_info info)
{
    int result = 1;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_PROCESSING, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0003(napi_env env, napi_callback_info info)
{
    int result = 2;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_CANCELED, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0004(napi_env env, napi_callback_info info)
{
    int result = 200;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_INNER_ERROR, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0005(napi_env env, napi_callback_info info)
{
    int result = 201;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_INVALID_PARAMETERS, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0006(napi_env env, napi_callback_info info)
{
    int result = 202;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_DATA_NOT_FOUND, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0007(napi_env env, napi_callback_info info)
{
    int result = 203;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_SYNC_FAILED, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_Udmf_ListenerStatus_0008(napi_env env, napi_callback_info info)
{
    int result = 204;
    napi_value returnCode;
    napi_create_int32(env, result == UDMF_COPY_FILE_FAILED, &returnCode);
    return returnCode;
}

static napi_value OH_UdmfData_AddRecord_001(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    int status = OH_UdmfData_AddRecord(unifiedData, record);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_OK, &result);
    OH_UdmfRecord_Destroy(record);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_UdmfData_AddRecord_002(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = nullptr;
    OH_UdmfData *unifiedData = OH_UdmfData_Create();
    int status = OH_UdmfData_AddRecord(unifiedData, record);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    OH_UdmfData_Destroy(unifiedData);
    return result;
}

static napi_value OH_UdmfData_AddRecord_003(napi_env env, napi_callback_info info)
{
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdmfData *unifiedData = nullptr;
    int status = OH_UdmfData_AddRecord(unifiedData, record);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    OH_UdmfRecord_Destroy(record);
    return result;
}

static napi_value OH_UdmfData_UdmfProgressInfo_GetStatus_001(napi_env env, napi_callback_info info)
{
    OH_Udmf_ProgressInfo *progressInfo = nullptr;
    int status = OH_UdmfProgressInfo_GetStatus(progressInfo);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdmfData_UdmfProgressInfo_GetProgress_001(napi_env env, napi_callback_info info)
{
    OH_Udmf_ProgressInfo *progressInfo = nullptr;
    int status = OH_UdmfProgressInfo_GetProgress(progressInfo);
    napi_value result;
    napi_create_int32(env, status == UDMF_E_INVALID_PARAM, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_UdmfData_Udmf_ListenerStatus_0001", nullptr, OH_UdmfData_Udmf_ListenerStatus_0001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0002", nullptr, OH_UdmfData_Udmf_ListenerStatus_0002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0003", nullptr, OH_UdmfData_Udmf_ListenerStatus_0002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0004", nullptr, OH_UdmfData_Udmf_ListenerStatus_0004, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0005", nullptr, OH_UdmfData_Udmf_ListenerStatus_0005, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0006", nullptr, OH_UdmfData_Udmf_ListenerStatus_0006, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0007", nullptr, OH_UdmfData_Udmf_ListenerStatus_0007, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_Udmf_ListenerStatus_0008", nullptr, OH_UdmfData_Udmf_ListenerStatus_0008, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_AddRecord_001", nullptr, OH_UdmfData_AddRecord_001, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_AddRecord_002", nullptr, OH_UdmfData_AddRecord_002, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_AddRecord_003", nullptr, OH_UdmfData_AddRecord_003, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_UdmfData_UdmfProgressInfo_GetStatus_001", nullptr, OH_UdmfData_UdmfProgressInfo_GetStatus_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdmfData_UdmfProgressInfo_GetProgress_001", nullptr, OH_UdmfData_UdmfProgressInfo_GetProgress_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "listenerStatus",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}