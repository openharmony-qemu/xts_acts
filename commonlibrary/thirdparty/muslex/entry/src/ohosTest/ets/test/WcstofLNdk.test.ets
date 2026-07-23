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
import wcstoflndktest from 'libwcstoflndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function WcstofLNdkTest() {
  describe('WcstofLNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testMuslSymExportedWcstofl001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0100
     * @tc.desc   Original simple test for wcstof_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslSymExportedWcstofl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstofl();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0200
     * @tc.desc   Normal test: convert "123.45xyz"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0300
     * @tc.desc   Normal test: convert "  -123.45rest"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0400
     * @tc.desc   Normal test: convert "456.75" (no endptr)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0500
     * @tc.desc   Normal test: convert "+inf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0600
     * @tc.desc   Normal test: convert hex float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0700
     * @tc.desc   Normal test: convert "nan(payload)rest"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal007
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0800
     * @tc.desc   Normal test: locale NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflNormal008
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_0900
     * @tc.desc   Normal test: LC_CTYPE only locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflNormal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflNormal008();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1000
     * @tc.desc   Abnormal test: no trailing characters, endptr points to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1100
     * @tc.desc   Abnormal test: invalid input "xxx123.45"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1200
     * @tc.desc   Boundary test: empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1300
     * @tc.desc   Boundary test: single minus sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1400
     * @tc.desc   Boundary test: near FLT_MIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1500
     * @tc.desc   Boundary test: near FLT_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1600
     * @tc.desc   Boundary test: overflow to inf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1700
     * @tc.desc   Boundary test: no integer part ".5"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflBoundary007
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1800
     * @tc.desc   Boundary test: extreme hex float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflBoundary007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_1900
     * @tc.desc   Functional test: multiple valid conversions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2000
     * @tc.desc   Functional test: French locale with comma decimal (always success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2100
     * @tc.desc   Functional test: French locale hex float (always success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2200
     * @tc.desc   Functional test: overflow/underflow detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2300
     * @tc.desc   Functional test: complex scientific notation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflFunc006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2400
     * @tc.desc   Functional test: signed zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflFunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflFunc006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflStable001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2500
     * @tc.desc   Stability: repeated conversions 10000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflStable002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2600
     * @tc.desc   Stability: multi-threaded conversions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflStable003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2700
     * @tc.desc   Stability: very long string (8192 X's then number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflStable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflStable003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflStable004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2800
     * @tc.desc   Stability: repeated locale creation and conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflStable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflStable004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoflStable005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOF_L_2900
     * @tc.desc   Stability: stub mode consistency check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoflStable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoflndktest.wcstoflStable005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}