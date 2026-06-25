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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005802,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.float_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005803,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.float_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005804,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005805,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.float_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005806,
        "KHR-GL40.shaders.indexing.varying_ar",
        "ray.float_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005807,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005808,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005809,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.float_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005810,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005811,
        "KHR-GL40.shaders.indexing.varying_array.",
        "float_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005812,
        "KHR-GL40.shaders.indexing.varying_array.",
        "float_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005813,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005814,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.float_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005815,
        "KHR-GL40.shaders.indexing.varying_array.",
        "float_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005816,
        "KHR-GL40.shaders.indexing.varying_array.f",
        "loat_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005817,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec2_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005818,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005819,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005820,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec2_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005821,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec2_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005822,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005823,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec2_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005824,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005825,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005826,
        "KHR-GL40.shaders.indexing.varying_array",
        ".vec2_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005827,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec2_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005828,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005829,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec2_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005830,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec2_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005831,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec2_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005832,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec3_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005833,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005834,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005835,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec3_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005836,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec3_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005837,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005838,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec3_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005839,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005840,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005841,
        "KHR-GL40.shaders.indexing.varying_array",
        ".vec3_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005842,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec3_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005843,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005844,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec3_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005845,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec3_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005846,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec3_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005847,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec4_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005848,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005849,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005850,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec4_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005851,
        "KHR-GL40.shaders.indexing.varying_a",
        "rray.vec4_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005852,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005853,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec4_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005854,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005855,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005856,
        "KHR-GL40.shaders.indexing.varying_array",
        ".vec4_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005857,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec4_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005858,
        "KHR-GL40.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005859,
        "KHR-GL40.shaders.indexing.varying_arra",
        "y.vec4_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005860,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec4_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005861,
        "KHR-GL40.shaders.indexing.varying_array.",
        "vec4_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005862,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.float_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005863,
        "KHR-GL40.shaders.indexing.uniform",
        "_array.float_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005864,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.float_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005865,
        "KHR-GL40.shaders.indexing.uniform",
        "_array.float_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005866,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.float_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005867,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.float_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005868,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.float_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005869,
        "KHR-GL40.shaders.indexing.uniform_ar",
        "ray.float_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005870,
        "KHR-GL40.shaders.indexing.unifo",
        "rm_array.vec2_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005871,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec2_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005872,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec2_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005873,
        "KHR-GL40.shaders.indexing.uniform",
        "_array.vec2_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005874,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec2_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005875,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec2_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005876,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec2_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005877,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec2_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005878,
        "KHR-GL40.shaders.indexing.unifo",
        "rm_array.vec3_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005879,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec3_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005880,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec3_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005881,
        "KHR-GL40.shaders.indexing.uniform",
        "_array.vec3_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005882,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec3_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005883,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec3_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005884,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec3_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005885,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec3_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005886,
        "KHR-GL40.shaders.indexing.unifo",
        "rm_array.vec4_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005887,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec4_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005888,
        "KHR-GL40.shaders.indexing.unifor",
        "m_array.vec4_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005889,
        "KHR-GL40.shaders.indexing.uniform",
        "_array.vec4_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005890,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec4_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005891,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec4_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005892,
        "KHR-GL40.shaders.indexing.uniform_",
        "array.vec4_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005893,
        "KHR-GL40.shaders.indexing.uniform_a",
        "rray.vec4_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005894,
        "KHR-GL40.shaders.indexing.tmp_array.f",
        "loat_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005895,
        "KHR-GL40.shaders.indexing.tmp_array.fl",
        "oat_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005896,
        "KHR-GL40.shaders.indexing.tmp_array.flo",
        "at_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005897,
        "KHR-GL40.shaders.indexing.tmp_array.floa",
        "t_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005898,
        "KHR-GL40.shaders.indexing.tmp_array.flo",
        "at_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005899,
        "KHR-GL40.shaders.indexing.tmp_array.floa",
        "t_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005900,
        "KHR-GL40.shaders.indexing.tmp_array.f",
        "loat_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005901,
        "KHR-GL40.shaders.indexing.tmp_array.fl",
        "oat_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005902,
        "KHR-GL40.shaders.indexing.tmp_array.flo",
        "at_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005903,
        "KHR-GL40.shaders.indexing.tmp_array.floa",
        "t_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005904,
        "KHR-GL40.shaders.indexing.tmp_array.flo",
        "at_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005905,
        "KHR-GL40.shaders.indexing.tmp_array.floa",
        "t_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005906,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005907,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005908,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005909,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005910,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005911,
        "KHR-GL40.shaders.indexing.tmp_array.vec2",
        "_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005912,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005913,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005914,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005915,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005916,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005917,
        "KHR-GL40.shaders.indexing.tmp_array.vec2",
        "_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005918,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005919,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005920,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005921,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005922,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005923,
        "KHR-GL40.shaders.indexing.tmp_array.vec3",
        "_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005924,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005925,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005926,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005927,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005928,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005929,
        "KHR-GL40.shaders.indexing.tmp_array.vec3",
        "_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005930,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005931,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005932,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005933,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005934,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005935,
        "KHR-GL40.shaders.indexing.tmp_array.vec4",
        "_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005936,
        "KHR-GL40.shaders.indexing.tmp_array.",
        "vec4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005937,
        "KHR-GL40.shaders.indexing.tmp_array.v",
        "ec4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005938,
        "KHR-GL40.shaders.indexing.tmp_array.ve",
        "c4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005939,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005940,
        "KHR-GL40.shaders.indexing.tmp_array.vec",
        "4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005941,
        "KHR-GL40.shaders.indexing.tmp_array.vec4",
        "_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005942,
        "KHR-GL40.shaders.index",
        "ing.tmp_array.vertexid");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005943,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec2_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005944,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c2_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005945,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c2_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005946,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "2_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005947,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2",
        "_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005948,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2_",
        "direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005949,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005950,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005951,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec2_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005952,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c2_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005953,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c2_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005954,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "2_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005955,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2",
        "_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005956,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2_",
        "static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005957,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005958,
        "KHR-GL40.shaders.indexing.vector_subscript.vec2_",
        "dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005959,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec3_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005960,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c3_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005961,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c3_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005962,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "3_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005963,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3",
        "_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005964,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3_",
        "direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005965,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005966,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005967,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec3_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005968,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c3_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005969,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c3_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005970,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "3_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005971,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3",
        "_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005972,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3_",
        "static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005973,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005974,
        "KHR-GL40.shaders.indexing.vector_subscript.vec3_",
        "dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005975,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec4_direct_write_static_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005976,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c4_direct_write_static_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005977,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c4_direct_write_dynamic_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005978,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "4_direct_write_dynamic_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005979,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4",
        "_direct_write_static_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005980,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4_",
        "direct_write_static_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005981,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4",
        "_direct_write_dynamic_loop_subscript_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005982,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4_",
        "direct_write_dynamic_loop_subscript_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005983,
        "KHR-GL40.shaders.indexing.vector_subscript.v",
        "ec4_static_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005984,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c4_static_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005985,
        "KHR-GL40.shaders.indexing.vector_subscript.ve",
        "c4_dynamic_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005986,
        "KHR-GL40.shaders.indexing.vector_subscript.vec",
        "4_dynamic_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005987,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4",
        "_static_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005988,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4_",
        "static_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005989,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4",
        "_dynamic_loop_subscript_write_direct_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005990,
        "KHR-GL40.shaders.indexing.vector_subscript.vec4_",
        "dynamic_loop_subscript_write_direct_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005991,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005992,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005993,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005994,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005995,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005996,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005997,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005998,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005999,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006000,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006001,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006002,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006003,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006004,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006005,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006006,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006007,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006008,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006009,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006010,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006011,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006012,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006013,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006014,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006015,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006016,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006017,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006018,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006019,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006020,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006021,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat2x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006022,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat2x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006023,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006024,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006025,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat2x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006026,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at2x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006027,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006028,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006029,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006030,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006031,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006032,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006033,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006034,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006035,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006036,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006037,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006038,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006039,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006040,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006041,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006042,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006043,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006044,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006045,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006046,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006047,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006048,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006049,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006050,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006051,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006052,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006053,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006054,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006055,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006056,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006057,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat3x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006058,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat3x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006059,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006060,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006061,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat3x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006062,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at3x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006063,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006064,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006065,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006066,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006067,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006068,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006069,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006070,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006071,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006072,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006073,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006074,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006075,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006076,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006077,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006078,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006079,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006080,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006081,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006082,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006083,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006084,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006085,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006086,
        "KHR-GL40.shaders.indexing.matrix_subscript.m",
        "at4x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006087,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006088,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006089,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006090,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006091,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006092,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006093,
        "KHR-GL40.shaders.indexing.matrix_subscri",
        "pt.mat4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006094,
        "KHR-GL40.shaders.indexing.matrix_subscrip",
        "t.mat4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006095,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006096,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006097,
        "KHR-GL40.shaders.indexing.matrix_subscript",
        ".mat4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006098,
        "KHR-GL40.shaders.indexing.matrix_subscript.",
        "mat4_dynamic_loop_write_static_read_fragment");
