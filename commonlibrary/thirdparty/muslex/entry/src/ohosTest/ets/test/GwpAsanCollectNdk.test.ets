/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import libgwpasancollectndktest from 'libgwpasancollectndktest.so';

export default function GwpAsanCollectNdkTest() {
  describe('GwpAsanCollectNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testgwpAsanCollectNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0100
     * @tc.desc   GWP-ASan collect with 1000ms timespan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0200
     * @tc.desc   GWP-ASan collect with zero timespan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0300
     * @tc.desc   GWP-ASan collect with large buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0500
     * @tc.desc   GWP-ASan collect with null buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0600
     * @tc.desc   GWP-ASan collect with zero max count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0700
     * @tc.desc   GWP-ASan collect with max timespan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0800
     * @tc.desc   GWP-ASan collect with single entry buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectStable001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_0900
     * @tc.desc   Repeated GWP-ASan collect stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanCollectThread001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_COLLECT_1000
     * @tc.desc   Multi-thread GWP-ASan collect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanCollectThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasancollectndktest.gwpAsanCollectThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}