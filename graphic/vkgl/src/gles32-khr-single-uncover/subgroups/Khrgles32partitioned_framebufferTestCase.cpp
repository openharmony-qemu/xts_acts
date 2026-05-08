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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003522,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003523,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003524,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003525,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003526,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003527,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003528,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003529,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003530,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003531,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003532,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003533,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003534,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003535,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003536,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003537,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003538,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003539,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003540,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003541,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003542,
        "KHR-Single-GLES32.subgroups.partitio",
        "ned.framebuffer.subgroupor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003543,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003544,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003545,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003546,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003547,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003548,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003549,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003550,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003551,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003552,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003553,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003554,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003555,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003556,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003557,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003558,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003559,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003560,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003561,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003562,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003563,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003564,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003565,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003566,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003567,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003568,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003569,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003570,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003571,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003572,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003573,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003574,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003575,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003576,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003577,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003578,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveadd_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003579,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003580,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003581,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003582,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemul_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003583,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003584,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003585,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003586,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemin_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003587,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003588,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003589,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003590,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivemax_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003591,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003592,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003593,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003594,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveand_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003595,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003596,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003597,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003598,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003599,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003600,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003601,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003602,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusivexor_int_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003603,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003604,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003605,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003606,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003607,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003608,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003609,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003610,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003611,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003612,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003613,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003614,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003615,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003616,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003617,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003618,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003619,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003620,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003621,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003622,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003623,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003624,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003625,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003626,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003627,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003628,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003629,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003630,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003631,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003632,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003633,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003634,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003635,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003636,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003637,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003638,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003639,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003640,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003641,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003642,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003643,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003644,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003645,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003646,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003647,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003648,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003649,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003650,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003651,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003652,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003653,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003654,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003655,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003656,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003657,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003658,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003659,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003660,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003661,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003662,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003663,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003664,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003665,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003666,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003667,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003668,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003669,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003670,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003671,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003672,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003673,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003674,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003675,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003676,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003677,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003678,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003679,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003680,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003681,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003682,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003683,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003684,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003685,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003686,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003687,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003688,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003689,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003690,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003691,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003692,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003693,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003694,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003695,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003696,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003697,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003698,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003699,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003700,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003701,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003702,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003703,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003704,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003705,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003706,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003707,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003708,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003709,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003710,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003711,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003712,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003713,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003714,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003715,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003716,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003717,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003718,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003719,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003720,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003721,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003722,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003723,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003724,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003725,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003726,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003727,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003728,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003729,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003730,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003731,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003732,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003733,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003734,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003735,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003736,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003737,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003738,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003739,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003740,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003741,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003742,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003743,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003744,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003745,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003746,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003747,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003748,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003749,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003750,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003751,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003752,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003753,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003754,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003755,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003756,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003757,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003758,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003759,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003760,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003761,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003762,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003763,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003764,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003765,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003766,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003767,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003768,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003769,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003770,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003771,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003772,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003773,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003774,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003775,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003776,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003777,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003778,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003779,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003780,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003781,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003782,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003783,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003784,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003785,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003786,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003787,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003788,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003789,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003790,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003791,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003792,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003793,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003794,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003795,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003796,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003797,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003798,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003799,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003800,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003801,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003802,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003803,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003804,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003805,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003806,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003807,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003808,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003809,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003810,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003811,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003812,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003813,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003814,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003815,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003816,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003817,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003818,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003819,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003820,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003821,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003822,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003823,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003824,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003825,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003826,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003827,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003828,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003829,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003830,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003831,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003832,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003833,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003834,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003835,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003836,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003837,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003838,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003839,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003840,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003841,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003842,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003843,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003844,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003845,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003846,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003847,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003848,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003849,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003850,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003851,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003852,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003853,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003854,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003855,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003856,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003857,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003858,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003859,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003860,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003861,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003862,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003863,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003864,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003865,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003866,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003867,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003868,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003869,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003870,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003871,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003872,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003873,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003874,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003875,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003876,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003877,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003878,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003879,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003880,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003881,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003882,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003883,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003884,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003885,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003886,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003887,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003888,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003889,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003890,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003891,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003892,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003893,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003894,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003895,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003896,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003897,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003898,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003899,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003900,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003901,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003902,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003903,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003904,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003905,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003906,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003907,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003908,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003909,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003910,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003911,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003912,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003913,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003914,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003915,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003916,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003917,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003918,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003919,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003920,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003921,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003922,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003923,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003924,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003925,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003926,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003927,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003928,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003929,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003930,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003931,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003932,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003933,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003934,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003935,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003936,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003937,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003938,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uint_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003939,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003940,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uint_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003941,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uint_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003942,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003943,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003944,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003945,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003946,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003947,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003948,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003949,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003950,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003951,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003952,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003953,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003954,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003955,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003956,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003957,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003958,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003959,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003960,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003961,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003962,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003963,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003964,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003965,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003966,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003967,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003968,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003969,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003970,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003971,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003972,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003973,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003974,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003975,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003976,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003977,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003978,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003979,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003980,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003981,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003982,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003983,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003984,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003985,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003986,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003987,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003988,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003989,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003990,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003991,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003992,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003993,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003994,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003995,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003996,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003997,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003998,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_003999,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004000,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004001,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004002,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004003,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004004,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004005,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004006,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004007,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004008,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004009,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004010,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004011,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004012,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004013,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004014,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004015,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004016,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004017,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004018,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004019,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004020,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004021,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004022,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004023,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004024,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004025,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004026,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004027,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004028,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004029,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004030,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004031,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004032,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004033,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004034,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004035,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004036,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004037,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004038,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004039,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004040,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004041,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004042,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004043,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004044,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004045,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004046,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004047,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004048,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004049,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004050,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004051,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004052,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004053,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004054,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004055,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004056,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004057,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004058,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004059,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004060,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004061,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004062,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004063,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004064,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004065,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004066,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004067,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004068,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004069,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004070,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004071,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004072,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004073,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004074,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004075,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004076,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004077,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004078,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004079,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004080,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004081,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004082,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004083,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004084,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004085,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004086,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004087,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004088,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004089,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004090,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004091,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004092,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004093,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004094,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004095,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004096,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004097,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004098,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004099,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004100,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004101,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004102,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004103,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004104,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004105,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004106,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004107,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004108,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004109,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004110,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004111,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004112,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004113,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004114,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004115,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004116,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004117,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004118,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004119,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004120,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004121,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004122,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004123,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004124,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004125,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004126,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004127,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004128,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004129,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004130,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004131,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004132,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004133,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004134,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004135,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004136,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004137,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004138,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004139,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004140,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004141,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004142,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004143,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004144,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004145,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004146,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004147,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004148,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004149,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004150,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004151,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004152,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004153,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004154,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004155,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004156,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004157,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004158,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004159,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004160,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004161,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004162,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004163,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004164,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004165,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004166,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004167,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004168,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004169,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004170,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004171,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004172,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004173,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004174,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004175,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004176,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004177,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004178,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004179,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004180,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004181,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004182,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004183,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004184,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004185,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004186,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004187,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004188,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004189,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004190,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004191,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004192,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004193,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004194,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004195,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004196,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004197,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004198,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004199,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004200,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004201,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004202,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004203,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004204,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004205,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004206,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004207,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004208,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004209,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004210,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004211,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004212,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004213,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004214,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004215,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004216,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004217,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004218,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004219,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004220,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004221,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004222,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004223,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004224,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004225,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004226,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004227,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004228,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004229,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004230,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004231,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004232,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004233,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004234,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004235,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004236,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004237,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004238,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_float_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004239,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004240,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004241,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004242,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004243,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004244,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004245,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004246,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004247,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004248,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004249,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004250,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004251,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004252,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004253,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004254,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004255,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004256,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004257,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004258,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004259,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004260,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004261,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004262,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004263,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004264,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004265,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004266,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004267,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004268,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004269,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004270,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004271,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004272,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004273,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004274,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004275,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004276,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004277,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004278,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004279,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004280,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004281,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004282,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004283,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004284,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004285,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004286,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004287,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004288,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004289,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004290,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004291,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004292,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004293,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004294,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004295,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004296,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004297,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004298,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004299,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004300,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004301,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004302,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004303,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004304,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004305,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004306,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004307,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004308,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004309,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004310,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004311,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004312,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004313,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004314,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004315,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004316,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004317,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004318,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004319,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004320,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004321,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004322,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004323,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004324,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004325,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004326,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004327,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004328,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004329,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004330,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004331,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004332,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004333,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004334,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004335,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004336,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004337,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004338,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004339,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004340,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004341,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004342,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmul_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004343,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004344,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004345,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004346,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004347,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004348,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004349,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004350,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupmax_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004351,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004352,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004353,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004354,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004355,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004356,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004357,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004358,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004359,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004360,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004361,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004362,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004363,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004364,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004365,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004366,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004367,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004368,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004369,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004370,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004371,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004372,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004373,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004374,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004375,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004376,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004377,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004378,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004379,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004380,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004381,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004382,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_vec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004383,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004384,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004385,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004386,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004387,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004388,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004389,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004390,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004391,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmul_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004392,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004393,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004394,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004395,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmin_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004396,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004397,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004398,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004399,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupmax_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004400,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004401,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004402,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004403,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004404,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusiveadd_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004405,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004406,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004407,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004408,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemul_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004409,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004410,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004411,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004412,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemin_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004413,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004414,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004415,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004416,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupinclusivemax_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004417,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004418,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004419,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004420,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusiveadd_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004421,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004422,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004423,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004424,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemul_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004425,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004426,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004427,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004428,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemin_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004429,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004430,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_double_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004431,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_double_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004432,
        "KHR-Single-GLES32.subgroups.partitioned.frameb",
        "uffer.subgroupexclusivemax_double_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004433,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_double_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004434,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004435,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004436,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004437,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004438,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004439,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004440,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004441,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004442,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004443,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004444,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004445,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004446,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004447,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004448,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004449,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004450,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004451,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004452,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004453,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004454,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004455,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004456,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004457,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004458,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004459,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004460,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004461,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004462,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004463,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004464,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004465,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004466,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004467,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004468,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004469,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004470,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004471,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004472,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004473,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004474,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004475,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004476,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004477,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004478,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004479,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004480,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004481,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004482,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004483,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004484,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004485,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004486,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004487,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004488,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004489,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004490,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004491,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004492,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004493,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004494,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004495,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004496,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004497,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004498,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004499,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004500,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004501,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004502,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004503,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004504,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004505,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004506,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004507,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004508,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004509,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004510,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004511,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004512,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004513,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004514,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004515,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004516,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004517,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004518,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004519,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004520,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004521,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004522,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004523,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004524,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004525,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004526,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004527,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004528,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004529,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004530,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004531,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004532,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004533,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004534,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004535,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004536,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004537,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004538,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004539,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004540,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004541,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004542,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupmax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004543,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004544,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupmax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004545,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupmax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004546,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004547,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004548,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004549,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004550,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004551,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004552,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004553,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004554,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004555,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004556,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004557,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004558,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004559,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004560,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004561,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004562,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004563,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004564,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004565,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004566,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004567,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004568,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004569,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004570,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004571,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004572,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004573,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004574,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivemax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004575,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivemax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004576,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivemax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004577,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivemax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004578,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupand_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004579,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004580,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupand_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004581,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004582,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004583,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004584,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004585,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004586,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupxor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004587,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004588,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupxor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004589,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004590,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004591,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004592,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004593,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004594,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupinclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004595,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004596,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004597,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004598,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004599,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004600,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004601,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004602,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004603,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004604,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004605,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004606,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupexclusiveor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004607,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004608,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004609,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004610,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bool_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004611,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004612,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bool_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004613,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bool_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004614,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004615,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004616,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004617,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004618,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004619,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004620,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004621,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004622,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004623,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004624,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004625,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004626,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004627,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004628,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004629,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004630,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004631,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004632,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004633,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004634,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004635,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004636,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004637,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004638,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004639,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004640,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004641,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004642,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004643,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004644,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004645,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004646,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004647,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004648,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004649,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004650,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004651,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004652,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004653,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004654,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004655,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004656,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004657,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004658,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004659,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004660,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004661,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004662,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004663,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004664,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004665,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004666,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004667,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004668,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004669,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004670,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004671,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004672,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004673,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004674,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004675,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004676,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004677,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004678,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004679,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004680,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004681,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004682,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004683,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004684,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004685,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004686,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004687,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004688,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004689,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004690,
        "KHR-Single-GLES32.subgroups.partition",
        "ed.framebuffer.subgroupor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004691,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004692,
        "KHR-Single-GLES32.subgroups.partitioned.",
        "framebuffer.subgroupor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004693,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004694,
        "KHR-Single-GLES32.subgroups.partitione",
        "d.framebuffer.subgroupxor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004695,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004696,
        "KHR-Single-GLES32.subgroups.partitioned.f",
        "ramebuffer.subgroupxor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004697,
        "KHR-Single-GLES32.subgroups.partitioned",
        ".framebuffer.subgroupxor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004698,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004699,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004700,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004701,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004702,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004703,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004704,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004705,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004706,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupinclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004707,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupinclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004708,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupinclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004709,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupinclusivexor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004710,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004711,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusiveand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004712,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004713,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004714,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusiveor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004715,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004716,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusiveor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004717,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusiveor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004718,
        "KHR-Single-GLES32.subgroups.partitioned.fr",
        "amebuffer.subgroupexclusivexor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004719,
        "KHR-Single-GLES32.subgroups.partitioned.fram",
        "ebuffer.subgroupexclusivexor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004720,
        "KHR-Single-GLES32.subgroups.partitioned.frame",
        "buffer.subgroupexclusivexor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320004TestSuite, TestCase_004721,
        "KHR-Single-GLES32.subgroups.partitioned.fra",
        "mebuffer.subgroupexclusivexor_bvec4_geometry");
