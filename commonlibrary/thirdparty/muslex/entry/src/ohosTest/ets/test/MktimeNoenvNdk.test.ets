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
import libmktimenoenvndktest from 'libmktimenoenvndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function MktimeNoenvNdkTest() {
  describe('MktimeNoenvNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testmktimeNoenvNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0100
     * @tc.desc   mktime without TZ env basic conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0200
     * @tc.desc   mktime without TZ env with DST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0300
     * @tc.desc   mktime without TZ env for epoch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0500
     * @tc.desc   mktime with invalid date fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0600
     * @tc.desc   mktime with negative time_t values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0700
     * @tc.desc   mktime boundary year 2038 problem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0800
     * @tc.desc   mktime boundary for Feb 29 leap year
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvStable001
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_0900
     * @tc.desc   Repeated mktime calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmktimeNoenvThread001
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_NOENV_1000
     * @tc.desc   Multi-thread mktime concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmktimeNoenvThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmktimenoenvndktest.mktimeNoenvThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 0) || (deviceType != '2in1' && resNum == 1);
      expect(isValid).assertTrue();
      done();
    });

  });
}