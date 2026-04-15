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

export default function stdio_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_stdio", () => {
    /**
     * @tc.name   fbufsize
     * @tc.number SUB_THIRDPARTY_MUSL_FBUFSIZE_0100
     * @tc.desc   libc-test __fbufsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fbufsize", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fbufsize");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   flbf
     * @tc.number SUB_THIRDPARTY_MUSL_FLBF_0100
     * @tc.desc   libc-test __flbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("flbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__flbf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clearerr
     * @tc.number SUB_THIRDPARTY_MUSL_CLEARERR_0100
     * @tc.desc   libc-test clearerr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clearerr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clearerr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fflush
     * @tc.number SUB_THIRDPARTY_MUSL_FFLUSH_0100
     * @tc.desc   libc-test fflush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fflush", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fflush");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   open_wmemstream
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_WMEMSTREAM_0100
     * @tc.desc   libc-test open_wmemstream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("open_wmemstream", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("open_wmemstream");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   printf
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_0100
     * @tc.desc   libc-test printf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putc_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_PUTC_UNLOCKED_0100
     * @tc.desc   libc-test putc_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putc_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putc_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putchar
     * @tc.number SUB_THIRDPARTY_MUSL_PUTCHAR_0100
     * @tc.desc   libc-test putchar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putchar", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putchar");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putchar_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_PUTCHAR_UNLOCKED_0100
     * @tc.desc   libc-test putchar_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putchar_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putchar_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   puts
     * @tc.number SUB_THIRDPARTY_MUSL_PUTS_0100
     * @tc.desc   libc-test puts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("puts", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("puts");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putwchar
     * @tc.number SUB_THIRDPARTY_MUSL_PUTWCHAR_0100
     * @tc.desc   libc-test putwchar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putwchar", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putwchar");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sprintf
     * @tc.number SUB_THIRDPARTY_MUSL_SPRINTF_0100
     * @tc.desc   libc-test sprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   swscanf
     * @tc.number SUB_THIRDPARTY_MUSL_SWSCANF_0100
     * @tc.desc   libc-test swscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("swscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("swscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tempnam
     * @tc.number SUB_THIRDPARTY_MUSL_TEMPNAM_0100
     * @tc.desc   libc-test tempnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tempnam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tempnam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tmpnam
     * @tc.number SUB_THIRDPARTY_MUSL_TMPNAM_0100
     * @tc.desc   libc-test tmpnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tmpnam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tmpnam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vasprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VASPRINTF_0100
     * @tc.desc   libc-test vasprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vasprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vasprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VPRINTF_0100
     * @tc.desc   libc-test vprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsnprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSNPRINTF_0100
     * @tc.desc   libc-test vsnprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsnprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsnprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSPRINTF_0100
     * @tc.desc   libc-test vsprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VSSCANF_0100
     * @tc.desc   libc-test vsscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vswprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSWPRINTF_0100
     * @tc.desc   libc-test vswprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vswprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vswprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vswscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VSWSCANF_0100
     * @tc.desc   libc-test vswscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vswscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vswscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vwprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VWPRINTF_0100
     * @tc.desc   libc-test vwprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vwprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vwprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoll
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLL_0100
     * @tc.desc   libc-test wcstoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoull
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOULL_0100
     * @tc.desc   libc-test wcstoull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoull", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoull");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wprintf
     * @tc.number SUB_THIRDPARTY_MUSL_WPRINTF_0100
     * @tc.desc   libc-test wprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wprintf");
      expect(result).assertEqual(0);
      done();
    });
  });
}
