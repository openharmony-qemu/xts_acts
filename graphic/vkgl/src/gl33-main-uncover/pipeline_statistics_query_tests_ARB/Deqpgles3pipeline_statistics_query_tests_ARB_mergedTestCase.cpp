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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008059,
        "KHR-GL33.pipeline_statistics_query_tests_A",
        "RB.api_coverage_invalid_glbeginquery_calls");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008060,
        "KHR-GL33.pipeline_statistics_query_te",
        "sts_ARB.api_coverage_unsupported_calls");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008068,
        "KHR-GL33.pipeline_statistics_query_tests_",
        "ARB.functional_compute_shader_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008061,
        "KHR-GL33.pipeline_statistics_query_t",
        "ests_ARB.functional_default_qo_values");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008067,
        "KHR-GL33.pipeline_statistics_query_tests_",
        "ARB.functional_fragment_shader_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008066,
        "KHR-GL33.pipeline_statistics_query_test",
        "s_ARB.functional_geometry_shader_queries");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008062,
        "KHR-GL33.pipeline_statistics_query_tests_ARB.funct",
        "ional_non_rendering_commands_do_not_affect_queries");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008063,
        "KHR-GL33.pipeline_statistics_query_tests_ARB.functional_primi",
        "tives_vertices_submitted_and_clipping_input_output_primitives");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008065,
        "KHR-GL33.pipeline_statistics_query",
        "_tests_ARB.functional_tess_queries");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008064,
        "KHR-GL33.pipeline_statistics_query_tests",
        "_ARB.functional_vertex_shader_invocations");
