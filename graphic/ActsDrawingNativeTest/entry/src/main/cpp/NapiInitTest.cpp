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
#include "include/DrawingCanvasDrawRecordCmdTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"


// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
static constexpr size_t TRAIN_EXPORT_MODEL_HANDLER_COUNT = 14;
static constexpr size_t CONTEXT_CREATE_HANDLER_COUNT = 66;
static constexpr size_t MODEL_CREATE_HANDLER_COUNT = 37;
static constexpr size_t TENSOR_CREATE_HANDLER_COUNT = 50;
static constexpr size_t HIAI_OFFLINEMODEL_HANDLER_COUNT = 15;
static constexpr size_t OHOS_CONTEXT_CPU_HANDLER_COUNT = 20;
static constexpr size_t OHOS_TENSOR_CREATE_HANDLER_COUNT = 16;
static constexpr size_t CANVAS_DRAW_RECORD_CMD_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_DRAW_SINGLE_CHA_WITH_FEATURES_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_DESTROY_HANDLER_COUNT = 2;
static constexpr size_t CANVAS_BIND_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_SAVE_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_SAVE_LAYER_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_RESTORE_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_RESTORE_TO_COUNT_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_DRAW_LINE_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_DRAW_PATH_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_ATTACH_HANDLER_COUNT = 10;
static constexpr size_t CANVAS_DETACH_HANDLER_COUNT = 2;
static constexpr size_t CANVAS_PART2_DRAW_PIXELMAP_RECT_HANDLER_COUNT = 7;
static constexpr size_t CANVAS_PART2_DRAW_BACKGROUND_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART2_DRAW_REGION_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART2_DRAW_POINTS_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART2_DRAW_BITMAP_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART2_DRAW_BITMAP_RECT_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART2_DRAW_RECT_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART2_DRAW_CIRCLE_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_DRAW_OVAL_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_DRAW_ARC_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_DRAW_ROUND_RECT_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_DRAW_TEXT_BLOB_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_CLIP_RECT_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_CLIP_ROUND_RECT_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART3_CLIP_PATH_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART3_ROTATE_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART3_TRANSLATE_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART3_SCALE_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART4_SKEW_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART4_GET_WIDTH_HEIGHT_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART4_GET_LOCAL_CLIP_BOUNDS_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART4_CONCAT_MATRIX_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART4_DRAW_SHADOW_HANDLER_COUNT = 5;
static constexpr size_t CANVAS_PART4_CLEAR_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART4_SET_MATRIX_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART4_RESET_MATRIX_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART4_DRAW_IMAGE_RECT_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART4_DRAW_VERTICES_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART4_READ_PIXELS_HANDLER_COUNT = 6;
static constexpr size_t CANVAS_PART4_READ_PIXELS_TO_BITMAP_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART4_DRAW_SINGLE_CHARACTER_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART4_DRAW_POINT_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART4_DRAW_COLOR_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART4_IS_CLIP_EMPTY_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART4_GET_IMAGE_INFO_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART4_CLIP_REGION_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_QUICK_REJECT_PATH_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_QUICK_REJECT_RECT_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_DRAW_ARC_WITH_CENTER_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_DRAW_NESTED_ROUND_RECT_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_NINE_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_CREATE_WITH_PIXEL_MAP_HANDLER_COUNT = 3;
static constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_RECT_CONSTRAINT_HANDLER_COUNT = 4;
static constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_MESH_HANDLER_COUNT = 11;
static constexpr size_t BITMAP_HANDLER_COUNT = 22;
static constexpr size_t COLOR_FILTER_CREATE_BLEND_MODE_HANDLER_COUNT = 5;
static constexpr size_t COLOR_FILTER_CREATE_COMPOSE_HANDLER_COUNT = 3;
static constexpr size_t COLOR_FILTER_CREATE_MATRIX_HANDLER_COUNT = 4;
static constexpr size_t COLOR_FILTER_CREATE_LINEAR_TO_SRGB_GAMMA_HANDLER_COUNT = 2;
static constexpr size_t COLOR_FILTER_CREATE_SRGB_GAMMA_TO_LINEAR_HANDLER_COUNT = 2;
static constexpr size_t COLOR_FILTER_CREATE_LUMA_HANDLER_COUNT = 2;
static constexpr size_t COLOR_FILTER_DESTROY_HANDLER_COUNT = 2;
static constexpr size_t COLOR_FILTER_CREATE_LIGHTING_HANDLER_COUNT = 4;
static constexpr size_t COLOR_SPACE_CREATE_SRGB_HANDLER_COUNT = 2;
static constexpr size_t COLOR_SPACE_DESTROY_HANDLER_COUNT = 1;
static constexpr size_t COLOR_SPACE_CREATE_SRGB_LINEAR_HANDLER_COUNT = 2;
static constexpr size_t COLOR_SET_ARGB_HANDLER_COUNT = 5;
static constexpr size_t BRUSH_CREATE_DESTROY_HANDLER_COUNT = 7;
static constexpr size_t BRUSH_ANTI_ALIAS_HANDLER_COUNT = 4;
static constexpr size_t BRUSH_COLOR_HANDLER_COUNT = 6;
static constexpr size_t BRUSH_ALPHA_HANDLER_COUNT = 6;
static constexpr size_t BRUSH_SHADER_EFFECT_HANDLER_COUNT = 2;
static constexpr size_t BRUSH_SHADOW_LAYER_HANDLER_COUNT = 2;
static constexpr size_t BRUSH_FILTER_HANDLER_COUNT = 4;
static constexpr size_t BRUSH_BLEND_MODE_HANDLER_COUNT = 2;
static constexpr size_t BRUSH_RESET_HANDLER_COUNT = 2;
static constexpr size_t BRUSH_GET_FLOAT_HANDLER_COUNT = 8;
static constexpr size_t BRUSH_SET_COLOR4F_HANDLER_COUNT = 3;

using DrawingNativeFn = int (*)();

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

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<DrawingNativeFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

// Canvas DrawRecordCmd related functions
static napi_value SUB_Drawing_CanvasDrawRecordCmd(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DRAW_RECORD_CMD_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdNormal
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

static const napi_property_descriptor g_drawingNativeDescriptors[] = {
    DECL_NAPI_DESC(SUB_Drawing_CanvasDrawRecordCmd),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_drawingNativeDescriptors) / sizeof(g_drawingNativeDescriptors[CASE_NUM_0]),
                           g_drawingNativeDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module drawingNativeModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "drawingnative",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&drawingNativeModule);
}
