import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { typeLoad95, typeStore80, typeStore85, typeStore88, typeStore95 } from './atomics';
import { sleep } from './utils';


export default function atomicsStoreTest() {
  describe('atomicsStoreTest', () => {
    afterEach(async () => {
      await sleep(10)
    })


    /**
     * @tc.name   testArkTSUtilsAtomicsStore0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0100
     * @tc.desc   Store value in async arrow function wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const asyncStore = async () => ArkTSUtils.Atomics.store(ta, 0, 250);
      const storedVal = await asyncStore();
      expect(storedVal).assertEqual(250);
      expect(ta[0]).assertEqual(250);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0200
     * @tc.desc   Store value with nested arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      const outer = (arr: collections.Uint32Array, idx: number, val: number) => ArkTSUtils.Atomics.store(arr, idx, val);
      const storedVal = outer(ta, 0, 1500000000);
      expect(storedVal).assertEqual(1500000000);
      expect(ta[0]).assertEqual(1500000000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0300
     * @tc.desc   Store value then load to verify (collections.Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 30);
      const loadedVal = ArkTSUtils.Atomics.load(ta, 0);
      expect(loadedVal).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0400
     * @tc.desc   Store value to middle index of multi-element collections.Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsStore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Int16 elements
      const ta = new collections.Int16Array(sab);
      const storedVal = ArkTSUtils.Atomics.store(ta, 1, 20);
      expect(storedVal).assertEqual(20);
      expect(ta[0]).assertEqual(0);
      expect(ta[1]).assertEqual(20);
      expect(ta[2]).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0500
     * @tc.desc   Store value in Promise.resolve with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const storedVal = await Promise.resolve().then(() => ArkTSUtils.Atomics.store(ta, 0, 45));
      expect(storedVal).assertEqual(45);
      expect(ta[0]).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0600
     * @tc.desc   Store multiple values sequentially (collections.Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 100);
      ArkTSUtils.Atomics.store(ta, 1, 200);
      expect(ta[0]).assertEqual(100);
      expect(ta[1]).assertEqual(200);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0700
     * @tc.desc   Store value to collections.Uint16Array then modify with ArkTSUtils.Atomics.add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Uint16Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 5000);
      ArkTSUtils.Atomics.add(ta, 0, 1000);
      expect(ta[0]).assertEqual(6000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0800
     * @tc.desc   Nested arrow functions with parameter validation before store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const validateAndStore = (arr: collections.Int32Array, idx: number, val: number): number => {
        if (idx < 0 || idx >= arr.length) {
          throw new Error('Invalid index');
        }
        return ArkTSUtils.Atomics.store(arr, idx, val);
      }
      const storedVal = validateAndStore(ta, 0, 75);
      expect(storedVal).assertEqual(75);
      expect(ta[0]).assertEqual(75);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_0900
     * @tc.desc   Store value in async arrow function with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const delayedStore = async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        return ArkTSUtils.Atomics.store(ta, 0, 127);
      };
      const storedVal = await delayedStore();
      expect(storedVal).assertEqual(127);
      expect(ta[0]).assertEqual(127);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1000
     * @tc.desc   Store value in Promise.race with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const raceResult: number = await Promise.race([
        Promise.resolve().then(() => ArkTSUtils.Atomics.store(ta, 0, 60)),
        new Promise<number>(resolve => setTimeout(() => resolve(0), 10))
      ]);
      expect(raceResult).assertEqual(60);
      expect(ta[0]).assertEqual(60);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1100
     * @tc.desc   Store zero value to collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsStore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const storedVal = ArkTSUtils.Atomics.store(ta, 0, 0);
      expect(storedVal).assertEqual(0);
      expect(ta[0]).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1200
     * @tc.desc   Nested arrow functions with error handling on invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const safeStore = (arr: collections.Int32Array, idx: number, val: number) => {
        try {
          return ArkTSUtils.Atomics.store(arr, idx, val);
        } catch (err) {
          return (err as Error).name;
        }
      }
      expect(safeStore(ta, 0, 80)).assertEqual(80);
      expect(safeStore(ta, 1, 90)).assertEqual('RangeError');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1300
     * @tc.desc   Store value to collections.Uint8Array then overwrite with new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 50);
      const storedVal = ArkTSUtils.Atomics.store(ta, 0, 150);
      expect(storedVal).assertEqual(150);
      expect(ta[0]).assertEqual(150);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1400
     * @tc.desc   Store value in async IIFE with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const storedVal = await (async () => ArkTSUtils.Atomics.store(ta, 0, 95))();
      expect(storedVal).assertEqual(95);
      expect(ta[0]).assertEqual(95);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1500
     * @tc.desc   Store value to collections.Int32Array via nested arrow index mapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      const indexMapper = (name: 'first' | 'second', val: number) => ArkTSUtils.Atomics.store(ta, name === 'first' ? 0 : 1, val)

      indexMapper('first', 1000);
      indexMapper('second', 2000);
      expect(ta[0]).assertEqual(1000);
      expect(ta[1]).assertEqual(2000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1600
     * @tc.desc   Async arrow function with parameter injection for collections.Uint8Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      const asyncStore = async (arr: collections.Uint8Array, idx: number, val: number) => ArkTSUtils.Atomics.store(arr, idx, val);

      const storedVal = await asyncStore(ta, 0, 123);
      expect(storedVal).assertEqual(123);
      expect(ta[0]).assertEqual(123);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1700
     * @tc.desc   Store value to collections.Int16Array then apply ArkTSUtils.Atomics.or
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 10); // 0b1010
      ArkTSUtils.Atomics.or(ta, 0, 3); // 0b0011 → 0b1011 (11)

      expect(ta[0]).assertEqual(11);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1800
     * @tc.desc   Nested arrow safe store with index bounds check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const safeStore = (arr: collections.Int32Array, idx: number, val: number) =>
      idx >= 0 && idx < arr.length ? ArkTSUtils.Atomics.store(arr, idx, val) : 'Invalid index'

      expect(safeStore(ta, 0, 456)).assertEqual(456);
      expect(safeStore(ta, 1, 789)).assertEqual('Invalid index');
      expect(ta[0]).assertEqual(456);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_1900
     * @tc.desc   Arrow function for collections.Int8Array store with value range validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const storeAndValidate = (arr: collections.Int8Array, idx: number, val: number) => {
        const isValid = val >= -128 && val <= 127;
        return isValid ? ArkTSUtils.Atomics.store(arr, idx, val) : 'Out of range';
      }

      expect(storeAndValidate(ta, 0, -45)).assertEqual(-45);
      expect(storeAndValidate(ta, 0, 150)).assertEqual('Out of range');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2000
     * @tc.desc   Async arrow store with retry on invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      let retryCount = 0;

      const asyncStoreWithRetry =
        async (arr: collections.Int32Array, idx: number, val: number, maxRetries: number): Promise<number> => {
          try {
            return ArkTSUtils.Atomics.store(arr, idx, val);
          } catch (err) {
            if (retryCount < maxRetries && (err as Error).name === 'RangeError') {
              retryCount++;
              await new Promise<void>(resolve => setTimeout(resolve, 2));
              return asyncStoreWithRetry(arr, 0, val, maxRetries); // Retry with valid index
            }
            throw err as Error;
          }
        };

      const storedVal = await asyncStoreWithRetry(ta, 1, 789, 1);
      expect(storedVal).assertEqual(789);
      expect(retryCount).assertEqual(1);
      expect(ta[0]).assertEqual(789);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2100
     * @tc.desc   Nested arrow function for collections.Uint32Array store with value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      const transformStore = (arr: collections.Uint32Array, idx: number, val: number, factor: number) =>
      ArkTSUtils.Atomics.store(arr, idx, val * factor)

      transformStore(ta, 0, 100, 2);
      expect(ta[0]).assertEqual(200);
      transformStore(ta, 0, 50, 5);
      expect(ta[0]).assertEqual(250);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2200
     * @tc.desc   Verify store/xor/load update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化状态，再原子切换
      ArkTSUtils.Atomics.store(ia, 0, 0b0010);
      ArkTSUtils.Atomics.xor(ia, 0, 0b0110);

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0b0100);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2300
     * @tc.desc   Store value to collections.Int16Array via Promise.race with error fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      const raceResult = await Promise.race([
        Promise.resolve().then(() => ArkTSUtils.Atomics.store(ta, 0, 321)),
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Timeout')), 10))
      ]);

      expect(raceResult).assertEqual(321);
      expect(ta[0]).assertEqual(321);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2400
     * @tc.desc   Arrow function for collections.Uint8Array store with even index check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(3); // 3 Uint8 elements
      const ta = new collections.Uint8Array(sab);
      const evenIndexStore = (arr: collections.Uint8Array, idx: number, val: number) =>
      idx % 2 === 0 ? ArkTSUtils.Atomics.store(arr, idx, val) : 'Odd index'

      expect(evenIndexStore(ta, 2, 255)).assertEqual(255);
      expect(evenIndexStore(ta, 1, 100)).assertEqual('Odd index');
      expect(ta[2]).assertEqual(255);
      expect(ta[1]).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2500
     * @tc.desc   Store value to collections.Int32Array then apply ArkTSUtils.Atomics.xor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 15); // 0b1111
      ArkTSUtils.Atomics.xor(ta, 0, 8); // 0b1000 → 0b0111 (7)

      expect(ta[0]).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2600
     * @tc.desc   Async arrow store for collections.Int8Array with delay and logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      let log: string[] = [];

      const delayedStoreWithLog = async (arr: collections.Int8Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        log.push(`Stored value: ${storedVal}`);
        return storedVal;
      };

      const result = await delayedStoreWithLog(ta, 0, 67);
      expect(result).assertEqual(67);
      expect(log).assertDeepEquals(['Stored value: 67']);
      expect(ta[0]).assertEqual(67);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2700
     * @tc.desc   Nested arrow batch store for collections.Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Uint16 elements
      const ta = new collections.Uint16Array(sab);
      const values = [1000, 2000, 3000];

      const batchStore = (arr: collections.Uint16Array, indices: number[], vals: number[]) =>
      indices.forEach((idx, i) => ArkTSUtils.Atomics.store(arr, idx, vals[i]))

      batchStore(ta, [0, 1, 2], values);
      expect(ta[0]).assertEqual(1000);
      expect(ta[1]).assertEqual(2000);
      expect(ta[2]).assertEqual(3000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2800
     * @tc.desc   Store value to collections.Int32Array then apply ArkTSUtils.Atomics.add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 50);
      ArkTSUtils.Atomics.add(ta, 0, 30); // 50 + 30 = 80

      expect(ta[0]).assertEqual(80);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_2900
     * @tc.desc   Nested arrow safe store with null check for collections.Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const safeStore = (arr: collections.Int8Array | null, idx: number, val: number) =>
      arr ? ArkTSUtils.Atomics.store(arr, idx, val) : 'Array is null'

      expect(safeStore(ta, 0, -89)).assertEqual(-89);
      expect(safeStore(null, 0, 10)).assertEqual('Array is null');
      expect(ta[0]).assertEqual(-89);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3000
     * @tc.desc   Async arrow store for collections.Uint32Array with multiple delays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      let delayCount = 0;

      const delayedStore = async (arr: collections.Uint32Array, idx: number, val: number, delays: number[]) => {
        for (const delay of delays) {
          await new Promise<void>(resolve => setTimeout(resolve, delay));
          delayCount++;
        }
        return ArkTSUtils.Atomics.store(arr, idx, val);
      };

      const result = await delayedStore(ta, 0, 4294967295, [2, 3]);
      expect(result).assertEqual(4294967295);
      expect(delayCount).assertEqual(2);
      expect(ta[0]).assertEqual(4294967295);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3100
     * @tc.desc   Nested arrow store for collections.Int16Array with value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      const formattedStore = (arr: collections.Int16Array, idx: number, val: number, prefix: string) => {
        ArkTSUtils.Atomics.store(arr, idx, val);
        return `${prefix}${val}`;
      }

      const result1 = formattedStore(ta, 0, 500, 'Value: ');
      const result2 = formattedStore(ta, 0, 600, 'Data: ');
      expect(result1).assertEqual('Value: 500');
      expect(result2).assertEqual('Data: 600');
      expect(ta[0]).assertEqual(600);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3200
     * @tc.desc   Nested arrow store for collections.Uint8Array with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      const rangeCheckStore = (arr: collections.Uint8Array, idx: number, val: number, min: number, max: number) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        return storedVal >= min && storedVal <= max ? storedVal : 'Out of range';
      }

      expect(rangeCheckStore(ta, 0, 150, 100, 200)).assertEqual(150);
      expect(rangeCheckStore(ta, 0, 250, 200, 300)).assertEqual(250);
      expect(ta[0]).assertEqual(250);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3300
     * @tc.desc   Nested Promise chain with arrow functions for collections.Int32Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      const result = await Promise.resolve()
        .then(() => new Promise<collections.Int32Array>(resolve => setTimeout(() => resolve(ta), 3)))
        .then((arr) => ArkTSUtils.Atomics.store(arr, 0, 7890))
        .then((val) => val);

      expect(result).assertEqual(7890);
      expect(ta[0]).assertEqual(7890);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3400
     * @tc.desc   Promise.race with multiple collections.Int8Array stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const val1 = -34;
      const val2 = -56;

      const createLoader = (delay: number, val: number) =>
      new Promise<number>((resolve) =>
      setTimeout(() => resolve(ArkTSUtils.Atomics.store(ta, 0, val)), delay)
      );

      const raceResult = await Promise.race([createLoader(2, val1), createLoader(5, val2)]);
      expect(raceResult).assertEqual(val1);
      expect(ta[0]).assertEqual(val1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3500
     * @tc.desc   Store and exchange update on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 30; // 原始值
      ia[1] = 0;  // 目标值

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子存储交换值，再原子交换
      ArkTSUtils.Atomics.store(ia, 1, 50);
      const oldVal = ArkTSUtils.Atomics.exchange(ia, 0, ArkTSUtils.Atomics.load(ia, 1));

      expect(oldVal).assertEqual(30);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(50);
      expect(ArkTSUtils.Atomics.load(ia, 1)).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3600
     * @tc.desc   Async batch store for collections.Uint32Array via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Uint32 elements
      const ta = new collections.Uint32Array(sab);
      const values = [100000, 200000, 300000];
      const indices = [0, 1, 2];

      const batchStore = async (arr: collections.Uint32Array, idxs: number[], vals: number[]) =>
      Promise.all(idxs.map(async (idx, i) => {
        await new Promise<void>(resolve => setTimeout(resolve, 1));
        return ArkTSUtils.Atomics.store(arr, idx, vals[i]);
      }));

      const storedVals = await batchStore(ta, indices, values);
      expect(storedVals).assertDeepEquals(values);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3700
     * @tc.desc   Verify store/sub/load update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化配额，再原子扣减
      ArkTSUtils.Atomics.store(ia, 0, 40);
      ArkTSUtils.Atomics.sub(ia, 0, 12);

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(28);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3800
     * @tc.desc   Nested arrows with async validation callback for collections.Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      const targetVal = 32000;
      let validationCalled = false;

      const storeWithValidation = async (arr: collections.Int16Array, idx: number, val: number, callback: (v: number) => void) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        callback(storedVal);
        validationCalled = true;
        return storedVal;
      }

      const storedVal = await storeWithValidation(ta, 0, targetVal, (val) => {
        expect(val).assertEqual(targetVal);
      });
      expect(storedVal).assertEqual(targetVal);
      expect(validationCalled).assertEqual(true);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_3900
     * @tc.desc   Async arrow store for collections.Int32Array with dynamic index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      const val1 = 111;
      const val2 = 222;

      const dynamicStore = async (arr: collections.Int32Array, useIndex1: boolean, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const idx = useIndex1 ? 1 : 0;
        return ArkTSUtils.Atomics.store(arr, idx, val);
      };

      const storedVal1 = await dynamicStore(ta, false, val1);
      const storedVal2 = await dynamicStore(ta, true, val2);
      expect(storedVal1).assertEqual(val1);
      expect(storedVal2).assertEqual(val2);
      expect(ta[0]).assertEqual(val1);
      expect(ta[1]).assertEqual(val2);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4000
     * @tc.desc   Verify store/compareExchange/load update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化，再执行幂等更新（仅当值匹配时更新）
      ArkTSUtils.Atomics.store(ia, 0, 8);
      const updated = ArkTSUtils.Atomics.compareExchange(ia, 0, 8, 16);

      expect(updated).assertEqual(8);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(16);
      // 再次执行无变化
      const noChange = ArkTSUtils.Atomics.compareExchange(ia, 0, 8, 16);
      expect(noChange).assertEqual(16);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4100
     * @tc.desc   Promise.race with collections.Int16Array store and timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      const targetVal = 4567;

      const raceResult = await Promise.race([
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(ArkTSUtils.Atomics.store(ta, 0, targetVal)), 3)
        ),
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(-1), 10)
        )
      ]);

      expect(raceResult).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4200
     * @tc.desc   Nested arrows for collections.Int32Array store with async transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const targetVal = 1234;

      const transformStore = async (arr: collections.Int32Array, idx: number, val: number) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return storedVal.toString();
      }

      const strVal = await transformStore(ta, 0, targetVal);
      expect(strVal).assertEqual(targetVal.toString());
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4300
     * @tc.desc   Async batch store for collections.Uint8Array with index filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4); // 4 Uint8 elements
      const ta = new collections.Uint8Array(sab);
      const values = [10, 20, 30, 40];
      // Filter even indices
      const filteredIndices = [0, 1, 2, 3].filter(idx => idx % 2 === 0);
      const filteredValues = filteredIndices.map(idx => values[idx]);

      const filteredBatchStore = async (arr: collections.Uint8Array, idxs: number[], vals: number[]) => {
        return Promise.all(idxs.map(async (idx, i) => {
          await new Promise<void>(resolve => setTimeout(resolve, 1));
          return ArkTSUtils.Atomics.store(arr, idx, vals[i]);
        }));
      };

      const storedVals = await filteredBatchStore(ta, filteredIndices, filteredValues);
      expect(storedVals).assertDeepEquals(filteredValues);
      expect(ta[0]).assertEqual(filteredValues[0]);
      expect(ta[2]).assertEqual(filteredValues[1]);
      expect(ta[1]).assertEqual(0);
      expect(ta[3]).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4400
     * @tc.desc   Nested arrows for collections.Int16Array batch store with async validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Int16 elements
      const ta = new collections.Int16Array(sab);
      const values = [100, 200, 300];
      const indices = [0, 1, 2];
      let validCount = 0;

      const batchValidateStore = async (arr: collections.Int16Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            const storedVal = ArkTSUtils.Atomics.store(arr, idx, vals[i]);
            return storedVal;
          })
        );
        storedVals.forEach(val => val > 0 && validCount++);
        return storedVals;
      }

      const storedVals = await batchValidateStore(ta, indices, values);
      expect(storedVals).assertDeepEquals(values);
      expect(validCount).assertEqual(3);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4500
     * @tc.desc   Promise.all with mixed collections.Uint32Array store and dummy tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      const targetVal = 123456789;

      const mixedTasks = [
        Promise.resolve().then(() => ArkTSUtils.Atomics.store(ta, 0, targetVal)),
        new Promise<number>((resolve) => setTimeout(() => resolve(100 + 200), 2))
      ];

      const result = await Promise.all(mixedTasks);
      expect(result[0]).assertEqual(targetVal);
      expect(result[1]).assertEqual(300);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4600
     * @tc.desc   Async arrow store for collections.Int8Array with state tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const targetVal = -67;
      const state: typeStore80 = { stored: false, value: 0 };

      const storeWithState = async (arr: collections.Int8Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        state.stored = true;
        state.value = storedVal;
        return storedVal;
      };

      const storedVal = await storeWithState(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(state.stored).assertEqual(true);
      expect(state.value).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4700
     * @tc.desc   Nested arrows for collections.Int32Array store with async error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      let errorLog: string[] = [];

      const storeWithErrorLog = async (arr: collections.Int32Array, idx: number, val: number) => {
        try {
          return ArkTSUtils.Atomics.store(arr, idx, val);
        } catch (err) {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          errorLog.push((err as Error).name);
          throw err as Error;
        }
      }

      try {
        await storeWithErrorLog(ta, 1, 123); // Invalid index
      } catch (err) {
        // Expected error
      }
      expect(errorLog).assertDeepEquals(['RangeError']);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4800
     * @tc.desc   Async batch store for collections.Int16Array with value sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4); // 2 Int16 elements
      const ta = new collections.Int16Array(sab);
      const values = [500, 1500];
      const indices = [0, 1];

      const batchStoreAndSum = async (arr: collections.Int16Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return ArkTSUtils.Atomics.store(arr, idx, vals[i]);
          })
        );
        return storedVals.reduce((acc, val) => acc + val, 0);
      };

      const sum = await batchStoreAndSum(ta, indices, values);
      expect(sum).assertEqual(2000);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_4900
     * @tc.desc   Verify store/exchange/load update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // 状态
      ia[1] = 0; // 审计计数

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化状态，再原子更新审计
      ArkTSUtils.Atomics.store(ia, 0, 1); // 激活状态
      ArkTSUtils.Atomics.exchange(ia, 1, ArkTSUtils.Atomics.load(ia, 1) + 1);

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(1);
      expect(ArkTSUtils.Atomics.load(ia, 1)).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5000
     * @tc.desc   Nested arrows for collections.Int32Array store with async value caching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const targetVal = 45678;
      const cache: typeStore85 = new collections.Map<number, number>();

      const cachedStore = async (arr: collections.Int32Array, idx: number, val: number) => {
        const cachedValue: number | undefined = cache.get(idx);
        if (cachedValue !== undefined) {
          return cachedValue;
        }
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        cache.set(idx, storedVal);
        return storedVal;
      }

      const storedVal1 = await cachedStore(ta, 0, targetVal);
      const storedVal2 = await cachedStore(ta, 0, 99999); // Should use cache
      expect(storedVal1).assertEqual(targetVal);
      expect(storedVal2).assertEqual(targetVal);
      expect(cache.get(0) as number).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5100
     * @tc.desc   Async arrow store for collections.Int32Array with dynamic delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const targetVal = 98765;

      const dynamicDelayStore = async (arr: collections.Int32Array, idx: number, val: number) => {
        const delay = idx === 0 ? 3 : 5; // Dynamic delay based on index
        await new Promise<void>(resolve => setTimeout(resolve, delay));
        return ArkTSUtils.Atomics.store(arr, idx, val);
      };

      const storedVal = await dynamicDelayStore(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5200
     * @tc.desc   Nested arrows for collections.Int32Array store with async range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      const val1 = 10000;
      const val2 = 50000;
      const min = 5000;
      const max = 40000;

      const rangeCheckStore = async (arr: collections.Int32Array, idx: number, val: number) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return { storedVal, inRange: storedVal >= min && storedVal <= max } as typeStore88;
      }

      const result1 = await rangeCheckStore(ta, 0, val1);
      const result2 = await rangeCheckStore(ta, 1, val2);
      expect(result1.storedVal).assertEqual(val1);
      expect(result1.inRange).assertEqual(true);
      expect(result2.storedVal).assertEqual(val2);
      expect(result2.inRange).assertEqual(false);
      expect(ta[0]).assertEqual(val1);
      expect(ta[1]).assertEqual(val2);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5300
     * @tc.desc   Nested arrows for collections.Int8Array store with async value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      const targetVal = 45;

      const formattedStore = async (arr: collections.Int8Array, idx: number, val: number, currency: string) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return `${currency}${storedVal.toFixed(2)}`;
      }

      const currencyStr = await formattedStore(ta, 0, targetVal, '$');
      expect(currencyStr).assertEqual('$45.00');
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5400
     * @tc.desc   Async batch store for collections.Uint32Array with unique value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Uint32 elements
      const ta = new collections.Uint32Array(sab);
      const values = [100, 200, 100]; // Duplicate value
      const indices = [0, 1, 2];

      const batchStoreAndCheckUnique = async (arr: collections.Uint32Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return ArkTSUtils.Atomics.store(arr, idx, vals[i]);
          })
        );
        const uniqueVals = new Set(storedVals);
        return uniqueVals.size === storedVals.length;
      };

      const isUnique = await batchStoreAndCheckUnique(ta, indices, values);
      expect(isUnique).assertEqual(false);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5500
     * @tc.desc   Verify store/compareExchange/load update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15;
      const targetVal = 25;

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 先通过 store 暂存目标值，再通过 compareExchange 验证条件后确认
      ArkTSUtils.Atomics.store(ia, 0, targetVal);
      const validated = ArkTSUtils.Atomics.compareExchange(ia, 0, targetVal, targetVal);

      expect(validated).assertEqual(targetVal);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5600
     * @tc.desc   Nested async arrows with delay chain for collections.Int16Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      const targetVal = 7890;

      const delayChainStore = async (ms: number, ms2: number, arr: collections.Int16Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, ms));
        await new Promise<void>(resolve => setTimeout(resolve, ms2));
        return ArkTSUtils.Atomics.store(arr, idx, val);
      }

      const storedVal = await delayChainStore(2, 3, ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5700
     * @tc.desc   Nested arrows for collections.Int32Array store with async even value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsStore0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const targetVal = 300;

      const validateEvenStore = async (arr: collections.Int32Array, idx: number, val: number) => {
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return storedVal % 2 === 0;
      }

      const isEven = await validateEvenStore(ta, 0, targetVal);
      expect(isEven).assertEqual(true); // 300 is even
      expect(ta[0]).assertEqual(targetVal);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsStore0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5800
     * @tc.desc   Async arrow store for collections.Uint8Array with retry on invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      const targetMin = 150;
      let retryCount = 0;

      const storeWithValueRetry = async (arr: collections.Uint8Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        await new Promise<number>(resolve => setTimeout(resolve, 3));
        const storedVal = ArkTSUtils.Atomics.store(arr, idx, val);
        if (storedVal < targetMin && retryCount < 2) {
          return storeWithValueRetry(arr, idx, targetMin + 10); // Retry with valid value
        }
        return storedVal;
      };

      // First attempt with invalid value (100 < 150)
      const storedVal = await storeWithValueRetry(ta, 0, 100);
      expect(storedVal).assertEqual(160); // Retried value
      expect(retryCount).assertEqual(2);
      expect(ta[0]).assertEqual(160);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsStore0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_STORE_5900
     * @tc.desc   Verify store then AND mask clears low 4 bits on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsStore0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化带脏位的值，再原子清除指定位
      ArkTSUtils.Atomics.store(ia, 0, 0b110111);
      ArkTSUtils.Atomics.and(ia, 0, 0b110000); // 清除低 4 位

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0b110000);
      done();
    });
  })
}
