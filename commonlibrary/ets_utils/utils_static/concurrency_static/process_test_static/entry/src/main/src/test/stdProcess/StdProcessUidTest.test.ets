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
import Utils, { WaitCounter } from '../Util';

export default function StdProcessUidTest(): void {
  describe('StdProcessUidTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessUidTest0100
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0100
     * @tc.desc    Verify StdProcess.uid() with no arguments returns positive integer
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessUidTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let uid: int = StdProcess.uid()
      expect(uid).assertLarger(0)
    })

    /**
     * @tc.name    StdProcessUidTest0200
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0200
     * @tc.desc    Verify StdProcess.uid() called via setTimeout callback returns valid uid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUidTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: WaitCounter = new WaitCounter();
      let uidValue: number = 0;
      setTimeout((): void => {
        uidValue = StdProcess.uid();
        counter.count++;
        const total: int = counter.count;
        expect(total).assertEqual(1);
        expect(uidValue).assertLarger(0);
        done();
      }, 100);
    })

    /**
     * @tc.name    StdProcessUidTest0300
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0300
     * @tc.desc    Verify StdProcess.uid() combined with ProcessManager.getUidForName
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessUidTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uid: int = StdProcess.uid()
      let processManager = new StdProcess.ProcessManager()
      let uidForName: int = processManager.getUidForName('root')
      expect(uid).assertLarger(0)
      expect(typeof uidForName).assertEqual('int')
    })

    /**
     * @tc.name    StdProcessUidTest0400
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0400
     * @tc.desc    Verify 5 concurrent TaskPool tasks each return a valid uid via Promise.all
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUidTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let totalCount: number = 5;
      let concurrentUidTask = (): number => {
        return StdProcess.uid();
      };
      // Dispatch all tasks first (true concurrency), then wait via Promise.all and assert each returned uid.
      let promises: Promise<number>[] = [];
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentUidTask);
        promises.push((async (): Promise<number> => {
          try {
            let result = await taskpool.execute(task);
            return result as number;
          } catch (error) {
            if (error instanceof Error) {
              console.error('StdProcessUidTest', `await failed: ${error.message}`);
            } else {
              console.error('StdProcessUidTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return 0;
        })());
      }
      try {
        let results: number[] = await Promise.all(promises);
        expect(results.length).assertEqual(totalCount);
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertLarger(0);
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUidTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    StdProcessUidTest0500
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0500
     * @tc.desc    Verify 10 concurrent TaskPool tasks each return a valid uid via Promise.all
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessUidTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let totalCount: number = 10;
      let concurrentUidTask = (): number => {
        return StdProcess.uid();
      };
      let promises: Promise<number>[] = [];
      for (let i = 0; i < totalCount; i++) {
        let task = new taskpool.Task(concurrentUidTask);
        promises.push((async (): Promise<number> => {
          try {
            let result = await taskpool.execute(task);
            return result as number;
          } catch (error) {
            if (error instanceof Error) {
              console.error('StdProcessUidTest', `await failed: ${error.message}`);
            } else {
              console.error('StdProcessUidTest', `await failed: unknown error`);
            }
            expect(false).assertFail();
          }
          return 0;
        })());
      }
      try {
        let results: number[] = await Promise.all(promises);
        expect(results.length).assertEqual(totalCount);
        for (let i = 0; i < results.length; i++) {
          expect(results[i]).assertLarger(0);
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessUidTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessUidTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    StdProcessUidTest0600
     * @tc.number  SUB_STD_PROCESS_UID_TEST_0600
     * @tc.desc    Verify StdProcess.uid API exists and is a function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessUidTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let uid: int = StdProcess.uid()
      expect(uid >= 0).assertTrue()
    })

    })
}
