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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000227,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec2_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000226,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec2_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000224,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec2_from_mat4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000229,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec2_from_mat4x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000231,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec2_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000230,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec2_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000228,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec2_from_mat4x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000233,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec2_from_mat4x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000235,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec2_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000234,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec2_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000232,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec2_from_mat4x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000311,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000310,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000309,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000308,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000315,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat2x3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000314,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat2x3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000313,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat2x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000312,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat2x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000319,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat2x4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000318,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat2x4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000317,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat2x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000316,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat2x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000323,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000322,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000321,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000320,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000327,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat3x2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000326,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat3x2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000325,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat3x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000324,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat3x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000331,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat3x4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000330,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat3x4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000329,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat3x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000328,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat3x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000335,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000334,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec3_from_float_mat4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000333,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000332,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec3_from_float_mat4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000339,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat4x2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000338,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat4x2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000337,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat4x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000336,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat4x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000343,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat4x3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000342,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec3_from_float_mat4x3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000341,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat4x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000340,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec3_from_float_mat4x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000273,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000275,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000274,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000272,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000277,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat2x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000279,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000278,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000276,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat2x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000281,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat2x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000283,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000282,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000280,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat2x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000285,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000287,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000286,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000284,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000289,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat3x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000291,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000290,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000288,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat3x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000293,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat3x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000295,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000294,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000292,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat3x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000297,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000299,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000298,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec3_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000296,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec3_from_mat4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000301,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat4x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000303,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000302,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000300,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat4x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000305,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat4x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000307,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000306,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec3_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000304,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec3_from_mat4x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000383,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000382,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000381,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000380,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000387,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat2x3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000386,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat2x3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000385,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat2x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000384,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat2x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000391,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat2x4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000390,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat2x4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000389,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat2x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000388,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat2x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000395,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000394,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000393,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000392,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000399,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat3x2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000398,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat3x2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000397,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat3x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000396,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat3x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000403,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat3x4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000402,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat3x4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000401,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat3x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000400,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat3x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000407,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat4_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000406,
        "KHR-GL31.shaders30.glsl_constructors.",
        "vec4_from_float_mat4_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000405,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000404,
        "KHR-GL31.shaders30.glsl_constr",
        "uctors.vec4_from_float_mat4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000411,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat4x2_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000410,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat4x2_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000409,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat4x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000408,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat4x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000415,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat4x3_float_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000414,
        "KHR-GL31.shaders30.glsl_constructors.v",
        "ec4_from_float_mat4x3_float_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000413,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat4x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000412,
        "KHR-GL31.shaders30.glsl_constru",
        "ctors.vec4_from_float_mat4x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000345,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000347,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000346,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000344,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000349,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat2x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000351,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000350,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000348,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat2x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000353,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat2x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000355,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000354,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000352,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat2x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000357,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000359,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000358,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000356,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000361,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat3x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000363,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000362,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000360,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat3x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000365,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat3x4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000367,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000366,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000364,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat3x4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000369,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat4_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000371,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000370,
        "KHR-GL31.shaders30.glsl_construct",
        "ors.vec4_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000368,
        "KHR-GL31.shaders30.glsl_con",
        "structors.vec4_from_mat4_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000373,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat4x2_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000375,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000374,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000372,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat4x2_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000377,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat4x3_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000379,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000378,
        "KHR-GL31.shaders30.glsl_constructor",
        "s.vec4_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000376,
        "KHR-GL31.shaders30.glsl_cons",
        "tructors.vec4_from_mat4x3_vs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000848,
        "KHR-GL31.shaders30.uniform_bloc",
        "k_negative.structure_declaration");
