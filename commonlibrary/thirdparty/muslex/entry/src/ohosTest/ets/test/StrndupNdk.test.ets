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
import strndupndktest from 'libstrndupndktest.so';

export default function StrndupNdkTest() {
  describe('StrndupNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testStrndupNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0100
     * @tc.desc   Duplicate first 5 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0200
     * @tc.desc   n larger than string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0300
     * @tc.desc   n = 0 should return empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0400
     * @tc.desc   Duplicate string with embedded NUL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0500
     * @tc.desc   n exactly equals string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0106
     * @tc.desc   NULL input should return NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // 应该crash
    // it('testStrndupAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = strndupndktest.strndupAbnormal001();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testStrndupAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0600
     * @tc.desc   n = SIZE_MAX (should handle gracefully)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0700
     * @tc.desc   n = 1 with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0800
     * @tc.desc   Very long string with n smaller than length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrndupBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = strndupndktest.strndupBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupStable001
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0900
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStrndupStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = strndupndktest.strndupStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testStrndupThread001
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_1000
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrndupThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = strndupndktest.strndupThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}