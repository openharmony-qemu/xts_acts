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
#include "../ActsDeqpgles30010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009818,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009819,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009820,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009821,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009822,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_5_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009823,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_5_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009824,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_5_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009825,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_5_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009826,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_15_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009827,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_15_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009828,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_15_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009829,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_15_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009830,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_30_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009831,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_30_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009832,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_30_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009833,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_30_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009834,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009835,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009836,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009837,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009838,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009839,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009840,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009841,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_5_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009842,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_15_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009843,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_15_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009844,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_15_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009845,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_15_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009846,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_30_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009847,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_30_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009848,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_30_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009849,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_30_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009850,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009851,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009852,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009853,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009854,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_5_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009855,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_5_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009856,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_5_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009857,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_5_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009858,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_15_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009859,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_15_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009860,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_15_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009861,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_15_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009862,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_30_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009863,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_30_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009864,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_30_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009865,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_30_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009866,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009867,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009868,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009869,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009870,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.0_5_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009871,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage3d.rgba_astc_8x5.8_5_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009872,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_5_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009873,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_5_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009874,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_15_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009875,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_15_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009876,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_15_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009877,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_15_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009878,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.0_30_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009879,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.8_30_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009880,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.16_30_8");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009881,
        "KHR-GL33.pixelstoragemodes.compres",
        "sedteximage3d.rgba_astc_8x5.32_30_8");
