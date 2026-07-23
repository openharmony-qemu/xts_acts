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
import librestracemovendktest from 'librestracemovendktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function ResTraceMoveNdkTest() {
  describe('ResTraceMoveNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testresTraceMoveNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0100
     * @tc.desc   Move resource trace basic operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0200
     * @tc.desc   Move trace between different regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0300
     * @tc.desc   Move trace with overlapping regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0500
     * @tc.desc   Move trace with null pointers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0600
     * @tc.desc   Move trace invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0700
     * @tc.desc   Move trace zero size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0800
     * @tc.desc   Move trace max size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveStable001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_0900
     * @tc.desc   Repeated trace move stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testresTraceMoveThread001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_MOVE_1000
     * @tc.desc   Multi-thread trace move concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testresTraceMoveThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracemovendktest.resTraceMoveThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

  });
}