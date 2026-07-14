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
import musl_log2finitendktest from 'libmusl_log2finitendktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function Log2FiniteNdkTest() {
  describe('Log2FiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testLog2FiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0100
     * @tc.desc   Verify __log2_finite computes log2 for typical positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2FiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteNormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0200
     * @tc.desc   Verify __log2_finite handles integer powers of 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2FiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteNormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0300
     * @tc.desc   Verify __log2_finite handles fractional values between 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2FiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteNormal003();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0400
     * @tc.desc   Verify __log2_finite IsStubMode returns expected result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2FiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0500
     * @tc.desc   Verify __log2_finite handles NaN input without errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2FiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteAbnormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0600
     * @tc.desc   Verify __log2_finite handles Inf and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2FiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteAbnormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0700
     * @tc.desc   Verify __log2_finite at boundary value 1.0 returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2FiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteBoundary001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0800
     * @tc.desc   Verify __log2_finite at very small positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2FiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteBoundary002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_0900
     * @tc.desc   Verify __log2_finite produces consistent results across repeated calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLog2FiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteStable001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2FiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2_FINITE_1000
     * @tc.desc   Verify __log2_finite thread safety with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLog2FiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_log2finitendktest.log2FiniteThread001();
      expect(resNum >= 0).assertTrue();
      done();
    });
  });
}