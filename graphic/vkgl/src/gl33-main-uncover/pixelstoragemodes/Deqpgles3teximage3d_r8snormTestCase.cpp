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

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009272,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.r8snorm.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009273,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.r8snorm.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009274,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009275,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.r8snorm.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009276,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009277,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009278,
        "KHR-GL33.pixelstoragemode",
        "s.teximage3d.r8snorm.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009279,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009280,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles30010TestSuite, TestCase_009281,
        "KHR-GL33.pixelstoragemodes",
        ".teximage3d.r8snorm.16_16_4");
