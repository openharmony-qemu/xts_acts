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
import getauxvaldktest from 'libgetauxvaldktest.so';

export default function GetauxvalNdkTest() {
  describe('GetauxvalNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testGetauxvalNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0100
     * @tc.desc   Verify __getauxval returns valid AT_PAGESZ value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0200
     * @tc.desc   Verify __getauxval returns valid AT_SECURE value (0 or 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0300
     * @tc.desc   Verify __getauxval returns valid AT_CLKTCK value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0400
     * @tc.desc   Verify __getauxval returns valid AT_RANDOM value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0500
     * @tc.desc   Verify __getauxval returns valid AT_ENTRY value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0600
     * @tc.desc   Verify __getauxval returns 0 and sets errno ENOENT for invalid item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0700
     * @tc.desc   Verify __getauxval handles negative item values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalAbnormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0800
     * @tc.desc   Verify __getauxval handles boundary item values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalAbnormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalAbnormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalStable001
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_0900
     * @tc.desc   Verify __getauxval returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetauxvalStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalStable002
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_1000
     * @tc.desc   Verify __getauxval handles massive calls without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetauxvalStable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalStable002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalThread001
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_1100
     * @tc.desc   Verify __getauxval is thread-safe with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetauxvalThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetauxvalThread002
     * @tc.number SUB_THIRDPARTY_MUSL_GETAUXVAL_1200
     * @tc.desc   Verify __getauxval thread-safety with mixed item values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetauxvalThread002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = getauxvaldktest.getauxvalThread002();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}