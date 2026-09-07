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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009722,
        "KHR-GL33.pixelstoragemodes.compr",
        "essedteximage2d.rgb_s3tc_dxt1.0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009723,
        "KHR-GL33.pixelstoragemodes.compr",
        "essedteximage2d.rgb_s3tc_dxt1.4_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009724,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.16_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009725,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.32_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009726,
        "KHR-GL33.pixelstoragemodes.compr",
        "essedteximage2d.rgb_s3tc_dxt1.0_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009727,
        "KHR-GL33.pixelstoragemodes.compr",
        "essedteximage2d.rgb_s3tc_dxt1.4_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009728,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.16_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009729,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.32_4");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009730,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.0_16");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009731,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.4_16");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009732,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.16_16");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009733,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.32_16");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009734,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.0_32");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009735,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.4_32");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009736,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.16_32");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009737,
        "KHR-GL33.pixelstoragemodes.compre",
        "ssedteximage2d.rgb_s3tc_dxt1.32_32");
