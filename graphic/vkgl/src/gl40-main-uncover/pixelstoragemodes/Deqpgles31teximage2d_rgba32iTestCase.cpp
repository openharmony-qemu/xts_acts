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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009250,
        "KHR-GL40.pixelstoragemod",
        "es.teximage2d.rgba32i.0_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009251,
        "KHR-GL40.pixelstoragemod",
        "es.teximage2d.rgba32i.1_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009252,
        "KHR-GL40.pixelstoragemode",
        "s.teximage2d.rgba32i.16_0");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009253,
        "KHR-GL40.pixelstoragemod",
        "es.teximage2d.rgba32i.1_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009254,
        "KHR-GL40.pixelstoragemode",
        "s.teximage2d.rgba32i.16_1");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009255,
        "KHR-GL40.pixelstoragemode",
        "s.teximage2d.rgba32i.16_16");
