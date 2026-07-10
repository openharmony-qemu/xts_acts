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

    it('testHilogBasePrintNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    it('testHilogBasePrintThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseprintndktest.hilogBasePrintThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });
  });
}
