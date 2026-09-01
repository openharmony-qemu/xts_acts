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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002492,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_component_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002500,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_component_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002493,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.depth_component_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002501,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002488,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.depth_component_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002496,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002484,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "depth_component_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002485,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002487,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.depth_component_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002495,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002486,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_component_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002494,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_component_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002489,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_component_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002497,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_component_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002490,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_component_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002498,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_component_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002491,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.depth_component_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002499,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002483,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_component_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002511,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.depth_stencil_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002519,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.depth_stencil_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002512,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_stencil_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002520,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002507,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_stencil_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002515,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002503,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".depth_stencil_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002504,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002506,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_stencil_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002514,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002505,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.depth_stencil_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002513,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.depth_stencil_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002508,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.depth_stencil_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002516,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.depth_stencil_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002509,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.depth_stencil_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002517,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.depth_stencil_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002510,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.depth_stencil_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002518,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002502,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.depth_stencil_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002606,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002614,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002607,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.r16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002615,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002602,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.r16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002610,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002598,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.r16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002599,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002601,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.r16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002609,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002600,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002608,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002603,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002611,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002604,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002612,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002605,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.r16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002613,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002597,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002625,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002633,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002626,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002634,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002621,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002629,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002617,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.r16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002618,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002620,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002628,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002619,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002627,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002622,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002630,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002623,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002631,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002624,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002632,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002616,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002720,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002728,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002721,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002729,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002716,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002724,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002712,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.r3_g3_b2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002713,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r3_g3_b2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002715,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r3_g3_b2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002723,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r3_g3_b2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002714,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002722,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002717,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.r3_g3_b2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002725,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.r3_g3_b2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002718,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002726,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002719,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r3_g3_b2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002727,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r3_g3_b2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002711,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r3_g3_b2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002568,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002576,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002569,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002577,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002564,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002572,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002560,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.r8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002561,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002563,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.r8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002571,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002562,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002570,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002565,
        "KHR-GL33.packed_pixels.p",
        "bo_rectangle.r8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002573,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002566,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002574,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002567,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.r8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002575,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002559,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.r8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002587,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002595,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002588,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002596,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002583,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002591,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002579,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.r8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002580,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002582,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.r8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002590,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002581,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002589,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002584,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.r8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002592,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.r8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002585,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002593,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002586,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.r8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002594,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.r8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002578,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.r8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002530,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002538,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002531,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002539,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002526,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002534,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002522,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002523,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002525,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002533,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002524,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002532,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002527,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002535,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002528,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002536,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002529,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002537,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002521,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002682,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002690,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002683,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002691,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002678,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002686,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002674,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002675,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rg16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002677,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rg16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002685,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rg16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002676,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002684,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002679,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002687,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002680,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002688,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002681,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002689,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002673,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rg16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002701,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002709,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002702,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002710,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002697,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002705,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002693,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.rg16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002694,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rg16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002696,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002704,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rg16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002695,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002703,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002698,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002706,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002699,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002707,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002700,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002708,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002692,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rg16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002644,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002652,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002645,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002653,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002640,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002648,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002636,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rg8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002637,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002639,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002647,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002638,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002646,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002641,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002649,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002642,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002650,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002643,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002651,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002635,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002663,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002671,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002664,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002672,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002659,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002667,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002655,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rg8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002656,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002658,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002666,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002657,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002665,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002660,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002668,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002661,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002669,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rg8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002662,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002670,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002654,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rg8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002549,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002557,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002550,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002558,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002545,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002553,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002541,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002542,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002544,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002552,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002543,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002551,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002546,
        "KHR-GL33.packed_pixels.p",
        "bo_rectangle.rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002554,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002547,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002555,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002548,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002556,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002540,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rg_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002986,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002994,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002987,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002995,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002982,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002990,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002978,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb10_a2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002979,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb10_a2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002981,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb10_a2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002989,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb10_a2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002980,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002988,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002983,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb10_a2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002991,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_a2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002984,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002992,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002985,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb10_a2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002993,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_a2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002977,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb10_a2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002997,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.rgb10_a2ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002998,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb10_a2ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002999,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002996,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb10_a2ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002815,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb10_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002823,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb10_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002816,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb10_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002824,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002811,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb10_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002819,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002807,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb10_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002808,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002810,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb10_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002818,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002809,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb10_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002817,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb10_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002812,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb10_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002820,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb10_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002813,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb10_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002821,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb10_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002814,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb10_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002822,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002806,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb10_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002834,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002842,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002835,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002843,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002830,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002838,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002826,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002827,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002829,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002837,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002828,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002836,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002831,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002839,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002832,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002840,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002833,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002841,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002825,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002853,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002861,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002854,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002862,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002849,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002857,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002845,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002846,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002848,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002856,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002847,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002855,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002850,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002858,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002851,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002859,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002852,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002860,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002844,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002872,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002880,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002873,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002881,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002868,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002876,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002864,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.rgb16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002865,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002867,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002875,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002866,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002874,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002869,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002877,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002870,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002878,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002871,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002879,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002863,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002739,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002747,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002740,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002748,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002735,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002743,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002731,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002732,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002734,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002742,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002733,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002741,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002736,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rgb4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002744,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002737,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002745,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002738,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002746,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002730,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002929,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb5_a1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002937,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_a1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002930,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb5_a1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002938,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002925,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb5_a1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002933,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002921,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb5_a1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002922,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002924,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb5_a1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002932,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002923,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb5_a1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002931,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_a1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002926,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb5_a1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002934,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_a1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002927,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb5_a1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002935,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_a1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002928,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb5_a1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002936,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002920,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_a1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002758,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002766,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002759,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002767,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002754,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002762,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002750,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002751,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002753,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002761,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002752,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002760,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002755,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rgb5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002763,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002756,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002764,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002757,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002765,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002749,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002777,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002785,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002778,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002786,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002773,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002781,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002769,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002770,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002772,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgb8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002780,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002771,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002779,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002774,
        "KHR-GL33.packed_pixels.pb",
        "o_rectangle.rgb8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002782,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002775,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002783,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002776,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgb8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002784,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002768,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgb8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002796,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002804,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002797,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002805,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002792,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002800,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002788,
        "KHR-GL33.packed_pixels.pbo_rectangl",
        "e.rgb8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002789,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002791,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgb8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002799,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002790,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002798,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002793,
        "KHR-GL33.packed_pixels.pbo_r",
        "ectangle.rgb8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002801,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgb8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002794,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002802,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002795,
        "KHR-GL33.packed_pixels.pbo_re",
        "ctangle.rgb8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002803,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.rgb8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002787,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.rgb8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002891,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002899,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002892,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002900,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002887,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002895,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002883,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgba2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002884,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002886,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002894,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002885,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002893,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002888,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002896,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002889,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002897,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002890,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002898,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002882,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002910,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002918,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002911,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002919,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002906,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002914,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002902,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgba4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002903,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002905,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002913,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002904,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002912,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002907,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002915,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002908,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002916,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002909,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002917,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002901,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002948,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002956,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002949,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002957,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002944,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002952,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002940,
        "KHR-GL33.packed_pixels.pbo_recta",
        "ngle.rgba8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002941,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002943,
        "KHR-GL33.packed_pixels.pbo_",
        "rectangle.rgba8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002951,
        "KHR-GL33.packed_pixels.pbo_rect",
        "angle.rgba8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002942,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002950,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002945,
        "KHR-GL33.packed_pixels.pbo",
        "_rectangle.rgba8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002953,
        "KHR-GL33.packed_pixels.pbo_rec",
        "tangle.rgba8_format_rg_integer");
