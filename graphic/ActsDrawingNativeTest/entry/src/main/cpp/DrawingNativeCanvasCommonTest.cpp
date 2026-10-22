/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "log_common.h"
#include <vector>

#define NUMBER_1 1
#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_4 4
#define NUMBER_5 5
#define NUMBER_6 6
#define NUMBER_16 16
#define NUMBER_20 20
#define NUMBER_255 255
#define NUMBER_2160 2160
#define NUMBER_4096 4096

using namespace std;

OH_PixelmapNative *GET_OH_PixelmapNative()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = NUMBER_4;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = NUMBER_4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255};
    // 16 means data length
    size_t dataLength = NUMBER_16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative(uint32_t width, uint32_t height)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255};
    // 16 means data length
    size_t dataLength = NUMBER_16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative4KBoundary()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4096 means width
    uint32_t width = NUMBER_4096;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 2160 means height
    uint32_t height = NUMBER_2160;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 3 means RGBA format
    int32_t pixelFormat = NUMBER_3;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255/0 means rgba data
    size_t dataLength = width * height * NUMBER_4;
    vector<uint8_t> data(dataLength);
    // Pixel value is {255, 255, 0, 255} (R=255, G=255, B=0, A=255).
    // Treat as uint32_t and fill in bulk (4x fewer writes than per-byte loop).
    // On little-endian, byte[0]=R is LSB, so pack as: A<<24 | B<<16 | G<<8 | R.
    uint32_t pixelValue = (static_cast<uint32_t>(NUMBER_255) << 24) |
                          (static_cast<uint32_t>(0) << 16) |
                          (static_cast<uint32_t>(NUMBER_255) << 8) |
                          static_cast<uint32_t>(NUMBER_255);
    std::fill(reinterpret_cast<uint32_t *>(data.data()),
              reinterpret_cast<uint32_t *>(data.data() + dataLength), pixelValue);
    // 4096 * 2160 means data length
    OH_PixelmapNative_CreatePixelmap(data.data(), dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}

OH_PixelmapNative *GET_OH_PixelmapNative_4ByteAlignment()
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    // 4 means width
    uint32_t width = NUMBER_5;
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    // 4 means height
    uint32_t height = NUMBER_4;
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    // 4 means RGBA format
    int32_t pixelFormat = NUMBER_6;
    OH_PixelmapInitializationOptions_SetPixelFormat(options, pixelFormat);
    // 2 means ALPHA_FORMAT_PREMUL format
    int32_t alphaType = NUMBER_2;
    OH_PixelmapInitializationOptions_SetAlphaType(options, alphaType);
    // 255 means rgba data
    uint8_t data[] = {
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255,
        NUMBER_255, NUMBER_255, 0, NUMBER_255};
    // 16 means data length
    size_t dataLength = NUMBER_20;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMap);
    OH_PixelmapInitializationOptions_Release(options);
    return pixelMap;
}
