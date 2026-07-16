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
import librestracefreeregionndktest from 'librestracefreeregionndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function ResTraceFreeRegionNdkTest() {
  describe('ResTraceFreeRegionNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testresTraceFreeRegionNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0100
     * @tc.desc   Free resource trace region basic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0200
     * @tc.desc   Free region with specific address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0300
     * @tc.desc   Free region multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0500
     * @tc.desc   Free region with null pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0600
     * @tc.desc   Free region invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0700
     * @tc.desc   Free region zero size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0800
     * @tc.desc   Free region large size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionStable001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_0900
     * @tc.desc   Repeated free region stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceFreeRegionThread001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_FREE_REGION_1000
     * @tc.desc   Multi-thread free region concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceFreeRegionThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracefreeregionndktest.resTraceFreeRegionThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

  });
}