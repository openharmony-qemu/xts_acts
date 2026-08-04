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
import strdupndktest from 'libstrdupndktest.so';

export default function StrdupNdkTest() {
  describe('StrdupNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testStrdupNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0100
     * @tc.desc   Duplicate a simple string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0200
     * @tc.desc   Duplicate empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0300
     * @tc.desc   Duplicate long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0400
     * @tc.desc   Duplicate string with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0500
     * @tc.desc   Duplicate string with all ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0106
     * @tc.desc   NULL input should return NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // 接口问题
    // it('testStrdupAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = strdupndktest.strdupAbnormal001();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testStrdupBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0600
     * @tc.desc   Very long string (near memory limit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0700
     * @tc.desc   String with only NUL terminator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrdupBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strdupndktest.strdupBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupStable001
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0800
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStrdupStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = strdupndktest.strdupStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrdupThread001
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0900
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrdupThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = strdupndktest.strdupThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}