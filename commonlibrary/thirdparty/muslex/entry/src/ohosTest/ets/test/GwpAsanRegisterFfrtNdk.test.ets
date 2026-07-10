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

    it('testgwpAsanRegisterFfrtNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    it('testgwpAsanRegisterFfrtThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libgwpasanregffrtndktest.gwpAsanRegisterFfrtThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

  });
}

