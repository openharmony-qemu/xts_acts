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
import atan2Finitendktest from 'libatan2Finitendktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function Atan2FiniteNdkTest() {
  describe('Atan2FiniteNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });
    /**
     * @tc.name   testAtan2FiniteNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0100
     * @tc.desc   TC-001: __atan2_finite basic function consistency with atan2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0200
     * @tc.desc   TC-002: NaN input silent pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0300
     * @tc.desc   TC-003: +inf input triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0400
     * @tc.desc   TC-004: -inf input triggers domain_error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0500
     * @tc.desc   TC-005: errno unchanged after valid call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0600
     * @tc.desc   TC-006: domain_error sets errno to EDOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAtan2FiniteFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteStable001
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0700
     * @tc.desc   TC-007: 10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAtan2FiniteStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteSpec001
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0800
     * @tc.desc   TC-008: PC device symbol existence and dlsym loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2FiniteSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteSpec001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteSpec002
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_0900
     * @tc.desc   TC-009: non-aarch64 symbol non-existence verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2FiniteSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteSpec002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteSpec003
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_1000
     * @tc.desc   TC-010: function pointer nullptr safety check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2FiniteSpec003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteSpec003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteSpec004
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_1100
     * @tc.desc   TC-011: non-PC device stub mode verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2FiniteSpec004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteSpec004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testAtan2FiniteSpec005
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN2_FINITE_1200
     * @tc.desc   TC-012: PC vs non-PC device behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtan2FiniteSpec005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = atan2Finitendktest.atan2FiniteSpec005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}