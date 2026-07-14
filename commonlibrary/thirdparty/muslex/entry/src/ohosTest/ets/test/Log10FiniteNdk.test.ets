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
import musl_log10finitedktest from 'libmusl_log10finitedktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function Log10FiniteNdkTest() {
  describe('Log10FiniteNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testLog10FiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0100
     * @tc.desc   log10(1.0) = 0.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0200
     * @tc.desc   log10(10.0) = 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0300
     * @tc.desc   log10(100.0) = 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0400
     * @tc.desc   log10(0.1) = -1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0500
     * @tc.desc   log10(1000.0) = 3.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0600
     * @tc.desc   log10(2.0) matches std::log10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal007
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0700
     * @tc.desc   Positive infinity returns +inf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteNormal008
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0800
     * @tc.desc   NaN input returns NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteNormal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteNormal008();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0109
     * @tc.desc   x = 0.0 -> pole error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testLog10FiniteAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = musl_log10finitedktest.log10FiniteAbnormal001();
    //   let deviceType: string = deviceInfo.deviceType;
    //   let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
    //   expect(isValid).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testLog10FiniteAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0110
     * @tc.desc   x = -1.0 -> domain error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testLog10FiniteAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = musl_log10finitedktest.log10FiniteAbnormal002();
    //   let deviceType: string = deviceInfo.deviceType;
    //   let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
    //   expect(isValid).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testLog10FiniteBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_0900
     * @tc.desc   DBL_MAX -> finite result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_1000
     * @tc.desc   DBL_MIN -> finite result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLog10FiniteBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_1100
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLog10FiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testLog10FiniteThread001
     * @tc.number SUB_THIRDPARTY_MUSL_LOG10_FINITE_1200
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLog10FiniteThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = musl_log10finitedktest.log10FiniteThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}