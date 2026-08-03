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
import acosfFinitendktest from 'libacosfFinitendktest.so';

export default function AcosfFiniteNdkTest() {
  describe('AcosfFiniteNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });
    /**
     * @tc.name   testAcosfFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0100
     * @tc.desc   TC-001: __acosf_finite basic function consistency with acosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0200
     * @tc.desc   TC-002: NaN input silent pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0300
     * @tc.desc   TC-003: +inf triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0400
     * @tc.desc   TC-004: -inf triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0500
     * @tc.desc   TC-005: x > 1 finite value triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0600
     * @tc.desc   TC-006: x < -1 finite value triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteNormal006();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0700
     * @tc.desc   TC-007: boundary x == +1.0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0800
     * @tc.desc   TC-008: boundary x == -1.0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_0900
     * @tc.desc   TC-009: boundary x == -0.0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteBoundary003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteBoundary004
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1000
     * @tc.desc   TC-010: slightly beyond boundary triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteBoundary004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteBoundary005
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1100
     * @tc.desc   TC-011: subnormal input behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteBoundary005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1200
     * @tc.desc   TC-012: errno unchanged after valid call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1300
     * @tc.desc   TC-013: domain_error sets errno to EDOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1400
     * @tc.desc   TC-014: non-zero errno not overwritten on success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc004
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1500
     * @tc.desc   TC-015: FE_INVALID floating-point exception verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc005
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1600
     * @tc.desc   TC-016: FE_INVALID clearable verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteFunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc006
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1700
     * @tc.desc   TC-017: no dynamic memory allocation verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteFunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc006();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1800
     * @tc.desc   TC-018: 10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteStable002
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_1900
     * @tc.desc   TC-019: 100000 calls no performance degradation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteStable002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteStable003
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2000
     * @tc.desc   TC-020: multi-thread MT-Safe verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteStable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteStable003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc007
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2100
     * @tc.desc   TC-022: FPU floating-point environment dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteFunc007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc007();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteFunc008
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2200
     * @tc.desc   TC-023: rounding mode does not affect function behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteFunc008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteFunc008();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec001
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2300
     * @tc.desc   TC-024: PC device symbol existence and dlsym loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec002
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2400
     * @tc.desc   TC-025: non-aarch64 symbol non-existence verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAcosfFiniteSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec003
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2500
     * @tc.desc   TC-026: function pointer nullptr safety check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAcosfFiniteSpec003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec004
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2600
     * @tc.desc   TC-027: non-PC device stub mode verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteSpec004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec005
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2700
     * @tc.desc   TC-028: IsStubMode detection mechanism verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteSpec005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testAcosfFiniteSpec006
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSF_FINITE_2800
     * @tc.desc   TC-029: PC vs non-PC device behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcosfFiniteSpec006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = acosfFinitendktest.acosfFiniteSpec006();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}