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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000901,
        "KHR-GL32.transform_feedback_overflow_query_A",
        "RB.advanced-single-stream-interleaved-attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000902,
        "KHR-GL32.transform_feedback_overflow_query_",
        "ARB.advanced-single-stream-separate-attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000899,
        "KHR-GL32.transform_feedback_overflow_query_",
        "ARB.basic-single-stream-interleaved-attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000900,
        "KHR-GL32.transform_feedback_overflow_quer",
        "y_ARB.basic-single-stream-separate-attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000894,
        "KHR-GL32.transform_feedback_overf",
        "low_query_ARB.context-state-update");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000893,
        "KHR-GL32.transform_feedback_overfl",
        "ow_query_ARB.default-context-state");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000896,
        "KHR-GL32.transform_feedback_overf",
        "low_query_ARB.error-already-active");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000897,
        "KHR-GL32.transform_feedback_overflow",
        "_query_ARB.error-incompatible-target");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000895,
        "KHR-GL32.transform_feedback_overf",
        "low_query_ARB.error-invalid-index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000898,
        "KHR-GL32.transform_feedback_overfl",
        "ow_query_ARB.error-no-active-query");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000892,
        "KHR-GL32.transform_feedback_overflow_q",
        "uery_ARB.implementation-dependent-state");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000904,
        "KHR-GL32.transform_feedback_overflow_query_AR",
        "B.multiple-streams-multiple-buffers-per-stream");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000903,
        "KHR-GL32.transform_feedback_overflow_query",
        "_ARB.multiple-streams-one-buffer-per-stream");
