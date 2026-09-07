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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004246,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004239,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004247,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004231,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004996,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004992,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004993,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004995,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004994,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004997,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004998,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004999,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004991,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004126,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004134,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004127,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004135,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004122,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004130,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004118,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004119,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004121,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004129,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004120,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004128,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004123,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004131,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004124,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004132,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004125,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004133,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004117,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004563,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb10_a2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004571,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_a2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004564,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004572,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004559,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004567,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004555,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004556,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004558,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004566,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004557,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb10_a2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004565,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_a2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004560,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb10_a2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004568,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_a2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004561,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb10_a2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004569,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_a2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004562,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004570,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004554,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004582,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004590,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004583,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb10_a2ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004591,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004578,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb10_a2ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004586,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004574,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgb10_a2ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004575,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004577,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb10_a2ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004585,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004576,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004584,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004579,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004587,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004580,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb10_a2ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004588,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_a2ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004581,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb10_a2ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004589,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004573,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb10_a2ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004392,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004400,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004393,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004401,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004388,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004396,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004384,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb10_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004385,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004387,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb10_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004395,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004386,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004394,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004389,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb10_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004397,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb10_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004390,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004398,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004391,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb10_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004399,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb10_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004383,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb10_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004411,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004419,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004412,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004420,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004407,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004415,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004403,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004404,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004406,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004414,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004405,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004413,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004408,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004416,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004409,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004417,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004410,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004418,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004402,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004430,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004438,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004431,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004439,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004426,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004434,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004422,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004423,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004425,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004433,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004424,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004432,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004427,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004435,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004428,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004436,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004429,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004437,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004421,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004449,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004457,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004450,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004458,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004445,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004453,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004441,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.rgb16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004442,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgb16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004444,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004452,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgb16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004443,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004451,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004446,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004454,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004447,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004455,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004448,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004456,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004440,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgb16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004734,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004742,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004735,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004743,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004730,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004738,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004726,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004727,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004729,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004737,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004728,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004736,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004731,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004739,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004732,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004740,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004733,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004741,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004725,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004810,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004818,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004811,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004819,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004806,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004814,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004802,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004803,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004805,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004813,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004804,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004812,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004807,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004815,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004808,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004816,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004809,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004817,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004801,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004316,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004324,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004317,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004325,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004312,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004320,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004308,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004309,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004311,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004319,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004310,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004318,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004313,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004321,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004314,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004322,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004315,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004323,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004307,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004506,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004514,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004507,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004515,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004502,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004510,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004498,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb5_a1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004499,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb5_a1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004501,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb5_a1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004509,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb5_a1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004500,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004508,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004503,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb5_a1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004511,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_a1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004504,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004512,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004505,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb5_a1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004513,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_a1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004497,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb5_a1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004335,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004343,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004336,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004344,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004331,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004339,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004327,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004328,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004330,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004338,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004329,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004337,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004332,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004340,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004333,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004341,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004334,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004342,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004326,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004354,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004362,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004355,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004363,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004350,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004358,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004346,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004347,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004349,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004357,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004348,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004356,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004351,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004359,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004352,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgb8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004360,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004353,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004361,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004345,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004373,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004381,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004374,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004382,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004369,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004377,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004365,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgb8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004366,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004368,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004376,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004367,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004375,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004370,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004378,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004371,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004379,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004372,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgb8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004380,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004364,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004867,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004875,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004868,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004876,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004863,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004871,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004859,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb9_e5_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004860,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb9_e5_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004862,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb9_e5_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004870,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb9_e5_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004861,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004869,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004864,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb9_e5_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004872,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb9_e5_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004865,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004873,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004866,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb9_e5_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004874,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb9_e5_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004858,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb9_e5_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004601,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba12_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004609,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba12_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004602,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba12_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004610,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004597,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba12_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004605,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004593,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba12_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004594,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004596,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba12_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004604,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004595,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba12_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004603,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba12_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004598,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba12_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004606,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba12_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004599,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba12_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004607,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba12_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004600,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba12_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004608,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004592,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba12_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004620,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004628,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004621,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004629,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004616,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004624,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004612,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004613,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004615,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004623,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004614,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004622,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004617,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004625,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004618,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004626,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004619,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004627,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004611,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004639,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004647,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004640,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004648,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004635,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004643,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004631,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.rgba16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004632,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004634,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004642,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004633,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004641,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004636,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004644,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004637,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004645,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004638,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004646,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004630,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004753,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004761,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004754,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004762,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004749,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004757,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004745,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004746,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004748,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgba16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004756,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004747,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004755,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004750,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004758,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004751,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004759,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004752,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004760,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004744,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004468,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004476,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004469,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004477,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004464,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004472,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004460,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004461,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004463,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004471,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004462,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004470,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004465,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgba2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004473,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004466,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004474,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004467,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004475,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004459,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004829,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004837,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004830,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004838,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004825,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004833,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004821,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004822,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004824,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgba32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004832,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004823,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004831,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004826,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004834,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004827,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004835,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004828,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004836,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004820,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004487,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004495,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004488,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004496,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004483,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004491,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004479,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba4_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004480,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba4_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004482,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba4_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004490,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba4_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004481,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004489,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004484,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgba4_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004492,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba4_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004485,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004493,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004486,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba4_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004494,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba4_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004478,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba4_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004525,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004533,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004526,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004534,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004521,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004529,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004517,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004518,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004520,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgba8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004528,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004519,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004527,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004522,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rgba8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004530,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004523,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004531,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004524,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgba8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004532,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004516,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgba8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004544,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004552,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004545,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004553,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004540,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004548,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004536,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.rgba8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004537,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004539,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgba8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004547,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004538,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004546,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004541,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgba8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004549,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgba8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004542,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004550,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004543,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rgba8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004551,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgba8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004535,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rgba8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004677,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.srgb8_alpha8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004685,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.srgb8_alpha8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004678,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_alpha8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004686,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004673,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_alpha8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004681,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004669,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.srgb8_alpha8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004670,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004672,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_alpha8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004680,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004671,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.srgb8_alpha8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004679,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.srgb8_alpha8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004674,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.srgb8_alpha8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004682,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.srgb8_alpha8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004675,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.srgb8_alpha8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004683,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.srgb8_alpha8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004676,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_alpha8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004684,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004668,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.srgb8_alpha8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004658,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.srgb8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004666,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004659,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.srgb8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004667,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.srgb8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004654,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.srgb8_format_blue");
