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

export default function StdProcessIsIsolatedTest(): void {
  describe('StdProcessIsIsolatedTest', (): void => {
    let isolatedBaseline: boolean = false;

    beforeAll((): void => {
      // Capture the current process isolation flag once; later cases compare against it.
      isolatedBaseline = StdProcess.isIsolatedProcess();
    })
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessIsIsolatedTest0100
     * @tc.number  SUB_STD_PROCESS_IS_ISOLATED_TEST_0100
     * @tc.desc    Verify StdProcess.isIsolatedProcess() with no arguments returns boolean type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsIsolatedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result: boolean = StdProcess.isIsolatedProcess()
      expect(typeof result).assertEqual('boolean')
    })

    /**
     * @tc.name    StdProcessIsIsolatedTest0200
     * @tc.number  SUB_STD_PROCESS_IS_ISOLATED_TEST_0200
     * @tc.desc    Verify StdProcess.isIsolatedProcess() matches the current process isolation flag
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsIsolatedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result: boolean = StdProcess.isIsolatedProcess()
      expect(result).assertEqual(isolatedBaseline)
    })

    /**
     * @tc.name    StdProcessIsIsolatedTest0300
     * @tc.number  SUB_STD_PROCESS_IS_ISOLATED_TEST_0300
     * @tc.desc    Verify StdProcess.isIsolatedProcess() called multiple times returns consistent result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessIsIsolatedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let result1: boolean = StdProcess.isIsolatedProcess()
      let result2: boolean = StdProcess.isIsolatedProcess()
      let result3: boolean = StdProcess.isIsolatedProcess()
      expect(result1).assertEqual(result2)
      expect(result2).assertEqual(result3)
    })
  })
}
