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

#include "animate/native_anim_common.h"

namespace ArkUICapiTest {

namespace {
constexpr float CUBIC_X1 = 0.42f;
constexpr float CUBIC_Y1 = 0.0f;
constexpr float CUBIC_X2 = 0.58f;
constexpr float CUBIC_Y2 = 1.0f;

ArkUI_CurveHandle TryCurveByType()
{
    auto curve = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    if (curve != nullptr) {
        return curve;
    }
    auto byType = AnimFp<CurveByTypeFn>("OH_ArkUI_Curve_CreateCurveByType");
    if (byType == nullptr) {
        return nullptr;
    }
    return byType(ARKUI_CURVE_LINEAR);
}

ArkUI_CurveHandle TryCubicCurve()
{
    auto curve = OH_ArkUI_Curve_CreateCubicBezierCurve(CUBIC_X1, CUBIC_Y1, CUBIC_X2, CUBIC_Y2);
    if (curve != nullptr) {
        return curve;
    }
    auto cubic = AnimFp<CurveCubicFn>("OH_ArkUI_Curve_CreateCubicBezierCurve");
    if (cubic == nullptr) {
        return nullptr;
    }
    return cubic(CUBIC_X1, CUBIC_Y1, CUBIC_X2, CUBIC_Y2);
}
} // namespace

ArkUI_CurveHandle MakeCurve()
{
    auto curve = TryCurveByType();
    if (curve != nullptr) {
        return curve;
    }
    return TryCubicCurve();
}

} // namespace ArkUICapiTest
