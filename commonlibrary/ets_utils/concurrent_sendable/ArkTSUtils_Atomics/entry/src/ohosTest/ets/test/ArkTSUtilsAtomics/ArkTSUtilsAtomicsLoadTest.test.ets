import { BusinessError } from '@kit.BasicServicesKit';
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { ATOMIC_INDEX_ERROR, typeLoad80, typeLoad85, typeLoad88, typeLoad95 } from './atomics';
import { sleep } from './utils';


export default function atomicsLoadTest() {
  describe('atomicsLoadTest', () => {
    afterEach(async () => {
      await sleep(10)
    })


    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0100
     * @tc.desc   Load value in async function with arrow function wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 200;
      const asyncLoad = async () => ArkTSUtils.Atomics.load(ta, 0);
      const result = await asyncLoad();
      expect(result).assertEqual(200);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0200
     * @tc.desc   Load value with nested arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 1500000000;
      const outer = (arr: collections.Uint32Array,idx: number) => { return ArkTSUtils.Atomics.load(arr, idx) };
      const result = outer(ta,0);
      expect(result).assertEqual(1500000000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0300
     * @tc.desc   Load value after ArkTSUtils.Atomics.and modification (collections.Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 30;
      ArkTSUtils.Atomics.and(ta, 0, 10);
      const result = ArkTSUtils.Atomics.load(ta, 0);
      expect(result).assertEqual(10);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0400
     * @tc.desc   Load value from middle index of multi-element collections.Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsLoad0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Int16 elements
      const ta = new collections.Int16Array(sab);
      ta[0] = 10;
      ta[1] = 20;
      ta[2] = 30;
      const result = ArkTSUtils.Atomics.load(ta, 1);
      expect(result).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0500
     * @tc.desc   Load value in Promise.resolve with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 45;
      const result = await Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 0));
      expect(result).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0600
     * @tc.desc   Load value multiple times (consistency check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsLoad0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 999999;
      const result1 = ArkTSUtils.Atomics.load(ta, 0);
      const result2 = ArkTSUtils.Atomics.load(ta, 0);
      const result3 = ArkTSUtils.Atomics.load(ta, 0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result3).assertEqual(999999);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0700
     * @tc.desc   Load value from collections.Uint16Array after index modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4); // 2 Uint16 elements
      const ta = new collections.Uint16Array(sab);
      ta[1] = 5000;
      const getValue = (idx: number) => ArkTSUtils.Atomics.load(ta, idx);
      expect(getValue(0)).assertEqual(0);
      expect(getValue(1)).assertEqual(5000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0800
     * @tc.desc   Nested arrow functions for load with parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 75;
      const validateAndLoad = (arr: collections.Int32Array,idx: number) => {
          if (idx < 0 || idx >= arr.length) {
            throw new Error('Invalid index');
          }
          return ArkTSUtils.Atomics.load(arr, idx);
        }
      const result = validateAndLoad(ta,0);
      expect(result).assertEqual(75);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_0900
     * @tc.desc   Load value in async arrow function with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = 127;
      const delayedLoad = async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        return ArkTSUtils.Atomics.load(ta, 0);
      };
      const result = await delayedLoad();
      expect(result).assertEqual(127);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1000
     * @tc.desc   Load value in Promise.race with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 60;
      const raceResult = await Promise.race([
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 0)),
        new Promise<number>(resolve => setTimeout(() => resolve(0), 10))
      ]);
      expect(raceResult).assertEqual(60);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1100
     * @tc.desc   Load value from collections.Int32Array with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsLoad0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab); // Default initial value is 0
      const result = ArkTSUtils.Atomics.load(ta, 0);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1200
     * @tc.desc   Nested arrow functions for load with error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 80;
      const safeLoad = (arr: collections.Int32Array,idx: number) => {
          try {
            return ArkTSUtils.Atomics.load(arr, idx);
          } catch (err) {
            return (err as BusinessError).code;
          }
        }
      expect(safeLoad(ta,0)).assertEqual(80);
      expect(safeLoad(ta,1)).assertEqual(ATOMIC_INDEX_ERROR);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1300
     * @tc.desc   Load value from collections.Uint8Array after manual modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ta[0] = 50;
      const result1 = ArkTSUtils.Atomics.load(ta, 0);
      ta[0] = 150; // Manual modification
      const result2 = ArkTSUtils.Atomics.load(ta, 0);
      expect(result1).assertEqual(50);
      expect(result2).assertEqual(150);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1400
     * @tc.desc   Load value in async IIFE with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 95;
      const result = await (async () => ArkTSUtils.Atomics.load(ta, 0))();
      expect(result).assertEqual(95);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1500
     * @tc.desc   Load value from collections.Int32Array with nested arrow functions and index mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      ta[0] = 1000;
      ta[1] = 2000;
      // Nested arrow: map index name to actual index, then load
      const indexMapper = (name: 'first' | 'second') => {
        return ArkTSUtils.Atomics.load(ta, name === 'first' ? 0 : 1)
      };
      expect(indexMapper('first')).assertEqual(1000);
      expect(indexMapper('second')).assertEqual(2000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1600
     * @tc.desc   Load value from collections.Uint8Array in async arrow function with parameter injection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ta[0] = 123;
      // Inject typed array and index into async loader
      const asyncLoader = async (arr: collections.Uint8Array, idx: number) => ArkTSUtils.Atomics.load(arr, idx);
      const result = await asyncLoader(ta, 0);
      expect(result).assertEqual(123);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1700
     * @tc.desc   Load value from collections.Int16Array after ArkTSUtils.Atomics.or modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 10; // 0b1010
      ArkTSUtils.Atomics.or(ta, 0, 3); // 0b0011 → result 0b1011 (11)
      const load = (arr: collections.Int16Array) => ArkTSUtils.Atomics.load(arr, 0);
      expect(load(ta)).assertEqual(11);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1800
     * @tc.desc   Nested arrow functions for safe load with index bounds check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 456;
      // Safe load: check bounds before loading
      const safeLoad = (arr: collections.Int32Array,idx: number) => idx >= 0 && idx < arr.length ? ArkTSUtils.Atomics.load(arr, idx) : null
      expect(safeLoad(ta,0)).assertEqual(456);
      expect(safeLoad(ta,1)).assertEqual(null); // Out of bounds
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_1900
     * @tc.desc   Load value from collections.Int8Array with arrow function as value validator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = -45;
      // Load and validate value range (-128 to 127)
      const loadAndValidate = (arr: collections.Int8Array,idx: number) => {
          const val = ArkTSUtils.Atomics.load(arr, idx);
          return val >= -128 && val <= 127 ? val : 'Invalid range';
        }
      expect(loadAndValidate(ta,0)).assertEqual(-45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2000
     * @tc.desc   Load value from collections.Int32Array in async arrow function with retries on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 789;
      let retryCount = 0;
      // Async load with retry on invalid index
      const asyncLoadWithRetry = async (arr: collections.Int32Array, idx: number, maxRetries: number): Promise<number> => {
        try {
          return ArkTSUtils.Atomics.load(arr, idx);
        } catch (err) {
          if (retryCount < maxRetries && (err as BusinessError).code === ATOMIC_INDEX_ERROR) {
            retryCount++;
            await new Promise<void>(resolve => setTimeout(resolve, 2));
            return asyncLoadWithRetry(arr, 0, maxRetries); // Retry with valid index
          }
          throw err as Error;
        }
      };
      const result = await asyncLoadWithRetry(ta, 1, 1); // First try invalid index 1
      expect(result).assertEqual(789);
      expect(retryCount).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2100
     * @tc.desc   Load value from collections.Uint32Array with nested arrow functions for value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 100;
      // Load and transform value (e.g., multiply by 2)
      const transformLoad = (arr: collections.Uint32Array,idx: number, factor: number) => ArkTSUtils.Atomics.load(arr, idx) * factor
      expect(transformLoad(ta,0, 2)).assertEqual(200);
      expect(transformLoad(ta,0, 5)).assertEqual(500);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2200
     * @tc.desc   Verify xor/compareExchange/load chain on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // Flag: 0 (unvalidated), 1 (validated)

      // Toggle flag to validated, then confirm via compareExchange
      ArkTSUtils.Atomics.xor(ia, 0, 1); // 0 → 1
      const isValidated = ArkTSUtils.Atomics.compareExchange(ia, 0, 1, 1) === 1;

      expect(isValidated).assertEqual(true);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(1);
      // Toggle back
      ArkTSUtils.Atomics.xor(ia, 0, 1);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2300
     * @tc.desc   Load value from collections.Int16Array via Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 321;
      // Race between valid load and error fallback
      const raceResult = await Promise.race([
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 0))]);
      expect(raceResult).assertEqual(321);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2400
     * @tc.desc   Load value from collections.Uint8Array with arrow function for index validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(3); // 3 Uint8 elements
      const ta = new collections.Uint8Array(sab);
      ta[2] = 255;
      // Validate index is even before loading
      const evenIndexLoad = (arr: collections.Uint8Array,idx: number) => idx % 2 === 0 ? ArkTSUtils.Atomics.load(arr, idx) : 'Odd index'
      expect(evenIndexLoad(ta,2)).assertEqual(255);
      expect(evenIndexLoad(ta,1)).assertEqual('Odd index');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2500
     * @tc.desc   Load value from collections.Int32Array after ArkTSUtils.Atomics.xor modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 15; // 0b1111
      ArkTSUtils.Atomics.xor(ta, 0, 8); // 0b1000 → result 0b0111 (7)
      const load = (arr: collections.Int32Array, idx: number) => ArkTSUtils.Atomics.load(arr, idx);
      expect(load(ta, 0)).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2600
     * @tc.desc   Load value from collections.Int8Array in async arrow function with delay and logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = 67;
      let log: string[] = [];

      const delayedLoadWithLog = async (arr: collections.Int8Array, idx: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        const value = ArkTSUtils.Atomics.load(arr, idx);
        log.push(`Loaded value: ${value}`);
        return value;
      };

      const result = await delayedLoadWithLog(ta, 0);
      expect(result).assertEqual(67);
      expect(log).assertDeepEquals(['Loaded value: 67']);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2700
     * @tc.desc   Load value from collections.Uint16Array with nested arrow functions for batch loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Uint16 elements
      const ta = new collections.Uint16Array(sab);
      ta[0] = 1000;
      ta[1] = 2000;
      ta[2] = 3000;

      // Batch load multiple indices
      const batchLoader = (arr: collections.Uint16Array,indices: number[]) => indices.map(idx => ArkTSUtils.Atomics.load(arr, idx))


      const loadedValues = batchLoader(ta,[0, 2]);
      expect(loadedValues).assertDeepEquals([1000, 3000]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2800
     * @tc.desc   Load value from collections.Int32Array after ArkTSUtils.Atomics.add modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 50;
      ArkTSUtils.Atomics.add(ta, 0, 30); // 50 + 30 = 80
      const load = (arr: collections.Int32Array, idx: number) => ArkTSUtils.Atomics.load(arr, idx);
      expect(load(ta, 0)).assertEqual(80);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_2900
     * @tc.desc   Verify add/sub/load/exchange sequence on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;  // Counter 1
      ia[1] = 8;  // Counter 2
      ia[2] = 12; // Counter 3

      // Batch update: increment all counters atomically
      ArkTSUtils.Atomics.add(ia, 0, 3);
      ArkTSUtils.Atomics.add(ia, 1, 2);
      ArkTSUtils.Atomics.sub(ia, 2, 4);

      // Validate batch result
      const result1 = ArkTSUtils.Atomics.load(ia, 0);
      const result2 = ArkTSUtils.Atomics.load(ia, 1);
      const result3 = ArkTSUtils.Atomics.load(ia, 2);

      expect(result1).assertEqual(8);
      expect(result2).assertEqual(10);
      expect(result3).assertEqual(8);
      // Atomic reset
      ArkTSUtils.Atomics.exchange(ia, 0, 5);
      ArkTSUtils.Atomics.exchange(ia, 1, 8);
      ArkTSUtils.Atomics.exchange(ia, 2, 12);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(5);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3000
     * @tc.desc   Load value from collections.Int8Array with arrow function for null check before load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = -89;

      // Check if typed array is not null before loading
      const safeLoad = (arr: collections.Int8Array | null, idx: number) => {
        return arr ? ArkTSUtils.Atomics.load(arr, idx) : 'Array is null'
      };

      expect(safeLoad(ta, 0)).assertEqual(-89);
      expect(safeLoad(null, 0)).assertEqual('Array is null');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3100
     * @tc.desc   Load value from collections.Uint32Array in async arrow function with multiple delays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 4294967295;
      let delayCount = 0;

      // Async load with increasing delays
      const delayedLoad = async (arr: collections.Uint32Array, idx: number, delays: number[]) => {
        for (const delay of delays) {
          await new Promise<void>(resolve => setTimeout(resolve, delay));
          delayCount++;
        }
        return ArkTSUtils.Atomics.load(arr, idx);
      };

      const result = await delayedLoad(ta, 0, [2, 3]);
      expect(result).assertEqual(4294967295);
      expect(delayCount).assertEqual(2);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3200
     * @tc.desc   Load value from collections.Int16Array with nested arrow functions for value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 500;

      // Load and format value as string with prefix
      const formattedLoad = (arr: collections.Int16Array,idx: number, prefix: string) => `${prefix}${ArkTSUtils.Atomics.load(arr, idx)}`

      expect(formattedLoad(ta,0, 'Value: ')).assertEqual('Value: 500');
      expect(formattedLoad(ta,0, 'Data: ')).assertEqual('Data: 500');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3300
     * @tc.desc   Load value from collections.Uint8Array with arrow function for range check after load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ta[0] = 150;

      // Check if loaded value is within target range
      const rangeCheckLoad = (arr: collections.Uint8Array, idx: number, min: number, max: number) => {
        const value = ArkTSUtils.Atomics.load(arr, idx);
        return value >= min && value <= max ? value : 'Out of range';
      }

      expect(rangeCheckLoad(ta, 0, 100, 200)).assertEqual(150);
      expect(rangeCheckLoad(ta, 0, 200, 300)).assertEqual('Out of range');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3400
     * @tc.desc   Load value from collections.Int32Array in nested Promise chain with arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 7890;

      // Nested Promise chain: delay → load → return value
      const result = await Promise.resolve()
        .then(() => new Promise<collections.Int32Array>(resolve => setTimeout(() => resolve(ta), 3)))
        .then((arr) => ArkTSUtils.Atomics.load(arr, 0))
        .then((val) => val);

      expect(result).assertEqual(7890);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3500
     * @tc.desc   Load value from collections.Int8Array in Promise.race with multiple loaders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = -34;

      // Create multiple loaders with different delays
      const createLoader = (delay: number) =>
      new Promise<number>((resolve) =>
      setTimeout(() => resolve(ArkTSUtils.Atomics.load(ta, 0)), delay)
      );

      // Race between fast (2ms) and slow (5ms) loader
      const raceResult = await Promise.race([createLoader(2), createLoader(5)]);
      expect(raceResult).assertEqual(-34);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3600
     * @tc.desc   CompareExchange and load state toggle on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0001; // Initial state

      // Flip bit 0 only if current state is 0b0001
      const oldState = ArkTSUtils.Atomics.compareExchange(ia, 0, 0b0001, 0b0001 ^ 0b0001);
      const newState = ArkTSUtils.Atomics.load(ia, 0);

      expect(oldState).assertEqual(0b0001);
      expect(newState).assertEqual(0b0000);
      // Flip back with validation
      ArkTSUtils.Atomics.compareExchange(ia, 0, 0b0000, 0b0001);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0b0001);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3700
     * @tc.desc   Load value from collections.Uint32Array in async batch with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Uint32 elements
      const ta = new collections.Uint32Array(sab);
      ta[0] = 100000;
      ta[1] = 200000;
      ta[2] = 300000;

      // Async batch load for multiple indices
      const batchLoad = async (arr: collections.Uint32Array, indices: number[]) =>
      Promise.all(indices.map(async (idx) => {
        await new Promise<void>(resolve => setTimeout(resolve, 1));
        return ArkTSUtils.Atomics.load(arr, idx);
      }));

      const results = await batchLoad(ta, [0, 2]);
      expect(results).assertDeepEquals([100000, 300000]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3800
     * @tc.desc   Verify add/exchange/load counter snapshot on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // Counter

      // Increment 3 times, then take atomic snapshot
      ArkTSUtils.Atomics.add(ia, 0, 1);
      ArkTSUtils.Atomics.add(ia, 0, 1);
      ArkTSUtils.Atomics.add(ia, 0, 1);
      const snapshot = ArkTSUtils.Atomics.exchange(ia, 0, ArkTSUtils.Atomics.load(ia, 0));

      expect(snapshot).assertEqual(3);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(3);
      // Continue incrementing
      ArkTSUtils.Atomics.add(ia, 0, 2);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(5);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_3900
     * @tc.desc   Nested arrow functions for load with async validation callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 32000;
      let validationCalled = false;

      // Load with async validation callback
      const loadWithValidation =async (arr: collections.Int16Array,idx: number, callback: (val: number) => void) => {
          const value = ArkTSUtils.Atomics.load(arr, idx);
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          callback(value);
          validationCalled = true;
          return value;
        }

      const result = await loadWithValidation(ta,0, (val) => {
        expect(val).assertEqual(32000);
      });
      expect(result).assertEqual(32000);
      expect(validationCalled).assertEqual(true);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4000
     * @tc.desc   Load value from collections.Int32Array in async arrow function with dynamic index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      ta[0] = 111;
      ta[1] = 222;

      // Async load with dynamic index selection
      const dynamicLoad = async (arr: collections.Int32Array, useIndex1: boolean) => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const idx = useIndex1 ? 1 : 0;
        return ArkTSUtils.Atomics.load(arr, idx);
      };

      const result1 = await dynamicLoad(ta, false);
      const result2 = await dynamicLoad(ta, true);
      expect(result1).assertEqual(111);
      expect(result2).assertEqual(222);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4100
     * @tc.desc   Verify or/load/exchange feature update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0010; // Initial state

      // Set bit 1 and 2, then reset to initial
      ArkTSUtils.Atomics.or(ia, 0, 0b0110); // 0b0010 | 0b0110 = 0b0110 (6)
      const modified = ArkTSUtils.Atomics.load(ia, 0);
      const reset = ArkTSUtils.Atomics.exchange(ia, 0, 0b0010);

      expect(modified).assertEqual(0b0110);
      expect(reset).assertEqual(0b0110);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0b0010);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4200
     * @tc.desc   Load value from collections.Int16Array in Promise.race with timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 4567;

      // Race between loader and timeout (loader should win)
      const raceResult = await Promise.race([
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(ArkTSUtils.Atomics.load(ta, 0)), 3)
        ),
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(-1), 10) // Timeout fallback
        )
      ]);

      expect(raceResult).assertEqual(4567);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4300
     * @tc.desc   Nested arrow functions for load with async value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 1234;

      // Load → async transformation (convert to string)
      const transformLoad =async (arr: collections.Int32Array,idx: number) => {
          const value = ArkTSUtils.Atomics.load(arr, idx);
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          return value.toString();
        }

      const result = await transformLoad(ta,0);
      expect(result).assertEqual('1234');
      expect(typeof result).assertEqual('string');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4400
     * @tc.desc   Load value from collections.Uint8Array in async batch with index filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4); // 4 Uint8 elements
      const ta = new collections.Uint8Array(sab);
      ta[0] = 10;
      ta[1] = 20;
      ta[2] = 30;
      ta[3] = 40;

      // Async batch load + filter even indices
      const filteredBatchLoad = async (arr: collections.Uint8Array) => {
        const indices = [0, 1, 2, 3].filter(idx => idx % 2 === 0); // Even indices
        return Promise.all(indices.map(async (idx) => {
          await new Promise<void>(resolve => setTimeout(resolve, 1));
          return ArkTSUtils.Atomics.load(arr, idx);
        }));
      };

      const results = await filteredBatchLoad(ta);
      expect(results).assertDeepEquals([10, 30]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4500
     * @tc.desc   Nested arrow functions for load with async batch validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(6); // 3 Int16 elements
      const ta = new collections.Int16Array(sab);
      ta[0] = 100;
      ta[1] = 200;
      ta[2] = 300;
      let validCount = 0;

      // Batch load + async validation (check value > 0)
      const batchValidateLoad = async (arr: collections.Int16Array, indices: number[]) => {
        const values = await Promise.all(
          indices.map(async (idx) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return ArkTSUtils.Atomics.load(arr, idx);
          })
        );
        values.forEach(val => val > 0 && validCount++);
        return values;
      }

      const results = await batchValidateLoad(ta, [0, 1, 2]);
      expect(results).assertDeepEquals([100, 200, 300]);
      expect(validCount).assertEqual(3);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4600
     * @tc.desc   Load value from collections.Uint32Array in Promise.all with mixed async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 123456789;

      // Mixed tasks: load + dummy async calculation
      const mixedTasks = [
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 0)),
        new Promise<number>((resolve) => setTimeout(() => resolve(100 + 200), 2))
      ];

      const result = await Promise.all(mixedTasks);
      expect(result[0]).assertEqual(123456789);
      expect(result[1]).assertEqual(300);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4700
     * @tc.desc   Load value from collections.Int8Array in async arrow function with state tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = -67;
      const state: typeLoad80 = { loaded: false, value: 0 };

      // Async load with state tracking
      const loadWithState = async (arr: collections.Int8Array, idx: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const value = ArkTSUtils.Atomics.load(arr, idx);
        state.loaded = true;
        state.value = value;
        return value;
      };

      const result = await loadWithState(ta, 0);
      expect(result).assertEqual(-67);
      expect(state.loaded).assertEqual(true);
      expect(state.value).assertEqual(-67);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4800
     * @tc.desc   Nested arrow functions for load with async error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const errorLog: number[] = [];

      // Load with async error logging on failure
      const loadWithErrorLog = async (arr: collections.Int32Array, idx: number) => {
        try {
          return ArkTSUtils.Atomics.load(arr, idx);
        } catch (err) {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          errorLog.push((err as BusinessError).code);
          throw err as Error;
        }
      }

      try {
        await loadWithErrorLog(ta, 1); // Invalid index
      } catch (err) {
        // Expected error
      }
      expect(errorLog).assertDeepEquals([ATOMIC_INDEX_ERROR]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_4900
     * @tc.desc   Load value from collections.Int16Array in async batch with value sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4); // 2 Int16 elements
      const ta = new collections.Int16Array(sab);
      ta[0] = 500;
      ta[1] = 1500;

      // Async batch load + calculate sum of values
      const batchLoadAndSum = async (arr: collections.Int16Array, indices: number[]) => {
        const values = await Promise.all(
          indices.map(async (idx) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return ArkTSUtils.Atomics.load(arr, idx);
          })
        );
        return values.reduce((acc, val) => acc + val, 0);
      };

      const sum = await batchLoadAndSum(ta, [0, 1]);
      expect(sum).assertEqual(2000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5000
     * @tc.desc   Verify and/load/compareExchange bit filtering on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b110110; // Initial value (54)

      // Filter: keep only bits 3-5 (0b111000)
      const filter = 0b111000;
      ArkTSUtils.Atomics.and(ia, 0, filter); // 0b110110 & 0b111000 = 0b110000 (48)
      const filtered = ArkTSUtils.Atomics.load(ia, 0);
      // Validate filter result
      const validated = ArkTSUtils.Atomics.compareExchange(ia, 0, filtered, filtered);

      expect(filtered).assertEqual(0b110000);
      expect(validated).assertEqual(0b110000);
      expect((filtered & ~filter) === 0).assertEqual(true);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5100
     * @tc.desc   Nested arrow functions for load with async value caching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 45678;
      const cache: typeLoad85 = new collections.Map<number, number>();

      // Load + async cache value by index
      const cachedLoad = async (arr: collections.Int32Array, idx: number) => {
        const cachedValue: number | undefined = cache.get(idx);
        if (cachedValue !== undefined) {
          return cachedValue;
        }
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const value = ArkTSUtils.Atomics.load(arr, idx);
        cache.set(idx, value);
        return value;
      }

      const result1 = await cachedLoad(ta, 0);
      const result2 = await cachedLoad(ta, 0); // Use cache
      expect(result1).assertEqual(45678);
      expect(result2).assertEqual(45678);
      expect(cache.get(0) as number).assertEqual(45678);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5200
     * @tc.desc   Load value from collections.Uint8Array in Promise.allSettled with error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2); // 2 Uint8 elements
      const ta = new collections.Uint8Array(sab);
      ta[0] = 255;

      const promises = [
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 0)), // Valid
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, 5)), // Invalid
        Promise.resolve().then(() => ArkTSUtils.Atomics.load(ta, -1))// Invalid
      ];

      const results = await Promise.allSettled(promises);
      // Process results: collect valid values, count errors
      let validValues: number[] = [];
      let errorCount = 0;

      results.forEach(res => {
        if (res.status === 'fulfilled') {
          validValues.push((res as PromiseFulfilledResult<number>).value);
        } else {
          errorCount++;
        }
      });

      expect(validValues).assertDeepEquals([255]);
      expect(errorCount).assertEqual(2);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5300
     * @tc.desc   Load value from collections.Int32Array in async arrow function with dynamic delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 98765;

      // Async load with delay based on index (dummy dynamic logic)
      const dynamicDelayLoad = async (arr: collections.Int32Array, idx: number) => {
        const delay = idx === 0 ? 3 : 5; // Dynamic delay
        await new Promise<void>(resolve => setTimeout(resolve, delay));
        return ArkTSUtils.Atomics.load(arr, idx);
      };

      const result = await dynamicDelayLoad(ta, 0);
      expect(result).assertEqual(98765);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5400
     * @tc.desc   Nested arrow functions for load with async range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ta = new collections.Int32Array(sab);
      ta[0] = 10000;
      ta[1] = 50000;

      // Load + async range check (value between 5000 and 40000)
      const rangeCheckLoad = async (arr: collections.Int32Array, idx: number, min: number, max: number) => {
        const value = ArkTSUtils.Atomics.load(arr, idx);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return { value, inRange: value >= min && value <= max } as typeLoad88;
      }

      const result1 = await rangeCheckLoad(ta, 0, 5000, 40000);
      const result2 = await rangeCheckLoad(ta, 1, 5000, 40000);
      expect(result1.value).assertEqual(10000);
      expect(result1.inRange).assertEqual(true);
      expect(result2.value).assertEqual(50000);
      expect(result2.inRange).assertEqual(false);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5500
     * @tc.desc   Nested arrow functions for load with async value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Int8Array(sab);
      ta[0] = 45;

      // Load + async format value as currency string
      const formattedLoad = async (arr: collections.Int8Array, idx: number, currency: string) => {
        const value = ArkTSUtils.Atomics.load(arr, idx);
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return `${currency}${value.toFixed(2)}`;
      }

      const result = await formattedLoad(ta, 0, '$');
      expect(result).assertEqual('$45.00');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5600
     * @tc.desc   Load value from collections.Uint32Array in async batch with unique value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Uint32 elements
      const ta = new collections.Uint32Array(sab);
      ta[0] = 100;
      ta[1] = 200;
      ta[2] = 100;

      // Async batch load + check if all values are unique
      const batchLoadAndCheckUnique = async (arr: collections.Uint32Array) => {
        const values = await Promise.all(
          [0, 1, 2].map(async (idx) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return ArkTSUtils.Atomics.load(arr, idx);
          })
        );
        const uniqueValues = new Set(values);
        return uniqueValues.size === values.length;
      };

      const isUnique = await batchLoadAndCheckUnique(ta);
      expect(isUnique).assertEqual(false); // 100 is duplicated
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5700
     * @tc.desc   Verify compareExchange/exchange/load state update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100; // Target value

      // Phase 1: Validate current value
      const phase1 = ArkTSUtils.Atomics.compareExchange(ia, 0, 100, -1); // Lock
      if (phase1 === 100) {
        // Phase 2: Update to new value
        ArkTSUtils.Atomics.exchange(ia, 0, 200);
      }

      expect(phase1).assertEqual(100);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(200);
      // Reverse two-phase update
      ArkTSUtils.Atomics.compareExchange(ia, 0, 200, -1);
      ArkTSUtils.Atomics.exchange(ia, 0, 100);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(100);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5800
     * @tc.desc   Load value from collections.Int16Array in nested async arrows with delay chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);
      ta[0] = 7890;

      // Nested async arrows with sequential delays
      const delayChainLoad = async (ms: number, ms2: number, arr: collections.Int16Array, idx: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, ms));
        await new Promise<void>(resolve => setTimeout(resolve, ms2));
        return ArkTSUtils.Atomics.load(arr, idx);
      }


      const result = await delayChainLoad(2, 3, ta, 0);
      expect(result).assertEqual(7890);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_5900
     * @tc.desc   Nested arrow functions for load with async value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsLoad0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 300;

      // Load + async validate value is even
      const validateLoad = async (arr: collections.Int32Array, idx: number) => {
        const value = ArkTSUtils.Atomics.load(arr, idx);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return value % 2 === 0;

      };

      const isEven = await validateLoad(ta, 0);
      expect(isEven).assertEqual(true); // 300 is even
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsLoad0060
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_6000
     * @tc.desc   Load value from collections.Uint8Array in async arrow with value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ta[0] = 200;
      let retryCount = 0;
      const targetMin = 150;

      // Async load with retry if value < targetMin (simulate validation)
      const loadWithValueRetry = async (arr: collections.Uint8Array, idx: number): Promise<number> => {
        retryCount++;
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const value = ArkTSUtils.Atomics.load(arr, idx);
        if (value < targetMin && retryCount < 2) {
          return loadWithValueRetry(arr, idx); // Retry if value is too small
        }
        return value;
      };

      const result = await loadWithValueRetry(ta, 0);
      expect(result).assertEqual(200);
      expect(retryCount).assertEqual(1); // No retry needed (200 ≥ 150)
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsLoad0061
     * @tc.number SUB_ARKTSUTILS_ATOMICS_LOAD_6100
     * @tc.desc   Verify add/load/compareExchange rollback when counter exceeds 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsLoad0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10; // Counter

      // Increment and rollback if exceeds 15
      ArkTSUtils.Atomics.add(ia, 0, 8); // 10 + 8 = 18
      const current = ArkTSUtils.Atomics.load(ia, 0);
      const rolledBack = ArkTSUtils.Atomics.compareExchange(ia, 0, current, current > 15 ? 10 : current);

      expect(rolledBack).assertEqual(18);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(10);
      // Increment without rollback
      ArkTSUtils.Atomics.add(ia, 0, 3);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(13);
      done();
    });
  })
}
