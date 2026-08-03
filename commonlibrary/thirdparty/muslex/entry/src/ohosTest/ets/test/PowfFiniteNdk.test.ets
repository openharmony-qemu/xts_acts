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
import powffinitendktest from 'libpowffinitendktest.so';

export default function PowfFiniteNdkTest() {
  describe('PowfFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testPowfFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0100
     * @tc.desc   Verify __powf_finite computes powf for typical positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowfFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0200
     * @tc.desc   Verify __powf_finite handles integer exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowfFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0300
     * @tc.desc   Verify __powf_finite handles fractional exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowfFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0400
     * @tc.desc   Verify __powf_finite computes powf(1, 100) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowfFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0500
     * @tc.desc   Verify __powf_finite handles NaN input without errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowfFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0600
     * @tc.desc   Verify __powf_finite handles Inf and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowfFiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0700
     * @tc.desc   Verify __powf_finite at boundary value powf(1, x) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowfFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0800
     * @tc.desc   Verify __powf_finite at boundary value powf(x, 0) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowfFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_0900
     * @tc.desc   Verify __powf_finite produces consistent results across repeated calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPowfFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowfFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_POWF_FINITE_1000
     * @tc.desc   Verify __powf_finite thread safety with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPowfFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = powffinitendktest.powfFiniteThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}