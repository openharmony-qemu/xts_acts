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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000915,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_component_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000923,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_component_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000916,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000924,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000911,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000919,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000907,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000908,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000910,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000918,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000909,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_component_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000917,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_component_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000912,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_component_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000920,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_component_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000913,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_component_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000921,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_component_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000914,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000922,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000906,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000934,
        "KHR-GL32.packed_pixels.recta",
        "ngle.depth_stencil_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000942,
        "KHR-GL32.packed_pixels.rectangle",
        ".depth_stencil_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000935,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_stencil_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000943,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000930,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_stencil_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000938,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000926,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_stencil_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000927,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000929,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_stencil_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000937,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000928,
        "KHR-GL32.packed_pixels.recta",
        "ngle.depth_stencil_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000936,
        "KHR-GL32.packed_pixels.rectangle",
        ".depth_stencil_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000931,
        "KHR-GL32.packed_pixels.recta",
        "ngle.depth_stencil_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000939,
        "KHR-GL32.packed_pixels.rectangle",
        ".depth_stencil_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000932,
        "KHR-GL32.packed_pixels.recta",
        "ngle.depth_stencil_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000940,
        "KHR-GL32.packed_pixels.rectangle",
        ".depth_stencil_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000933,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth_stencil_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000941,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000925,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth_stencil_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000905,
        "KHR-GL32.packed_pixels.",
        "rectangle.initial_values");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000991,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000999,
        "KHR-GL32.packed_pixels.rect",
        "angle.r8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000992,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000987,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000995,
        "KHR-GL32.packed_pixels.rect",
        "angle.r8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000983,
        "KHR-GL32.packed_pixels.rectan",
        "gle.r8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000984,
        "KHR-GL32.packed_pixels.recta",
        "ngle.r8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000986,
        "KHR-GL32.packed_pixels.r",
        "ectangle.r8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000994,
        "KHR-GL32.packed_pixels.recta",
        "ngle.r8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000985,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000993,
        "KHR-GL32.packed_pixels.rect",
        "angle.r8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000988,
        "KHR-GL32.packed_pixels",
        ".rectangle.r8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000996,
        "KHR-GL32.packed_pixels.rec",
        "tangle.r8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000989,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000997,
        "KHR-GL32.packed_pixels.rect",
        "angle.r8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000990,
        "KHR-GL32.packed_pixels.",
        "rectangle.r8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000998,
        "KHR-GL32.packed_pixels.rect",
        "angle.r8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000982,
        "KHR-GL32.packed_pixels.recta",
        "ngle.r8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000953,
        "KHR-GL32.packed_pixels.",
        "rectangle.red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000961,
        "KHR-GL32.packed_pixels.rect",
        "angle.red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000954,
        "KHR-GL32.packed_pixels.r",
        "ectangle.red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000962,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000949,
        "KHR-GL32.packed_pixels.r",
        "ectangle.red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000957,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000945,
        "KHR-GL32.packed_pixels.rectan",
        "gle.red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000946,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000948,
        "KHR-GL32.packed_pixels.r",
        "ectangle.red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000956,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000947,
        "KHR-GL32.packed_pixels.",
        "rectangle.red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000955,
        "KHR-GL32.packed_pixels.rect",
        "angle.red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000950,
        "KHR-GL32.packed_pixels.",
        "rectangle.red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000958,
        "KHR-GL32.packed_pixels.rect",
        "angle.red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000951,
        "KHR-GL32.packed_pixels.",
        "rectangle.red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000959,
        "KHR-GL32.packed_pixels.rect",
        "angle.red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000952,
        "KHR-GL32.packed_pixels.r",
        "ectangle.red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000960,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000944,
        "KHR-GL32.packed_pixels.recta",
        "ngle.red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000972,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000980,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000973,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000981,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000968,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000976,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000964,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000965,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000967,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000975,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000966,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000974,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000969,
        "KHR-GL32.packed_pixels",
        ".rectangle.rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000977,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000970,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000978,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000971,
        "KHR-GL32.packed_pixels.",
        "rectangle.rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000979,
        "KHR-GL32.packed_pixels.rect",
        "angle.rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000963,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rg_format_stencil_index");
