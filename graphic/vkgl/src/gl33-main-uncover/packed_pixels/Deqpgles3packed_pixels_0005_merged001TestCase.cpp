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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004001,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004002,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004000,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004031,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.compressed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004039,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004032,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.compressed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004040,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004027,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.compressed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004035,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004023,
        "KHR-GL33.packed_pixels.pbo_rectangle.co",
        "mpressed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004024,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004026,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.compressed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004034,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004025,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.compressed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004033,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004028,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.compressed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004036,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004029,
        "KHR-GL33.packed_pixels.pbo_rectan",
        "gle.compressed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004037,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004030,
        "KHR-GL33.packed_pixels.pbo_rectang",
        "le.compressed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004038,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004022,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004012,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004020,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004013,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_signed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004021,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004008,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_signed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004016,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004004,
        "KHR-GL33.packed_pixels.pbo_rectangle.compre",
        "ssed_signed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004005,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004007,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_signed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004015,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004006,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004014,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004009,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004017,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004010,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004018,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004011,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_signed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004019,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004003,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004050,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004058,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004051,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004059,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004046,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004054,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004042,
        "KHR-GL33.packed_pixels.pbo_rectangle.compre",
        "ssed_signed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004043,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004045,
        "KHR-GL33.packed_pixels.pbo_rectangle.c",
        "ompressed_signed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004053,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004044,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004052,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004047,
        "KHR-GL33.packed_pixels.pbo_rectangle",
        ".compressed_signed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004055,
        "KHR-GL33.packed_pixels.pbo_rectangle.com",
        "pressed_signed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004048,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004056,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004049,
        "KHR-GL33.packed_pixels.pbo_rectangle.",
        "compressed_signed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004057,
        "KHR-GL33.packed_pixels.pbo_rectangle.comp",
        "ressed_signed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004041,
        "KHR-GL33.packed_pixels.pbo_rectangle.compr",
        "essed_signed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004069,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004077,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004070,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004078,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004065,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004073,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004061,
        "KHR-GL33.packed_pixels.varied_rectangle",
        ".depth_component_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004062,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004064,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.depth_component_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004072,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004063,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004071,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004066,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_component_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004074,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_component_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004067,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004075,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004068,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_component_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004076,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_component_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004060,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_component_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004088,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004096,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004089,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004097,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004084,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004092,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004080,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.depth_stencil_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004081,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_stencil_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004083,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.depth_stencil_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004091,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_stencil_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004082,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004090,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004085,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.depth_stencil_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004093,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.depth_stencil_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004086,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004094,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004087,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.depth_stencil_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004095,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.depth_stencil_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004079,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.depth_stencil_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004848,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r11f_g11f_b10f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004856,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.r11f_g11f_b10f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004849,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r11f_g11f_b10f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004857,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004844,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r11f_g11f_b10f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004852,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004840,
        "KHR-GL33.packed_pixels.varied_rectangl",
        "e.r11f_g11f_b10f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004841,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004843,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r11f_g11f_b10f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004851,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004842,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r11f_g11f_b10f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004850,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.r11f_g11f_b10f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004845,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r11f_g11f_b10f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004853,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.r11f_g11f_b10f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004846,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r11f_g11f_b10f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004854,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.r11f_g11f_b10f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004847,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r11f_g11f_b10f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004855,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004839,
        "KHR-GL33.packed_pixels.varied_rectang",
        "le.r11f_g11f_b10f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004183,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004191,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004184,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004192,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004179,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004187,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004175,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004176,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004178,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004186,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004177,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004185,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004180,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004188,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004181,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004189,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004182,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004190,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004174,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004202,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004210,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004203,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004211,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004198,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004206,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004194,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.r16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004195,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.r16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004197,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004205,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.r16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004196,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004204,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004199,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004207,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004200,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004208,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004201,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004209,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004193,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.r16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004696,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004704,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004697,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004705,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004692,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004700,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004688,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004689,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004691,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004699,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004690,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004698,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004693,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004701,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004694,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004702,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004695,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004703,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004687,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004924,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004932,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004925,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004933,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004920,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004928,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004916,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004917,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004919,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004927,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004918,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004926,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004921,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004929,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004922,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004930,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004923,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004931,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004915,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004943,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004951,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004944,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004952,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004939,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004947,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004935,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004936,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004938,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004946,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004937,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004945,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004940,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004948,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004941,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004949,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004942,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004950,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004934,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004772,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004780,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004773,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004781,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004768,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004776,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004764,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004765,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004767,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004775,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004766,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004774,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004769,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004777,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004770,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004778,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004771,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004779,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004763,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004962,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004970,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004963,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004971,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004958,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004966,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004954,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004955,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004957,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004965,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004956,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004964,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004959,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004967,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004960,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004968,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004961,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004969,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004953,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004981,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004989,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004982,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004990,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004977,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004985,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004973,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004974,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004976,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004984,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004975,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004983,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004978,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004986,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004979,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004987,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004980,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004988,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004972,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004297,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r3_g3_b2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004305,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r3_g3_b2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004298,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r3_g3_b2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004306,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004293,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r3_g3_b2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004301,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004289,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.r3_g3_b2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004290,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004292,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r3_g3_b2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004300,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004291,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r3_g3_b2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004299,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r3_g3_b2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004294,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r3_g3_b2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004302,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r3_g3_b2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004295,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r3_g3_b2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004303,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r3_g3_b2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004296,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r3_g3_b2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004304,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004288,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r3_g3_b2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004145,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004153,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004146,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004154,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004141,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004149,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004137,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004138,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004140,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004148,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004139,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004147,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004142,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004150,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004143,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004151,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004144,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004152,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004136,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004164,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004172,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004165,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004173,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004160,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004168,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004156,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.r8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004157,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004159,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004167,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004158,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004166,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004161,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004169,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004162,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.r8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004170,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004163,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004171,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004155,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.r8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004886,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004894,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004887,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004895,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004882,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004890,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004878,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004879,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004881,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004889,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004880,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004888,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004883,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.r8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004891,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.r8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004884,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004892,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004885,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004893,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004877,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004905,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004913,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004906,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004914,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004901,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004909,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004897,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.r8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004898,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004900,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004908,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004899,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004907,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004902,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004910,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004903,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.r8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004911,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.r8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004904,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.r8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004912,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004896,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.r8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004107,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004115,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004108,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004116,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004103,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004111,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004099,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004100,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004102,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004110,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004101,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004109,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004104,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004112,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004105,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004113,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004106,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004114,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004098,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004259,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004267,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004260,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004268,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004255,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004263,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004251,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004252,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004254,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004262,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004253,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004261,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004256,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004264,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004257,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004265,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004258,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004266,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004250,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004278,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg16_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004286,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004279,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004287,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004274,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004282,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004270,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rg16_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004271,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004273,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004281,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004272,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg16_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004280,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004275,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg16_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004283,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004276,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg16_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004284,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004277,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004285,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004269,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg16_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004715,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004723,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004716,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004724,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004711,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004719,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004707,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004708,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004710,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004718,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004709,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004717,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004712,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004720,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004713,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004721,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004714,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004722,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004706,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004791,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004799,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004792,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004800,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004787,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004795,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004783,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004784,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004786,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004794,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004785,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004793,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004788,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004796,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004789,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004797,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004790,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004798,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004782,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004221,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004229,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004222,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004230,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004217,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004225,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004213,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004214,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004216,
        "KHR-GL33.packed_pixels.varie",
        "d_rectangle.rg8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004224,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004215,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004223,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004218,
        "KHR-GL33.packed_pixels.var",
        "ied_rectangle.rg8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004226,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004219,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004227,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004220,
        "KHR-GL33.packed_pixels.vari",
        "ed_rectangle.rg8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004228,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004212,
        "KHR-GL33.packed_pixels.varied_re",
        "ctangle.rg8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004240,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004248,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004241,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004249,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004236,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004244,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004232,
        "KHR-GL33.packed_pixels.varied_rectan",
        "gle.rg8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004233,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004235,
        "KHR-GL33.packed_pixels.varied_r",
        "ectangle.rg8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004243,
        "KHR-GL33.packed_pixels.varied_recta",
        "ngle.rg8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004234,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004242,
        "KHR-GL33.packed_pixels.varied_rect",
        "angle.rg8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004237,
        "KHR-GL33.packed_pixels.varied",
        "_rectangle.rg8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004245,
        "KHR-GL33.packed_pixels.varied_rec",
        "tangle.rg8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004238,
        "KHR-GL33.packed_pixels.varied_",
        "rectangle.rg8_snorm_format_rgb");
