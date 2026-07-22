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
import open2ndktest from 'libopenextndktest.so';

export default function OpenExtNdkTest() {
  describe('OpenExtNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testMuslSymExportedOpen2001
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0100
     * @tc.desc   Original simple test for __open_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslSymExportedOpen2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Normal003
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0200
     * @tc.desc   Normal test: open /dev/null with O_WRONLY | O_APPEND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Normal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Normal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Normal004
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0300
     * @tc.desc   Normal test: open /dev/null with O_WRONLY | O_TRUNC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Normal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Normal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Abnormal004
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0400
     * @tc.desc   Abnormal test: empty path (should fail with ENOENT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Abnormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Abnormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Abnormal005
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0500
     * @tc.desc   Abnormal test: invalid flags (EINVAL expected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Abnormal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Abnormal005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Abnormal006
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0600
     * @tc.desc   Abnormal test: non-existent file (ENOENT expected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Abnormal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Abnormal006();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Abnormal007
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0700
     * @tc.desc   Abnormal test: open directory with O_WRONLY (EISDIR expected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Abnormal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Abnormal007();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Boundary001
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0800
     * @tc.desc   Boundary test: path length > PATH_MAX (ENAMETOOLONG expected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Boundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Boundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Boundary002
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_0900
     * @tc.desc   Boundary test: flags = 0 (O_RDONLY)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Boundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Boundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Boundary003
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1000
     * @tc.desc   Boundary test: O_CLOEXEC flag, verify FD_CLOEXEC set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Boundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Boundary003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Boundary005
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1100
     * @tc.desc   Boundary test: symlink test (skipped, always success in full mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Boundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Boundary005();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Func001
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1200
     * @tc.desc   Functional: compare open2 with standard open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Func001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Func001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Func003
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1300
     * @tc.desc   Functional: verify function works in full mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Func003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Func003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Func004
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1400
     * @tc.desc   Functional: O_DIRECT flag test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Func004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Func004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Stable001
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1500
     * @tc.desc   Stability: repeated open/close 10000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Stable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Stable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Stable002
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1600
     * @tc.desc   Stability: multi-threaded concurrent open/close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Stable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Stable002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Stable003
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1700
     * @tc.desc   Stability: exhaust file descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Stable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Stable003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testOpen2Stable004
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_EXT_1800
     * @tc.desc   Stability: stub mode repeated calls consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpen2Stable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = open2ndktest.open2Stable004();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}