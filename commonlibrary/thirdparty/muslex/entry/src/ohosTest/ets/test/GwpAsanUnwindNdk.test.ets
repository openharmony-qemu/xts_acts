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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import libgwpasanunwindndktest from 'libgwpasanunwindndktest.so';

export default function GwpAsanUnwindNdkTest() {
  describe('GwpAsanUnwindNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testGwpAsanUnwindRecursive10
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0100
     * @tc.desc   Recursive 10-level backtrace completeness (BUG-001 regression).
     *             Expect frames >= 10 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindRecursive10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindRecursive10();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindRecursive50
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0200
     * @tc.desc   Recursive 50-level backtrace completeness (BUG-001 regression).
     *             Expect frames >= 50 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindRecursive50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindRecursive50();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindRecursive3
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0300
     * @tc.desc   Recursive 3-level minimum backtrace (BUG-001 regression).
     *             Expect frames >= 3 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindRecursive3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindRecursive3();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindCapLimit
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0400
     * @tc.desc   Capacity truncation at max=5 (BUG-002 regression).
     *             Expect frames <= 5, no overflow when GWP-ASan available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindCapLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindCapLimit();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindZeroCap
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0500
     * @tc.desc   Zero capacity boundary (BUG-002 regression).
     *             Expect frames == 0, no crash when GWP-ASan available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindZeroCap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindZeroCap();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindSingleFrameFast
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0600
     * @tc.desc   Single frame capacity on fast path (BUG-002 regression).
     *             Expect frames <= 1, no leak when GWP-ASan available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindSingleFrameFast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindSingleFrameFast();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindNullBuf
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0700
     * @tc.desc   Null buffer pointer robustness.
     *             Expect frames == 0, no crash when GWP-ASan available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindNullBuf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindNullBuf();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindNonRecursive4
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0800
     * @tc.desc   Non-recursive 4-level call chain backtrace (regression protection).
     *             Expect frames >= 4 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindNonRecursive4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindNonRecursive4();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindSingleMin
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_0900
     * @tc.desc   Single frame minimum backtrace (regression protection).
     *             Expect frames >= 1 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindSingleMin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindSingleMin();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindDeep200
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_1000
     * @tc.desc   Deep recursion 200-level pressure (BUG-001 stress).
     *             Expect frames >= 200 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindDeep200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindDeep200();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });

    /**
     * @tc.name   testGwpAsanUnwindDeep500
     * @tc.number SUB_THIRDPARTY_MUSL_GWP_ASAN_UNWIND_1100
     * @tc.desc   Deep recursion 500-level near stack limit (BUG-001 stress).
     *             Expect frames >= 500 when GWP-ASan available, skip when unavailable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGwpAsanUnwindDeep500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let resNum: number = libgwpasanunwindndktest.gwpAsanUnwindDeep500();
      expect(resNum === -1 || resNum === 1).assertTrue();
    });
  });
}
