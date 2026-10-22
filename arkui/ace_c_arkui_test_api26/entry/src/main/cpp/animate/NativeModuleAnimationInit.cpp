/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "animate/native_anim_exports.h"
#include <napi/native_api.h>

namespace ArkUICapiTest {


static void RegisterAnimProps00(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimEnum001", nullptr, NativeAnimEnum001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropCreate002", nullptr, NativeAnimPropCreate002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroy003", nullptr,
            NativeAnimPropDestroy003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFrom004", nullptr,
            NativeAnimPropSetFrom004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFrom005", nullptr,
            NativeAnimPropGetFrom005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTo006", nullptr, NativeAnimPropSetTo006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTo007", nullptr, NativeAnimPropGetTo007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDur008", nullptr, NativeAnimPropSetDur008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDur009", nullptr, NativeAnimPropGetDur009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelay010", nullptr,
            NativeAnimPropSetDelay010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelay011", nullptr,
            NativeAnimPropGetDelay011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurve012", nullptr,
            NativeAnimPropSetCurve012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetCurve013", nullptr,
            NativeAnimPropGetCurve013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempo014", nullptr,
            NativeAnimPropSetTempo014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempo015", nullptr,
            NativeAnimPropGetTempo015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRev016", nullptr,
            NativeAnimPropSetAutoRev016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRev017", nullptr,
            NativeAnimPropGetAutoRev017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIter018", nullptr,
            NativeAnimPropSetIter018, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps01(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetIter019", nullptr,
            NativeAnimPropGetIter019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTarget020", nullptr,
            NativeAnimPropSetTarget020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTarget021", nullptr,
            NativeAnimPropGetTarget021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropDestroyNull022", nullptr,
            NativeAnimPropDestroyNull022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullAnim023", nullptr,
            NativeAnimPropSetFromNullAnim023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetFromNullVal024", nullptr,
            NativeAnimPropSetFromNullVal024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullAnim025", nullptr,
            NativeAnimPropGetFromNullAnim025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetFromNullOut026", nullptr,
            NativeAnimPropGetFromNullOut026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullAnim027", nullptr,
            NativeAnimPropSetToNullAnim027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetToNullVal028", nullptr,
            NativeAnimPropSetToNullVal028, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullAnim029", nullptr,
            NativeAnimPropGetToNullAnim029, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetToNullOut030", nullptr,
            NativeAnimPropGetToNullOut030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurNull031", nullptr,
            NativeAnimPropSetDurNull031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDurInvalid032", nullptr,
            NativeAnimPropSetDurInvalid032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDurNull033", nullptr,
            NativeAnimPropGetDurNull033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetDelayNull034", nullptr,
            NativeAnimPropSetDelayNull034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetDelayNull035", nullptr,
            NativeAnimPropGetDelayNull035, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetCurveNull036", nullptr,
            NativeAnimPropSetCurveNull036, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps02(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPropGetCurveNull037", nullptr,
            NativeAnimPropGetCurveNull037, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTempoNull038", nullptr,
            NativeAnimPropSetTempoNull038, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTempoNull039", nullptr,
            NativeAnimPropGetTempoNull039, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetAutoRevNull040", nullptr,
            NativeAnimPropSetAutoRevNull040, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetAutoRevNull041", nullptr,
            NativeAnimPropGetAutoRevNull041, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetIterNull042", nullptr,
            NativeAnimPropSetIterNull042, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetIterNull043", nullptr,
            NativeAnimPropGetIterNull043, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropSetTargetNull044", nullptr,
            NativeAnimPropSetTargetNull044, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropGetTargetNull045", nullptr,
            NativeAnimPropGetTargetNull045, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreate046", nullptr, NativeAnimKeyCreate046, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroy047", nullptr, NativeAnimKeyDestroy047, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimes048", nullptr,
            NativeAnimKeySetKeyTimes048, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTime049", nullptr,
            NativeAnimKeyGetKeyTime049, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTime050", nullptr,
            NativeAnimKeySetKeyTime050, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValue051", nullptr,
            NativeAnimKeySetValue051, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValues052", nullptr,
            NativeAnimKeySetValues052, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetValue053", nullptr,
            NativeAnimKeyGetValue053, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurves054", nullptr,
            NativeAnimKeySetCurves054, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps03(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetCurve055", nullptr,
            NativeAnimKeySetCurve055, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetCurve056", nullptr,
            NativeAnimKeyGetCurve056, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDur057", nullptr, NativeAnimKeySetDur057, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDur058", nullptr, NativeAnimKeyGetDur058, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetDelay059", nullptr,
            NativeAnimKeySetDelay059, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetDelay060", nullptr,
            NativeAnimKeyGetDelay060, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTempo061", nullptr,
            NativeAnimKeySetTempo061, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTempo062", nullptr,
            NativeAnimKeyGetTempo062, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetAutoRev063", nullptr,
            NativeAnimKeySetAutoRev063, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetAutoRev064", nullptr,
            NativeAnimKeyGetAutoRev064, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetIter065", nullptr, NativeAnimKeySetIter065, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetIter066", nullptr, NativeAnimKeyGetIter066, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetTarget067", nullptr,
            NativeAnimKeySetTarget067, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetTarget068", nullptr,
            NativeAnimKeyGetTarget068, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyCreateInvalid069", nullptr,
            NativeAnimKeyCreateInvalid069, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyDestroyNull070", nullptr,
            NativeAnimKeyDestroyNull070, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetKeyTimesNull071", nullptr,
            NativeAnimKeySetKeyTimesNull071, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetKeyTimeNull072", nullptr,
            NativeAnimKeyGetKeyTimeNull072, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps04(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimKeySetKeyTimeNull073", nullptr,
            NativeAnimKeySetKeyTimeNull073, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValueNull074", nullptr,
            NativeAnimKeySetValueNull074, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetValuesNull075", nullptr,
            NativeAnimKeySetValuesNull075, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetValueNull076", nullptr,
            NativeAnimKeyGetValueNull076, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurvesNull077", nullptr,
            NativeAnimKeySetCurvesNull077, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeySetCurveNull078", nullptr,
            NativeAnimKeySetCurveNull078, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyGetCurveNull079", nullptr,
            NativeAnimKeyGetCurveNull079, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyTimingNull080", nullptr,
            NativeAnimKeyTimingNull080, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimKeyTargetNull081", nullptr,
            NativeAnimKeyTargetNull081, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathCreate082", nullptr, NativeAnimPathCreate082, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDestroy083", nullptr,
            NativeAnimPathDestroy083, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDur084", nullptr, NativeAnimPathSetDur084, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDur085", nullptr, NativeAnimPathGetDur085, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDelay086", nullptr,
            NativeAnimPathSetDelay086, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDelay087", nullptr,
            NativeAnimPathGetDelay087, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetTempo090", nullptr,
            NativeAnimPathSetTempo090, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps05(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPathGetTempo091", nullptr,
            NativeAnimPathGetTempo091, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetAutoRev092", nullptr,
            NativeAnimPathSetAutoRev092, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetAutoRev093", nullptr,
            NativeAnimPathGetAutoRev093, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetIter094", nullptr,
            NativeAnimPathSetIter094, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetIter095", nullptr,
            NativeAnimPathGetIter095, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetAutoRot096", nullptr,
            NativeAnimPathSetAutoRot096, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetAutoRot097", nullptr,
            NativeAnimPathGetAutoRot097, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetTarget098", nullptr,
            NativeAnimPathSetTarget098, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetTarget099", nullptr,
            NativeAnimPathGetTarget099, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathCreateNull100", nullptr,
            NativeAnimPathCreateNull100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDestroyNull101", nullptr,
            NativeAnimPathDestroyNull101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathSetDurNull102", nullptr,
            NativeAnimPathSetDurNull102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathGetDurNull103", nullptr,
            NativeAnimPathGetDurNull103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathDelayNull104", nullptr,
            NativeAnimPathDelayNull104, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathTempoNull106", nullptr,
            NativeAnimPathTempoNull106, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathAutoRevNull107", nullptr,
            NativeAnimPathAutoRevNull107, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathIterNull108", nullptr,
            NativeAnimPathIterNull108, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps06(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimPathAutoRotNull109", nullptr,
            NativeAnimPathAutoRotNull109, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPathTargetNull110", nullptr,
            NativeAnimPathTargetNull110, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupCreate111", nullptr,
            NativeAnimGroupCreate111, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupDestroy112", nullptr,
            NativeAnimGroupDestroy112, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetDur113", nullptr,
            NativeAnimGroupSetDur113, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetDur114", nullptr,
            NativeAnimGroupGetDur114, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetDelay115", nullptr,
            NativeAnimGroupSetDelay115, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetDelay116", nullptr,
            NativeAnimGroupGetDelay116, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetCurve117", nullptr,
            NativeAnimGroupSetCurve117, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetCurve118", nullptr,
            NativeAnimGroupGetCurve118, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetTempo119", nullptr,
            NativeAnimGroupSetTempo119, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetTempo120", nullptr,
            NativeAnimGroupGetTempo120, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetAutoRev121", nullptr,
            NativeAnimGroupSetAutoRev121, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetAutoRev122", nullptr,
            NativeAnimGroupGetAutoRev122, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetIter123", nullptr,
            NativeAnimGroupSetIter123, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetIter124", nullptr,
            NativeAnimGroupGetIter124, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetFps125", nullptr,
            NativeAnimGroupSetFps125, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetFps126", nullptr,
            NativeAnimGroupGetFps126, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps07(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimGroupRegFinish127", nullptr,
            NativeAnimGroupRegFinish127, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupSetTarget128", nullptr,
            NativeAnimGroupSetTarget128, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupGetTarget129", nullptr,
            NativeAnimGroupGetTarget129, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddProp130", nullptr,
            NativeAnimGroupAddProp130, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddKey131", nullptr,
            NativeAnimGroupAddKey131, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupAddPath132", nullptr,
            NativeAnimGroupAddPath132, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimAddGroup133", nullptr, NativeAnimAddGroup133, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimHasGroup134", nullptr, NativeAnimHasGroup134, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGetState135", nullptr, NativeAnimGetState135, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimRemoveGroup136", nullptr,
            NativeAnimRemoveGroup136, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPauseGroup137", nullptr, NativeAnimPauseGroup137, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimResumeGroup138", nullptr,
            NativeAnimResumeGroup138, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimFinishGroup139", nullptr,
            NativeAnimFinishGroup139, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupDestroyNull140", nullptr,
            NativeAnimGroupDestroyNull140, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupTimingNull141", nullptr,
            NativeAnimGroupTimingNull141, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupCurveNull142", nullptr,
            NativeAnimGroupCurveNull142, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupFpsNull143", nullptr,
            NativeAnimGroupFpsNull143, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupRegNull144", nullptr,
            NativeAnimGroupRegNull144, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimProps08(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimGroupAddNull145", nullptr,
            NativeAnimGroupAddNull145, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimGroupTargetNull146", nullptr,
            NativeAnimGroupTargetNull146, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimCtxNull147", nullptr, NativeAnimCtxNull147, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimCtrlNull148", nullptr, NativeAnimCtrlNull148, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimPropTrans149", nullptr, NativeAnimPropTrans149, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimFinishModes150", nullptr,
            NativeAnimFinishModes150, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterAnimApi2601(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeAnimApi2601ErrSameCtx001", nullptr,
            NativeAnimApi2601ErrSameCtx001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601Transform3D002", nullptr,
            NativeAnimApi2601Transform3D002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601TransX003", nullptr,
            NativeAnimApi2601TransX003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601TransY004", nullptr,
            NativeAnimApi2601TransY004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601TransZ005", nullptr,
            NativeAnimApi2601TransZ005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601Scale006", nullptr,
            NativeAnimApi2601Scale006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601ScaleX007", nullptr,
            NativeAnimApi2601ScaleX007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601ScaleY008", nullptr,
            NativeAnimApi2601ScaleY008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601Rot009", nullptr,
            NativeAnimApi2601Rot009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601RotX010", nullptr,
            NativeAnimApi2601RotX010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601RotY011", nullptr,
            NativeAnimApi2601RotY011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601RotZ012", nullptr,
            NativeAnimApi2601RotZ012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601Bounds013", nullptr,
            NativeAnimApi2601Bounds013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601BoundsX014", nullptr,
            NativeAnimApi2601BoundsX014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601BoundsY015", nullptr,
            NativeAnimApi2601BoundsY015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601BoundsW016", nullptr,
            NativeAnimApi2601BoundsW016, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NativeAnimApi2601BoundsH017", nullptr,
            NativeAnimApi2601BoundsH017, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    RegisterAnimProps00(env, exports);
    RegisterAnimProps01(env, exports);
    RegisterAnimProps02(env, exports);
    RegisterAnimProps03(env, exports);
    RegisterAnimProps04(env, exports);
    RegisterAnimProps05(env, exports);
    RegisterAnimProps06(env, exports);
    RegisterAnimProps07(env, exports);
    RegisterAnimProps08(env, exports);
    RegisterAnimApi2601(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativeanimModule = {.nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeanim",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterNativeAnimModule(void)
{
    napi_module_register(&nativeanimModule);
}

} // namespace ArkUICapiTest
