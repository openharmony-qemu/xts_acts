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

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002097,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_blue_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002085,
        "KHR-GL32.packed_pixels.rectangl",
        "e.rgba8ui_format_depth_component");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002086,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002088,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba8ui_format_green");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002096,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_green_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002087,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8ui_format_red");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002095,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8ui_format_red_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002090,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8ui_format_rg");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002098,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8ui_format_rg_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002091,
        "KHR-GL32.packed_pixels.re",
        "ctangle.rgba8ui_format_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002099,
        "KHR-GL32.packed_pixels.rectan",
        "gle.rgba8ui_format_rgb_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002092,
        "KHR-GL32.packed_pixels.rec",
        "tangle.rgba8ui_format_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002100,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_rgba_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002084,
        "KHR-GL32.packed_pixels.rectang",
        "le.rgba8ui_format_stencil_index");
