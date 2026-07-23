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
import powfinitendktest from 'libpowfinitendktest.so';

export default function PowFiniteNdkTest() {
  describe('PowFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testPowFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0100
     * @tc.desc   Verify __pow_finite computes pow for typical positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0200
     * @tc.desc   Verify __pow_finite handles integer exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0300
     * @tc.desc   Verify __pow_finite handles fractional exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0400
     * @tc.desc   Verify __pow_finite computes pow(1, 100) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPowFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0500
     * @tc.desc   Verify __pow_finite handles NaN input without errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0600
     * @tc.desc   Verify __pow_finite handles Inf and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowFiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0700
     * @tc.desc   Verify __pow_finite at boundary value pow(1, x) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0800
     * @tc.desc   Verify __pow_finite at boundary value pow(x, 0) returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPowFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_0900
     * @tc.desc   Verify __pow_finite produces consistent results across repeated calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPowFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testPowFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_POW_FINITE_1000
     * @tc.desc   Verify __pow_finite thread safety with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPowFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = powfinitendktest.powFiniteThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}