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

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010733,
        "KHR-GL40.draw_indirect.advan",
        "ced-primitiveRestart-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010731,
        "KHR-GL40.draw_indirect.advanced-",
        "twoPass-transformFeedback-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010732,
        "KHR-GL40.draw_indirect.advanced-t",
        "woPass-transformFeedback-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010680,
        "KHR-GL40.draw_indirect",
        ".basic-binding-default");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010684,
        "KHR-GL40.draw_indirec",
        "t.basic-binding-delete");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010683,
        "KHR-GL40.draw_indirec",
        "t.basic-binding-multi");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010682,
        "KHR-GL40.draw_indirec",
        "t.basic-binding-single");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010681,
        "KHR-GL40.draw_indire",
        "ct.basic-binding-zero");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010691,
        "KHR-GL40.draw_indirect.",
        "basic-buffer-copySubData");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010685,
        "KHR-GL40.draw_indire",
        "ct.basic-buffer-data");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010690,
        "KHR-GL40.draw_indirect.bas",
        "ic-buffer-flushMappedRange");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010688,
        "KHR-GL40.draw_indirect.",
        "basic-buffer-getPointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010689,
        "KHR-GL40.draw_indirect",
        ".basic-buffer-mapRange");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010686,
        "KHR-GL40.draw_indirec",
        "t.basic-buffer-subData");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010687,
        "KHR-GL40.draw_indire",
        "ct.basic-buffer-unMap");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010702,
        "KHR-GL40.draw_indirect.bas",
        "ic-drawArrays-bufferOffset");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010694,
        "KHR-GL40.draw_indirect.ba",
        "sic-drawArrays-instancing");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010693,
        "KHR-GL40.draw_indirect.basi",
        "c-drawArrays-manyPrimitives");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010701,
        "KHR-GL40.draw_indirect.",
        "basic-drawArrays-noFirst");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010700,
        "KHR-GL40.draw_indirect.",
        "basic-drawArrays-simple");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010692,
        "KHR-GL40.draw_indirect.basi",
        "c-drawArrays-singlePrimitive");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010703,
        "KHR-GL40.draw_indirect.b",
        "asic-drawArrays-vertexIds");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010695,
        "KHR-GL40.draw_indirect.b",
        "asic-drawArrays-xfbPaused");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010706,
        "KHR-GL40.draw_indirect.bas",
        "ic-drawElements-basevertex");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010707,
        "KHR-GL40.draw_indirect.basi",
        "c-drawElements-bufferOffset");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010698,
        "KHR-GL40.draw_indirect.bas",
        "ic-drawElements-instancing");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010697,
        "KHR-GL40.draw_indirect.basic",
        "-drawElements-manyPrimitives");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010705,
        "KHR-GL40.draw_indirect.basi",
        "c-drawElements-noFirstIndex");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010704,
        "KHR-GL40.draw_indirect.b",
        "asic-drawElements-simple");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010696,
        "KHR-GL40.draw_indirect.basic",
        "-drawElements-singlePrimitive");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010708,
        "KHR-GL40.draw_indirect.ba",
        "sic-drawElements-vertexIds");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010699,
        "KHR-GL40.draw_indirect.ba",
        "sic-drawElements-xfbPaused");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010710,
        "KHR-GL40.draw_indirect.basic-",
        "indicesDataType-unsigned_byte");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010709,
        "KHR-GL40.draw_indirect.basic-",
        "indicesDataType-unsigned_short");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010714,
        "KHR-GL40.draw_indirect.basi",
        "c-mode-drawArrays-line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010713,
        "KHR-GL40.draw_indirect.basi",
        "c-mode-drawArrays-line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010718,
        "KHR-GL40.draw_indirect.basic-mod",
        "e-drawArrays-line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010712,
        "KHR-GL40.draw_indirect.ba",
        "sic-mode-drawArrays-lines");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010717,
        "KHR-GL40.draw_indirect.basic-m",
        "ode-drawArrays-lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010711,
        "KHR-GL40.draw_indirect.ba",
        "sic-mode-drawArrays-points");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010716,
        "KHR-GL40.draw_indirect.basic",
        "-mode-drawArrays-triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010715,
        "KHR-GL40.draw_indirect.basic-",
        "mode-drawArrays-triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010720,
        "KHR-GL40.draw_indirect.basic-mode-",
        "drawArrays-triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010719,
        "KHR-GL40.draw_indirect.basic-mod",
        "e-drawArrays-triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010724,
        "KHR-GL40.draw_indirect.basic",
        "-mode-drawElements-line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010723,
        "KHR-GL40.draw_indirect.basic",
        "-mode-drawElements-line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010728,
        "KHR-GL40.draw_indirect.basic-mode",
        "-drawElements-line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010722,
        "KHR-GL40.draw_indirect.bas",
        "ic-mode-drawElements-lines");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010727,
        "KHR-GL40.draw_indirect.basic-mo",
        "de-drawElements-lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010721,
        "KHR-GL40.draw_indirect.bas",
        "ic-mode-drawElements-points");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010726,
        "KHR-GL40.draw_indirect.basic-",
        "mode-drawElements-triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010725,
        "KHR-GL40.draw_indirect.basic-m",
        "ode-drawElements-triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010730,
        "KHR-GL40.draw_indirect.basic-mode-d",
        "rawElements-triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010729,
        "KHR-GL40.draw_indirect.basic-mode",
        "-drawElements-triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010740,
        "KHR-GL40.draw_indirect.ne",
        "gative-bufferMapped-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010741,
        "KHR-GL40.draw_indirect.neg",
        "ative-bufferMapped-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010743,
        "KHR-GL40.draw_indirect.nega",
        "tive-gshIncompatible-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010744,
        "KHR-GL40.draw_indirect.negat",
        "ive-gshIncompatible-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010736,
        "KHR-GL40.draw_indirect.ne",
        "gative-invalidMode-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010737,
        "KHR-GL40.draw_indirect.neg",
        "ative-invalidMode-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010747,
        "KHR-GL40.draw_indirect.ne",
        "gative-invalidSize-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010748,
        "KHR-GL40.draw_indirect.neg",
        "ative-invalidSize-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010742,
        "KHR-GL40.draw_indirect.neg",
        "ative-invalidType-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010738,
        "KHR-GL40.draw_indirect",
        ".negative-noVAO-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010739,
        "KHR-GL40.draw_indirect.",
        "negative-noVAO-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010734,
        "KHR-GL40.draw_indirect.n",
        "egative-noindirect-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010735,
        "KHR-GL40.draw_indirect.ne",
        "gative-noindirect-elements");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010749,
        "KHR-GL40.draw_indirect.",
        "negative-unalignedOffset");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010745,
        "KHR-GL40.draw_indirect.ne",
        "gative-wrongOffset-arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010746,
        "KHR-GL40.draw_indirect.neg",
        "ative-wrongOffset-elements");
