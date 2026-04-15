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

export default function time_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_time", () => {
    /**
     * @tc.name   clock
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_0100
     * @tc.desc   libc-test clock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clock_getcpuclockid
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCK_GETCPUCLOCKID_0100
     * @tc.desc   libc-test clock_getcpuclockid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clock_getcpuclockid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clock_getcpuclockid");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   difftime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_DIFFTIME_SUP_0100
     * @tc.desc   libc-test difftime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("difftime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("difftime_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mktime_sup
     * @tc.number SUB_THIRDPARTY_MUSL_MKTIME_SUP_0100
     * @tc.desc   libc-test mktime_sup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mktime_sup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mktime_sup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   timer_delete
     * @tc.number SUB_THIRDPARTY_MUSL_TIMER_DELETE_0100
     * @tc.desc   libc-test timer_delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("timer_delete", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("timer_delete");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   times
     * @tc.number SUB_THIRDPARTY_MUSL_TIMES_0100
     * @tc.desc   libc-test times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("times", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("times");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsftime_l
     * @tc.number SUB_THIRDPARTY_MUSL_WCSFTIME_L_0100
     * @tc.desc   libc-test wcsftime_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsftime_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsftime_l");
      expect(result).assertEqual(0);
      done();
    });
  });
}
