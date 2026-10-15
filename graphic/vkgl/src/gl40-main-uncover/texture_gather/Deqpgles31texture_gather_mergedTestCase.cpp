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

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010605,
        "KHR-GL40.texture",
        "_gather.api-enums");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010667,
        "KHR-GL40.texture_",
        "gather.base-level");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010673,
        "KHR-GL40.texture_gather",
        ".gather-geometry-shader");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010606,
        "KHR-GL40.texture_gath",
        "er.gather-glsl-compile");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010674,
        "KHR-GL40.texture_gather.",
        "gather-tesselation-shader");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010669,
        "KHR-GL40.texture_gather.in",
        "complete-texture-last-comp");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010668,
        "KHR-GL40.texture_gath",
        "er.incomplete-texture");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010640,
        "KHR-GL40.texture_gather",
        ".offset-gather-depth-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010645,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-depth-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010650,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-depth-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010679,
        "KHR-GL40.texture_gather.",
        "offset-gather-float-2d-r");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010678,
        "KHR-GL40.texture_gather.",
        "offset-gather-float-2d-rg");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010677,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-float-2d-rgb");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010636,
        "KHR-GL40.texture_gather",
        ".offset-gather-float-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010641,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-float-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010646,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-float-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010638,
        "KHR-GL40.texture_gathe",
        "r.offset-gather-int-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010643,
        "KHR-GL40.texture_gather.",
        "offset-gather-int-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010648,
        "KHR-GL40.texture_gather.",
        "offset-gather-int-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010639,
        "KHR-GL40.texture_gathe",
        "r.offset-gather-uint-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010644,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-uint-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010649,
        "KHR-GL40.texture_gather.",
        "offset-gather-uint-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010637,
        "KHR-GL40.texture_gather",
        ".offset-gather-unorm-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010642,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-unorm-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010647,
        "KHR-GL40.texture_gather.o",
        "ffset-gather-unorm-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010655,
        "KHR-GL40.texture_gather",
        ".offsets-gather-depth-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010660,
        "KHR-GL40.texture_gather.of",
        "fsets-gather-depth-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010665,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-depth-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010651,
        "KHR-GL40.texture_gather",
        ".offsets-gather-float-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010656,
        "KHR-GL40.texture_gather.of",
        "fsets-gather-float-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010661,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-float-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010653,
        "KHR-GL40.texture_gathe",
        "r.offsets-gather-int-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010658,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-int-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010663,
        "KHR-GL40.texture_gather.",
        "offsets-gather-int-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010654,
        "KHR-GL40.texture_gather",
        ".offsets-gather-uint-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010659,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-uint-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010664,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-uint-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010652,
        "KHR-GL40.texture_gather",
        ".offsets-gather-unorm-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010657,
        "KHR-GL40.texture_gather.of",
        "fsets-gather-unorm-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010662,
        "KHR-GL40.texture_gather.o",
        "ffsets-gather-unorm-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010613,
        "KHR-GL40.texture_gathe",
        "r.plain-gather-depth-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010618,
        "KHR-GL40.texture_gather.p",
        "lain-gather-depth-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010635,
        "KHR-GL40.texture_gather.",
        "plain-gather-depth-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010630,
        "KHR-GL40.texture_gather.pl",
        "ain-gather-depth-cube-array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010625,
        "KHR-GL40.texture_gather",
        ".plain-gather-depth-cube");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010676,
        "KHR-GL40.texture_gather",
        ".plain-gather-float-2d-r");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010608,
        "KHR-GL40.texture_gather.",
        "plain-gather-float-2d-rg");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010675,
        "KHR-GL40.texture_gather.",
        "plain-gather-float-2d-rgb");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010607,
        "KHR-GL40.texture_gather.p",
        "lain-gather-float-2d-rgba");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010672,
        "KHR-GL40.texture_gather.plai",
        "n-gather-float-2d-srgb-alpha");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010671,
        "KHR-GL40.texture_gather.p",
        "lain-gather-float-2d-srgb");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010614,
        "KHR-GL40.texture_gather.p",
        "lain-gather-float-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010631,
        "KHR-GL40.texture_gather.",
        "plain-gather-float-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010626,
        "KHR-GL40.texture_gather.pl",
        "ain-gather-float-cube-array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010620,
        "KHR-GL40.texture_gather.p",
        "lain-gather-float-cube-rg");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010619,
        "KHR-GL40.texture_gather.pl",
        "ain-gather-float-cube-rgba");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010611,
        "KHR-GL40.texture_gather",
        ".plain-gather-int-2d-rg");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010610,
        "KHR-GL40.texture_gather.",
        "plain-gather-int-2d-rgba");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010616,
        "KHR-GL40.texture_gather.",
        "plain-gather-int-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010633,
        "KHR-GL40.texture_gather",
        ".plain-gather-int-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010628,
        "KHR-GL40.texture_gather.p",
        "lain-gather-int-cube-array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010623,
        "KHR-GL40.texture_gather.",
        "plain-gather-int-cube-rg");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010622,
        "KHR-GL40.texture_gather.p",
        "lain-gather-int-cube-rgba");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010612,
        "KHR-GL40.texture_gathe",
        "r.plain-gather-uint-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010617,
        "KHR-GL40.texture_gather.",
        "plain-gather-uint-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010634,
        "KHR-GL40.texture_gather.",
        "plain-gather-uint-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010629,
        "KHR-GL40.texture_gather.pl",
        "ain-gather-uint-cube-array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010624,
        "KHR-GL40.texture_gather",
        ".plain-gather-uint-cube");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010609,
        "KHR-GL40.texture_gathe",
        "r.plain-gather-unorm-2d");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010615,
        "KHR-GL40.texture_gather.p",
        "lain-gather-unorm-2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010632,
        "KHR-GL40.texture_gather.",
        "plain-gather-unorm-2drect");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010627,
        "KHR-GL40.texture_gather.pl",
        "ain-gather-unorm-cube-array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010621,
        "KHR-GL40.texture_gather",
        ".plain-gather-unorm-cube");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010666,
        "KHR-GL40.textur",
        "e_gather.swizzle");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010670,
        "KHR-GL40.texture_g",
        "ather.triangle-draw");
