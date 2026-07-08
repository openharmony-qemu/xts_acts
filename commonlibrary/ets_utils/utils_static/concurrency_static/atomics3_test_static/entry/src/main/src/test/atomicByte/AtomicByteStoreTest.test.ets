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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

interface StoreNoParam {
  store: () => void;
}

interface StoreObjectParam {
  store: (a: Object) => void;
}

interface StoreStringParam {
  store: (a: string) => void;
}

interface StoreNumberParam {
  store: (a: number) => void;
}

export default function AtomicByteStoreTest(): void {
  describe("AtomicByteStoreTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteStore0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_PARAM_TEST_0100
     * @tc.desc   Verify store with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      atomicByte.store(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteStore0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_PARAM_TEST_0200
     * @tc.desc   Verify store throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreNoParam;
        storeFunc.store();
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_EDGE_TEST_0300
     * @tc.desc   Verify store with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteStore0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_EDGE_TEST_0400
     * @tc.desc   Verify store with byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteStore0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_BASIC_TEST_0500
     * @tc.desc   Verify store with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(0);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteStore0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_BASIC_TEST_0600
     * @tc.desc   Verify store with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(-50);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteStore0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ERROR_TEST_0700
     * @tc.desc   Verify store with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreObjectParam;
        storeFunc.store(null as Object);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ERROR_TEST_0800
     * @tc.desc   Verify store with undefined parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreObjectParam;
        storeFunc.store(undefined as Object);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ERROR_TEST_0900
     * @tc.desc   Verify store with out of range value 128 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreNumberParam;
        storeFunc.store(128);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ERROR_TEST_1000
     * @tc.desc   Verify store with out of range value -129 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreNumberParam;
        storeFunc.store(-129);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ERROR_TEST_1100
     * @tc.desc   Verify store with string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let storeFunc = obj as StoreStringParam;
        storeFunc.store("10");
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1200
     * @tc.desc   Verify store returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let result = atomicByte.store(10);
      expect(result).assertEqual(undefined);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteStore1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1300
     * @tc.desc   Verify store overwrites old value with new value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      atomicByte.store(10);
      expect(atomicByte.load()).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteStore1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1400
     * @tc.desc   Verify store with same value as current value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteStore1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1500
     * @tc.desc   Verify store updates value and load returns new value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      expect(atomicByte.load()).assertEqual(5);
      atomicByte.store(15);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteStore1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_TYPE_TEST_1600
     * @tc.desc   Verify store updates value and load returns number type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      atomicByte.store(10);
      expect(Number.isInteger(atomicByte.load())).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1700
     * @tc.desc   Verify store with multiple overwrites keeps latest value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(10);
      atomicByte.store(20);
      atomicByte.store(30);
      atomicByte.store(40);
      expect(atomicByte.load()).assertEqual(40);
    })
    /**
     * @tc.name   testAtomicByteStore1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1800
     * @tc.desc   Verify store value is within byte range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(50);
      let value = atomicByte.load();
      expect(value >= -128 && value <= 127).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_1900
     * @tc.desc   Verify store with positive value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(50);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteStore2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_2000
     * @tc.desc   Verify store with negative value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteStore2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(-50);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteStore2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_RETURN_TEST_2100
     * @tc.desc   Verify store with zero value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteStore2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(100);
      atomicByte.store(0);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteStore2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CONCURRENT_TEST_2200
     * @tc.desc   Verify store atomicity with concurrent writes from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicByte.store(1);
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicByte.store(2);
        }
      };
      await Promise.all([task1(), task2()]);
      let finalValue = atomicByte.load();
      expect(finalValue === 1 || finalValue === 2).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CONCURRENT_TEST_2300
     * @tc.desc   Verify store and load consistency under concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let results: number[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicByte.store(1);
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicByte.load());
        }
      };
      await Promise.all([task1(), task2()]);
      for (let i = 0; i < results.length; i++) {
        expect(results[i] === 0 || results[i] === 1).assertTrue();
      }
    })
    /**
     * @tc.name   testAtomicByteStore2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ATOMIC_TEST_2400
     * @tc.desc   Verify store operation is visible to subsequent load
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(5);
      atomicByte.store(10);
      expect(atomicByte.load()).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteStore2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CONCURRENT_TEST_2500
     * @tc.desc   Verify store with multiple concurrent tasks writing different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicByte.store(1);
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicByte.store(2);
        }
      };
      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicByte.store(3);
        }
      };
      await Promise.all([task1(), task2(), task3()]);
      let finalValue = atomicByte.load();
      expect(finalValue === 1 || finalValue === 2 || finalValue === 3).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteStore2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_ATOMIC_TEST_2600
     * @tc.desc   Verify store value is visible to compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(5);
      atomicByte.store(10);
      let result = atomicByte.compareAndSwap(10, 20);
      expect(result).assertEqual(10);
      expect(atomicByte.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteStore2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CHAIN_TEST_2700
     * @tc.desc   Verify store with consecutive writes keeps last value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(10);
      atomicByte.store(20);
      atomicByte.store(30);
      expect(atomicByte.load()).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteStore2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COMBINED_TEST_2800
     * @tc.desc   Verify store combined with load operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(20);
      let value = atomicByte.load();
      expect(value).assertEqual(20);
      atomicByte.store(30);
      value = atomicByte.load();
      expect(value).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteStore2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COMBINED_TEST_2900
     * @tc.desc   Verify store combined with exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(20);
      let oldValue = atomicByte.exchange(30);
      expect(oldValue).assertEqual(20);
      expect(atomicByte.load()).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteStore3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COMBINED_TEST_3000
     * @tc.desc   Verify store combined with fetchAdd operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(20);
      let oldValue = atomicByte.fetchAdd(5);
      expect(oldValue).assertEqual(20);
      expect(atomicByte.load()).assertEqual(25);
    })
    /**
     * @tc.name   testAtomicByteStore3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_EXTREME_TEST_3100
     * @tc.desc   Verify store with extreme value transition from 127 to -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(127);
      expect(atomicByte.load()).assertEqual(127);
      atomicByte.store(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteStore3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_EXTREME_TEST_3200
     * @tc.desc   Verify store with extreme value transition from -128 to 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.store(-128);
      expect(atomicByte.load()).assertEqual(-128);
      atomicByte.store(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteStore3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CHAIN_TEST_3300
     * @tc.desc   Verify store in loop with sequential values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i * 10);
        atomicByte.store(val);
      }
      expect(atomicByte.load()).assertEqual(90);
    })
    /**
     * @tc.name   testAtomicByteStore3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COMBINED_TEST_3400
     * @tc.desc   Verify store combined with compareAndSwap operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);
      atomicByte.store(20);
      let swapped = atomicByte.compareAndSwap(20, 30);
      expect(swapped).assertEqual(20);
      expect(atomicByte.load()).assertEqual(30);
      atomicByte.store(40);
      expect(atomicByte.load()).assertEqual(40);
    })
    /**
     * @tc.name   testAtomicByteStore3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_PERF_TEST_3500
     * @tc.desc   Verify store single call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let start = Date.now();
      atomicByte.store(10);
      let end = Date.now();
      let duration = end - start;
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteStore3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_PERF_TEST_3600
     * @tc.desc   Verify store batch call performance with 10000 calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        let val: byte = Int.toByte(i % 128);
        atomicByte.store(val);
      }
      let end = Date.now();
      let duration = end - start;
      expect(typeof atomicByte.load()).assertEqual('byte');
    })
    /**
     * @tc.name   testAtomicByteStore3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_PERF_TEST_3700
     * @tc.desc   Verify store large volume continuous calls performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteStore3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let start = Date.now();
      for (let i = 0; i < 50000; i++) {
        atomicByte.store(Int.toByte(i % 256 - 128));
      }
      let end = Date.now();
      let duration = end - start;
      expect(typeof atomicByte.load()).assertEqual('byte');
    })
    /**
     * @tc.name   testAtomicByteStore3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_STATE_TEST_3800
     * @tc.desc   Verify store updates state flag from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let status = new AtomicByte(0);
      status.store(1);
      expect(status.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteStore3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_STATE_TEST_3900
     * @tc.desc   Verify store for state toggle pattern 0 to 1 to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let status = new AtomicByte(0);
      status.store(1);
      expect(status.load()).assertEqual(1);
      status.store(0);
      expect(status.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteStore4000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COUNTER_TEST_4000
     * @tc.desc   Verify store resets counter to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(100);
      counter.store(0);
      expect(counter.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteStore4100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_COUNTER_TEST_4100
     * @tc.desc   Verify store updates counter to new value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);
      counter.fetchAdd(50);
      counter.store(10);
      expect(counter.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteStore4200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CONFIG_TEST_4200
     * @tc.desc   Verify store updates configuration value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new AtomicByte(10);
      config.store(20);
      expect(config.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteStore4300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_CONFIG_TEST_4300
     * @tc.desc   Verify store updates multiple configuration items independently
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config1 = new AtomicByte(10);
      let config2 = new AtomicByte(20);
      let config3 = new AtomicByte(30);
      config1.store(15);
      config2.store(25);
      config3.store(35);
      expect(config1.load()).assertEqual(15);
      expect(config2.load()).assertEqual(25);
      expect(config3.load()).assertEqual(35);
    })

    /**
     * @tc.name   testAtomicByteStore4400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_BUFFER_TEST_4400
     * @tc.desc   Verify store updates value in buffer array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let buffer: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i);
        buffer.push(new AtomicByte(val));
      }
      buffer[5].store(42);
      expect(buffer[5].load()).assertEqual(42);
      expect(buffer[3].load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteStore4500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_STORE_SENSOR_TEST_4500
     * @tc.desc   Verify store updates sensor reading value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteStore4500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      temperature.store(26);
      expect(temperature.load()).assertEqual(26);
      temperature.store(27);
      expect(temperature.load()).assertEqual(27);
    })  })
}
