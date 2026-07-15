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
import wcstoldlndktest from 'libwcstoldlndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function WcstoldLNdkTest() {
  describe('WcstoldLNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testWcstoldlNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0100
     * @tc.desc   Normal test: convert "123.45xyz"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0200
     * @tc.desc   Normal test: convert "  -123.45rest"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0300
     * @tc.desc   Normal test: convert "456.75" (no endptr)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0400
     * @tc.desc   Normal test: convert "+inf"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0500
     * @tc.desc   Normal test: convert hex float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0600
     * @tc.desc   Normal test: convert "nan(payload)rest"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal007
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0700
     * @tc.desc   Normal test: locale NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlNormal008
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0800
     * @tc.desc   Normal test: LC_CTYPE only locale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlNormal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlNormal008();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_0900
     * @tc.desc   Abnormal test: invalid input "xxx123.45"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1000
     * @tc.desc   Boundary test: empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1100
     * @tc.desc   Boundary test: single minus sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1200
     * @tc.desc   Boundary test: near LDBL_MIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1300
     * @tc.desc   Boundary test: near LDBL_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1400
     * @tc.desc   Boundary test: overflow to inf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1500
     * @tc.desc   Boundary test: no integer part ".5"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlBoundary007
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1600
     * @tc.desc   Boundary test: extreme hex float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlBoundary007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1700
     * @tc.desc   Functional test: multiple valid conversions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1800
     * @tc.desc   Functional test: French locale with comma decimal (always success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_1900
     * @tc.desc   Functional test: French locale hex float (always success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2000
     * @tc.desc   Functional test: overflow/underflow detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2100
     * @tc.desc   Functional test: complex scientific notation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc006
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2200
     * @tc.desc   Functional test: signed zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc006();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlFunc007
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2300
     * @tc.desc   Functional test: high precision hex floats (depends on LDBL_MANT_DIG)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlFunc007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlFunc007();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlStable001
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2400
     * @tc.desc   Stability: repeated conversions 10000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlStable002
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2500
     * @tc.desc   Stability: multi-threaded conversions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlStable003
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2600
     * @tc.desc   Stability: very long string (8192 X's then number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlStable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlStable003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlStable004
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2700
     * @tc.desc   Stability: repeated locale creation and conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlStable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlStable004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testWcstoldlStable005
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLD_L_2800
     * @tc.desc   Stability: stub mode consistency check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWcstoldlStable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = wcstoldlndktest.wcstoldlStable005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}