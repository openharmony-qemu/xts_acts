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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009959,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009960,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009961,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009963,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009962,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009964,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009967,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009965,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009966,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.abs_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009955,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_double");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009956,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009957,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009958,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.abs_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009972,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009973,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009974,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009976,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009975,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009977,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009980,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009978,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009979,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009968,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ceil_double");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009969,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009970,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009971,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.ceil_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009998,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009999,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010000,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009994,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009995,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009996,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009997,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009985,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009986,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009987,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009989,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009988,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009990,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009993,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009991,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009992,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.clamp_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009981,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_double");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009982,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009983,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009984,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.clamp_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009950,
        "KHR-GL40.gpu_shader_",
        "fp64.fp64.conversions");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009946,
        "KHR-GL40.gpu_shade",
        "r_fp64.fp64.errors");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009951,
        "KHR-GL40.gpu_shader_fp64",
        ".fp64.illegal_conversions");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009947,
        "KHR-GL40.gpu_shader_fp64.f",
        "p64.max_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009948,
        "KHR-GL40.gpu_shader_fp64.",
        "fp64.named_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009954,
        "KHR-GL40.gpu_shader",
        "_fp64.fp64.operators");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009949,
        "KHR-GL40.gpu_shader_",
        "fp64.fp64.state_query");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009953,
        "KHR-GL40.gpu_shader_fp64",
        ".fp64.valid_constructors");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009952,
        "KHR-GL40.gpu_shader",
        "_fp64.fp64.varyings");
