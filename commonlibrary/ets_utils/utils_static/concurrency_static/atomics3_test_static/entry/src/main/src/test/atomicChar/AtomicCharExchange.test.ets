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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function atomicCharExchangeTest():void {
  describe('atomicCharExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicChar.exchange() with required parameter returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.exchange(c'b');
      expect(oldValue).assertEqual(c'a');
      expect(atomicChar.load()).assertEqual(c'b');
    });

    /**
     * @tc.name   atomicCharExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicChar.exchange() returns old value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'X');
      let oldValue = atomicChar.exchange(c'Y');
      expect(oldValue).assertEqual(c'X');
      expect(atomicChar.load()).assertEqual(c'Y');
    });

    /**
     * @tc.name   atomicCharExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicChar.exchange() for status switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let status = new AtomicChar(c'N');
      let oldStatus = status.exchange(c'R');
      expect(oldStatus).assertEqual(c'N');
      expect(status.load()).assertEqual(c'R');
    });

    /**
     * @tc.name   atomicCharExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicChar.exchange() with digit character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'0');
      let oldValue = atomicChar.exchange(c'9');
      expect(oldValue).assertEqual(c'0');
      expect(atomicChar.load()).assertEqual(c'9');
    });

    /**
     * @tc.name   atomicCharExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicChar.exchange() with null character Unicode boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.exchange(c'\u0000');
      expect(oldValue).assertEqual(c'a');
      expect(atomicChar.load()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name   atomicCharExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicChar.exchange() with special character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'@');
      let oldValue = atomicChar.exchange(c'#')
      expect(oldValue).assertEqual(c'@');
      expect(atomicChar.load()).assertEqual(c'#');
    });
    /**
     * @tc.name   atomicCharExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicChar.exchange() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let results1: char[] = [];
      let results2: char[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicChar.exchange(c'x'));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicChar.exchange(c'y'));
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i] === c'a' || results1[i] === c'x' || results1[i] === c'y').assertTrue();
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i] === c'a' || results2[i] === c'x' || results2[i] === c'y').assertTrue();
      }
    });
    /**
     * @tc.name   atomicCharExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicChar.exchange() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let results: char[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.exchange(c'x'));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.exchange(c'y'));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.exchange(c'z'));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(results.length).assertEqual(150);
    });
    /**
     * @tc.name   atomicCharExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicChar.exchange() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let readResults: char[] = [];
      let exchangeResults: char[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicChar.load());
        }
      };

      let exchangeTask = async () => {
        for (let i = 0; i < 100; i++) {
          exchangeResults.push(atomicChar.exchange(c'b'));
          atomicChar.store(c'a');
        }
      };

      await Promise.all([readTask(), exchangeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === c'a' || readResults[i] === c'b').assertTrue();
      }
    });
  })
}
