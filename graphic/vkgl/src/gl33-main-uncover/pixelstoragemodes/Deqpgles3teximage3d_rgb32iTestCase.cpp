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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009572,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009573,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009574,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009575,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009576,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009577,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb32i.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009578,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009579,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.rgb32i.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009580,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb32i.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009581,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.rgb32i.16_16_4");
