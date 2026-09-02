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

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003879,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003887,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003880,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003888,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003875,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003883,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003871,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "compressed_red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003872,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003874,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003882,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003873,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003881,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003876,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003884,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003877,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003885,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003878,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003886,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003870,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003993,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003994,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003989,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003997,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003985,
        "KHR-GL32.packed_pixels.pbo_rectangle.com",
        "pressed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003986,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003988,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003996,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003987,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003995,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003990,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.compressed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003998,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "compressed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003991,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003999,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003992,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003984,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003898,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003906,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003899,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003907,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003894,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003902,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003890,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003891,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003893,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003901,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003892,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003900,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003895,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003903,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003896,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003904,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003897,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003905,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003889,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rg_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003917,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003925,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003918,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003926,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003913,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003921,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003909,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "compressed_rgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003910,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003912,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_rgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003920,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003911,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003919,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003914,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.compressed_rgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003922,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_rgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003915,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003923,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003916,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003924,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003908,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003936,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgba_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003944,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgba_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003937,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_rgba_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003945,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003932,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_rgba_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003940,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003928,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "compressed_rgba_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003929,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003931,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_rgba_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003939,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003930,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgba_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003938,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgba_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003933,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgba_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003941,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgba_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003934,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_rgba_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003942,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_rgba_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003935,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_rgba_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003943,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003927,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_rgba_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003974,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_srgb_alpha_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003982,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_srgb_alpha_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003975,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_alpha_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003983,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003970,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_alpha_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003978,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003966,
        "KHR-GL32.packed_pixels.pbo_rectangle.com",
        "pressed_srgb_alpha_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003967,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003969,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_alpha_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003977,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003968,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_srgb_alpha_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003976,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_srgb_alpha_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003971,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_srgb_alpha_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003979,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_srgb_alpha_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003972,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.compressed_srgb_alpha_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003980,
        "KHR-GL32.packed_pixels.pbo_rectangle.c",
        "ompressed_srgb_alpha_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003973,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_alpha_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003981,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003965,
        "KHR-GL32.packed_pixels.pbo_rectangle.co",
        "mpressed_srgb_alpha_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003955,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_srgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003963,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003956,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_srgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003964,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003951,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_srgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003959,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003947,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "compressed_srgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003948,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003950,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_srgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003958,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003949,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_srgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003957,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003952,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_srgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003960,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003953,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.compressed_srgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003961,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.compressed_srgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003954,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.compressed_srgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003962,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003946,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".compressed_srgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003841,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003849,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003842,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003850,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003837,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003845,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003833,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth24_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003834,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth24_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003836,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth24_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003844,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth24_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003835,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003843,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003838,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.depth24_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003846,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.depth24_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003839,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003847,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003840,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth24_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003848,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth24_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003832,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth24_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003860,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth32f_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003868,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth32f_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003861,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth32f_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003869,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003856,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth32f_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003864,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003852,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth32f_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003853,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003855,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth32f_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003863,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003854,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth32f_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003862,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth32f_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003857,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth32f_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003865,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth32f_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003858,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth32f_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003866,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth32f_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003859,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth32f_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003867,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003851,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth32f_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003765,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003773,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003766,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003774,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003761,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003769,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003757,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003758,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003760,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003768,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003759,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003767,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003762,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003770,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003763,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003771,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003764,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003772,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003756,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003784,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component24_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003792,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component24_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003785,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component24_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003793,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003780,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component24_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003788,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003776,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component24_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003777,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003779,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component24_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003787,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003778,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component24_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003786,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component24_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003781,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component24_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003789,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component24_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003782,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component24_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003790,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component24_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003783,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component24_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003791,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003775,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component24_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003803,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component32_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003811,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component32_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003804,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003812,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003799,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003807,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003795,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component32_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003796,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003798,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003806,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003797,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component32_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003805,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component32_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003800,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component32_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003808,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component32_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003801,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component32_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003809,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component32_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003802,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003810,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003794,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003822,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003830,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003823,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003831,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003818,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003826,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003814,
        "KHR-GL32.packed_pixels.pbo_rectangle.de",
        "pth_component32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003815,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003817,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.depth_component32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003825,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003816,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003824,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003819,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.depth_component32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003827,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".depth_component32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003820,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003828,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003821,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.depth_component32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003829,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "depth_component32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003813,
        "KHR-GL32.packed_pixels.pbo_rectangle.d",
        "epth_component32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003271,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003279,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003272,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003280,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003267,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003275,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003263,
        "KHR-GL32.packed_pixels.pbo_rectangle.",
        "r11f_g11f_b10f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003264,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".r11f_g11f_b10f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003266,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r11f_g11f_b10f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003274,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".r11f_g11f_b10f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003265,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003273,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003268,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r11f_g11f_b10f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003276,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.r11f_g11f_b10f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003269,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003277,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003270,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r11f_g11f_b10f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003278,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.r11f_g11f_b10f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003262,
        "KHR-GL32.packed_pixels.pbo_rectangle",
        ".r11f_g11f_b10f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003119,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003127,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003120,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003128,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003115,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003123,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003111,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003112,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003114,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003122,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003113,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003121,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003116,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003124,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003117,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003125,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003118,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003126,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003110,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003347,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003355,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003348,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003356,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003343,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003351,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003339,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003340,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003342,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003350,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003341,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003349,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003344,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003352,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003345,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003353,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003346,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003354,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003338,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003366,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003374,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003367,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003375,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003362,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003370,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003358,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003359,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003361,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003369,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003360,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003368,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003363,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003371,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003364,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003372,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003365,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003373,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003357,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003195,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003203,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003196,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003204,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003191,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003199,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003187,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003188,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003190,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003198,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003189,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003197,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003192,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003200,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003193,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003201,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003194,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003202,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003186,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003385,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003393,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003386,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003394,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003381,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003389,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003377,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003378,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003380,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003388,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003379,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003387,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003382,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003390,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003383,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003391,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003384,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003392,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003376,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003404,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003412,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003405,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003413,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003400,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003408,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003396,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003397,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003399,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003407,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003398,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003406,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003401,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003409,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003402,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003410,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003403,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003411,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003395,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003309,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003317,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003310,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003318,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003305,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003313,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003301,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003302,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003304,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003312,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003303,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003311,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003306,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003314,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003307,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003315,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003308,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003316,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003300,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003328,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003336,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003329,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003337,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003324,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003332,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003320,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.r8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003321,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003323,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.r8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003331,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003322,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003330,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003325,
        "KHR-GL32.packed_pixels.pb",
        "o_rectangle.r8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003333,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.r8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003326,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003334,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003327,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.r8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003335,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.r8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003319,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.r8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003138,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003146,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003139,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003147,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003134,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003142,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003130,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg16f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003131,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003133,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003141,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003132,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003140,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003135,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003143,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003136,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003144,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003137,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003145,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003129,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003461,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003469,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003462,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003470,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003457,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003465,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003453,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003454,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003456,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003464,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003455,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003463,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003458,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003466,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003459,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003467,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003460,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003468,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003452,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003480,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003488,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003481,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003489,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003476,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003484,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003472,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rg16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003473,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003475,
        "KHR-GL32.packed_pixels.pbo_r",
        "ectangle.rg16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003483,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003474,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003482,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003477,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003485,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003478,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003486,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003479,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003487,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003471,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003214,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003222,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003215,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003223,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003210,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003218,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003206,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.rg32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003207,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003209,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003217,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003208,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003216,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003211,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003219,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003212,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003220,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003213,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rg32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003221,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003205,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rg32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003499,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rg32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003507,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rg32i_format_bgr_integer");
