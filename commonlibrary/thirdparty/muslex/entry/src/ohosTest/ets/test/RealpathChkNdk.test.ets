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
import realpathchkndktest from 'librealpathchkndktest.so';

export default function RealpathChkNdkTest() {
  describe('RealpathChkNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testRealpathChkNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0100
     * @tc.desc   Resolve root path with sufficient buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0200
     * @tc.desc   Resolve existing path with sufficient buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0300
     * @tc.desc   Resolve current directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0400
     * @tc.desc   Resolve parent directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkNormal005
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0500
     * @tc.desc   Resolve /proc/self/exe (if available)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkNormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkNormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0106
     * @tc.desc   Buffer too small should abort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testRealpathChkAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = realpathchkndktest.realpathChkAbnormal001();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testRealpathChkAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0107
     * @tc.desc   NULL resolved path should abort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('testRealpathChkAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    //   let resNum: number = realpathchkndktest.realpathChkAbnormal002();
    //   expect(resNum == 1).assertTrue();
      // done();
    // });

    /**
     * @tc.name   testRealpathChkAbnormal003
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0600
     * @tc.desc   Non-existent path should fail (not abort)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkAbnormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkAbnormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0700
     * @tc.desc   Buffer exactly PATH_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0800
     * @tc.desc   Very long path (not exceeding PATH_MAX)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealpathChkBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkStable001
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_0900
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRealpathChkStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testRealpathChkThread001
     * @tc.number SUB_THIRDPARTY_MUSL_REALPATH_CHK_1000
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRealpathChkThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = realpathchkndktest.realpathChkThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}