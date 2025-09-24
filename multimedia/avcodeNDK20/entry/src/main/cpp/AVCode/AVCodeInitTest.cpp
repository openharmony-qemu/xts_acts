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


#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>

namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}
EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumOHAudioChannelLayout1", EnumOHAudioChannelLayout1));
    desc.push_back(XL("EnumOHAudioChannelLayout2", EnumOHAudioChannelLayout2));
    desc.push_back(XL("EnumOHAudioChannelLayout3", EnumOHAudioChannelLayout3));
    desc.push_back(XL("EnumOHAudioChannelLayout4", EnumOHAudioChannelLayout4));
    desc.push_back(XL("EnumOHAudioChannelLayout5", EnumOHAudioChannelLayout5));
    desc.push_back(XL("EnumOHAudioChannelLayout6", EnumOHAudioChannelLayout6));
    desc.push_back(XL("EnumOHAudioChannelLayout7", EnumOHAudioChannelLayout7));
    desc.push_back(XL("EnumOHAudioChannelLayout8", EnumOHAudioChannelLayout8));
    desc.push_back(XL("EnumOHAudioChannelLayout9", EnumOHAudioChannelLayout9));
    desc.push_back(XL("EnumOHAudioChannelLayout10", EnumOHAudioChannelLayout10));
    desc.push_back(XL("EnumOHAudioChannelLayout11", EnumOHAudioChannelLayout11));
    desc.push_back(XL("EnumOHAudioChannelLayout12", EnumOHAudioChannelLayout12));
    desc.push_back(XL("EnumOHAudioChannelLayout13", EnumOHAudioChannelLayout13));
    desc.push_back(XL("EnumOHAudioChannelLayout14", EnumOHAudioChannelLayout14));
    desc.push_back(XL("EnumOHAudioChannelLayout15", EnumOHAudioChannelLayout15));
    desc.push_back(XL("EnumOHAudioChannelLayout16", EnumOHAudioChannelLayout16));
    desc.push_back(XL("EnumOHAudioChannelLayout17", EnumOHAudioChannelLayout17));
    desc.push_back(XL("EnumOHAudioChannelLayout18", EnumOHAudioChannelLayout18));
    desc.push_back(XL("EnumOHAudioChannelLayout19", EnumOHAudioChannelLayout19));
    desc.push_back(XL("EnumOHAudioChannelLayout20", EnumOHAudioChannelLayout20));
    desc.push_back(XL("EnumOHAudioChannelLayout21", EnumOHAudioChannelLayout21));
    desc.push_back(XL("EnumOHAudioChannelLayout22", EnumOHAudioChannelLayout22));
    desc.push_back(XL("EnumOHAudioChannelLayout23", EnumOHAudioChannelLayout23));
    desc.push_back(XL("EnumOHAudioChannelLayout24", EnumOHAudioChannelLayout24));
    desc.push_back(XL("EnumOHAudioChannelLayout25", EnumOHAudioChannelLayout25));
    desc.push_back(XL("EnumOHAudioChannelLayout26", EnumOHAudioChannelLayout26));
    desc.push_back(XL("EnumOHAudioChannelLayout27", EnumOHAudioChannelLayout27));
    desc.push_back(XL("EnumOHAudioChannelLayout28", EnumOHAudioChannelLayout28));
    desc.push_back(XL("EnumOHAudioChannelLayout29", EnumOHAudioChannelLayout29));
    desc.push_back(XL("EnumOHAudioChannelLayout30", EnumOHAudioChannelLayout30));
    desc.push_back(XL("EnumOHAudioChannelLayout31", EnumOHAudioChannelLayout31));
    desc.push_back(XL("EnumOHAudioChannelLayout32", EnumOHAudioChannelLayout32));
    desc.push_back(XL("EnumOHAudioChannelLayout33", EnumOHAudioChannelLayout33));
    desc.push_back(XL("EnumOHAudioChannelLayout34", EnumOHAudioChannelLayout34));
    desc.push_back(XL("EnumOHAudioChannelLayout35", EnumOHAudioChannelLayout35));
    desc.push_back(XL("EnumOHAudioChannelLayout36", EnumOHAudioChannelLayout36));
    desc.push_back(XL("EnumOHAudioChannelLayout37", EnumOHAudioChannelLayout37));
    desc.push_back(XL("EnumOHAudioChannelLayout38", EnumOHAudioChannelLayout38));
    desc.push_back(XL("EnumOHAudioChannelLayout39", EnumOHAudioChannelLayout39));
    desc.push_back(XL("EnumOHAudioChannelLayout40", EnumOHAudioChannelLayout40));
    desc.push_back(XL("EnumOHAudioChannelLayout41", EnumOHAudioChannelLayout41));
    desc.push_back(XL("EnumOHAudioChannelLayout42", EnumOHAudioChannelLayout42));
    desc.push_back(XL("EnumOHAudioChannelLayout43", EnumOHAudioChannelLayout43));
    desc.push_back(XL("EnumOHAudioChannelLayout44", EnumOHAudioChannelLayout44));
    desc.push_back(XL("EnumOHAudioChannelLayout45", EnumOHAudioChannelLayout45));
    desc.push_back(XL("EnumOHAudioChannelLayout46", EnumOHAudioChannelLayout46));
    desc.push_back(XL("EnumOHAudioChannelLayout47", EnumOHAudioChannelLayout47));
    desc.push_back(XL("EnumOHAudioChannelLayout48", EnumOHAudioChannelLayout48));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumOHAudioChannelSet1", EnumOHAudioChannelSet1));
    desc.push_back(XL("EnumOHAudioChannelSet2", EnumOHAudioChannelSet2));
    desc.push_back(XL("EnumOHAudioChannelSet3", EnumOHAudioChannelSet3));
    desc.push_back(XL("EnumOHAudioChannelSet4", EnumOHAudioChannelSet4));
    desc.push_back(XL("EnumOHAudioChannelSet5", EnumOHAudioChannelSet5));
    desc.push_back(XL("EnumOHAudioChannelSet6", EnumOHAudioChannelSet6));
    desc.push_back(XL("EnumOHAudioChannelSet7", EnumOHAudioChannelSet7));
    desc.push_back(XL("EnumOHAudioChannelSet8", EnumOHAudioChannelSet8));
    desc.push_back(XL("EnumOHAudioChannelSet9", EnumOHAudioChannelSet9));
    desc.push_back(XL("EnumOHAudioChannelSet10", EnumOHAudioChannelSet10));
    desc.push_back(XL("EnumOHAudioChannelSet11", EnumOHAudioChannelSet11));
    desc.push_back(XL("EnumOHAudioChannelSet12", EnumOHAudioChannelSet12));
    desc.push_back(XL("EnumOHAudioChannelSet13", EnumOHAudioChannelSet13));
    desc.push_back(XL("EnumOHAudioChannelSet14", EnumOHAudioChannelSet14));
    desc.push_back(XL("EnumOHAudioChannelSet15", EnumOHAudioChannelSet15));
    desc.push_back(XL("EnumOHAudioChannelSet16", EnumOHAudioChannelSet16));
    desc.push_back(XL("EnumOHAudioChannelSet17", EnumOHAudioChannelSet17));
    desc.push_back(XL("EnumOHAudioChannelSet18", EnumOHAudioChannelSet18));
    desc.push_back(XL("EnumOHAudioChannelSet19", EnumOHAudioChannelSet19));
    desc.push_back(XL("EnumOHAudioChannelSet20", EnumOHAudioChannelSet20));
    desc.push_back(XL("EnumOHAudioChannelSet21", EnumOHAudioChannelSet21));
    desc.push_back(XL("EnumOHAudioChannelSet22", EnumOHAudioChannelSet22));
    desc.push_back(XL("EnumOHAudioChannelSet23", EnumOHAudioChannelSet23));
    desc.push_back(XL("EnumOHAudioChannelSet24", EnumOHAudioChannelSet24));
    desc.push_back(XL("EnumOHAudioChannelSet25", EnumOHAudioChannelSet25));
    desc.push_back(XL("EnumOHAudioChannelSet26", EnumOHAudioChannelSet26));
    desc.push_back(XL("EnumOHAudioChannelSet27", EnumOHAudioChannelSet27));
    desc.push_back(XL("EnumOHAudioChannelSet28", EnumOHAudioChannelSet28));
    desc.push_back(XL("EnumOHAudioChannelSet29", EnumOHAudioChannelSet29));
    desc.push_back(XL("EnumOHAudioChannelSet30", EnumOHAudioChannelSet30));
    desc.push_back(XL("EnumAmbAttributeSet1", EnumAmbAttributeSet1));
    desc.push_back(XL("EnumAmbAttributeSet2", EnumAmbAttributeSet2));
    desc.push_back(XL("EnumAmbAttributeSet3", EnumAmbAttributeSet3));
    desc.push_back(XL("EnumAmbAttributeSet4", EnumAmbAttributeSet4));
    desc.push_back(XL("EnumAmbAttributeSet5", EnumAmbAttributeSet5));
    desc.push_back(XL("EnumAmbAttributeSet6", EnumAmbAttributeSet6));
    desc.push_back(XL("EnumAmbAttributeSet7", EnumAmbAttributeSet7));
    desc.push_back(XL("EnumAmbAttributeSet8", EnumAmbAttributeSet8));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumAudioChannelSet1", EnumAudioChannelSet1));
    desc.push_back(XL("EnumAudioChannelSet2", EnumAudioChannelSet2));
    desc.push_back(XL("EnumAudioChannelSet3", EnumAudioChannelSet3));
    desc.push_back(XL("EnumAudioChannelSet4", EnumAudioChannelSet4));
    desc.push_back(XL("EnumAudioChannelSet5", EnumAudioChannelSet5));
    desc.push_back(XL("EnumAudioChannelSet6", EnumAudioChannelSet6));
    desc.push_back(XL("EnumAudioChannelSet7", EnumAudioChannelSet7));
    desc.push_back(XL("EnumAudioChannelSet8", EnumAudioChannelSet8));
    desc.push_back(XL("EnumAudioChannelSet9", EnumAudioChannelSet9));
    desc.push_back(XL("EnumAudioChannelSet10", EnumAudioChannelSet10));
    desc.push_back(XL("EnumAudioChannelSet11", EnumAudioChannelSet11));
    desc.push_back(XL("EnumAudioChannelSet12", EnumAudioChannelSet12));
    desc.push_back(XL("EnumAudioChannelSet13", EnumAudioChannelSet13));
    desc.push_back(XL("EnumAudioChannelSet14", EnumAudioChannelSet14));
    desc.push_back(XL("EnumAudioChannelSet15", EnumAudioChannelSet15));
    desc.push_back(XL("EnumAudioChannelSet16", EnumAudioChannelSet16));
    desc.push_back(XL("EnumAudioChannelSet17", EnumAudioChannelSet17));
    desc.push_back(XL("EnumAudioChannelSet18", EnumAudioChannelSet18));
    desc.push_back(XL("EnumAudioChannelSet19", EnumAudioChannelSet19));
    desc.push_back(XL("EnumAudioChannelSet20", EnumAudioChannelSet20));
    desc.push_back(XL("EnumAudioChannelSet21", EnumAudioChannelSet21));
    desc.push_back(XL("EnumAudioChannelSet22", EnumAudioChannelSet22));
    desc.push_back(XL("EnumAudioChannelSet23", EnumAudioChannelSet23));
    desc.push_back(XL("EnumAudioChannelSet24", EnumAudioChannelSet24));
    desc.push_back(XL("EnumAudioChannelSet25", EnumAudioChannelSet25));
    desc.push_back(XL("EnumAudioChannelSet26", EnumAudioChannelSet26));
    desc.push_back(XL("EnumAudioChannelSet27", EnumAudioChannelSet27));
    desc.push_back(XL("EnumAudioChannelSet28", EnumAudioChannelSet28));
    desc.push_back(XL("EnumAudioChannelSet29", EnumAudioChannelSet29));
    desc.push_back(XL("EnumAudioChannelSet30", EnumAudioChannelSet30));
    desc.push_back(XL("EnumAudioChannelLayout1", EnumAudioChannelLayout1));
    desc.push_back(XL("EnumAudioChannelLayout2", EnumAudioChannelLayout2));
    desc.push_back(XL("EnumAudioChannelLayout3", EnumAudioChannelLayout3));
    desc.push_back(XL("EnumAudioChannelLayout4", EnumAudioChannelLayout4));
    desc.push_back(XL("EnumAudioChannelLayout5", EnumAudioChannelLayout5));
    desc.push_back(XL("EnumAudioChannelLayout6", EnumAudioChannelLayout6));
    desc.push_back(XL("EnumAudioChannelLayout7", EnumAudioChannelLayout7));
    desc.push_back(XL("EnumAudioChannelLayout8", EnumAudioChannelLayout8));
    desc.push_back(XL("EnumAudioChannelLayout9", EnumAudioChannelLayout9));
    desc.push_back(XL("EnumAudioChannelLayout10", EnumAudioChannelLayout10));
    desc.push_back(XL("EnumAudioChannelLayout11", EnumAudioChannelLayout11));
    desc.push_back(XL("EnumAudioChannelLayout12", EnumAudioChannelLayout12));
    desc.push_back(XL("EnumAudioChannelLayout13", EnumAudioChannelLayout13));
    desc.push_back(XL("EnumAudioChannelLayout14", EnumAudioChannelLayout14));
    desc.push_back(XL("EnumAudioChannelLayout15", EnumAudioChannelLayout15));
    desc.push_back(XL("EnumAudioChannelLayout16", EnumAudioChannelLayout16));
    desc.push_back(XL("EnumAudioChannelLayout17", EnumAudioChannelLayout17));
    desc.push_back(XL("EnumAudioChannelLayout18", EnumAudioChannelLayout18));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumAudioChannelLayout19", EnumAudioChannelLayout19));
    desc.push_back(XL("EnumAudioChannelLayout20", EnumAudioChannelLayout20));
    desc.push_back(XL("EnumAudioChannelLayout21", EnumAudioChannelLayout21));
    desc.push_back(XL("EnumAudioChannelLayout22", EnumAudioChannelLayout22));
    desc.push_back(XL("EnumAudioChannelLayout23", EnumAudioChannelLayout23));
    desc.push_back(XL("EnumAudioChannelLayout24", EnumAudioChannelLayout24));
    desc.push_back(XL("EnumAudioChannelLayout25", EnumAudioChannelLayout25));
    desc.push_back(XL("EnumAudioChannelLayout26", EnumAudioChannelLayout26));
    desc.push_back(XL("EnumAudioChannelLayout27", EnumAudioChannelLayout27));
    desc.push_back(XL("EnumAudioChannelLayout28", EnumAudioChannelLayout28));
    desc.push_back(XL("EnumAudioChannelLayout29", EnumAudioChannelLayout29));
    desc.push_back(XL("EnumAudioChannelLayout30", EnumAudioChannelLayout30));
    desc.push_back(XL("EnumAudioChannelLayout31", EnumAudioChannelLayout31));
    desc.push_back(XL("EnumAudioChannelLayout32", EnumAudioChannelLayout32));
    desc.push_back(XL("AVCodeAVBufferDestroyErrInvalidVal", AVCodeAVBufferDestroyErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferDestroyErrOperateNotPermit", AVCodeAVBufferDestroyErrOperateNotPermit));
    desc.push_back(XL("AVCodeAVBufferGetBufferAttrErrInvalidVal", AVCodeAVBufferGetBufferAttrErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferSetBufferAttrErrInvalidVal", AVCodeAVBufferSetBufferAttrErrInvalidVal));
    desc.push_back(XL("AVCodeAVBufferSetParameterErrInvalidVal", AVCodeAVBufferSetParameterErrInvalidVal));
    desc.push_back(
        XL("AVCodeOHAVCapabilityGetAudioSupportedSampleRates", AVCodeOHAVCapabilityGetAudioSupportedSampleRates));
    desc.push_back(XL("AVCodeOHAVCapabilityGetAudioChannelCountRange", AVCodeOHAVCapabilityGetAudioChannelCountRange));
    desc.push_back(XL("AVCodeOHAudioCodecDestroyAVErrInvalidState", AVCodeOHAudioCodecDestroyAVErrInvalidState));
    desc.push_back(XL("AVCodeOHAudioCodecRegisterCallback", AVCodeOHAudioCodecRegisterCallback));
    desc.push_back(XL("AVCodeOHAudioCodecPrepareInvalidState", AVCodeOHAudioCodecPrepareInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderDestroySuccess", AVCodeOHAudioDecoderDestroySuccess));
    desc.push_back(XL("AVCodeOHAudioDecoderDestroyInvalidVal", AVCodeOHAudioDecoderDestroyInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderConfigureUnsupport", AVCodeOHAudioDecoderConfigureUnsupport));
    desc.push_back(XL("AVCodeOHAudioDecoderConfigureInvalidVal", AVCodeOHAudioDecoderConfigureInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPrepareUnsupport", AVCodeOHAudioDecoderPrepareUnsupport));
    desc.push_back(XL("AVCodeOHAudioDecoderPrepareInvalidVal", AVCodeOHAudioDecoderPrepareInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderStartInvalidState", AVCodeOHAudioDecoderStartInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderStartInvalidVal", AVCodeOHAudioDecoderStartInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderStopInvalidState", AVCodeOHAudioDecoderStopInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderStopInvalidVal", AVCodeOHAudioDecoderStopInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderFlushInvalidVal", AVCodeOHAudioDecoderFlushInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderFlushInvalidState", AVCodeOHAudioDecoderFlushInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderResetInvalidVal", AVCodeOHAudioDecoderResetInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderSetParameterInvalidVal", AVCodeOHAudioDecoderSetParameterInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPushInputDataInvalidVal", AVCodeOHAudioDecoderPushInputDataInvalidVal));
    desc.push_back(XL("AVCodeOHAudioDecoderPushInputDataInvalidState", AVCodeOHAudioDecoderPushInputDataInvalidState));
    desc.push_back(
        XL("AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal", AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioDecoderPushFreeOutputDataInvalidState", AVCodeOHAudioDecoderPushFreeOutputDataInvalidState));
    desc.push_back(XL("AVCodeOHAudioDecoderIsValidInvalidVal", AVCodeOHAudioDecoderIsValidInvalidVal));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVCodeOHAudioEncoderDestroySuccess", AVCodeOHAudioEncoderDestroySuccess));
    desc.push_back(XL("AVCodeOHAudioEncoderDestroyInvalidVal", AVCodeOHAudioEncoderDestroyInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderConfigureUnsupport", AVCodeOHAudioEncoderConfigureUnsupport));
    desc.push_back(XL("AVCodeOHAudioEncoderConfigureInvalidVal", AVCodeOHAudioEncoderConfigureInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPrepareUnsupport", AVCodeOHAudioEncoderPrepareUnsupport));
    desc.push_back(XL("AVCodeOHAudioEncoderPrepareInvalidVal", AVCodeOHAudioEncoderPrepareInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderStartInvalidState", AVCodeOHAudioEncoderStartInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderStartInvalidVal", AVCodeOHAudioEncoderStartInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderStopInvalidState", AVCodeOHAudioEncoderStopInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderStopInvalidVal", AVCodeOHAudioEncoderStopInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderFlushInvalidVal", AVCodeOHAudioEncoderFlushInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderFlushInvalidState", AVCodeOHAudioEncoderFlushInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderResetInvalidVal", AVCodeOHAudioEncoderResetInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderSetParameterInvalidVal", AVCodeOHAudioEncoderSetParameterInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPushInputDataInvalidVal", AVCodeOHAudioEncoderPushInputDataInvalidVal));
    desc.push_back(XL("AVCodeOHAudioEncoderPushInputDataInvalidState", AVCodeOHAudioEncoderPushInputDataInvalidState));
    desc.push_back(
        XL("AVCodeOHAudioEncoderPushFreeOutputDataInvalidVal", AVCodeOHAudioEncoderPushFreeOutputDataInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioEncoderPushFreeOutputDataInvalidState", AVCodeOHAudioEncoderPushFreeOutputDataInvalidState));
    desc.push_back(XL("AVCodeOHAudioEncoderIsValidInvalidVal", AVCodeOHAudioEncoderIsValidInvalidVal));
    desc.push_back(XL("AVCodeOHAudioCodecSetParameterInvalidVal", AVCodeOHAudioCodecSetParameterInvalidVal));
    desc.push_back(
        XL("AVCodeOHAudioCodecSetParameterOperateNotPermit", AVCodeOHAudioCodecSetParameterOperateNotPermit));
    desc.push_back(
        XL("AVCodeOHAudioCodecSetParameterOperateInvalidState", AVCodeOHAudioCodecSetParameterOperateInvalidState));
    desc.push_back(XL("AVCodeOHAudioCodecSetParameterOperateUnknown", AVCodeOHAudioCodecSetParameterOperateUnknown));
    desc.push_back(XL("AVCodeOHAudioCodecPushInputBufferInvalidVal", AVCodeOHAudioCodecPushInputBufferInvalidVal));
    desc.push_back(XL("EnumAACPROFILEHE", EnumAACPROFILEHE));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("EnumMPEGProfile1", EnumMPEGProfile1));
    desc.push_back(XL("EnumMPEGProfile2", EnumMPEGProfile2));
    desc.push_back(XL("EnumMPEGProfile3", EnumMPEGProfile3));
    desc.push_back(XL("EnumMPEGProfile4", EnumMPEGProfile4));
    desc.push_back(XL("EnumMPEGProfile5", EnumMPEGProfile5));
    desc.push_back(XL("EnumMPEGProfile6", EnumMPEGProfile6));
    desc.push_back(XL("EnumMPEGProfile7", EnumMPEGProfile7));
    desc.push_back(XL("EnumMPEGProfile8", EnumMPEGProfile8));
    desc.push_back(XL("EnumMPEGProfile9", EnumMPEGProfile9));
    desc.push_back(XL("EnumMPEGProfile10", EnumMPEGProfile10));
    desc.push_back(XL("EnumMPEGProfile11", EnumMPEGProfile11));
    desc.push_back(XL("EnumMPEGProfile12", EnumMPEGProfile12));
    desc.push_back(XL("EnumMPEGProfile13", EnumMPEGProfile13));
    desc.push_back(XL("EnumMPEGProfile14", EnumMPEGProfile14));
    desc.push_back(XL("EnumMPEGProfile15", EnumMPEGProfile15));
    desc.push_back(XL("EnumMPEGProfile16", EnumMPEGProfile16));
    desc.push_back(XL("EnumMPEGProfile17", EnumMPEGProfile17));
    desc.push_back(XL("EnumMPEGProfile18", EnumMPEGProfile18));
    desc.push_back(XL("EnumMPEGProfile19", EnumMPEGProfile19));
    desc.push_back(XL("EnumMPEGProfile20", EnumMPEGProfile20));
    desc.push_back(XL("EnumMPEGProfile21", EnumMPEGProfile21));
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
