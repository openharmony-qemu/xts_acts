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
import hilogbaseprintndktest from 'libhilogbaseprintndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function HilogBasePrintNdkTest() {
  describe('HilogBasePrintNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testHilogBasePrintNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0100
     * @tc.desc   Hilog print basic message test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0200
     * @tc.desc   Hilog print with format arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0300
     * @tc.desc   Hilog print with multiple format specifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0500
     * @tc.desc   Hilog print with null tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0600
     * @tc.desc   Hilog print with null message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0700
     * @tc.desc   Hilog print with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0800
     * @tc.desc   Hilog print with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintStable001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_0900
     * @tc.desc   Repeated hilog print stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBasePrintThread001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_PRINT_1000
     * @tc.desc   Multi-thread hilog print concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBasePrintThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });
  });
}