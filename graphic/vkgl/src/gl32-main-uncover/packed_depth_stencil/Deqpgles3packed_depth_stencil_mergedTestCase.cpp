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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005656,
        "KHR-GL32.packed_depth_ste",
        "ncil.blit.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005657,
        "KHR-GL32.packed_depth_sten",
        "cil.blit.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005654,
        "KHR-GL32.packed_depth_stencil",
        ".clear_buffer.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005655,
        "KHR-GL32.packed_depth_stencil.",
        "clear_buffer.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005652,
        "KHR-GL32.packed_depth_stencil.",
        "renderbuffers.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005653,
        "KHR-GL32.packed_depth_stencil.",
        "renderbuffers.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005660,
        "KHR-GL32.packed_depth_stencil",
        ".stencil_size.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005661,
        "KHR-GL32.packed_depth_stencil.",
        "stencil_size.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005658,
        "KHR-GL32.packed_depth_stencil.st",
        "encil_texturing.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005659,
        "KHR-GL32.packed_depth_stencil.st",
        "encil_texturing.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005638,
        "KHR-GL32.packed_depth_stencil.v",
        "alidate_errors.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005639,
        "KHR-GL32.packed_depth_stencil.v",
        "alidate_errors.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005637,
        "KHR-GL32.packed_depth_stencil",
        ".validate_errors.initial_state");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005644,
        "KHR-GL32.packed_depth_stencil.veri",
        "fy_copy_tex_image.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005645,
        "KHR-GL32.packed_depth_stencil.veri",
        "fy_copy_tex_image.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005642,
        "KHR-GL32.packed_depth_stencil.ver",
        "ify_get_tex_image.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005643,
        "KHR-GL32.packed_depth_stencil.veri",
        "fy_get_tex_image.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005648,
        "KHR-GL32.packed_depth_stencil.verif",
        "y_mixed_attachments.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005649,
        "KHR-GL32.packed_depth_stencil.verify",
        "_mixed_attachments.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005650,
        "KHR-GL32.packed_depth_stencil.ve",
        "rify_parameters.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005651,
        "KHR-GL32.packed_depth_stencil.ve",
        "rify_parameters.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005646,
        "KHR-GL32.packed_depth_stencil.verify",
        "_partial_attachments.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005647,
        "KHR-GL32.packed_depth_stencil.verify_",
        "partial_attachments.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005640,
        "KHR-GL32.packed_depth_stencil.ve",
        "rify_read_pixels.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005641,
        "KHR-GL32.packed_depth_stencil.ver",
        "ify_read_pixels.depth32f_stencil8");
