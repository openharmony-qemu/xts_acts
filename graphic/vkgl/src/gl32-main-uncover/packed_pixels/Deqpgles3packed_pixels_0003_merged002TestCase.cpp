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

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002946,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.rgba8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002954,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002947,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.rgba8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002955,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002939,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.rgba8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002967,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba8_snorm_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002975,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8_snorm_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002968,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8_snorm_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002976,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002963,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8_snorm_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002971,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002959,
        "KHR-GL32.packed_pixels.pbo_rectangl",
        "e.rgba8_snorm_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002960,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002962,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8_snorm_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002970,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002961,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba8_snorm_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002969,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8_snorm_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002964,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba8_snorm_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002972,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8_snorm_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002965,
        "KHR-GL32.packed_pixels.pbo_re",
        "ctangle.rgba8_snorm_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002973,
        "KHR-GL32.packed_pixels.pbo_rectan",
        "gle.rgba8_snorm_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002966,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.rgba8_snorm_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002974,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002958,
        "KHR-GL32.packed_pixels.pbo_rectang",
        "le.rgba8_snorm_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002302,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002310,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002303,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002311,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002298,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002306,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002294,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_red_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002295,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_red_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002297,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_red_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002305,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_red_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002296,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002304,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002299,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_red_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002307,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002300,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002308,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002301,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_red_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002309,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002293,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_red_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002416,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002424,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002417,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002425,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002412,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002420,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002408,
        "KHR-GL32.packed_pixels.rectangle.compr",
        "essed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002409,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002411,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002419,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002410,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002418,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002413,
        "KHR-GL32.packed_pixels.rectangl",
        "e.compressed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002421,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002414,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002422,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002415,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002423,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002407,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002321,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_rg_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002329,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002322,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rg_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002330,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002317,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rg_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002325,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002313,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rg_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002314,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002316,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rg_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002324,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002315,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_rg_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002323,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002318,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_rg_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002326,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002319,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_rg_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002327,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002320,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rg_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002328,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002312,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rg_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002454,
        "KHR-GL32.packed_pixels.rectangl",
        "e.compressed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002462,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002455,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002463,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002450,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002458,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002446,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002447,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002449,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002457,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002448,
        "KHR-GL32.packed_pixels.rectangl",
        "e.compressed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002456,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002451,
        "KHR-GL32.packed_pixels.rectangl",
        "e.compressed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002459,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002452,
        "KHR-GL32.packed_pixels.rectangl",
        "e.compressed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002460,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002453,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002461,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002445,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002340,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002348,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002341,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002349,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002336,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002344,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002332,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002333,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002335,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_rgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002343,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002334,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002342,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002337,
        "KHR-GL32.packed_pixels.recta",
        "ngle.compressed_rgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002345,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_rgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002338,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002346,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002339,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002347,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002331,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002359,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgba_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002367,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgba_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002360,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_rgba_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002368,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002355,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_rgba_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002363,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002351,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_rgba_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002352,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002354,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_rgba_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002362,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002353,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgba_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002361,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgba_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002356,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgba_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002364,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgba_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002357,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_rgba_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002365,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_rgba_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002358,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_rgba_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002366,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002350,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_rgba_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002435,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_red_rgtc1_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002443,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_red_rgtc1_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002436,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_signed_red_rgtc1_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002444,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002431,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_signed_red_rgtc1_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002439,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002427,
        "KHR-GL32.packed_pixels.rectangle.compress",
        "ed_signed_red_rgtc1_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002428,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002430,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_signed_red_rgtc1_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002438,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002429,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_red_rgtc1_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002437,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_red_rgtc1_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002432,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_red_rgtc1_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002440,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_red_rgtc1_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002433,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_red_rgtc1_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002441,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_red_rgtc1_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002434,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_signed_red_rgtc1_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002442,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002426,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_red_rgtc1_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002473,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002481,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002474,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002482,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002469,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002477,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002465,
        "KHR-GL32.packed_pixels.rectangle.compress",
        "ed_signed_rg_rgtc2_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002466,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_rg_rgtc2_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002468,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_signed_rg_rgtc2_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002476,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_rg_rgtc2_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002467,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002475,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002470,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_signed_rg_rgtc2_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002478,
        "KHR-GL32.packed_pixels.rectangle.compr",
        "essed_signed_rg_rgtc2_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002471,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002479,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002472,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_signed_rg_rgtc2_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002480,
        "KHR-GL32.packed_pixels.rectangle.compre",
        "ssed_signed_rg_rgtc2_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002464,
        "KHR-GL32.packed_pixels.rectangle.compres",
        "sed_signed_rg_rgtc2_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002397,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_srgb_alpha_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002405,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_srgb_alpha_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002398,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_alpha_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002406,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002393,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_alpha_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002401,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002389,
        "KHR-GL32.packed_pixels.rectangle.compr",
        "essed_srgb_alpha_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002390,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002392,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_alpha_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002400,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002391,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_srgb_alpha_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002399,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_srgb_alpha_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002394,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_srgb_alpha_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002402,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_srgb_alpha_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002395,
        "KHR-GL32.packed_pixels.rectangle",
        ".compressed_srgb_alpha_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002403,
        "KHR-GL32.packed_pixels.rectangle.com",
        "pressed_srgb_alpha_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002396,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_alpha_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002404,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002388,
        "KHR-GL32.packed_pixels.rectangle.comp",
        "ressed_srgb_alpha_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002378,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_srgb_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002386,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002379,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_srgb_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002387,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002374,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_srgb_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002382,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002370,
        "KHR-GL32.packed_pixels.rectangle.co",
        "mpressed_srgb_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002371,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002373,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_srgb_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002381,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002372,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_srgb_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002380,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002375,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_srgb_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002383,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002376,
        "KHR-GL32.packed_pixels.rectan",
        "gle.compressed_srgb_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002384,
        "KHR-GL32.packed_pixels.rectangle.",
        "compressed_srgb_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002377,
        "KHR-GL32.packed_pixels.rectang",
        "le.compressed_srgb_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002385,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002369,
        "KHR-GL32.packed_pixels.rectangle.c",
        "ompressed_srgb_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002264,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002272,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002265,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002273,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002260,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002268,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002256,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th24_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002257,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth24_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002259,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth24_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002267,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth24_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002258,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002266,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002261,
        "KHR-GL32.packed_pixels.rectan",
        "gle.depth24_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002269,
        "KHR-GL32.packed_pixels.rectangle.",
        "depth24_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002262,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002270,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002263,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth24_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002271,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth24_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002255,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth24_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002283,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth32f_stencil8_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002291,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth32f_stencil8_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002284,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth32f_stencil8_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002292,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002279,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth32f_stencil8_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002287,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002275,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th32f_stencil8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002276,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002278,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth32f_stencil8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002286,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002277,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth32f_stencil8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002285,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth32f_stencil8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002280,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth32f_stencil8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002288,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth32f_stencil8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002281,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth32f_stencil8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002289,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth32f_stencil8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002282,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth32f_stencil8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002290,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002274,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth32f_stencil8_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002188,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component16_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002196,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component16_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002189,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component16_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002197,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002184,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component16_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002192,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002180,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component16_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002181,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002183,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component16_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002191,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002182,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component16_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002190,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component16_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002185,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component16_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002193,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component16_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002186,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component16_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002194,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component16_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002187,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component16_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002195,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002179,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component16_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002207,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component24_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002215,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component24_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002208,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component24_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002216,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002203,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component24_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002211,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002199,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component24_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002200,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002202,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component24_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002210,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002201,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component24_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002209,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component24_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002204,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component24_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002212,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component24_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002205,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component24_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002213,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component24_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002206,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component24_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002214,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002198,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component24_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002226,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component32_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002234,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component32_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002227,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002235,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002222,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002230,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002218,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component32_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002219,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002221,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002229,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002220,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component32_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002228,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component32_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002223,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component32_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002231,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component32_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002224,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component32_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002232,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component32_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002225,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002233,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002217,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002245,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002253,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002246,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002254,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002241,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002249,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002237,
        "KHR-GL32.packed_pixels.rectangle.dept",
        "h_component32f_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002238,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component32f_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002240,
        "KHR-GL32.packed_pixels.rectangle",
        ".depth_component32f_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002248,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component32f_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002239,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002247,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002242,
        "KHR-GL32.packed_pixels.rectang",
        "le.depth_component32f_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002250,
        "KHR-GL32.packed_pixels.rectangle.d",
        "epth_component32f_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002243,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002251,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002244,
        "KHR-GL32.packed_pixels.rectangl",
        "e.depth_component32f_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002252,
        "KHR-GL32.packed_pixels.rectangle.de",
        "pth_component32f_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002236,
        "KHR-GL32.packed_pixels.rectangle.dep",
        "th_component32f_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002006,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002007,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002002,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002001,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002000,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002003,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002004,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002005,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002017,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002025,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002018,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002026,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002013,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002021,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002009,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002010,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002012,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002020,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002011,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002019,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002014,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002022,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002015,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002023,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002016,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002024,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002008,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002036,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002044,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002037,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002045,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002032,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002040,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002028,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002029,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002031,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002039,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002030,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002038,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002033,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgb32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002041,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgb32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002034,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002042,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002035,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002043,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002027,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002055,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002063,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002056,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002064,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002051,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002059,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002047,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgb32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002048,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002050,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002058,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002049,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002057,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002052,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002060,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002053,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgb32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002061,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgb32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002054,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgb32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002062,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002046,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgb32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002112,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002120,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002113,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002121,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002108,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002116,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002104,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002105,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002107,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002115,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002106,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002114,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002109,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002117,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002110,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002118,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002111,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002119,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002103,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002131,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002139,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002132,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002140,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002127,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002135,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002123,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002124,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002126,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002134,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002125,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002133,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002128,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002136,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002129,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002137,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002130,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002138,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002122,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002150,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002158,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002151,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002159,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002146,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002154,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002142,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002143,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002145,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002153,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002144,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002152,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002147,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002155,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002148,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002156,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002149,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002157,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002141,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002169,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002177,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002170,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002178,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002165,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002173,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002161,
        "KHR-GL32.packed_pixels.rectangle",
        ".rgba32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002162,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002164,
        "KHR-GL32.packed_pixels.rect",
        "angle.rgba32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002172,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002163,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002171,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002166,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002174,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002167,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002175,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002168,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002176,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002160,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002074,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002082,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002075,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002083,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002070,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002078,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002066,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002067,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002069,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002077,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002068,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002076,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002071,
        "KHR-GL32.packed_pixels.r",
        "ectangle.rgba8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002079,
        "KHR-GL32.packed_pixels.recta",
        "ngle.rgba8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002072,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002080,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002073,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002081,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002065,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002093,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002101,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002094,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002102,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002089,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba8ui_format_blue");
