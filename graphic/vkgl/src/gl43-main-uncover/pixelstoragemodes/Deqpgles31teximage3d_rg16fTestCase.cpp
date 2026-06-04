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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009382,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.rg16f.0_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009383,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.rg16f.1_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009384,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009385,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.rg16f.1_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009386,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009387,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009388,
        "KHR-GL43.pixelstoragemod",
        "es.teximage3d.rg16f.1_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009389,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009390,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009391,
        "KHR-GL43.pixelstoragemode",
        "s.teximage3d.rg16f.16_16_4");
