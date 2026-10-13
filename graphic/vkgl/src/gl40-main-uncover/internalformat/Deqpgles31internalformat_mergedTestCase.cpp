/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009933,
        "KHR-GL40.internalformat.copy",
        "_tex_image.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009934,
        "KHR-GL40.internalformat.copy",
        "_tex_image.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009935,
        "KHR-GL40.internalformat.copy",
        "_tex_image.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009938,
        "KHR-GL40.internalformat",
        ".copy_tex_image.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009937,
        "KHR-GL40.internalformat.",
        "copy_tex_image.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009936,
        "KHR-GL40.internalformat",
        ".copy_tex_image.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009942,
        "KHR-GL40.internalformat.re",
        "nderbuffer.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009943,
        "KHR-GL40.internalformat.ren",
        "derbuffer.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009944,
        "KHR-GL40.internalformat.ren",
        "derbuffer.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009945,
        "KHR-GL40.internalformat.ren",
        "derbuffer.depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009941,
        "KHR-GL40.internalformat",
        ".renderbuffer.rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009940,
        "KHR-GL40.internalforma",
        "t.renderbuffer.rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009939,
        "KHR-GL40.internalform",
        "at.renderbuffer.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009910,
        "KHR-GL40.internalformat.texture2d.depth_",
        "component_unsigned_int_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009908,
        "KHR-GL40.internalformat.texture2d.depth_",
        "component_unsigned_int_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009909,
        "KHR-GL40.internalformat.texture2d.depth_",
        "component_unsigned_int_depth_component32");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009907,
        "KHR-GL40.internalformat.texture2d.depth",
        "_component_unsigned_int_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009906,
        "KHR-GL40.internalformat.texture2d.depth_c",
        "omponent_unsigned_short_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009905,
        "KHR-GL40.internalformat.texture2d.depth_",
        "component_unsigned_short_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009894,
        "KHR-GL40.internalformat.t",
        "exture2d.red_byte_r8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009929,
        "KHR-GL40.internalformat.",
        "texture2d.red_float_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009925,
        "KHR-GL40.internalformat.te",
        "xture2d.red_half_float_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009895,
        "KHR-GL40.internalformat.te",
        "xture2d.red_short_r16_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009896,
        "KHR-GL40.internalformat.t",
        "exture2d.rg_byte_rg8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009930,
        "KHR-GL40.internalformat.",
        "texture2d.rg_float_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009926,
        "KHR-GL40.internalformat.te",
        "xture2d.rg_half_float_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009897,
        "KHR-GL40.internalformat.te",
        "xture2d.rg_short_rg16_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009898,
        "KHR-GL40.internalformat.te",
        "xture2d.rgb_byte_rgb8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009931,
        "KHR-GL40.internalformat.t",
        "exture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009927,
        "KHR-GL40.internalformat.tex",
        "ture2d.rgb_half_float_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009924,
        "KHR-GL40.internalformat.text",
        "ure2d.rgb_integer_byte_rgb8i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009920,
        "KHR-GL40.internalformat.text",
        "ure2d.rgb_integer_int_rgb32i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009922,
        "KHR-GL40.internalformat.textu",
        "re2d.rgb_integer_short_rgb16i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009918,
        "KHR-GL40.internalformat.texture2d",
        ".rgb_integer_unsigned_byte_rgb8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009914,
        "KHR-GL40.internalformat.texture2d",
        ".rgb_integer_unsigned_int_rgb32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009916,
        "KHR-GL40.internalformat.texture2d.",
        "rgb_integer_unsigned_short_rgb16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009899,
        "KHR-GL40.internalformat.tex",
        "ture2d.rgb_short_rgb16_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009900,
        "KHR-GL40.internalformat.tex",
        "ture2d.rgba_byte_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009932,
        "KHR-GL40.internalformat.te",
        "xture2d.rgba_float_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009928,
        "KHR-GL40.internalformat.text",
        "ure2d.rgba_half_float_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009923,
        "KHR-GL40.internalformat.textu",
        "re2d.rgba_integer_byte_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009919,
        "KHR-GL40.internalformat.textu",
        "re2d.rgba_integer_int_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009921,
        "KHR-GL40.internalformat.textur",
        "e2d.rgba_integer_short_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009917,
        "KHR-GL40.internalformat.texture2d.",
        "rgba_integer_unsigned_byte_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009912,
        "KHR-GL40.internalformat.texture2d.rgba_int",
        "eger_unsigned_int_2_10_10_10_rev_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009913,
        "KHR-GL40.internalformat.texture2d.",
        "rgba_integer_unsigned_int_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009915,
        "KHR-GL40.internalformat.texture2d.r",
        "gba_integer_unsigned_short_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009901,
        "KHR-GL40.internalformat.text",
        "ure2d.rgba_short_rgba16_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009911,
        "KHR-GL40.internalformat.textur",
        "e2d.rgba_unsigned_byte_rgb9_e5");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009903,
        "KHR-GL40.internalformat.texture2d.rgb",
        "a_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009904,
        "KHR-GL40.internalformat.texture2d.rgb",
        "a_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009902,
        "KHR-GL40.internalformat.texture2d.r",
        "gba_unsigned_int_2_10_10_10_rev_rgba");
