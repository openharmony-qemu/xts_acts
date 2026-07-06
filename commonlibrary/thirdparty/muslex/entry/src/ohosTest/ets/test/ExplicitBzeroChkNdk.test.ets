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
import explicitbzerochkndktest from 'libexplicitbzerochkndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function ExplicitBzeroChkNdkTest() {
  describe('ExplicitBzeroChkNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });
    /**
     * @tc.name   testMuslSymExportedExplicitBzeroChk001
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0100
     * @tc.desc   Original simple test for __explicit_bzero_chk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslSymExportedExplicitBzeroChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChk();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0101
     * @tc.desc   Normal test: zero out entire buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0102
     * @tc.desc   Normal test: zero out first 5 bytes of 10-byte buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0103
     * @tc.desc   Normal test: zero length should not modify buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0104
     * @tc.desc   Normal test: zero out first byte only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkAbnormal003
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0105
     * @tc.desc   Abnormal test: zero length on single byte buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkAbnormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkAbnormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0106
     * @tc.desc   Boundary test: zero length on single byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0107
     * @tc.desc   Boundary test: clear single byte buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkBoundary003
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0108
     * @tc.desc   Boundary test: clear 9 bytes of 10-byte buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkBoundary003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0109
     * @tc.desc   Functional: volatile buffer ensures no optimization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0110
     * @tc.desc   Functional: zero length should not change memory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkFunc003
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0111
     * @tc.desc   Functional: stub mode returns ENOSYS and no modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkFunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkFunc003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkFunc004
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0112
     * @tc.desc   Functional: not applicable, always returns 1 in full mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkFunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkFunc004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkStable001
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0113
     * @tc.desc   Stability: repeated calls 10000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkStable002
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0114
     * @tc.desc   Stability: multi-threaded concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testExplicitBzeroChkStable004
     * @tc.number SUB_THIRDPARTY_MUSL_EXPLICIT_BZERO_CHK_0115
     * @tc.desc   Stability: stub mode repeated calls consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testExplicitBzeroChkStable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = explicitbzerochkndktest.explicitBzeroChkStable004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}
