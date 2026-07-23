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
import Utils from '../Util.test';

export default function atomicBooleanExchangeTest():void {
  describe('atomicBooleanExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicBoolean.exchange() with all required parameters - exchange false to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const oldValue = atomicBoolean.exchange(true);
      expect(oldValue).assertFalse();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicBoolean.exchange() with all required parameters - exchange true to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const oldValue = atomicBoolean.exchange(false);
      expect(oldValue).assertTrue();
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicBoolean.exchange() with same value exchange (false to false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const oldValue = atomicBoolean.exchange(false);
      expect(oldValue).assertFalse();
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicBoolean.exchange() with same value exchange (true to true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const oldValue = atomicBoolean.exchange(true);
      expect(oldValue).assertTrue();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicBoolean.exchange() multiple consecutive exchanges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);

      // First exchange: false -> true
      let result = atomicBoolean.exchange(true);
      expect(result).assertFalse();
      expect(atomicBoolean.load()).assertTrue();

      // Second exchange: true -> false
      result = atomicBoolean.exchange(false);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertFalse();

      // Third exchange: false -> true
      result = atomicBoolean.exchange(true);
      expect(result).assertFalse();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicBoolean.exchange() return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const result = atomicBoolean.exchange(true);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicBoolean.exchange() creates independent instances behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean1 = new AtomicBoolean(false);
      const atomicBoolean2 = new AtomicBoolean(true);

      const oldValue1 = atomicBoolean1.exchange(true);
      const oldValue2 = atomicBoolean2.exchange(false);

      expect(oldValue1).assertFalse();
      expect(atomicBoolean1.load()).assertTrue();
      expect(oldValue2).assertTrue();
      expect(atomicBoolean2.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicBoolean.exchange() used in toggle pattern implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const toggle = new AtomicBoolean(false);

      // Toggle from false to true
      let previousState = toggle.exchange(true);
      expect(previousState).assertFalse();
      expect(toggle.load()).assertTrue();

      // Toggle from true to false
      previousState = toggle.exchange(false);
      expect(previousState).assertTrue();
      expect(toggle.load()).assertFalse();
    });
    /**
     * @tc.name   atomicBooleanExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicBoolean.exchange() concurrent exchange returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const results: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicBoolean.exchange(true));
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicBoolean.exchange(false));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('boolean');
      }
    });

    /**
     * @tc.name   atomicBooleanExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_EXCHANGE_TEST_1000
     * @tc.desc   Verify AtomicBoolean.exchange() concurrent read and exchange returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanExchangeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const readResults: boolean[] = [];
      const exchangeResults: boolean[] = [];

      const readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicBoolean.load());
        }
      };

      const exchangeTask = async () => {
        for (let i = 0; i < 100; i++) {
          exchangeResults.push(atomicBoolean.exchange(i % 2 === 0));
        }
      };

      await Promise.all([readTask(), exchangeTask()]);

      expect(readResults.length).assertEqual(100);
      expect(exchangeResults.length).assertEqual(100);
      for (let i = 0; i < readResults.length; i++) {
        expect(typeof readResults[i]).assertEqual('boolean');
      }
      for (let i = 0; i < exchangeResults.length; i++) {
        expect(typeof exchangeResults[i]).assertEqual('boolean');
      }
    });
  });
}
