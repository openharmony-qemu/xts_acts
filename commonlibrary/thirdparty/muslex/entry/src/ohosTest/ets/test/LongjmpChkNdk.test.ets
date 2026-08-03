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
import longjmpchkndktest from 'liblongjmpchkndktest.so';

export default function LongjmpChkNdkTest() {
  describe('LongjmpChkNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testLongjmpChkNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0100
     * @tc.desc   Verify __longjmp_chk restores execution context correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongjmpChkNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0200
     * @tc.desc   Verify __longjmp_chk restores register state after setjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongjmpChkNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0300
     * @tc.desc   Verify __longjmp_chk handles nested setjmp/longjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLongjmpChkNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0400
     * @tc.desc   Verify __longjmp_chk detects invalid jump buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLongjmpChkAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0500
     * @tc.desc   Verify __longjmp_chk handles stack overflow detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLongjmpChkAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0600
     * @tc.desc   Verify __longjmp_chk with zero return value coerced to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLongjmpChkBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0700
     * @tc.desc   Verify __longjmp_chk with minimal stack frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLongjmpChkBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkStable001
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0800
     * @tc.desc   Verify __longjmp_chk stability with repeated jumps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLongjmpChkStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testLongjmpChkThread001
     * @tc.number SUB_THIRDPARTY_MUSL_LONGJMP_CHK_0900
     * @tc.desc   Verify __longjmp_chk thread safety with concurrent jumps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLongjmpChkThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = longjmpchkndktest.longjmpChkThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}