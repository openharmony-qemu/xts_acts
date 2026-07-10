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
import expfinitedktest from 'libexpfinitedktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function ExpFiniteNdkTest() {
  describe('ExpFiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    // ==================== 正常参数测试 ====================

    /**
     * @tc.name   testExpFiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0101
     * @tc.desc   Verify __exp_finite calculates exponential values correctly (zero, positive, negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0102
     * @tc.desc   Verify __exp_finite calculates large exponential values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0103
     * @tc.desc   Verify __exp_finite precision matches standard exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 边界值测试 ====================

    /**
     * @tc.name   testExpFiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0104
     * @tc.desc   Verify __exp_finite overflow boundary (large positive values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0105
     * @tc.desc   Verify __exp_finite underflow boundary (large negative values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0106
     * @tc.desc   Verify __exp_finite near overflow/underflow boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteBoundary003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 异常参数测试 ====================

    /**
     * @tc.name   testExpFiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0107
     * @tc.desc   Verify __exp_finite handles NaN and Inf inputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 稳定性测试 ====================

    /**
     * @tc.name   testExpFiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0108
     * @tc.desc   Verify __exp_finite returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExpFiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteStable002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0109
     * @tc.desc   Verify __exp_finite handles massive number of calls without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExpFiniteStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 多线程测试 ====================

    /**
     * @tc.name   testExpFiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0110
     * @tc.desc   Verify __exp_finite is thread-safe with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExpFiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExpFiniteThread002
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_FINITE_0111
     * @tc.desc   Verify __exp_finite thread-safety with mixed parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExpFiniteThread002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = expfinitedktest.expFiniteThread002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}
