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
import librestracendktest from 'librestracendktest.so';

export default function RestraceNdkTest() {
  describe('RestraceNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testrestraceNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0100
     * @tc.desc   Resource trace basic write operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0200
     * @tc.desc   Resource trace with size parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0300
     * @tc.desc   Resource trace multiple writes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0500
     * @tc.desc   Resource trace with null address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0600
     * @tc.desc   Resource trace with zero size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0700
     * @tc.desc   Resource trace max size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0800
     * @tc.desc   Resource trace min size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceStable001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_0900
     * @tc.desc   Repeated resource trace stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceThread001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_1000
     * @tc.desc   Multi-thread resource trace concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestracendktest.restraceThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}