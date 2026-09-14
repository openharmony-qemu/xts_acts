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

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003085,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003073,
        "KHR-GL32.packed_pixels.pbo_recta",
        "ngle.srgb8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003074,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003076,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.srgb8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003084,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003075,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.srgb8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003083,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003078,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.srgb8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003086,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003079,
        "KHR-GL32.packed_pixels.pbo",
        "_rectangle.srgb8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003087,
        "KHR-GL32.packed_pixels.pbo_rec",
        "tangle.srgb8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003080,
        "KHR-GL32.packed_pixels.pbo_",
        "rectangle.srgb8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003088,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30004TestSuite, TestCase_003072,
        "KHR-GL32.packed_pixels.pbo_rect",
        "angle.srgb8_format_stencil_index");
