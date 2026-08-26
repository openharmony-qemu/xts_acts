'use static'
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
import Utils from '../Util';
/**
 * SAFETY NOTE — why only one method-existence oracle is used here.
 *
 * In the SDK, StdProcess.ProcessManager.exit is declared as `native exit(code: int): void`.
 * It has NO safe error path: per the SDK contract, "After this API is called, the application
 * exits" for any supplied int code. There is no return value, no documented exception path, and
 * no code value that exit() rejects at runtime, so invoking it with any argument (including 0)
 * terminates the current test process and tears down the test runner.
 *
 * Because a real exit() call cannot be observed from a living process, the only deterministic,
 * non-destructive oracle is to verify the method is present on the instance
 * (typeof === 'function'). exit() is therefore NEVER called in this file, and no fabricated
 * exit-code behavior (e.g. a fictitious "401") is asserted.
 */
export default function ProcessManagerExitTest(): void {
  describe('ProcessManagerExitTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    ProcessManagerExitTest0100
     * @tc.number  SUB_PROCESS_MANAGER_EXIT_TEST_0100
     * @tc.desc    Verify ProcessManager instance exposes exit as a function (only safe, non-destructive oracle)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessManagerExitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let processManager = new StdProcess.ProcessManager()
      // exit(code: int): void terminates the process for any code, so it is never invoked here;
      // the only safe oracle is confirming the method exists on the instance.
      let isMethod: boolean = typeof processManager.exit === 'function'
      expect(isMethod).assertTrue()
    })
  })
}
