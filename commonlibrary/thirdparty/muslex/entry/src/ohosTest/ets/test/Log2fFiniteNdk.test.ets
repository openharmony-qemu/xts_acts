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
import musl_log2ffinitendktest from 'libmusl_log2ffinitendktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function Log2fFiniteNdkTest() {
  describe('Log2fFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testLog2fFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0100
     * @tc.desc   Verify __log2f_finite computes log2f for typical positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2fFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteNormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0200
     * @tc.desc   Verify __log2f_finite handles integer powers of 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2fFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteNormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0300
     * @tc.desc   Verify __log2f_finite handles fractional values between 0 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2fFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteNormal003();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0400
     * @tc.desc   Verify __log2f_finite IsStubMode returns expected result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog2fFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0500
     * @tc.desc   Verify __log2f_finite handles NaN input without errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2fFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteAbnormal001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0600
     * @tc.desc   Verify __log2f_finite handles Inf and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2fFiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteAbnormal002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0700
     * @tc.desc   Verify __log2f_finite at boundary value 1.0f returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2fFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteBoundary001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0800
     * @tc.desc   Verify __log2f_finite at very small positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog2fFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteBoundary002();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_0900
     * @tc.desc   Verify __log2f_finite produces consistent results across repeated calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLog2fFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteStable001();
      expect(resNum >= 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog2fFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG2F_FINITE_1000
     * @tc.desc   Verify __log2f_finite thread safety with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLog2fFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_log2ffinitendktest.log2fFiniteThread001();
      expect(resNum >= 0).assertTrue();
      done();
    });
  });
}