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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005456,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005464,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005457,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005465,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005452,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005460,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005448,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005449,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005451,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005459,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005450,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005458,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005453,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005461,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005454,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005462,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005455,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005463,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005447,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005570,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005578,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005571,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005579,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005566,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005574,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005562,
        "KHR-GL33.packed_pixels.varied_rectangle.c",
        "ompressed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005563,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005565,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005573,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005564,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005572,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005567,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005575,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005568,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005576,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005569,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005577,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005561,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005475,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005483,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005476,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005484,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005471,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005479,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005467,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005468,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005470,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005478,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005469,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005477,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005472,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.compressed_rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005480,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005473,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005481,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005474,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005482,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005466,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rg_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005608,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005616,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005609,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005617,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005604,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005612,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005600,
        "KHR-GL33.packed_pixels.varied_rectangle.c",
        "ompressed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005601,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005603,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005611,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005602,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005610,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005605,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.compressed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005613,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005606,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005614,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005607,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005615,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005599,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005494,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005502,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005495,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005503,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005490,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005498,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005486,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005487,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005489,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005497,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005488,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005496,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005491,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005499,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005492,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005500,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005493,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005501,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005485,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005513,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005521,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005514,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005522,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005509,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005517,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005505,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_rgba_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005506,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rgba_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005508,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.compressed_rgba_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005516,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rgba_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005507,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005515,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005510,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_rgba_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005518,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_rgba_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005511,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005519,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005512,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_rgba_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005520,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_rgba_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005504,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_rgba_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005589,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005597,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005590,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005598,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005585,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005593,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005581,
        "KHR-GL33.packed_pixels.varied_rectangle.compr",
        "essed_signed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005582,
        "KHR-GL33.packed_pixels.varied_rectangle.comp",
        "ressed_signed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005584,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_signed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005592,
        "KHR-GL33.packed_pixels.varied_rectangle.comp",
        "ressed_signed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005583,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005591,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005586,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_signed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005594,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_signed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005587,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005595,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005588,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005596,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005580,
        "KHR-GL33.packed_pixels.varied_rectangle.comp",
        "ressed_signed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005627,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_signed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005635,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_signed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005628,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005636,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005623,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005631,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005619,
        "KHR-GL33.packed_pixels.varied_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005620,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005622,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005630,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005621,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_signed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005629,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_signed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005624,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_signed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005632,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_signed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005625,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_signed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005633,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_signed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005626,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_signed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005634,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005618,
        "KHR-GL33.packed_pixels.varied_rectangle.com",
        "pressed_signed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005551,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005559,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005552,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005560,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005547,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005555,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005543,
        "KHR-GL33.packed_pixels.varied_rectangle.co",
        "mpressed_srgb_alpha_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005544,
        "KHR-GL33.packed_pixels.varied_rectangle.c",
        "ompressed_srgb_alpha_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005546,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_alpha_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005554,
        "KHR-GL33.packed_pixels.varied_rectangle.c",
        "ompressed_srgb_alpha_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005545,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005553,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005548,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.compressed_srgb_alpha_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005556,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_srgb_alpha_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005549,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005557,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005550,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_alpha_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005558,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "compressed_srgb_alpha_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005542,
        "KHR-GL33.packed_pixels.varied_rectangle.c",
        "ompressed_srgb_alpha_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005532,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005540,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005533,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005541,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005528,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005536,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005524,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".compressed_srgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005525,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_srgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005527,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.compressed_srgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005535,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_srgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005526,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005534,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005529,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.compressed_srgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005537,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.compressed_srgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005530,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005538,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005531,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.compressed_srgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005539,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.compressed_srgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005523,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.compressed_srgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005418,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth24_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005426,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth24_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005419,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth24_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005427,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005414,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth24_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005422,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005410,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth24_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005411,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005413,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth24_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005421,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005412,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth24_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005420,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth24_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005415,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth24_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005423,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth24_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005416,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth24_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005424,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth24_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005417,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth24_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005425,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005409,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth24_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005437,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005445,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005438,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005446,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005433,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005441,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005429,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "depth32f_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005430,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth32f_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005432,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth32f_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005440,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth32f_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005431,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005439,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005434,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth32f_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005442,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth32f_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005435,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005443,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005436,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth32f_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005444,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth32f_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005428,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth32f_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005342,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005350,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005343,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005351,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005338,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005346,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005334,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "depth_component16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005335,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005337,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005345,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005336,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005344,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005339,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005347,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005340,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005348,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005341,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005349,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005333,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005361,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005369,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005362,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005370,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005357,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005365,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005353,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "depth_component24_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005354,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component24_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005356,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component24_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005364,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component24_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005355,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005363,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005358,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component24_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005366,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component24_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005359,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005367,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005360,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component24_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005368,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component24_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005352,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component24_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005380,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005388,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005381,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005389,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005376,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005384,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005372,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "depth_component32_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005373,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005375,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component32_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005383,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005374,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005382,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005377,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component32_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005385,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component32_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005378,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005386,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005379,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005387,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005371,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005399,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005407,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005400,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005408,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005395,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005403,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005391,
        "KHR-GL33.packed_pixels.varied_rectangle.",
        "depth_component32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005392,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005394,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005402,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005393,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005401,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005396,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005404,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005397,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005405,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005398,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_component32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005406,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005390,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005038,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005046,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005039,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005047,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005034,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005042,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005030,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005031,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005033,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005041,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005032,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005040,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005035,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005043,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005036,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005044,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005037,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005045,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005029,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005057,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005065,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005058,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005066,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005053,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005061,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005049,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005050,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005052,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005060,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005051,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005059,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005054,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005062,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005055,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005063,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005056,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005064,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005048,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005076,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005084,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005077,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005085,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005072,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005080,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005068,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005069,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005071,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005079,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005070,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005078,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005073,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005081,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005074,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005082,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005075,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005083,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005067,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005095,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005103,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005096,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005104,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005091,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005099,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005087,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005088,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005090,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005098,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005089,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005097,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005092,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005100,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005093,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005101,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005094,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005102,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005086,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005000,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005008,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005001,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005009,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005004,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005003,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005002,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005005,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005006,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005007,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005019,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005027,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005020,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005028,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005015,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005023,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005011,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005012,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005014,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005022,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005013,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005021,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005016,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005024,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005017,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005025,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005018,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005026,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005010,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005152,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005160,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005153,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005161,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005148,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005156,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005144,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005145,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005147,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005155,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005146,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005154,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005149,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005157,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005150,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005158,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005151,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005159,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005143,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005171,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005179,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005172,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005180,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005167,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005175,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005163,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005164,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005166,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005174,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005165,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005173,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005168,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005176,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005169,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005177,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005170,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005178,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005162,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005190,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005198,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005191,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005199,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005186,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005194,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005182,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005183,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005185,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005193,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005184,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005192,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005187,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005195,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005188,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005196,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005189,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005197,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005181,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005209,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005217,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005210,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005218,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005205,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005213,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005201,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rgb32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005202,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005204,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rgb32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005212,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005203,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005211,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005206,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005214,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005207,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005215,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005208,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rgb32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005216,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005200,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005114,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005122,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005115,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005123,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005110,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rgb8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005118,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rgb8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005106,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rgb8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005107,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rgb8i_format_depth_stencil");
