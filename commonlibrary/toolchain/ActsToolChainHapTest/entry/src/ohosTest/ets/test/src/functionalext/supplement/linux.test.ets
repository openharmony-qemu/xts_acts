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

export default function linux_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_linux", () => {
    /**
     * @tc.name   brk
     * @tc.number SUB_THIRDPARTY_MUSL_BRK_0100
     * @tc.desc   libc-test brk
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("brk", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("brk");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   capget
     * @tc.number SUB_THIRDPARTY_MUSL_CAPGET_0100
     * @tc.desc   libc-test capget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("capget", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("capget");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clone
     * @tc.number SUB_THIRDPARTY_MUSL_CLONE_0100
     * @tc.desc   libc-test clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clone", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clone");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_create
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CREATE_0100
     * @tc.desc   libc-test epoll_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_create");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_create1
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CREATE_ONE_0100
     * @tc.desc   libc-test epoll_create1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_create1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_create1");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_ctl
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_CTL_0100
     * @tc.desc   libc-test epoll_ctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_ctl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_ctl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_pwait
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_PWAIT_0100
     * @tc.desc   libc-test epoll_pwait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_pwait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_pwait");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   epoll_wait
     * @tc.number SUB_THIRDPARTY_MUSL_EPOLL_WAIT_0100
     * @tc.desc   libc-test epoll_wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("epoll_wait", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("epoll_wait");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_0100
     * @tc.desc   libc-test eventfd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd_read
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_READ_0100
     * @tc.desc   libc-test eventfd_read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd_read", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd_read");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   eventfd_write
     * @tc.number SUB_THIRDPARTY_MUSL_EVENTFD_WRITE_0100
     * @tc.desc   libc-test eventfd_write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("eventfd_write", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("eventfd_write");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fanotify_init
     * @tc.number SUB_THIRDPARTY_MUSL_FANOTIFY_INIT_0100
     * @tc.desc   libc-test fanotify_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fanotify_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fanotify_init");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getrandom
     * @tc.number SUB_THIRDPARTY_MUSL_GETRANDOM_0100
     * @tc.desc   libc-test getrandom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getrandom", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getrandom");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   inotify_init1
     * @tc.number SUB_THIRDPARTY_MUSL_INOTIFY_INIT_ONE_0100
     * @tc.desc   libc-test inotify_init1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inotify_init1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inotify_init1");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memfd_create
     * @tc.number SUB_THIRDPARTY_MUSL_MEMFD_CREATE_0100
     * @tc.desc   libc-test memfd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memfd_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memfd_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mlock2
     * @tc.number SUB_THIRDPARTY_MUSL_MLOCK_TWO_0100
     * @tc.desc   libc-test mlock2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mlock2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mlock2");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   personality
     * @tc.number SUB_THIRDPARTY_MUSL_PERSONALITY_0100
     * @tc.desc   libc-test personality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("personality", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("personality");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   prctl
     * @tc.number SUB_THIRDPARTY_MUSL_PRCTL_0100
     * @tc.desc   libc-test prctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("prctl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("prctl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   prlimit
     * @tc.number SUB_THIRDPARTY_MUSL_PRLIMIT_0100
     * @tc.desc   libc-test prlimit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("prlimit", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("prlimit");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   quotactl
     * @tc.number SUB_THIRDPARTY_MUSL_QUOTACTL_0100
     * @tc.desc   libc-test quotactl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("quotactl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("quotactl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setfsgid
     * @tc.number SUB_THIRDPARTY_MUSL_SETFSGID_0100
     * @tc.desc   libc-test setfsgid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setfsgid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setfsgid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setfsuid
     * @tc.number SUB_THIRDPARTY_MUSL_SETFSUID_0100
     * @tc.desc   libc-test setfsuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setfsuid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setfsuid");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   signalfd
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNALFD_0100
     * @tc.desc   libc-test signalfd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("signalfd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("signalfd");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sysinfo
     * @tc.number SUB_THIRDPARTY_MUSL_SYSINFO_0100
     * @tc.desc   libc-test sysinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sysinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sysinfo");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timerfd_create
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_CREATE_0100
     * @tc.desc   libc-test timerfd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timerfd_create", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timerfd_create");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vmsplice
     * @tc.number SUB_THIRDPARTY_MUSL_VMSPLICE_0100
     * @tc.desc   libc-test vmsplice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vmsplice", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vmsplice");
      expect(result).assertEqual(0);
      done();
    });
  });
}
