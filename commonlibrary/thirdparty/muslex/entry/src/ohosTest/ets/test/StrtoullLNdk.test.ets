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
import libstrtoulllndktest from 'libstrtoulllndktest.so';

export default function StrtoullLNdkTest() {
  describe('StrtoullLNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   teststrtoullLNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0100
     * @tc.desc   strtoull_l basic decimal conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0200
     * @tc.desc   strtoull_l with different locales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0300
     * @tc.desc   strtoull_l with hex and octal bases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0500
     * @tc.desc   strtoull_l with invalid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0600
     * @tc.desc   strtoull_l with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0700
     * @tc.desc   strtoull_l with min/max unsigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0800
     * @tc.desc   strtoull_l with zero and negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLStable001
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_0900
     * @tc.desc   Repeated strtoull_l calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   teststrtoullLThread001
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOULL_L_1000
     * @tc.desc   Multi-thread strtoull_l concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('teststrtoullLThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libstrtoulllndktest.strtoullLThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}