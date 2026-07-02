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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009342,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.r32ui.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009343,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.r32ui.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009344,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009345,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.r32ui.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009346,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009347,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009348,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.r32ui.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009349,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009350,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009351,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.r32ui.16_16_4");
