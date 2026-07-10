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
import isinffndktest from 'libisinffndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function isinffNdkTest() {
  describe('IsinffNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testIsinffNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0101
     * @tc.desc   Verify __isinff identifies positive infinity, negative infinity, NaN, zero, and normal values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsinffNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isinffndktest.isInffNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsinffBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0102
     * @tc.desc   Verify __isinff handles boundary values: FLT_MAX, FLT_MIN, and large finite numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsinffBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isinffndktest.isInffBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsinffAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0103
     * @tc.desc   Verify stub mode behavior: errno set to ENOSYS, return 0, no side effects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsinffAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isinffndktest.isInffAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      // 在Stub模式下（非2in1设备），期望返回1表示所有异常场景验证通过
      // 在正常模式下（2in1设备），也返回1（因为功能可用，不涉及Stub异常）
      // 因此此用例在所有设备上都期望返回1
      expect(resNum).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testIsinffAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0106
     * @tc.desc   Verify __isinff handles extreme inputs: near infinity, near zero, and invalid values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsinffAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isinffndktest.isInffAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsinffStable001
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0104
     * @tc.desc   Verify __isinff returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsinffStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = isinffndktest.isInffStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testIsinffThreadSafety001
     * @tc.number SUB_THIRDPARTY_MUSL_ISINFF_0105
     * @tc.desc   Verify __isinff is thread-safe (MT-Safe) - calls from multiple threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsinffThreadSafety001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = isinffndktest.isInffThreadSafety001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}