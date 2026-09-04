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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001694,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001702,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001695,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001703,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001690,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001698,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001686,
        "KHR-GL33.packed_pixels.rectangle.r1",
        "1f_g11f_b10f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001687,
        "KHR-GL33.packed_pixels.rectangle.r",
        "11f_g11f_b10f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001689,
        "KHR-GL33.packed_pixels.rectang",
        "le.r11f_g11f_b10f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001697,
        "KHR-GL33.packed_pixels.rectangle.r",
        "11f_g11f_b10f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001688,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001696,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001691,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r11f_g11f_b10f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001699,
        "KHR-GL33.packed_pixels.rectangle",
        ".r11f_g11f_b10f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001692,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001700,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001693,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r11f_g11f_b10f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001701,
        "KHR-GL33.packed_pixels.rectangle.",
        "r11f_g11f_b10f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001685,
        "KHR-GL33.packed_pixels.rectangle.r",
        "11f_g11f_b10f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001029,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001037,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001030,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001038,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001025,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001033,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001021,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001022,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001024,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001032,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001023,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001031,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001026,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001034,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001027,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001035,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001028,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001036,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001020,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001048,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001056,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001049,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001057,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001044,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001052,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001040,
        "KHR-GL33.packed_pixels.rectangle",
        ".r16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001041,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001043,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001051,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001042,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001050,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001045,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001053,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001046,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001054,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001047,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001055,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001039,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001542,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001550,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001543,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001551,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001538,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001546,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001534,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001535,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001537,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001545,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001536,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001544,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001539,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001547,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001540,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001548,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001541,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001549,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001533,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001770,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001778,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001771,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001779,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001766,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001774,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001762,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001763,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001765,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001773,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001764,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001772,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001767,
        "KHR-GL33.packed_pixels.",
        "rectangle.r16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001775,
        "KHR-GL33.packed_pixels.rect",
        "angle.r16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001768,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001776,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001769,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001777,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001761,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001789,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001797,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001790,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001798,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001785,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001793,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001781,
        "KHR-GL33.packed_pixels.rectang",
        "le.r16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001782,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001784,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001792,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001783,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001791,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001786,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001794,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001787,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001795,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001788,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001796,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001780,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001618,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001626,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001619,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001627,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001614,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001622,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001610,
        "KHR-GL33.packed_pixels.rectang",
        "le.r32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001611,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001613,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001621,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001612,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001620,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001615,
        "KHR-GL33.packed_pixels.",
        "rectangle.r32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001623,
        "KHR-GL33.packed_pixels.rect",
        "angle.r32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001616,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001624,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001617,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001625,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001609,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001808,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001816,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001809,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001817,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001804,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001812,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001800,
        "KHR-GL33.packed_pixels.rectang",
        "le.r32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001801,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001803,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001811,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001802,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001810,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001805,
        "KHR-GL33.packed_pixels.",
        "rectangle.r32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001813,
        "KHR-GL33.packed_pixels.rect",
        "angle.r32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001806,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001814,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001807,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001815,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001799,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001827,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001835,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001828,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001836,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001823,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001831,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001819,
        "KHR-GL33.packed_pixels.rectang",
        "le.r32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001820,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001822,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001830,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001821,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001829,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001824,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001832,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001825,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001833,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001826,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001834,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001818,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001143,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001151,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001144,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001152,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001139,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001147,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001135,
        "KHR-GL33.packed_pixels.rectangle",
        ".r3_g3_b2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001136,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r3_g3_b2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001138,
        "KHR-GL33.packed_pixels.rect",
        "angle.r3_g3_b2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001146,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r3_g3_b2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001137,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001145,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001140,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r3_g3_b2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001148,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r3_g3_b2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001141,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001149,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001142,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r3_g3_b2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001150,
        "KHR-GL33.packed_pixels.rectang",
        "le.r3_g3_b2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001134,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r3_g3_b2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001000,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001010,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001018,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001011,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001019,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001006,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001014,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001002,
        "KHR-GL33.packed_pixels.rectangle",
        ".r8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001003,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001005,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001013,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001004,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001012,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001007,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001015,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001008,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001016,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001009,
        "KHR-GL33.packed_pixels.rec",
        "tangle.r8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001017,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001001,
        "KHR-GL33.packed_pixels.rectangl",
        "e.r8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001732,
        "KHR-GL33.packed_pixels.",
        "rectangle.r8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001740,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001733,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001741,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001728,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001736,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001724,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001725,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001727,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001735,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001726,
        "KHR-GL33.packed_pixels.",
        "rectangle.r8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001734,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001729,
        "KHR-GL33.packed_pixels.",
        "rectangle.r8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001737,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001730,
        "KHR-GL33.packed_pixels.",
        "rectangle.r8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001738,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001731,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001739,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001723,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001751,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001759,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001752,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001760,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001747,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001755,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001743,
        "KHR-GL33.packed_pixels.rectang",
        "le.r8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001744,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001746,
        "KHR-GL33.packed_pixels.re",
        "ctangle.r8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001754,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001745,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001753,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001748,
        "KHR-GL33.packed_pixels.",
        "rectangle.r8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001756,
        "KHR-GL33.packed_pixels.rect",
        "angle.r8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001749,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001757,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001750,
        "KHR-GL33.packed_pixels.r",
        "ectangle.r8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001758,
        "KHR-GL33.packed_pixels.recta",
        "ngle.r8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001742,
        "KHR-GL33.packed_pixels.rectan",
        "gle.r8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001105,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001113,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001106,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001114,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001101,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001109,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001097,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001098,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001100,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001108,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001099,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001107,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001102,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001110,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001103,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001111,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001104,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001112,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001096,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001124,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001132,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001125,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001133,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001120,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001128,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001116,
        "KHR-GL33.packed_pixels.rectangle.",
        "rg16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001117,
        "KHR-GL33.packed_pixels.rectangle",
        ".rg16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001119,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001127,
        "KHR-GL33.packed_pixels.rectangle",
        ".rg16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001118,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001126,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001121,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001129,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001122,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001130,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001123,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001131,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001115,
        "KHR-GL33.packed_pixels.rectangle",
        ".rg16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001561,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001569,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001562,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001570,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001557,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001565,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001553,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001554,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001556,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001564,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001555,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001563,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001558,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001566,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001559,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001567,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001560,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001568,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001552,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001884,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001892,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001885,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001893,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001880,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001888,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001876,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001877,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001879,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001887,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001878,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001886,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001881,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001889,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001882,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001890,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001883,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001891,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001875,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001903,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001911,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001904,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001912,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001899,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001907,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001895,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001896,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001898,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001906,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001897,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001905,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001900,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001908,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001901,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001909,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001902,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001910,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001894,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001637,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001645,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001638,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001646,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001633,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001641,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001629,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001630,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001632,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001640,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001631,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001639,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001634,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001642,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001635,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001643,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001636,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001644,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001628,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001922,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001930,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001923,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001931,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001918,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001926,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001914,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001915,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001917,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001925,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001916,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001924,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001919,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001927,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001920,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001928,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001921,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001929,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001913,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001941,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001949,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001942,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001950,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001937,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001945,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001933,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001934,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001936,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001944,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001935,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001943,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001938,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001946,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001939,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001947,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001940,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001948,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001932,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001067,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001075,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001068,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001076,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001063,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001071,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001059,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001060,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001062,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001070,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001061,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001069,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001064,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001072,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001065,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001073,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001066,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001074,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001058,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001086,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001094,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001087,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001095,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001082,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001090,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001078,
        "KHR-GL33.packed_pixels.rectangle",
        ".rg8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001079,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001081,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001089,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001080,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001088,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001083,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001091,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001084,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rg8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001092,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001085,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001093,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001077,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rg8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001846,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001854,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001847,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001855,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001842,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001850,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001838,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001839,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001841,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001849,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001840,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001848,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001843,
        "KHR-GL33.packed_pixels.",
        "rectangle.rg8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001851,
        "KHR-GL33.packed_pixels.rect",
        "angle.rg8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001844,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001852,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001845,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001853,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001837,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001865,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001873,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001866,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001874,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001861,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001869,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001857,
        "KHR-GL33.packed_pixels.rectang",
        "le.rg8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001858,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001860,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001868,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001859,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001867,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001862,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001870,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001863,
        "KHR-GL33.packed_pixels.r",
        "ectangle.rg8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001871,
        "KHR-GL33.packed_pixels.recta",
        "ngle.rg8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001864,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rg8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001872,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001856,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rg8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001409,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001417,
        "KHR-GL33.packed_pixels.rectang",
        "le.rgb10_a2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001410,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001418,
        "KHR-GL33.packed_pixels.rectang",
        "le.rgb10_a2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001405,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001413,
        "KHR-GL33.packed_pixels.rectang",
        "le.rgb10_a2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001401,
        "KHR-GL33.packed_pixels.rectangle",
        ".rgb10_a2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001402,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rgb10_a2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001404,
        "KHR-GL33.packed_pixels.rect",
        "angle.rgb10_a2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001412,
        "KHR-GL33.packed_pixels.rectangl",
        "e.rgb10_a2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001403,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001411,
        "KHR-GL33.packed_pixels.rectang",
        "le.rgb10_a2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001406,
        "KHR-GL33.packed_pixels.re",
        "ctangle.rgb10_a2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001414,
        "KHR-GL33.packed_pixels.rectan",
        "gle.rgb10_a2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001407,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001415,
        "KHR-GL33.packed_pixels.rectang",
        "le.rgb10_a2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001408,
        "KHR-GL33.packed_pixels.rec",
        "tangle.rgb10_a2_format_rgba");
