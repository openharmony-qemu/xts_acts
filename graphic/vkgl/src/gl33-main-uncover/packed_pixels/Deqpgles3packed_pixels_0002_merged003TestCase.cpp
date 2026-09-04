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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001508,
        "KHR-GL33.packed_pixels.rectan",
        "gle.srgb8_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001496,
        "KHR-GL33.packed_pixels.rectang",
        "le.srgb8_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001497,
        "KHR-GL33.packed_pixels.rectan",
        "gle.srgb8_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001499,
        "KHR-GL33.packed_pixels.re",
        "ctangle.srgb8_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001507,
        "KHR-GL33.packed_pixels.rectan",
        "gle.srgb8_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001498,
        "KHR-GL33.packed_pixels.r",
        "ectangle.srgb8_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001506,
        "KHR-GL33.packed_pixels.recta",
        "ngle.srgb8_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001501,
        "KHR-GL33.packed_pixels.r",
        "ectangle.srgb8_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001509,
        "KHR-GL33.packed_pixels.recta",
        "ngle.srgb8_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001502,
        "KHR-GL33.packed_pixels.r",
        "ectangle.srgb8_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001510,
        "KHR-GL33.packed_pixels.recta",
        "ngle.srgb8_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001503,
        "KHR-GL33.packed_pixels.re",
        "ctangle.srgb8_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001511,
        "KHR-GL33.packed_pixels.rectan",
        "gle.srgb8_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001495,
        "KHR-GL33.packed_pixels.rectan",
        "gle.srgb8_format_stencil_index");
