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
import feenableexceptndktest from 'libfeenableexceptndktest.so';

export default function FeenableexceptNdkTest() {
  describe('FeenableexceptNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testFeenableexceptNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0100
     * @tc.desc   Enable FE_DIVBYZERO exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0200
     * @tc.desc   Enable FE_INVALID exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0300
     * @tc.desc   Enable multiple exceptions FE_DIVBYZERO|FE_OVERFLOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0500
     * @tc.desc   Enable with zero exception mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0600
     * @tc.desc   Enable with invalid exception mask 0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0700
     * @tc.desc   Enable all exceptions FE_ALL_EXCEPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0800
     * @tc.desc   Toggle FE_DIVBYZERO enable after disable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptStable001
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_0900
     * @tc.desc   Repeated feenableexcept/fedisableexcept stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFeenableexceptThread001
     * @tc.number SUB_THIRDPARTY_MUSL_FEENABLE_EXCEPT_1000
     * @tc.desc   Multi-thread enable/disable concurrency test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFeenableexceptThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = feenableexceptndktest.feenableexceptThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}