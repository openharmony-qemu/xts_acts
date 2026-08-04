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
import fcntl64nativetest from 'libfcntl64nativetest.so';

export default function Fcntl64NativeTest() {
  describe('Fcntl64NativeTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testFcntl64Normal001
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0100
     * @tc.desc   F_GETFD on temp file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Normal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Normal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Normal002
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0200
     * @tc.desc   F_SETFD and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Normal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Normal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Normal003
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0300
     * @tc.desc   F_GETFL on temp file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Normal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Normal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Normal004
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0400
     * @tc.desc   IsStubMode check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Normal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Normal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Abnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0500
     * @tc.desc   Invalid fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Abnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Abnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Abnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0600
     * @tc.desc   Invalid cmd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Abnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Abnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Boundary001
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0700
     * @tc.desc   F_GETFD on stdin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Boundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Boundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Boundary002
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0800
     * @tc.desc   Clear FD_CLOEXEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFcntl64Boundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Boundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Stable001
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_0900
     * @tc.desc   10000 repeated calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFcntl64Stable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Stable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFcntl64Thread001
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL64_NATIVE_1000
     * @tc.desc   Multi-thread safety
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFcntl64Thread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = fcntl64nativetest.fcntl64Thread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}