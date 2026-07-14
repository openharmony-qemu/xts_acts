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
import libpthreadattrgetaffnpndktest from 'libpthreadattrgetaffnpndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function PthreadAttrGetaffinityNpNdkTest() {
  describe('PthreadAttrGetaffinityNpNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0100
     * @tc.desc   Get CPU affinity for current thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0200
     * @tc.desc   Get CPU affinity with large cpuset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0300
     * @tc.desc   Get CPU affinity after attribute set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0500
     * @tc.desc   Get CPU affinity with null cpuset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0600
     * @tc.desc   Get CPU affinity with zero size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0700
     * @tc.desc   Get CPU affinity max cpuset size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0800
     * @tc.desc   Get CPU affinity min cpuset size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpStable001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_0900
     * @tc.desc   Repeated get affinity stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testpthreadAttrGetaffinityNpThread001
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ATTR_GETAFFINITY_NP_1000
     * @tc.desc   Multi-thread get affinity concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpthreadAttrGetaffinityNpThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libpthreadattrgetaffnpndktest.pthreadAttrGetaffinityNpThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && resNum == 0);
      expect(isValid).assertTrue();
      done();
    });

  });
}