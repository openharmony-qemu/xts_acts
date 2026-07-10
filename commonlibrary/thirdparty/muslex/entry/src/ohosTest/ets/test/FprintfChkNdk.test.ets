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
import fprintfchkdktest from 'libfprintfchkdktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function FprintfChkNdkTest() {
  describe('FprintfChkNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    // ==================== 正常参数测试 ====================

    /**
     * @tc.name   testFprintfChkNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0101
     * @tc.desc   Verify __fprintf_chk writes output with flag=0 and various formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0102
     * @tc.desc   Verify __fprintf_chk writes output with flag=1 (security check enabled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0103
     * @tc.desc   Verify __fprintf_chk handles mixed format strings correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 边界值测试 ====================

    /**
     * @tc.name   testFprintfChkBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0104
     * @tc.desc   Verify __fprintf_chk handles long and very long strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFprintfChkBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0105
     * @tc.desc   Verify __fprintf_chk handles large numbers and scientific notation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 异常参数测试 ====================

    /**
     * @tc.name   testFprintfChkAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0106
     * @tc.desc   Verify __fprintf_chk handles invalid FILE* pointer gracefully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testFprintfChkAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = fprintfchkdktest.fprintfChkAbnormal001();
    //   let deviceType: string = deviceInfo.deviceType;
    //   let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
    //   expect(isValid).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testFprintfChkAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0107
     * @tc.desc   Verify __fprintf_chk handles empty format string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkAbnormal003
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0108
     * @tc.desc   Verify __fprintf_chk handles format-parameter mismatches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testFprintfChkAbnormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = fprintfchkdktest.fprintfChkAbnormal003();
    //   let deviceType: string = deviceInfo.deviceType;
    //   let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
    //   expect(isValid).assertTrue();
      // done();
    // });

    // ==================== 稳定性测试 ====================

    /**
     * @tc.name   testFprintfChkStable001
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0109
     * @tc.desc   Verify __fprintf_chk returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFprintfChkStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkStable002
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0110
     * @tc.desc   Verify __fprintf_chk handles massive formatting calls without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFprintfChkStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkStable002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    // ==================== 多线程测试 ====================

    /**
     * @tc.name   testFprintfChkThread001
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0111
     * @tc.desc   Verify __fprintf_chk thread-safety with different file outputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFprintfChkThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testFprintfChkThread002
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_CHK_0112
     * @tc.desc   Verify __fprintf_chk thread-safety with shared file output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFprintfChkThread002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = fprintfchkdktest.fprintfChkThread002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}