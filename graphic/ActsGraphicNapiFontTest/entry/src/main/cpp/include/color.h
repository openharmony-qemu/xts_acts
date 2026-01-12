/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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

#ifndef COLOR_H
#define COLOR_H

#include <cstdint>
#include <stdint.h>

namespace OHOS {
namespace Rosen {
namespace Drawing {
enum class Clamp {
    NO_CLAMP,
    YES_CLAMP,
};

enum ColorType {
    COLORTYPE_UNKNOWN = 0,
    COLORTYPE_ALPHA_8,
    COLORTYPE_RGB_565,
    COLORTYPE_ARGB_4444,
    COLORTYPE_RGBA_8888,
    COLORTYPE_BGRA_8888,
    COLORTYPE_RGBA_F16,
    COLORTYPE_N32,
    COLORTYPE_RGBA_1010102,
    COLORTYPE_GRAY_8,
    COLORTYPE_RGB_888X,
    COLORTYPE_RGBA_1010108,
};

enum AlphaType {
    ALPHATYPE_UNKNOWN = 0,
    ALPHATYPE_OPAQUE,
    ALPHATYPE_PREMUL,
    ALPHATYPE_UNPREMUL,
};


typedef uint32_t ColorQuad;

class Color {
public:
    constexpr static ColorQuad COLOR_TRANSPARENT = 0;
    constexpr static ColorQuad COLOR_BLACK = 0xFF000000;
    constexpr static ColorQuad COLOR_DKGRAY = 0xFF444444;
    constexpr static ColorQuad COLOR_GRAY = 0xFF888888;
    constexpr static ColorQuad COLOR_LTGRAY = 0xFFCCCCCC;
    constexpr static ColorQuad COLOR_WHITE = 0xFFFFFFFF;
    constexpr static ColorQuad COLOR_RED = 0xFFFF0000;
    constexpr static ColorQuad COLOR_GREEN = 0xFF00FF00;
    constexpr static ColorQuad COLOR_BLUE = 0xFF0000FF;
    constexpr static ColorQuad COLOR_YELLOW = 0xFFFFFF00;
    constexpr static ColorQuad COLOR_CYAN = 0xFF00FFFF;
    constexpr static ColorQuad COLOR_MAGENTA = 0xFFFF00FF;
    constexpr static ColorQuad COLOR_FOREGROUND = 0x00000001;

    constexpr static uint8_t RGB_MAX = 255;
    // Return color value from component values.
    static inline ColorQuad ColorQuadSetARGB(uint32_t a, uint32_t r, uint32_t g, uint32_t b)
    {
        return ((a & 0xffu) << 24) | ((r & 0xffu) << 16) | ((g & 0xffu) << 8) | ((b & 0xffu) << 0);
    }

    // Return alpha byte from color value.
    static inline uint32_t ColorQuadGetA(ColorQuad c)
    {
        return ((c >> 24) & 0xff);
    }

    // Return red component of color, from zero to 255.
    static inline uint32_t ColorQuadGetR(ColorQuad c)
    {
        return ((c >> 16) & 0xff);
    }

    // Return green component of color, from zero to 255.
    static inline uint32_t ColorQuadGetG(ColorQuad c)
    {
        return ((c >> 8) & 0xff);
    }

    // Return blue component of color, from zero to 255.
    static inline uint32_t ColorQuadGetB(ColorQuad c)
    {
        return ((c >> 0) & 0xff);
    }

    ~Color() {}

public:
    Color() noexcept;
    Color(const Color& c) noexcept;
    Color(uint32_t r, uint32_t g, uint32_t b, uint32_t a) noexcept;
    Color(ColorQuad rgba) noexcept;

    uint32_t GetRed() const;
    uint32_t GetGreen() const;
    uint32_t GetBlue() const;
    uint32_t GetAlpha() const;
    void SetRed(uint32_t r);
    void SetGreen(uint32_t g);
    void SetBlue(uint32_t b);
    void SetAlpha(uint32_t a);


    void SetRgb(uint32_t r, uint32_t g, uint32_t b, uint32_t a = 255);

    void SetColorQuad(uint32_t c);
    ColorQuad CastToColorQuad() const;

    // Placeholder feature methods
    bool IsPlaceholder() const;

    friend  bool operator==(const Color& c1, const Color& c2);
    friend  bool operator!=(const Color& c1, const Color& c2);


private:
    void UpdateValueToFloat();
    void UpdateValueToInt();
    uint32_t alpha_;
    uint32_t red_;
    uint32_t green_;
    uint32_t blue_;
};
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
#endif
