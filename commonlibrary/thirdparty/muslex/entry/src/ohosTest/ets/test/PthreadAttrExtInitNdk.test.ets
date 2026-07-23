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
import libpthreadattrextinitndktest from 'libpthreadattrextinitndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function PthreadAttrExtInitNdkTest() {
  describe('PthreadAttrExtInitNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testpthreadAttrExtInitNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0100
     * @tc.desc   Initialize pthread attr extension basic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0200
     * @tc.desc   Initialize attr extension with parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0300
     * @tc.desc   Initialize attr extension multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0500
     * @tc.desc   Initialize attr extension with null attr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0600
     * @tc.desc   Initialize attr extension error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0700
     * @tc.desc   Repeated init/destroy cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0800
     * @tc.desc   Initialize attr extension edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_0900
     * @tc.desc   Repeated attr init stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrExtInitThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_EXT_INIT_1000
     * @tc.desc   Multi-thread attr init concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrExtInitThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrextinitndktest.pthreadAttrExtInitThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}