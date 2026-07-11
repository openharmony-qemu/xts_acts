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
import libgwpasanregffrtndktest from 'libgwpasanregffrtndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function GwpAsanRegisterFfrtNdkTest() {
  describe('GwpAsanRegisterFfrtNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testgwpAsanRegisterFfrtNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0100
     * @tc.desc   Register FFRT handler basic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0200
     * @tc.desc   Register FFRT handler with different params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0300
     * @tc.desc   Register FFRT handler multiple registrations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0500
     * @tc.desc   Register FFRT handler invalid input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0600
     * @tc.desc   Register FFRT handler edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0700
     * @tc.desc   Register FFRT handler boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0800
     * @tc.desc   Register FFRT handler boundary behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtStable001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_0900
     * @tc.desc   Repeated FFRT register stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testgwpAsanRegisterFfrtThread001
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_REGISTER_FFRT_1000
     * @tc.desc   Multi-thread FFRT register concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgwpAsanRegisterFfrtThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

  });
}