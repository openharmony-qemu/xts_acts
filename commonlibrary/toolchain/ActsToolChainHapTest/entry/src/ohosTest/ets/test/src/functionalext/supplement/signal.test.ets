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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function signal_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_signal", () => {
    /**
     * @tc.name   libc_current_sigrtmax
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_CURRENT_SIGRTMAX_0100
     * @tc.desc   libc-test __libc_current_sigrtmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("libc_current_sigrtmax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__libc_current_sigrtmax");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   libc_current_sigrtmin
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_CURRENT_SIGRTMIN_0100
     * @tc.desc   libc-test __libc_current_sigrtmin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("libc_current_sigrtmin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__libc_current_sigrtmin");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getitimer
     * @tc.number SUB_THIRDPARTY_MUSL_GETITIMER_0100
     * @tc.desc   libc-test getitimer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getitimer", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getitimer");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   kill
     * @tc.number SUB_THIRDPARTY_MUSL_KILL_0100
     * @tc.desc   libc-test kill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("kill", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("kill");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   killpg
     * @tc.number SUB_THIRDPARTY_MUSL_KILLPG_0100
     * @tc.desc   libc-test killpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("killpg", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("killpg");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   psiginfo
     * @tc.number SUB_THIRDPARTY_MUSL_PSIGINFO_0100
     * @tc.desc   libc-test psiginfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("psiginfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("psiginfo");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   psignal
     * @tc.number SUB_THIRDPARTY_MUSL_PSIGNAL_0100
     * @tc.desc   libc-test psignal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("psignal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("psignal");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigaction
     * @tc.number SUB_THIRDPARTY_MUSL_SIGACTION_0100
     * @tc.desc   libc-test sigaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigaction", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigaction");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigignore
     * @tc.number SUB_THIRDPARTY_MUSL_SIGIGNORE_0100
     * @tc.desc   libc-test sigignore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigignore", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigignore");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigqueue
     * @tc.number SUB_THIRDPARTY_MUSL_SIGQUEUE_0100
     * @tc.desc   libc-test sigqueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigqueue", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigqueue");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigwait
     * @tc.number SUB_THIRDPARTY_MUSL_SIGWAIT_0100
     * @tc.desc   libc-test sigwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigwait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigwait");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigwaitinfo
     * @tc.number SUB_THIRDPARTY_MUSL_SIGWAITINFO_0100
     * @tc.desc   libc-test sigwaitinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigwaitinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigwaitinfo");
      expect(result).assertEqual(0);
      done();
    });
  });
}
