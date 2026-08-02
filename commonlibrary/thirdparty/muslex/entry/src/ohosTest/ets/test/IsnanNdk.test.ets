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
import isnanndktest from 'libisnanndktest.so';

export default function IsnanNdkTest() {
  describe('IsnanNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testIsnanNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0100
     * @tc.desc   NaN should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0200
     * @tc.desc   Positive infinity should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0300
     * @tc.desc   Negative infinity should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0400
     * @tc.desc   Zero should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0500
     * @tc.desc   Normal finite value should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0600
     * @tc.desc   Negative finite value should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanNormal006();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0700
     * @tc.desc   DBL_MAX should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0800
     * @tc.desc   DBL_MIN should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_0900
     * @tc.desc   Signaling NaN should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_1000
     * @tc.desc   Various NaN bit patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsnanAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isnanndktest.isnanAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanStable001
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_1100
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsnanStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = isnanndktest.isnanStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsnanThread001
     * @tc.number SUB_THIRDPARTY_MUSL_ISNAN_1200
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsnanThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = isnanndktest.isnanThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}