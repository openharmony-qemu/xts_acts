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

#ifndef ACTSGRAPHICNAPIDRAWINGTEST_NATIVECOPYSTYLETEST_H
#define ACTSGRAPHICNAPIDRAWINGTEST_NATIVECOPYSTYLETEST_H

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_typography.h>

struct NativeCopyStyleTestContext {
    OH_Drawing_FontCollection* fontCollection;
    OH_Drawing_TextStyle* txtStyle;
    OH_Drawing_TypographyCreate* handler;
    OH_Drawing_Typography* typography;
    OH_Drawing_TypographyStyle* typoStyle;
    OH_Drawing_TextStyle* txtStyleCopy;
    OH_Drawing_TypographyStyle* typoStyleCopy;

    NativeCopyStyleTestContext()
        : fontCollection(nullptr),
          txtStyle(nullptr),
          handler(nullptr),
          typography(nullptr),
          typoStyle(nullptr),
          txtStyleCopy(nullptr),
          typoStyleCopy(nullptr)
    {
    }

    ~NativeCopyStyleTestContext()
    {
        if (fontCollection != nullptr) {
            OH_Drawing_DestroyFontCollection(fontCollection);
            fontCollection = nullptr;
        }
        if (txtStyle != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyle);
            txtStyle = nullptr;
        }
        if (handler != nullptr) {
            OH_Drawing_DestroyTypographyHandler(handler);
            handler = nullptr;
        }
        if (typography != nullptr) {
            OH_Drawing_DestroyTypography(typography);
            typography = nullptr;
        }
        if (typoStyle != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyle);
            typoStyle = nullptr;
        }
        if (txtStyleCopy != nullptr) {
            OH_Drawing_DestroyTextStyle(txtStyleCopy);
            txtStyleCopy = nullptr;
        }
        if (typoStyleCopy != nullptr) {
            OH_Drawing_DestroyTypographyStyle(typoStyleCopy);
            typoStyleCopy = nullptr;
        }
    }
};

namespace OHOS {
int OHDrawingCopyTextStyle001();
int OHDrawingCopyTextStyle002();
int OHDrawingCopyTextStyle003();
int OHDrawingCopyTextStyle004();
int OHDrawingCopyTextShadow001();
int OHDrawingCopyTypographyStyle001();
int OHDrawingCopyTypographyStyle002();
int OHDrawingCopyTypographyStyle003();
int OHDrawingCopyTypographyStyle004();
} // namespace OHOS

#endif // ACTSGRAPHICNAPIDRAWINGTEST_NATIVECOPYSTYLETEST_H
