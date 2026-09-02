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
#include "../ActsDeqpgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003500,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003508,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003495,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003503,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003491,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003492,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003494,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003502,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003493,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003501,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003496,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003504,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003497,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003505,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003498,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003506,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003490,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003518,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003526,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003519,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003527,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003514,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003522,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003510,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rg32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003511,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003513,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rg32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003521,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003512,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003520,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003515,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003523,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003516,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003524,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003517,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003525,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003509,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003423,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003431,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003424,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003432,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003419,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003427,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003415,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003416,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003418,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003426,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003417,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003425,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003420,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.rg8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003428,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rg8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003421,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003429,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003422,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003430,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003414,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003442,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003450,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003443,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003451,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003438,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003446,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003434,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003435,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003437,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003445,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003436,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003444,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003439,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003447,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003440,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003448,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003441,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003449,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003433,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003005,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003013,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003006,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003014,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003001,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003009,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003000,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb10_a2ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003008,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgb10_a2ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003007,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003002,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb10_a2ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003010,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb10_a2ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003003,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003011,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003004,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgb10_a2ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003012,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb10_a2ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003157,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003165,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003158,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003166,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003153,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003161,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003149,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003150,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003152,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003160,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003151,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003159,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003154,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003162,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003155,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003163,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003156,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003164,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003148,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003575,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003583,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003576,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003584,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003571,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003579,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003567,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003568,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003570,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003578,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003569,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003577,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003572,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003580,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003573,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003581,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003574,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003582,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003566,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003594,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003602,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003595,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003603,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003590,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003598,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003586,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003587,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003589,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003597,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003588,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003596,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003591,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003599,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003592,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003600,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003593,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003601,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003585,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003233,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003241,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003234,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003242,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003229,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003237,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003225,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003226,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003228,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003236,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003227,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003235,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003230,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003238,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003231,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003239,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003232,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003240,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003224,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003613,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003621,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003614,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003622,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003609,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003617,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003605,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003606,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003608,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003616,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003607,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003615,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003610,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003618,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003611,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003619,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003612,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003620,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003604,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003632,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003640,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003633,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003641,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003628,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003636,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003624,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003625,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003627,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003635,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003626,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003634,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003629,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003637,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003630,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003638,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003631,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003639,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003623,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003537,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003545,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003538,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003546,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003533,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003541,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003529,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003530,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003532,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003540,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003531,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003539,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003534,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003542,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003535,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003543,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003536,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003544,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003528,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003556,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003564,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003557,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003565,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003552,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003560,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003548,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003549,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003551,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003559,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003550,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003558,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003553,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgb8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003561,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgb8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003554,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003562,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003555,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003563,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003547,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003290,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb9_e5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003298,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb9_e5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003291,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb9_e5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003299,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003286,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb9_e5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003294,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003282,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgb9_e5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003283,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003285,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb9_e5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003293,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003284,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb9_e5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003292,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb9_e5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003287,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb9_e5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003295,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb9_e5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003288,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgb9_e5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003296,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgb9_e5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003289,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgb9_e5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003297,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003281,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgb9_e5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003024,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003032,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003025,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003033,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003020,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003028,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003016,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003017,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003019,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003027,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003018,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003026,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003021,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgba12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003029,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003022,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003030,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003023,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003031,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003015,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003043,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003051,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003044,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003052,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003039,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003047,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003035,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003036,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003038,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003046,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003037,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003045,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003040,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgba16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003048,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003041,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003049,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003042,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003050,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003034,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003062,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003070,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003063,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003071,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003058,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003066,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003054,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".rgba16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003055,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.rgba16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003057,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003065,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.rgba16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003056,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003064,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003059,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003067,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003060,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003068,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003061,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003069,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003053,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.rgba16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003176,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003184,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003177,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003185,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003172,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003180,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003168,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003169,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003171,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003179,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003170,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003178,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003173,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003181,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003174,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003182,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003175,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003183,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003167,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003689,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003697,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003690,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003698,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003685,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003693,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003681,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003682,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003684,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003692,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003683,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003691,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003686,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003694,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003687,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003695,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003688,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003696,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003680,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003708,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003716,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003709,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003717,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003704,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003712,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003700,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003701,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003703,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003711,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003702,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003710,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003705,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003713,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003706,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003714,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003707,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003715,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003699,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003252,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003260,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003253,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003261,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003248,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003256,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003244,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003245,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003247,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003255,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003246,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003254,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003249,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003257,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003250,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003258,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003251,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003259,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003243,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003727,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003735,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003728,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003736,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003723,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003731,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003719,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003720,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003722,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003730,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003721,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003729,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003724,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003732,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003725,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003733,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003726,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003734,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003718,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003746,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003754,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003747,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003755,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003742,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003750,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003738,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003739,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003741,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003749,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003740,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003748,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003743,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003751,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003744,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003752,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003745,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003753,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003737,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003651,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003659,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003652,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003660,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003647,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003655,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003643,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003644,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003646,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003654,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003645,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003653,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003648,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgba8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003656,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003649,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003657,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003650,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003658,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003642,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003670,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003678,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003671,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003679,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003666,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003674,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003662,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003663,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003665,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003673,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003664,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003672,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003667,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003675,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003668,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003676,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003669,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rgba8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003677,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003661,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rgba8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003100,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003108,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003101,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003109,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003096,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003104,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003092,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".srgb8_alpha8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003093,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.srgb8_alpha8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003095,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_alpha8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003103,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.srgb8_alpha8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003094,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003102,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003097,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.srgb8_alpha8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003105,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.srgb8_alpha8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003098,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003106,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003099,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_alpha8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003107,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.srgb8_alpha8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003091,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.srgb8_alpha8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003081,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.srgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003089,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003082,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.srgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003090,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003077,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.srgb8_format_blue");
