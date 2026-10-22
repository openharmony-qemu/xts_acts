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
#include "../ActsDeqpgles310011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010474,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010472,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010473,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010462,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010463,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010464,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010465,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010492,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010493,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010494,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010496,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010495,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010497,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010500,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010498,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010499,
        "KHR-GL40.gpu_shader_fp64.builtin.",
        "smoothstep_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010488,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010489,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010490,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010491,
        "KHR-GL40.gpu_shader_fp64.builtin",
        ".smoothstep_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010479,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010480,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010481,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010483,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010482,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010484,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010487,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010485,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010486,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010475,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.smoothstep_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010476,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010477,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010478,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.smoothstep_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010505,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010506,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010507,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010509,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010508,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010510,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010513,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010511,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010512,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010501,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sqrt_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010502,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010503,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010504,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sqrt_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010531,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010532,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010533,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010535,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010534,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010536,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010539,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010537,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010538,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.step_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010527,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010528,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010529,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010530,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.step_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010518,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010519,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010520,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010522,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010521,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010523,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010526,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010524,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010525,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010514,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.step_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010515,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010516,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010517,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.step_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010544,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010545,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010546,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010548,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010547,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010549,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010552,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010550,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010551,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.transpose_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010540,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010541,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010542,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010543,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.transpose_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010557,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010558,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010559,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010561,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010560,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010562,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010565,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010563,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010564,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.trunc_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010553,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010554,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010555,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010556,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.trunc_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010570,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010571,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010572,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010574,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010573,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010575,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010578,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010576,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010577,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010566,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.unpackdouble2x32_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010567,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010568,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010569,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.unpackdouble2x32_dvec4");
