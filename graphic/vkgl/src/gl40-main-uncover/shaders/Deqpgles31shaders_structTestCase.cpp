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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007137,
        "KHR-GL40.shaders.stru",
        "ct.local.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007138,
        "KHR-GL40.shaders.struc",
        "t.local.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007139,
        "KHR-GL40.shaders.stru",
        "ct.local.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007140,
        "KHR-GL40.shaders.struc",
        "t.local.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007141,
        "KHR-GL40.shaders.struct.",
        "local.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007142,
        "KHR-GL40.shaders.struct.l",
        "ocal.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007143,
        "KHR-GL40.shaders.struct.local.a",
        "rray_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007144,
        "KHR-GL40.shaders.struct.local.ar",
        "ray_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007145,
        "KHR-GL40.shaders.struct.",
        "local.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007146,
        "KHR-GL40.shaders.struct.l",
        "ocal.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007147,
        "KHR-GL40.shaders.struct.local.s",
        "truct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007148,
        "KHR-GL40.shaders.struct.local.st",
        "ruct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007149,
        "KHR-GL40.shaders.struct.loca",
        "l.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007150,
        "KHR-GL40.shaders.struct.local",
        ".nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007151,
        "KHR-GL40.shaders.struct.local.neste",
        "d_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007152,
        "KHR-GL40.shaders.struct.local.nested",
        "_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007153,
        "KHR-GL40.shaders.struct",
        ".local.parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007154,
        "KHR-GL40.shaders.struct.",
        "local.parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007155,
        "KHR-GL40.shaders.struct.lo",
        "cal.parameter_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007156,
        "KHR-GL40.shaders.struct.loc",
        "al.parameter_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007157,
        "KHR-GL40.shaders.stru",
        "ct.local.return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007158,
        "KHR-GL40.shaders.struc",
        "t.local.return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007159,
        "KHR-GL40.shaders.struct.l",
        "ocal.return_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007160,
        "KHR-GL40.shaders.struct.lo",
        "cal.return_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007161,
        "KHR-GL40.shaders.struct.local",
        ".conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007162,
        "KHR-GL40.shaders.struct.local.",
        "conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007163,
        "KHR-GL40.shaders.struct.lo",
        "cal.loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007164,
        "KHR-GL40.shaders.struct.loc",
        "al.loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007165,
        "KHR-GL40.shaders.struct.local.",
        "dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007166,
        "KHR-GL40.shaders.struct.local.d",
        "ynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007167,
        "KHR-GL40.shaders.struct.local.nes",
        "ted_conditional_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007168,
        "KHR-GL40.shaders.struct.local.nest",
        "ed_conditional_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007169,
        "KHR-GL40.shaders.struct.local",
        ".nested_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007170,
        "KHR-GL40.shaders.struct.local.",
        "nested_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007171,
        "KHR-GL40.shaders.struct.local.nes",
        "ted_dynamic_loop_assignment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007172,
        "KHR-GL40.shaders.struct.local.nest",
        "ed_dynamic_loop_assignment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007173,
        "KHR-GL40.shaders.struct.loc",
        "al.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007174,
        "KHR-GL40.shaders.struct.loca",
        "l.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007175,
        "KHR-GL40.shaders.struct.local.",
        "loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007176,
        "KHR-GL40.shaders.struct.local.l",
        "oop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007177,
        "KHR-GL40.shaders.struct.local.d",
        "ynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007178,
        "KHR-GL40.shaders.struct.local.dy",
        "namic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007179,
        "KHR-GL40.shaders.struct.local.dyna",
        "mic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007180,
        "KHR-GL40.shaders.struct.local.dynam",
        "ic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007181,
        "KHR-GL40.shaders.struct.",
        "local.basic_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007182,
        "KHR-GL40.shaders.struct.l",
        "ocal.basic_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007183,
        "KHR-GL40.shaders.struct.lo",
        "cal.basic_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007184,
        "KHR-GL40.shaders.struct.loc",
        "al.basic_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007185,
        "KHR-GL40.shaders.struct.",
        "local.nested_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007186,
        "KHR-GL40.shaders.struct.l",
        "ocal.nested_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007187,
        "KHR-GL40.shaders.struct.lo",
        "cal.nested_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007188,
        "KHR-GL40.shaders.struct.loc",
        "al.nested_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007189,
        "KHR-GL40.shaders.struct.local",
        ".array_member_equality_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007190,
        "KHR-GL40.shaders.struct.local.",
        "array_member_equality_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007191,
        "KHR-GL40.shaders.struc",
        "t.uniform.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007192,
        "KHR-GL40.shaders.struct",
        ".uniform.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007193,
        "KHR-GL40.shaders.struc",
        "t.uniform.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007194,
        "KHR-GL40.shaders.struct",
        ".uniform.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007195,
        "KHR-GL40.shaders.struct.u",
        "niform.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007196,
        "KHR-GL40.shaders.struct.un",
        "iform.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007197,
        "KHR-GL40.shaders.struct.uniform.",
        "array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007198,
        "KHR-GL40.shaders.struct.uniform.a",
        "rray_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007199,
        "KHR-GL40.shaders.struct.u",
        "niform.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007200,
        "KHR-GL40.shaders.struct.un",
        "iform.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007201,
        "KHR-GL40.shaders.struct.uniform.",
        "struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007202,
        "KHR-GL40.shaders.struct.uniform.s",
        "truct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007203,
        "KHR-GL40.shaders.struct.unifo",
        "rm.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007204,
        "KHR-GL40.shaders.struct.unifor",
        "m.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007205,
        "KHR-GL40.shaders.struct.uniform.nest",
        "ed_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007206,
        "KHR-GL40.shaders.struct.uniform.neste",
        "d_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007207,
        "KHR-GL40.shaders.struct.unif",
        "orm.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007208,
        "KHR-GL40.shaders.struct.unifo",
        "rm.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007209,
        "KHR-GL40.shaders.struct.uniform",
        ".loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007210,
        "KHR-GL40.shaders.struct.uniform.",
        "loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007211,
        "KHR-GL40.shaders.struct.uniform.",
        "dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007212,
        "KHR-GL40.shaders.struct.uniform.d",
        "ynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007213,
        "KHR-GL40.shaders.struct.uniform.dyn",
        "amic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007214,
        "KHR-GL40.shaders.struct.uniform.dyna",
        "mic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007215,
        "KHR-GL40.shaders.struct",
        ".uniform.sampler_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007216,
        "KHR-GL40.shaders.struct.",
        "uniform.sampler_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007217,
        "KHR-GL40.shaders.struct.un",
        "iform.sampler_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007218,
        "KHR-GL40.shaders.struct.uni",
        "form.sampler_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007219,
        "KHR-GL40.shaders.struct.un",
        "iform.sampler_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007220,
        "KHR-GL40.shaders.struct.uni",
        "form.sampler_array_fragment");
