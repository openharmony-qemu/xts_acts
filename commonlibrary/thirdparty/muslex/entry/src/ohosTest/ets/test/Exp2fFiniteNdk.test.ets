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
import exp2ffinitedktest from 'libexp2ffinitedktest.so';

export default function Exp2fFiniteNdkTest() {
  describe('Exp2fFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    // ==================== 正常参数测试 ====================

    /**
     * @tc.name   testExp2fFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0100
     * @tc.desc   Verify exp2f_finite calculates base-2 exponential correctly (zero, positive, negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0200
     * @tc.desc   Verify exp2f_finite calculates large base-2 exponential values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0300
     * @tc.desc   Verify exp2f_finite precision matches standard powf(2, x)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0400
     * @tc.desc   Verify exp2f_finite handles integer powers correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    // ==================== 边界值测�?====================

    /**
     * @tc.name   testExp2fFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0500
     * @tc.desc   Verify exp2f_finite overflow boundary (large positive values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0600
     * @tc.desc   Verify exp2f_finite underflow boundary (large negative values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0700
     * @tc.desc   Verify exp2f_finite near overflow/underflow boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteBoundary003();
      expect(resNum == 1).assertTrue();
      done();
    });

    // ==================== 异常参数测试 ====================

    /**
     * @tc.name   testExp2fFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0800
     * @tc.desc   Verify exp2f_finite handles NaN and Inf inputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    // ==================== 稳定性测�?====================

    /**
     * @tc.name   testExp2fFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_0900
     * @tc.desc   Verify exp2f_finite returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExp2fFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteStable002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_1000
     * @tc.desc   Verify exp2f_finite handles massive number of calls without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2fFiniteStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteStable002();
      expect(resNum == 1).assertTrue();
      done();
    });

    // ==================== 多线程测�?====================

    /**
     * @tc.name   testExp2fFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_1100
     * @tc.desc   Verify exp2f_finite is thread-safe with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2fFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testExp2fFiniteThread002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP2F_FINITE_1200
     * @tc.desc   Verify exp2f_finite thread-safety with mixed parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExp2fFiniteThread002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = exp2ffinitedktest.exp2fFiniteThread002();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}