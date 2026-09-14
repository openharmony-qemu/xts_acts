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

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005109,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgb8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005117,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005108,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005116,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005111,
        "KHR-GL32.packed_pixels.vari",
        "ed_rectangle.rgb8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005119,
        "KHR-GL32.packed_pixels.varied_r",
        "ectangle.rgb8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005112,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005120,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005113,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005121,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005105,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005133,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005141,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005134,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgb8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005142,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005129,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgb8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005137,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005125,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgb8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005126,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005128,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgb8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005136,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005127,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005135,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005130,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005138,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005131,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgb8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005139,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgb8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005132,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgb8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005140,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005124,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgb8ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005266,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005274,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005267,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005275,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005262,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005270,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005258,
        "KHR-GL32.packed_pixels.varied_recta",
        "ngle.rgba16i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005259,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005261,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba16i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005269,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005260,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005268,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005263,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba16i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005271,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba16i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005264,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005272,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005265,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005273,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005257,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005285,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005293,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005286,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba16ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005294,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005281,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba16ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005289,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005277,
        "KHR-GL32.packed_pixels.varied_recta",
        "ngle.rgba16ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005278,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005280,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba16ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005288,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005279,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005287,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005282,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005290,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005283,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba16ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005291,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba16ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005284,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba16ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005292,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005276,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba16ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005304,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005312,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005305,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005313,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005300,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005308,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005296,
        "KHR-GL32.packed_pixels.varied_recta",
        "ngle.rgba32i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005297,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005299,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba32i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005307,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005298,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005306,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005301,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba32i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005309,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba32i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005302,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005310,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005303,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005311,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005295,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005323,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005331,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005324,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba32ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005332,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005319,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba32ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005327,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005315,
        "KHR-GL32.packed_pixels.varied_recta",
        "ngle.rgba32ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005316,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005318,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba32ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005326,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005317,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005325,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005320,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005328,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005321,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba32ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005329,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba32ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005322,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba32ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005330,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005314,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba32ui_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005228,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba8i_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005236,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba8i_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005229,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8i_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005237,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005224,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8i_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005232,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005220,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba8i_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005221,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005223,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8i_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005231,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005222,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba8i_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005230,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba8i_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005225,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba8i_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005233,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba8i_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005226,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba8i_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005234,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba8i_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005227,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8i_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005235,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005219,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8i_format_stencil_index");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005247,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_bgr");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005255,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_bgr_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005248,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_bgra");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005256,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_bgra_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005243,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005251,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005239,
        "KHR-GL32.packed_pixels.varied_recta",
        "ngle.rgba8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005240,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005242,
        "KHR-GL32.packed_pixels.varied_",
        "rectangle.rgba8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005250,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005241,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005249,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005244,
        "KHR-GL32.packed_pixels.varie",
        "d_rectangle.rgba8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005252,
        "KHR-GL32.packed_pixels.varied_re",
        "ctangle.rgba8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005245,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005253,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005246,
        "KHR-GL32.packed_pixels.varied",
        "_rectangle.rgba8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005254,
        "KHR-GL32.packed_pixels.varied_rec",
        "tangle.rgba8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005238,
        "KHR-GL32.packed_pixels.varied_rect",
        "angle.rgba8ui_format_stencil_index");
