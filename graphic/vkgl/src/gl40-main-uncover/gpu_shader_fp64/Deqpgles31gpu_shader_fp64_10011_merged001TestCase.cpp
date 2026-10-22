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

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010002,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010001,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010003,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010006,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.clamp_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010004,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010005,
        "KHR-GL40.gpu_shader_fp64.built",
        "in.clamp_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010011,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010012,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010013,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010015,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010014,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010016,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010019,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010017,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010018,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.cross_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010007,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010008,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010009,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010010,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.cross_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010024,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010025,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010026,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010028,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010027,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010029,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010032,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010030,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010031,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.determinant_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010020,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010021,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010022,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010023,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.determinant_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010037,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010038,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010039,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010041,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010040,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010042,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010045,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010043,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010044,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010033,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.distance_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010034,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010035,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010036,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.distance_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010050,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010051,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010052,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010054,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010053,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010055,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010058,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010056,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010057,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.dot_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010046,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010047,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010048,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010049,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.dot_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010063,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010064,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010065,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010067,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010066,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010068,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010071,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010069,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010070,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.equal_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010059,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010060,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010061,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010062,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.equal_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010076,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010077,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010078,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010080,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010079,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010081,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010084,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010082,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010083,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.faceforward_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010072,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010073,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010074,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010075,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.faceforward_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010089,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010090,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010091,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010093,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010092,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010094,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010097,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010095,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010096,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.floor_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010085,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010086,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010087,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010088,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.floor_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010102,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010103,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010104,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010106,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010105,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010107,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010110,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010108,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010109,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fma_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010098,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010099,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010100,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010101,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.fma_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010115,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010116,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010117,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010119,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010118,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010120,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010123,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010121,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010122,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.fract_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010111,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010112,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010113,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010114,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.fract_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010128,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010129,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010130,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010132,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010131,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010133,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010136,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010134,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010135,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.frexp_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010124,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010125,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010126,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010127,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.frexp_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010141,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010142,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010143,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010145,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010144,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010146,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010149,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010147,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010148,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.greaterthan_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010137,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010138,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010139,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010140,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.greaterthan_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010154,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010155,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010156,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010158,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010157,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010159,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010162,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010160,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010161,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010150,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.greaterthanequal_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010151,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010152,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010153,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.greaterthanequal_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010167,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010168,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010169,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010171,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010170,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010172,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010175,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010173,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010174,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.inverse_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010163,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010164,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010165,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010166,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.inverse_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010180,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010181,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010182,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010184,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010183,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010185,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010188,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010186,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010187,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.inversesqrt_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010176,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010177,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010178,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010179,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.inversesqrt_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010596,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010597,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010598,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010600,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010599,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010601,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010604,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010602,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010603,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isinf_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010592,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010593,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010594,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010595,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isinf_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010583,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010584,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010585,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010587,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010586,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010588,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010591,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010589,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010590,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.isnan_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010579,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010580,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010581,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010582,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.isnan_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010193,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010194,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010195,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010197,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010196,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010198,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010201,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010199,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010200,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.ldexp_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010189,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010190,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010191,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010192,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.ldexp_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010232,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010233,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010234,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010236,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010235,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010237,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010240,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010238,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010239,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010228,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.length_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010229,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010230,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010231,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.length_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010206,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010207,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010208,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010210,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010209,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010211,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010214,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010212,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010213,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010202,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.lessthan_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010203,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010204,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010205,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.lessthan_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010219,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010220,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010221,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010223,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010222,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010224,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010227,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010225,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010226,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.lessthanequal_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010215,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010216,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010217,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010218,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.lessthanequal_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010245,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010246,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010247,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010249,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010248,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010250,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010253,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010251,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010252,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010241,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.matrixcompmult_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010242,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010243,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010244,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.matrixcompmult_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010271,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010272,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010273,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010275,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010274,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010276,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010279,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010277,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010278,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010267,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.max_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010268,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010269,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010270,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.max_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010258,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010259,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010260,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010262,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010261,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010263,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010266,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010264,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010265,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.max_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010254,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010255,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010256,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010257,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.max_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010297,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010298,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010299,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010301,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010300,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010302,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010305,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010303,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010304,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010293,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.min_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010294,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010295,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010296,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.min_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010284,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010285,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010286,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010288,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010287,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010289,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010292,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010290,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010291,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.min_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010280,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010281,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010282,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010283,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.min_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010310,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010311,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010312,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010314,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010313,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010315,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010318,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010316,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010317,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mix_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010306,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010307,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010308,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010309,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mix_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010336,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010337,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010338,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010340,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010339,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010341,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010344,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010342,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010343,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010332,
        "KHR-GL40.gpu_shader_fp64.buil",
        "tin.mod_against_scalar_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010333,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010334,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010335,
        "KHR-GL40.gpu_shader_fp64.bui",
        "ltin.mod_against_scalar_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010323,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010324,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010325,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010327,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010326,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010328,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010331,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010329,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010330,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.mod_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010319,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010320,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010321,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010322,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.mod_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010349,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010350,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010351,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010353,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010352,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010354,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010357,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010355,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010356,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010345,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.modf_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010346,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010347,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010348,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.modf_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010362,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010363,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010364,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010366,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010365,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010367,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010370,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010368,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010369,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.normalize_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010358,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010359,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010360,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010361,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.normalize_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010375,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010376,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010377,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010379,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010378,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010380,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010383,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010381,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010382,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010371,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.notequal_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010372,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010373,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010374,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.notequal_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010388,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010389,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010390,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010392,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010391,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010393,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010396,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010394,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010395,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010384,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.outerproduct_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010385,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010386,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010387,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.outerproduct_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010401,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010402,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010403,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010405,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010404,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010406,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010409,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010407,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010408,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010397,
        "KHR-GL40.gpu_shader_fp64.bu",
        "iltin.packdouble2x32_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010398,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010399,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010400,
        "KHR-GL40.gpu_shader_fp64.b",
        "uiltin.packdouble2x32_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010414,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010415,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010416,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010418,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010417,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010419,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010422,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010420,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010421,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.reflect_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010410,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010411,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010412,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010413,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.reflect_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010427,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010428,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010429,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010431,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010430,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010432,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010435,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010433,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010434,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.refract_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010423,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010424,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010425,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010426,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.refract_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010440,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010441,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010442,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010444,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010443,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010445,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010448,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010446,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010447,
        "KHR-GL40.gpu_shader_fp6",
        "4.builtin.round_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010436,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010437,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010438,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010439,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.round_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010453,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010454,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010455,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010457,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010456,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010458,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010461,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dmat4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010459,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010460,
        "KHR-GL40.gpu_shader_fp64.",
        "builtin.roundeven_dmat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010449,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_double");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010450,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010451,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010452,
        "KHR-GL40.gpu_shader_fp64",
        ".builtin.roundeven_dvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010466,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dmat2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010467,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010468,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010470,
        "KHR-GL40.gpu_shader_f",
        "p64.builtin.sign_dmat3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010469,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010471,
        "KHR-GL40.gpu_shader_fp",
        "64.builtin.sign_dmat3x4");
