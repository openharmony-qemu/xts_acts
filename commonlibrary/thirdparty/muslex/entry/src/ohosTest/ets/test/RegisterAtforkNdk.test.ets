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
import registeratforkndktest from 'libregisteratforkndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function RegisterAtforkNdkTest() {
  describe('RegisterAtforkNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testRegisterAtforkNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0100
     * @tc.desc   Register all three handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0200
     * @tc.desc   Register with NULL handlers (should succeed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0300
     * @tc.desc   Register only prepare handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0400
     * @tc.desc   Register only parent handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0500
     * @tc.desc   Register only child handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkNormal005();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0600
     * @tc.desc   Register after fork (should still succeed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0700
     * @tc.desc   Register multiple handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAtforkBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkStable001
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0800
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAtforkStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testRegisterAtforkThread001
     * @tc.number SUB_THIRDPARTY_MUSL_REGISTER_ATFORK_0900
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterAtforkThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = registeratforkndktest.registerAtforkThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}