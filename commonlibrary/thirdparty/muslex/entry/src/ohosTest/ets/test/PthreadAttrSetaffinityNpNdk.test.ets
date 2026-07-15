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
import libpthreadattrsetaffnpndktest from 'libpthreadattrsetaffnpndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function PthreadAttrSetaffinityNpNdkTest() {
  describe('PthreadAttrSetaffinityNpNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0100
     * @tc.desc   Set CPU affinity for current thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0200
     * @tc.desc   Set CPU affinity with specific CPU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0300
     * @tc.desc   Set CPU affinity with multiple CPUs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0500
     * @tc.desc   Set CPU affinity with null cpuset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0600
     * @tc.desc   Set CPU affinity with zero size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0700
     * @tc.desc   Set CPU affinity all CPUs mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0800
     * @tc.desc   Set CPU affinity verify after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_0900
     * @tc.desc   Repeated set affinity stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrSetaffinityNpThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_SETAFFINITY_NP_1000
     * @tc.desc   Multi-thread set affinity concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrSetaffinityNpThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrsetaffnpndktest.pthreadAttrSetaffinityNpThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}