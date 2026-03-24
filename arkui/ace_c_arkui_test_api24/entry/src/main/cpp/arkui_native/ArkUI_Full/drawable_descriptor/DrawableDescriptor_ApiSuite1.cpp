/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "../../../common/common.h"
#include <arkui/drawable_descriptor.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {

/*
 * 测试接口: DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME（DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME = 0）
 * 预期效果: 枚举/宏常量取值应为 0。
 * 实际测试: 读取符号 DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME 并断言等于 0。
 */
static napi_value TestArkUICapi_003(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 0;
    ASSERT_EQ(static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME), expected);
    NAPI_END;
}

/*
 * 测试接口: DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME（DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME = 1）
 * 预期效果: 枚举/宏常量取值应为 1。
 * 实际测试: 读取符号 DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME 并断言等于 1。
 */
static napi_value TestArkUICapi_004(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    constexpr int32_t expected = 1;
    ASSERT_EQ(static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME), expected);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_DrawableDescriptor_SetAnimationStopMode
 * 预期效果: 在合法动图 DrawableDescriptor 上设置停止模式成功。
 * 实际测试: 按文档用 CreateEmptyPixelMap×2 + CreateFromAnimatedPixelMap 建描述符，SetAnimationStopMode 后释放全链路。
 */
static napi_value TestArkUICapi_005(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    ASSERT_NOTNULL(opts);
    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm0 = nullptr;
    OH_PixelmapNative *pm1 = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm0);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm1);
    ASSERT_NOTNULL(pm0);
    ASSERT_NOTNULL(pm1);
    OH_PixelmapNative *frames[2] = {pm0, pm1};
    auto *dd = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(frames, 2);
    ASSERT_NOTNULL(dd);
    auto rc = OH_ArkUI_DrawableDescriptor_SetAnimationStopMode(
        dd, DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME);
    ASSERT_EQ(rc, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_DrawableDescriptor_Dispose(dd);
    (void)OH_PixelmapNative_Destroy(&pm0);
    (void)OH_PixelmapNative_Destroy(&pm1);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    NAPI_END;
}

/*
 * 测试接口: OH_ArkUI_DrawableDescriptor_GetAnimationStopMode
 * 预期效果: Get 读到与 Set 一致的动图停止模式。
 * 实际测试: 双帧 PixelMap 建动图描述符，Set LAST_FRAME 后 Get 断言一致，再释放。
 */
static napi_value TestArkUICapi_006(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&opts);
    ASSERT_NOTNULL(opts);
    (void)OH_PixelmapInitializationOptions_SetWidth(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetHeight(opts, 1);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(opts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pm0 = nullptr;
    OH_PixelmapNative *pm1 = nullptr;
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm0);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(opts, &pm1);
    ASSERT_NOTNULL(pm0);
    ASSERT_NOTNULL(pm1);
    OH_PixelmapNative *frames[2] = {pm0, pm1};
    auto *dd = OH_ArkUI_DrawableDescriptor_CreateFromAnimatedPixelMap(frames, 2);
    ASSERT_NOTNULL(dd);
    ASSERT_EQ(OH_ArkUI_DrawableDescriptor_SetAnimationStopMode(
                  dd, DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME),
        ARKUI_ERROR_CODE_NO_ERROR);
    DrawableDescriptor_AnimationStopMode mode = DRAWABLE_DESCRIPTOR_ANIMATION_FIRST_FRAME;
    auto rc = OH_ArkUI_DrawableDescriptor_GetAnimationStopMode(dd, &mode);
    ASSERT_EQ(rc, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(static_cast<int32_t>(mode),
        static_cast<int32_t>(DRAWABLE_DESCRIPTOR_ANIMATION_LAST_FRAME));
    OH_ArkUI_DrawableDescriptor_Dispose(dd);
    (void)OH_PixelmapNative_Destroy(&pm0);
    (void)OH_PixelmapNative_Destroy(&pm1);
    (void)OH_PixelmapInitializationOptions_Release(opts);
    NAPI_END;
}

} // namespace ArkUICapiTest
