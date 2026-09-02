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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000011,
        "KHR-GL32.transform_fe",
        "edback.api_errors_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000015,
        "KHR-GL32.transform_feedback.ca",
        "pture_geometry_interleaved_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000017,
        "KHR-GL32.transform_feedback.c",
        "apture_geometry_separate_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000028,
        "KHR-GL32.transform_feedback.ca",
        "pture_special_interleaved_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000014,
        "KHR-GL32.transform_feedback.c",
        "apture_vertex_interleaved_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000016,
        "KHR-GL32.transform_feedback.",
        "capture_vertex_separate_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000024,
        "KHR-GL32.transform_feedb",
        "ack.discard_geometry_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000023,
        "KHR-GL32.transform_feed",
        "back.discard_vertex_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000026,
        "KHR-GL32.transform_feedba",
        "ck.draw_xfb_feedbackk_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000029,
        "KHR-GL32.transform_feedba",
        "ck.draw_xfb_instanced_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000030,
        "KHR-GL32.transform_feedback.d",
        "raw_xfb_stream_instanced_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000027,
        "KHR-GL32.transform_feedb",
        "ack.draw_xfb_stream_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000025,
        "KHR-GL32.transform_f",
        "eedback.draw_xfb_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000031,
        "KHR-GL32.transform",
        "_feedback.geometry");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000018,
        "KHR-GL32.transform_fe",
        "edback.get_xfb_varying");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000013,
        "KHR-GL32.transform_",
        "feedback.limits_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000012,
        "KHR-GL32.transform_feed",
        "back.linking_errors_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000020,
        "KHR-GL32.transform_feedback.q",
        "uery_geometry_interleaved_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000022,
        "KHR-GL32.transform_feedback.",
        "query_geometry_separate_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000019,
        "KHR-GL32.transform_feedback.",
        "query_vertex_interleaved_test");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000021,
        "KHR-GL32.transform_feedback",
        ".query_vertex_separate_test");
