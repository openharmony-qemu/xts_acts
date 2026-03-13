/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/ActsCodecFormatNdkTest.h"
#include <cstdlib>
#include <iostream>
#include <map>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <string>
#include "include/SecurecTest.h"

using namespace std;

static bool CheckDecDesc(map<string, std::pair<bool, int>> inDesc, OH_AVFormat* outDesc)
{
    for (const auto& t : inDesc) {
        int32_t out_int32 = 0;
        int64_t out_int64 = 0;
        bool res = true;
        if (t.second.first) {
            res = OH_AVFormat_GetLongValue(outDesc, t.first.c_str(), &out_int64);
            out_int32 = out_int64;
        } else {
            res = OH_AVFormat_GetIntValue(outDesc, t.first.c_str(), &out_int32);
        }
        if (!res) {
            return false;
        }
        if (out_int32 != t.second.second) {
            return false;
        }
    }
    return true;
}

static bool SetFormat(struct OH_AVFormat* format, map<string, std::pair<bool, int>> mediaDesc)
{
    const char* key;
    for (const auto& t : mediaDesc) {
        key = t.first.c_str();
        bool ret = true;
        if (t.second.first) {
            ret = OH_AVFormat_SetLongValue(format, key, static_cast<int64_t>(t.second.second));
        } else {
            ret = OH_AVFormat_SetIntValue(format, key, static_cast<int32_t>(t.second.second));
        }
        if (!ret) {
            return false;
        }
    }
    return true;
}

int SubMultimediaMediaCodecFormat0100()
{
    OH_AVFormat* codecFormatIn = OH_AVFormat_Create();
    if (codecFormatIn == nullptr) {
        return -1;
    }
    OH_AVFormat* codecFormatOut = OH_AVFormat_Create();
    if (codecFormatOut == nullptr) {
        OH_AVFormat_Destroy(codecFormatIn);
        return -1;
    }
    map<string, std::pair<bool, int>> CodecParam = {
        { OH_ED_KEY_TIME_STAMP, { true, 200 } },
        { OH_ED_KEY_EOS, { false, 1 } },
        { OH_MD_KEY_TRACK_TYPE, { false, 1 } },
        { OH_MD_KEY_DURATION, { true, 200 } },
        { OH_MD_KEY_BITRATE, { true, 48000 } },
        { OH_MD_KEY_MAX_INPUT_SIZE, { false, 2000 } },
        { OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, { false, 0 } },
        { OH_MD_KEY_PROFILE, { false, 1 } },
        { OH_MD_KEY_I_FRAME_INTERVAL, { false, 1 } },
        { OH_MD_KEY_ROTATION, { false, 90 } },
    };
    if (!SetFormat(codecFormatIn, CodecParam)) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    if (!CheckDecDesc(CodecParam, codecFormatOut)) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    if (OH_AVFormat_DumpInfo(codecFormatOut) == nullptr) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatOut = nullptr;
    return AV_ERR_OK;
}

int SubMultimediaMediaCodecFormat0200()
{
    const char* intKey = "int value key";
    const char* longKey = "long value key";
    const char* floatKey = "float value key";
    const char* doubleKey = "double value key";
    const char* stringKey = "string value key";
    const char* stringValue = "string_value";
    int32_t intValue = 1;
    int64_t longValue = 1;
    float floatValue = 1.0;
    double doubleValue = 1.0;

    OH_AVFormat* codecFormatIn = OH_AVFormat_Create();
    if (codecFormatIn == nullptr) {
        return -1;
    }
    OH_AVFormat* codecFormatOut = OH_AVFormat_Create();
    if (codecFormatOut == nullptr) {
        OH_AVFormat_Destroy(codecFormatIn);
        return -1;
    }
    OH_AVFormat_SetIntValue(codecFormatIn, intKey, intValue);
    OH_AVFormat_SetLongValue(codecFormatIn, longKey, longValue);
    OH_AVFormat_SetFloatValue(codecFormatIn, floatKey, floatValue);
    OH_AVFormat_SetDoubleValue(codecFormatIn, doubleKey, doubleValue);
    OH_AVFormat_SetStringValue(codecFormatIn, stringKey, stringValue);

    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    int32_t intValueOut = 0;
    OH_AVFormat_GetIntValue(codecFormatOut, intKey, &intValueOut);
    if (intValueOut != intValue) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    int64_t longValueOut = 0;
    OH_AVFormat_GetLongValue(codecFormatOut, longKey, &longValueOut);
    if (longValueOut != longValue) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    float floatValueOut = 0.0f;
    OH_AVFormat_GetFloatValue(codecFormatOut, floatKey, &floatValueOut);
    if (floatValueOut != floatValue) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    double doubleValueOut = 0.0;
    OH_AVFormat_GetDoubleValue(codecFormatOut, doubleKey, &doubleValueOut);
    if (doubleValueOut != doubleValue) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    const char* stringValueOut = nullptr;
    OH_AVFormat_GetStringValue(codecFormatOut, stringKey, &stringValueOut);
    if (stringValueOut == nullptr || *stringValueOut != *stringValue) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }

    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatOut = nullptr;
    return AV_ERR_OK;
}

int SubMultimediaMediaCodecFormat0300()
{
    const char* bufferKey = "buffer value key";
    OH_AVFormat* codecFormatIn = OH_AVFormat_Create();
    if (codecFormatIn == nullptr) {
        return -1;
    }
    OH_AVFormat* codecFormatOut = OH_AVFormat_Create();
    if (codecFormatOut == nullptr) {
        OH_AVFormat_Destroy(codecFormatIn);
        return -1;
    }
    int32_t buffernum = 10;
    size_t sizeIn = buffernum * sizeof(uint8_t);
    uint8_t* buffer = reinterpret_cast<uint8_t*>(malloc(sizeIn));
    if (buffer == nullptr) {
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    (void)SecureMemset(buffer, sizeIn, 1, sizeIn);
    OH_AVFormat_SetBuffer(codecFormatIn, bufferKey, buffer, sizeIn);

    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    uint8_t* addrout = nullptr;
    size_t sizeOut = 0;
    OH_AVFormat_GetBuffer(codecFormatOut, bufferKey, &addrout, &sizeOut);
    if (sizeIn != sizeOut) {
        free(buffer);
        OH_AVFormat_Destroy(codecFormatIn);
        OH_AVFormat_Destroy(codecFormatOut);
        return -1;
    }
    for (int32_t i = 0; i < buffernum; i++) {
        if (buffer[i] != addrout[i]) {
            free(buffer);
            OH_AVFormat_Destroy(codecFormatIn);
            OH_AVFormat_Destroy(codecFormatOut);
            return -1;
        }
    }

    free(buffer);
    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatOut = nullptr;
    return AV_ERR_OK;
}
