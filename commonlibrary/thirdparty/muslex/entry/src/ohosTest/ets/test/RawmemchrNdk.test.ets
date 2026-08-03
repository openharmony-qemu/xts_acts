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
import rawmemchrndktest from 'librawmemchrndktest.so';

export default function RawmemchrNdkTest() {
  describe('RawmemchrNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testRawmemchrNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0100
     * @tc.desc   Find existing character in string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0200
     * @tc.desc   Find first character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0300
     * @tc.desc   Find last character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0400
     * @tc.desc   Find NUL terminator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0500
     * @tc.desc   Find character in empty string (only NUL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrNormal006
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0600
     * @tc.desc   Find character in long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrNormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrNormal006();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0107
     * @tc.desc   Character not found should return end of string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testRawmemchrAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = rawmemchrndktest.rawmemchrAbnormal001();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testRawmemchrAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0108
     * @tc.desc   Character not found in long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testRawmemchrAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = rawmemchrndktest.rawmemchrAbnormal002();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testRawmemchrBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0700
     * @tc.desc   Find NUL at end of long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRawmemchrBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrStable001
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0800
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRawmemchrStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRawmemchrThread001
     * @tc.number SUB_THIRDPARTY_MUSL_RAWMEMCHR_0900
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRawmemchrThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = rawmemchrndktest.rawmemchrThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}