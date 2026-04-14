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

export default function string_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_string", () => {
    /**
     * @tc.name   bzero
     * @tc.number SUB_THIRDPARTY_MUSL_BZERO_0100
     * @tc.desc   libc-test bzero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("bzero", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("bzero");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   index
     * @tc.number SUB_THIRDPARTY_MUSL_INDEX_0100
     * @tc.desc   libc-test index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("index", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("index");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memccpy
     * @tc.number SUB_THIRDPARTY_MUSL_MEMCCPY_0100
     * @tc.desc   libc-test memccpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memccpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memccpy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memchr
     * @tc.number SUB_THIRDPARTY_MUSL_MEMCHR_0100
     * @tc.desc   libc-test memchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memchr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memchr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   memmove
     * @tc.number SUB_THIRDPARTY_MUSL_MEMMOVE_0100
     * @tc.desc   libc-test memmove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memmove", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memmove");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   mempcpy
     * @tc.number SUB_THIRDPARTY_MUSL_MEMPCPY_0100
     * @tc.desc   libc-test mempcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mempcpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mempcpy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strcasecmp
     * @tc.number SUB_THIRDPARTY_MUSL_STRCASECMP_0100
     * @tc.desc   libc-test strcasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strcasecmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strcasecmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strcasestr
     * @tc.number SUB_THIRDPARTY_MUSL_STRCASESTR_0100
     * @tc.desc   libc-test strcasestr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strcasestr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strcasestr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strcat
     * @tc.number SUB_THIRDPARTY_MUSL_STRCAT_0100
     * @tc.desc   libc-test strcat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strcat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strcat");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strchrnul
     * @tc.number SUB_THIRDPARTY_MUSL_STRCHRNUL_0100
     * @tc.desc   libc-test strchrnul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strchrnul", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strchrnul");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strcoll
     * @tc.number SUB_THIRDPARTY_MUSL_STRCOLL_0100
     * @tc.desc   libc-test strcoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strcoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strcoll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strdup
     * @tc.number SUB_THIRDPARTY_MUSL_STRDUP_0100
     * @tc.desc   libc-test strdup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strdup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strdup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strerror_r
     * @tc.number SUB_THIRDPARTY_MUSL_STRERROR_R_0100
     * @tc.desc   libc-test strerror_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strerror_r", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strerror_r");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strndup
     * @tc.number SUB_THIRDPARTY_MUSL_STRNDUP_0100
     * @tc.desc   libc-test strndup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strndup", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strndup");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strnlen
     * @tc.number SUB_THIRDPARTY_MUSL_STRNLEN_0100
     * @tc.desc   libc-test strnlen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strnlen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strnlen");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strsep
     * @tc.number SUB_THIRDPARTY_MUSL_STRSEP_0100
     * @tc.desc   libc-test strsep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strsep", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strsep");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strsignal
     * @tc.number SUB_THIRDPARTY_MUSL_STRSIGNAL_0100
     * @tc.desc   libc-test strsignal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strsignal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strsignal");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcpcpy
     * @tc.number SUB_THIRDPARTY_MUSL_WCPCPY_0100
     * @tc.desc   libc-test wcpcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcpcpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcpcpy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcscasecmp
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCASECMP_0100
     * @tc.desc   libc-test wcscasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcscasecmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcscasecmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcscasecmp_l
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCASECMP_L_0100
     * @tc.desc   libc-test wcscasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcscasecmp_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcscasecmp_l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcschr
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCHR_0100
     * @tc.desc   libc-test wcschr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcschr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcschr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcscmp
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCMP_0100
     * @tc.desc   libc-test wcscmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcscmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcscmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcscspn
     * @tc.number SUB_THIRDPARTY_MUSL_WCSCSPN_0100
     * @tc.desc   libc-test wcscspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcscspn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcscspn");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcslen
     * @tc.number SUB_THIRDPARTY_MUSL_WCSLEN_0100
     * @tc.desc   libc-test wcslen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcslen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcslen");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsncasecmp
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNCASECMP_0100
     * @tc.desc   libc-test wcsncasecmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsncasecmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsncasecmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsncasecmp_l
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNCASECMP_L_0100
     * @tc.desc   libc-test wcsncasecmp_l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsncasecmp_l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsncasecmp_l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsncat
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNCAT_0100
     * @tc.desc   libc-test wcsncat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsncat", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsncat");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsncmp
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNCMP_0100
     * @tc.desc   libc-test wcsncmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsncmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsncmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsnlen
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNLEN_0100
     * @tc.desc   libc-test wcsnlen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsnlen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsnlen");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsrchr
     * @tc.number SUB_THIRDPARTY_MUSL_WCSRCHR_0100
     * @tc.desc   libc-test wcsrchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsrchr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsrchr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsspn
     * @tc.number SUB_THIRDPARTY_MUSL_WCSSPN_0100
     * @tc.desc   libc-test wcsspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsspn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsspn");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstok
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOK_0100
     * @tc.desc   libc-test wcstok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstok", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstok");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcswcs
     * @tc.number SUB_THIRDPARTY_MUSL_WCSWCS_0100
     * @tc.desc   libc-test wcswcs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcswcs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcswcs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wmemchr
     * @tc.number SUB_THIRDPARTY_MUSL_WMEMCHR_0100
     * @tc.desc   libc-test wmemchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wmemchr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wmemchr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wmemcmp
     * @tc.number SUB_THIRDPARTY_MUSL_WMEMCMP_0100
     * @tc.desc   libc-test wmemcmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wmemcmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wmemcmp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wmemcpy
     * @tc.number SUB_THIRDPARTY_MUSL_WMEMCPY_0100
     * @tc.desc   libc-test wmemcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wmemcpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wmemcpy");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wmemmove
     * @tc.number SUB_THIRDPARTY_MUSL_WMEMMOVE_0100
     * @tc.desc   libc-test wmemmove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wmemmove", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wmemmove");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wmemset
     * @tc.number SUB_THIRDPARTY_MUSL_WMEMSET_0100
     * @tc.desc   libc-test wmemset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wmemset", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wmemset");
      expect(result).assertEqual(0);
      done();
    });
  });
}
