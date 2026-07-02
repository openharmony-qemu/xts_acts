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
import qsortrndktest from 'libqsortrndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function qsortrNdkTest() {
  describe('QsortrNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testMuslSymExportedQsortr001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0100
     * @tc.desc   test qsort_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslSymExportedQsortr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortR();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0101
     * @tc.desc   Verify qsort_r sorts integers with context (descending)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0102
     * @tc.desc   Verify qsort_r sorts uint8_t array correctly vs reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0103
     * @tc.desc   Verify qsort_r sorts large struct (47 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0104
     * @tc.desc   Verify context switching ascending/descending (always expect success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRNormal004();
      expect(resNum).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testQsortRAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0105
     * @tc.desc   Verify stub mode returns ENOSYS and does not modify data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0106
     * @tc.desc   Verify nel = 0 returns immediately, no comparator call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0107
     * @tc.desc   Verify nel = 1 returns immediately, no comparator call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0108
     * @tc.desc   Verify max elements (63) with various types sorts correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRBoundary003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0109
     * @tc.desc   Comprehensive sort correctness across types and patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0110
     * @tc.desc   Verify comparator call count is reasonable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0111
     * @tc.desc   Verify instability of equal elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRFunc003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRFunc004
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0112
     * @tc.desc   Verify context arg can carry complex structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRFunc004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRFunc005
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0113
     * @tc.desc   Verify stub mode does not sort (duplicate of abnormal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRFunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRFunc005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRStable001
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0114
     * @tc.desc   Large array sort does not crash and finishes in time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRStable002
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0115
     * @tc.desc   Repeated sorts of the same array give identical result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRStable003
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0116
     * @tc.desc   Sort large struct array under memory pressure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRStable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRStable003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testQsortRStable004
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0117
     * @tc.desc   Comparator longjmp safety (skipped, always expect success)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRStable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRStable004();
      expect(resNum).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testQsortRStable005
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_R_0118
     * @tc.desc   Multi-threaded sorting of independent arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQsortRStable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = qsortrndktest.qsortRStable005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}
