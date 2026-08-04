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
import exp2Finitendktest from 'libexp2Finitendktest.so';

export default function Exp2FiniteNdkTest() {
  describe('Exp2FiniteNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });
    /**
     * @tc.name   testExp2FiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0100
     * @tc.desc   TC-001: __exp2_finite basic function consistency with exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0200
     * @tc.desc   TC-002: NaN input silent pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0300
     * @tc.desc   TC-003: +inf input triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0400
     * @tc.desc   TC-004: -inf input triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0500
     * @tc.desc   TC-005: errno unchanged after valid call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteFunc001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0600
     * @tc.desc   TC-006: domain_error sets errno to EDOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteFunc002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0700
     * @tc.desc   TC-007: FE_INVALID floating-point exception verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2FiniteFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteFunc003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0800
     * @tc.desc   TC-008: 10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testExp2FiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteSpec001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_0900
     * @tc.desc   TC-009: PC device symbol existence and dlsym loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2FiniteSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteSpec001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteSpec002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_1000
     * @tc.desc   TC-010: non-aarch64 symbol non-existence verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2FiniteSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteSpec002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteSpec003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_1100
     * @tc.desc   TC-011: function pointer nullptr safety check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2FiniteSpec003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteSpec003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteSpec004
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_1200
     * @tc.desc   TC-012: non-PC device stub mode verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2FiniteSpec004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteSpec004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2FiniteSpec005
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2_FINITE_1300
     * @tc.desc   TC-013: PC vs non-PC device behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2FiniteSpec005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2Finitendktest.exp2FiniteSpec005();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}