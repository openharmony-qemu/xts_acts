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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001416,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb10_a2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001400,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001428,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001436,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001429,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001437,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001424,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001432,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001420,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgb10_a2ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001421,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb10_a2ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001423,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb10_a2ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001431,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb10_a2ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001422,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001430,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001425,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb10_a2ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001433,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb10_a2ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001426,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001434,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001427,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb10_a2ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001435,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb10_a2ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001419,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb10_a2ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001238,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb10_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001246,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb10_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001239,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb10_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001247,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001234,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb10_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001242,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001230,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb10_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001231,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001233,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb10_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001241,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001232,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb10_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001240,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb10_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001235,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb10_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001243,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb10_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001236,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb10_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001244,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb10_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001237,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb10_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001245,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001229,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb10_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001257,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001265,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001258,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001266,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001253,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001261,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001249,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001250,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001252,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001260,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001251,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001259,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001254,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001262,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001255,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001263,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001256,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001264,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001248,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001276,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001284,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001277,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001285,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001272,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001280,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001268,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001269,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001271,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001279,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001270,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001278,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001273,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001281,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001274,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001282,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001275,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001283,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001267,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001295,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001303,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001296,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001304,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001291,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001299,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001287,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgb16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001288,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001290,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001298,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001289,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001297,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001292,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001300,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001293,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001301,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001294,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001302,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001286,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001580,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001588,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001581,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001589,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001576,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001584,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001572,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001573,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001575,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001583,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001574,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001582,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001577,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001585,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001578,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001586,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001579,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001587,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001571,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001998,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001999,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001994,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001990,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001991,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001993,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001992,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001995,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001996,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001997,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001989,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001656,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001664,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001657,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001665,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001652,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001660,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001648,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001649,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001651,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001659,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001650,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001658,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001653,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001661,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001654,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001662,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001655,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001663,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001647,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001162,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001170,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001163,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001171,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001158,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001166,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001154,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001155,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001157,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001165,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001156,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001164,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001159,
        "KHR-GL32.packed_pixels.",
        "rectangle.rgb4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001167,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001160,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001168,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001161,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001169,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001153,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001352,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb5_a1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001360,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_a1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001353,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb5_a1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001361,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001348,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb5_a1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001356,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001344,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb5_a1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001345,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001347,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb5_a1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001355,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001346,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb5_a1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001354,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_a1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001349,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb5_a1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001357,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_a1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001350,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb5_a1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001358,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_a1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001351,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb5_a1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001359,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001343,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_a1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001181,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001189,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001182,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001190,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001177,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001185,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001173,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001174,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001176,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001184,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001175,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001183,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001178,
        "KHR-GL32.packed_pixels.",
        "rectangle.rgb5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001186,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001179,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001187,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001180,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001188,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001172,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001200,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001208,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001201,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001209,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001196,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001204,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001192,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001193,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001195,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001203,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001194,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001202,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001197,
        "KHR-GL32.packed_pixels.",
        "rectangle.rgb8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001205,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001198,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001206,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001199,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001207,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001191,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001219,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001227,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001220,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001228,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001215,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001223,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001211,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgb8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001212,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001214,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001222,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001213,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001221,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001216,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001224,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001217,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001225,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001218,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgb8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001226,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001210,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgb8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001960,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001968,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001961,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001969,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001956,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001964,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001952,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001953,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001955,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001963,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001954,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001962,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001957,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001965,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001958,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001966,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001959,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001967,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001951,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001979,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001987,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001980,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001988,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001975,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001983,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001971,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001972,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001974,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001982,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001973,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001981,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001976,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001984,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001977,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001985,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001978,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001986,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001970,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001713,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb9_e5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001721,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb9_e5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001714,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb9_e5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001722,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001709,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb9_e5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001717,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001705,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb9_e5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001706,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001708,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb9_e5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001716,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001707,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb9_e5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001715,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb9_e5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001710,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb9_e5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001718,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb9_e5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001711,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb9_e5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001719,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb9_e5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001712,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb9_e5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001720,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001704,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb9_e5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001447,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001455,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001448,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001456,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001443,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001451,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001439,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001440,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001442,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001450,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001441,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001449,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001444,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001452,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001445,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001453,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001446,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001454,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001438,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001466,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001474,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001467,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001475,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001462,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001470,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001458,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001459,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001461,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001469,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001460,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001468,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001463,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001471,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001464,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001472,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001465,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001473,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001457,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001485,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001493,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001486,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001494,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001481,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001489,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001477,
        "KHR-GL32.packed_pixels.rectangle.r",
        "gba16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001478,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgba16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001480,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001488,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgba16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001479,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001487,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001482,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001490,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001483,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001491,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001484,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001492,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001476,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgba16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001599,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001607,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001600,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001608,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001595,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001603,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001591,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001592,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001594,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001602,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001593,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001601,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001596,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001604,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001597,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001605,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001598,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001606,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001590,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001314,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001322,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001315,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001323,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001310,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001318,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001306,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001307,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001309,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001317,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001308,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001316,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001311,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001319,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001312,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001320,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001313,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001321,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001305,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001675,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001683,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001676,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001684,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001671,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001679,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001667,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001668,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001670,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001678,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001669,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001677,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001672,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001680,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001673,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001681,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001674,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001682,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001666,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001333,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001341,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001334,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001342,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001329,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001337,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001325,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001326,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001328,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001336,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001327,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001335,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001330,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001338,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001331,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001339,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001332,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001340,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001324,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001371,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001379,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001372,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001380,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001367,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001375,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001363,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001364,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001366,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001374,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001365,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001373,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001368,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001376,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001369,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001377,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001370,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001378,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001362,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001390,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001398,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001391,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001399,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001386,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001394,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001382,
        "KHR-GL32.packed_pixels.rectangle.",
        "rgba8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001383,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001385,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001393,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001384,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001392,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001387,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001395,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001388,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001396,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001389,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001397,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001381,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001523,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001531,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001524,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001532,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001519,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001527,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001515,
        "KHR-GL32.packed_pixels.rectangle.s",
        "rgb8_alpha8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001516,
        "KHR-GL32.packed_pixels.rectangle.",
        "srgb8_alpha8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001518,
        "KHR-GL32.packed_pixels.rectan",
        "gle.srgb8_alpha8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001526,
        "KHR-GL32.packed_pixels.rectangle.",
        "srgb8_alpha8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001517,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001525,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001520,
        "KHR-GL32.packed_pixels.rect",
        "angle.srgb8_alpha8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001528,
        "KHR-GL32.packed_pixels.rectangl",
        "e.srgb8_alpha8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001521,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001529,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001522,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_alpha8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001530,
        "KHR-GL32.packed_pixels.rectangle",
        ".srgb8_alpha8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001514,
        "KHR-GL32.packed_pixels.rectangle.",
        "srgb8_alpha8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001504,
        "KHR-GL32.packed_pixels.r",
        "ectangle.srgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001512,
        "KHR-GL32.packed_pixels.recta",
        "ngle.srgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001505,
        "KHR-GL32.packed_pixels.re",
        "ctangle.srgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001513,
        "KHR-GL32.packed_pixels.rectan",
        "gle.srgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001500,
        "KHR-GL32.packed_pixels.re",
        "ctangle.srgb8_format_blue");
