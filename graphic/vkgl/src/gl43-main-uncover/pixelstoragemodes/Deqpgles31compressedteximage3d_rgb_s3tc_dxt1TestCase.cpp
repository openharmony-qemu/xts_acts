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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009754,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009755,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009756,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009757,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009758,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_4_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009759,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_4_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009760,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_4_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009761,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_4_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009762,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009763,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009764,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009765,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009766,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_32_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009767,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_32_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009768,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_32_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009769,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_32_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009770,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009771,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009772,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009773,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_0_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009774,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_4_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009775,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_4_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009776,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_4_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009777,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_4_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009778,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009779,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009780,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009781,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009782,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_32_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009783,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_32_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009784,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_32_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009785,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_32_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009786,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009787,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009788,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009789,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_0_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009790,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009791,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009792,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009793,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_4_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009794,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_16_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009795,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_16_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009796,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_16_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009797,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_16_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009798,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_32_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009799,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_32_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009800,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_32_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009801,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_32_4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009802,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009803,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009804,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009805,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009806,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.0_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009807,
        "KHR-GL43.pixelstoragemodes.compre",
        "ssedteximage3d.rgb_s3tc_dxt1.4_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009808,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009809,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009810,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_16_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009811,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_16_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009812,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_16_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009813,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_16_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009814,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.0_32_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009815,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.4_32_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009816,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.16_32_8");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009817,
        "KHR-GL43.pixelstoragemodes.compres",
        "sedteximage3d.rgb_s3tc_dxt1.32_32_8");
