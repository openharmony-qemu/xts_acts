'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

export default function StdProcessIsBitTest(): void {
  describe('StdProcessIsBitTest', (): void => {
    let bitBaseline: boolean = false;

    beforeAll((): void => {
      // The process bit-ness is a fixed architecture property; capture it once as the reference.
      bitBaseline = StdProcess.is64Bit();
    })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessIsBitTest0100
     * @tc.number  SUB_STD_PROCESS_IS_BIT_TEST_0100
     * @tc.desc    Verify StdProcess.is64Bit() with no arguments returns boolean type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsBitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result: boolean = StdProcess.is64Bit()
      expect(typeof result).assertEqual('boolean')
    })

    /**
     * @tc.name    StdProcessIsBitTest0200
     * @tc.number  SUB_STD_PROCESS_IS_BIT_TEST_0200
     * @tc.desc    Verify StdProcess.is64Bit() stays consistent across interleaved StdProcess calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsBitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let first: boolean = StdProcess.is64Bit()
      // Interleave other StdProcess calls; they must not perturb the bit-ness result.
      StdProcess.uid()
      StdProcess.tid()
      let second: boolean = StdProcess.is64Bit()
      expect(first).assertEqual(second)
    })

    /**
     * @tc.name    StdProcessIsBitTest0300
     * @tc.number  SUB_STD_PROCESS_IS_BIT_TEST_0300
     * @tc.desc    Verify StdProcess.is64Bit() matches the process architecture flag captured at suite start
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsBitTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result: boolean = StdProcess.is64Bit()
      expect(result).assertEqual(bitBaseline)
    })

    /**
     * @tc.name    StdProcessIsBitTest0400
     * @tc.number  SUB_STD_PROCESS_IS_BIT_TEST_0400
     * @tc.desc    Verify StdProcess.is64Bit() called multiple times returns consistent result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsBitTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result1: boolean = StdProcess.is64Bit()
      let result2: boolean = StdProcess.is64Bit()
      let result3: boolean = StdProcess.is64Bit()
      expect(result1).assertEqual(result2)
      expect(result2).assertEqual(result3)
    })
  })
}
