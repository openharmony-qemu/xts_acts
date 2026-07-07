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
import cmsgNxthdrndktest from 'libcmsgNxthdrndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function CmsgNxthdrNdkTest() {
  describe('CmsgNxthdrNdkTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });
    /**
     * @tc.name   testCmsgNxthdrNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0200
     * @tc.desc   TC-001: CMSG_NXTHDR basic function verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCmsgNxthdrNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0201
     * @tc.desc   TC-002: CMSG_NXTHDR single control message iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCmsgNxthdrNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0202
     * @tc.desc   TC-003: CMSG_NXTHDR multi control message iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCmsgNxthdrNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrFunc001
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0203
     * @tc.desc   TC-004: CMSG_NXTHDR returns NULL at end of buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCmsgNxthdrFunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrFunc001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrFunc002
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0204
     * @tc.desc   TC-005: CMSG_NXTHDR empty buffer handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCmsgNxthdrFunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrFunc002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrSpec001
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0205
     * @tc.desc   TC-006: PC device symbol existence and dlsym loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCmsgNxthdrSpec001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrSpec001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrSpec002
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0206
     * @tc.desc   TC-007: non-aarch64 symbol non-existence verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCmsgNxthdrSpec002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrSpec002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrSpec003
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0207
     * @tc.desc   TC-008: function pointer nullptr safety check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCmsgNxthdrSpec003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrSpec003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testCmsgNxthdrSpec004
     * @tc.number SUB_THIRDPARTY_MUSL_CMSG_NXTHDR_0208
     * @tc.desc   TC-009: non-PC device stub mode verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCmsgNxthdrSpec004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = cmsgNxthdrndktest.cmsgNxthdrSpec004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });
  });
}
