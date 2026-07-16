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
import libmalloccheckfromptrndktest from 'libmalloccheckfromptrndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function MallocCheckFromPtrNdkTest() {
  describe('MallocCheckFromPtrNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testmallocCheckFromPtrNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0100
     * @tc.desc   Check valid heap pointer from malloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0200
     * @tc.desc   Check nullptr returns valid result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0300
     * @tc.desc   Check pointer after free behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0500
     * @tc.desc   Check invalid pointer 0xDEADBEEF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0600
     * @tc.desc   Check stack address (non-heap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0700
     * @tc.desc   Check large malloc pointer boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0800
     * @tc.desc   Check zero-size malloc pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrStable001
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_0900
     * @tc.desc   Repeated malloc check calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testmallocCheckFromPtrThread001
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_CHECK_FROM_PTR_1000
     * @tc.desc   Multi-thread malloc check concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testmallocCheckFromPtrThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libmalloccheckfromptrndktest.mallocCheckFromPtrThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = (deviceType == '2in1' && resNum == 1) || (deviceType != '2in1' && (resNum == 0 || resNum == 1));
      expect(isValid).assertTrue();
      done();
    });

  });
}