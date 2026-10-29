import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import {
  typeSub25,
  typeSub46,
  typeSub56,
  typeSub63,
  typeSub71,
  typeSub76,
  typeSub83,
  typeSub93,
  typeSub98
} from './atomics';
import { sleep } from './utils';


export default function atomicsSubTest() {
  describe('atomicsSubTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0100
     * @tc.desc   Basic collections.Int32Array subtraction, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 3);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(7);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0200
     * @tc.desc   Subtract 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 0);
      expect(oldValue).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0300
     * @tc.desc   Subtract from collections.Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 12;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 1, 4);
      expect(oldValue).assertEqual(12);
      expect(ia[1]).assertEqual(8);
      expect(ia[0]).assertEqual(5); // Unchanged
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0400
     * @tc.desc   Subtract to get negative result in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 5);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(-2);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0500
     * @tc.desc   Verify add/sub/load/compareExchange checksum on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 4;  // Value X
      ia[1] = 6;  // Value Y
      ia[2] = 10; // Checksum (X + Y)

      // Update X and Y, then validate checksum
      ArkTSUtils.Atomics.add(ia, 0, 3); // X:4→7
      ArkTSUtils.Atomics.sub(ia, 1, 2); // Y:6→4
      const newChecksum = ArkTSUtils.Atomics.load(ia, 0) + ArkTSUtils.Atomics.load(ia, 1);
      const checksumValid = ArkTSUtils.Atomics.compareExchange(ia, 2, 10, newChecksum) === 10;

      expect(checksumValid).assertEqual(true);
      expect(ArkTSUtils.Atomics.load(ia, 2)).assertEqual(11); // 7+4=11
      // Reset for consistency
      ArkTSUtils.Atomics.exchange(ia, 0, 4);
      ArkTSUtils.Atomics.exchange(ia, 1, 6);
      ArkTSUtils.Atomics.exchange(ia, 2, 10);
      expect(ArkTSUtils.Atomics.load(ia, 2)).assertEqual(10);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0600
     * @tc.desc   Subtract twice on same collections.Int32Array index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 20;

      const old1 = ArkTSUtils.Atomics.sub(ia, 0, 5);
      expect(old1).assertEqual(20);
      expect(ia[0]).assertEqual(15);

      const old2 = ArkTSUtils.Atomics.sub(ia, 0, 3);
      expect(old2).assertEqual(15);
      expect(ia[0]).assertEqual(12);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0700
     * @tc.desc   Subtract from collections.Int32Array with value=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 8);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(-8);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0800
     * @tc.desc   Subtract non-integer value (coerced to integer) in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 3.8); // Coerced to 3
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(7);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_0900
     * @tc.desc   Subtract from collections.Int32Array maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSub0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 1);
      expect(oldValue).assertEqual(0x7FFFFFFF);
      expect(ia[0]).assertEqual(0x7FFFFFFE);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1000
     * @tc.desc   Subtract with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 18;
      const subWrapper = (arr: collections.Int32Array, idx: number, val: number) => ArkTSUtils.Atomics.sub(arr, idx, val);
      const oldValue = subWrapper(ia, 0, 6);
      expect(oldValue).assertEqual(18);
      expect(ia[0]).assertEqual(12);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1100
     * @tc.desc   Verify isLockFree/sub/load/compareExchange update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 6;
      const min = 0;

      // Confirm lock-free before lock-free operation
      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // Lock-free subtract with underflow check
      ArkTSUtils.Atomics.sub(ia, 0, 8); // 6 - 8 = -2
      const current = ArkTSUtils.Atomics.load(ia, 0);
      const corrected = ArkTSUtils.Atomics.compareExchange(ia, 0, current, current < min ? min : current);

      expect(corrected).assertEqual(-2);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1200
     * @tc.desc   Subtract from collections.Uint32Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 5;
      const oldValue = ArkTSUtils.Atomics.sub(ua, 0, 10); // Underflow, wraps to unsigned max
      expect(oldValue).assertEqual(5);
      expect(ua[0]).assertEqual(4294967291); // 5 - 10 = -5 → unsigned 4294967291
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1300
     * @tc.desc   Arrow function to batch subtract on multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 20;
      ia[1] = 30;

      const batchSub = (arr: collections.Int32Array, ops: Array<typeSub25>) => {
        return ops.map(op => ArkTSUtils.Atomics.sub(arr, op.idx, op.val));
      };

      const oldValues = batchSub(ia, [{ idx: 0, val: 5 }, { idx: 1, val: 8 }]);
      expect(oldValues).assertDeepEquals([20, 30]);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(22);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1400
     * @tc.desc   Nested arrow functions: subtract with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40;

      const getDynamicValue = (base: number, offset: number) => base - offset;
      const dynamicSub = (arr: collections.Int32Array, idx: number, base: number, offset: number) => {
        const val = getDynamicValue(base, offset);
        return ArkTSUtils.Atomics.sub(arr, idx, val);
      };

      const oldValue = dynamicSub(ia, 0, 15, 5); // val = 15 - 5 = 10
      expect(oldValue).assertEqual(40);
      expect(ia[0]).assertEqual(30);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1500
     * @tc.desc   Subtract value exceeding 32 bits (truncated) in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100;
      const longValue = 0x100000005; // 33 bits, truncated to 0x00000005
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, longValue);
      expect(oldValue).assertEqual(100);
      expect(ia[0]).assertEqual(95); // 100 - 5 = 95
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1600
     * @tc.desc   Subtract from collections.Int32Array with value=0x80000000 (min Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0x80000000; // Min Int32 (-2147483648)
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 1); // Overflow to max Int32
      expect(oldValue).assertEqual(-2147483648);
      expect(ia[0]).assertEqual(2147483647); // -2147483648 - 1 = 2147483647 (wrap)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1700
     * @tc.desc   Nested arrow functions: subtract with value from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 80;
      const outerValue = 25; // Captured from outer scope

      const outer = (arr: collections.Int32Array): number => {
        const inner = (idx: number) => ArkTSUtils.Atomics.sub(arr, idx, outerValue);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(80);
      expect(ia[0]).assertEqual(55); // 80 - 25 = 55
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1800
     * @tc.desc   Arrow function to chain subtract operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100;

      const chainSub = (arr: collections.Int32Array, idx: number, ...values: number[]) => {
        return values.map(val => ArkTSUtils.Atomics.sub(arr, idx, val));
      };

      const oldValues = chainSub(ia, 0, 10, 20, 15);
      expect(oldValues).assertDeepEquals([100, 90, 70]);
      expect(ia[0]).assertEqual(55); // 100 -10-20-15 = 55
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_1900
     * @tc.desc   Nested arrow functions: subtract with conditional value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 70;

      const conditionalSub = (arr: collections.Int32Array, idx: number, useSmallValue: boolean) => {
        const getValue = () => useSmallValue ? 10 : 25;
        return ArkTSUtils.Atomics.sub(arr, idx, getValue());
      };

      const oldValue = conditionalSub(ia, 0, true); // Use small value (10)
      expect(oldValue).assertEqual(70);
      expect(ia[0]).assertEqual(60); // 70 - 10 = 60
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2000
     * @tc.desc   Subtract from collections.Int16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(2);
      const ia = new collections.Int16Array(sab);
      ia[0] = 500;
      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 1000); // Underflow to Int16 range
      expect(oldValue).assertEqual(500);
      expect(ia[0]).assertEqual(-500); // 500 - 1000 = -500 (within Int16 range)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2100
     * @tc.desc   Subtract from collections.Uint8Array (allowed type), check 8-bit unsigned range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 50;
      const oldValue = ArkTSUtils.Atomics.sub(ua, 0, 100); // Underflow, wraps to 8-bit unsigned
      expect(oldValue).assertEqual(50);
      expect(ua[0]).assertEqual(206); // 50 - 100 = -50 → unsigned 206
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2200
     * @tc.desc   Arrow function to subtract and return new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 90;

      const subAndGetNew = (arr: collections.Int32Array, idx: number, val: number) => {
        ArkTSUtils.Atomics.sub(arr, idx, val);
        return arr[idx];
      };

      const newValue = subAndGetNew(ia, 0, 35);
      expect(newValue).assertEqual(55); // 90 - 35 = 55
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2300
     * @tc.desc   Async subtract with Promise wrapper, resolve old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 85;

      const asyncSub = (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncSub(ia, 0, 25);
      expect(oldValue).assertEqual(85);
      expect(ia[0]).assertEqual(60);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2400
     * @tc.desc   Promise.all with multiple subtract operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60;
      ia[1] = 90;

      const createSubPromise = (arr: collections.Int32Array, idx: number, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const old = await Promise.all([
        createSubPromise(ia, 0, 15),
        createSubPromise(ia, 1, 30)
      ]);

      expect(old[0]).assertEqual(60);
      expect(old[1]).assertEqual(90);
      expect(ia[0]).assertEqual(45);
      expect(ia[1]).assertEqual(60);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2500
     * @tc.desc   Async subtract with arrow function closure, capture index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40;
      ia[1] = 70;
      const targetIdx = 1;

      const createClosureSub = (arr: collections.Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const closureSub = createClosureSub(ia);
      const oldValue = await closureSub(25);
      expect(oldValue).assertEqual(70);
      expect(ia[1]).assertEqual(45);
      expect(ia[0]).assertEqual(40); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2600
     * @tc.desc   Nested async: subtract with fractional value coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      let retryCount = 0;

      const subWithRetry = async (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        const validVal = typeof val === 'number' ? Math.floor(val) : 0;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, validVal);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer value (12.7 → coerced to 12)
      const oldValue = await subWithRetry(ia, 0, 12.7);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(38);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2700
     * @tc.desc   Promise.race between two subtract operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100;

      const subTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 10);
      });

      const subTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 30);
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([subTask1, subTask2]);
      await Promise.allSettled([subTask1, subTask2]);

      expect([100, 80].includes(winnerOld)).assertTrue(); // Either task wins first
      expect(ia[0]).assertEqual(50); // 100 -20-30 = 50
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2800
     * @tc.desc   Nested arrow functions: async subtract with dynamic value from mock API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 75;

      // Mock API to get dynamic subtract value
      const mockValueApi = async (): Promise<number> => {
        return new Promise((resolve) => setTimeout(() => resolve(25), 12));
      };

      const dynamicSub = async (arr: collections.Int32Array, idx: number) => {
        const val = await mockValueApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicSub(ia, 0);
      expect(oldValue).assertEqual(75);
      expect(ia[0]).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_2900
     * @tc.desc   Promise.allSettled with valid and invalid subtract tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.sub(ia, 0, 15)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(ArkTSUtils.Atomics.sub(ia, 1, 15));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      expect(results[0].status).assertEqual('fulfilled');
      expect(results[1].status).assertEqual('rejected');
      const validResult = results[0] as PromiseFulfilledResult<number>;
      expect(validResult.value).assertEqual(60);
      expect(ia[0]).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3000
     * @tc.desc   Async subtract with closure that tracks operation history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 120;
      const history: Array<typeSub56> = [];

      const createTrackedSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              const newVal = arr[idx];
              history.push({ time: Date.now(), old, new: newVal });
              resolve(old);
            }, 7);
          });
        };
      };

      const trackedSub = createTrackedSub(ia, 0);
      await trackedSub(30); // 120 → 90
      await trackedSub(20); // 90 → 70
      await trackedSub(15); // 70 → 55

      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(120);
      expect(history[0].new).assertEqual(90);
      expect(history[1].old).assertEqual(90);
      expect(history[1].new).assertEqual(70);
      expect(history[2].old).assertEqual(70);
      expect(history[2].new).assertEqual(55);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3100
     * @tc.desc   Async subtract with Promise chain: validate → subtract → log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 80;
      const log: string[] = [];

      // Step 1: Validate subtract value
      const validateVal = (val: number): Promise<boolean> => {
        return new Promise((resolve) => setTimeout(() => resolve(val <= 50), 5));
      };

      // Step 2: Perform async subtract
      const performSub = (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            log.push(`Sub: old=${old}, new=${newVal}`);
            resolve();
          }, 3);
        });
      };

      // Chain workflow
      const subVal = 30;
      const isValid = await validateVal(subVal);
      if (isValid) {
        const oldValue = await performSub(ia, 0, subVal);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('Sub: old=80, new=50');
      expect(ia[0]).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3200
     * @tc.desc   Nested arrow functions: async subtract with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25;
      ia[1] = 50;
      ia[2] = 75;
      const targetIdx = 2; // Captured in closure

      const createIndexSub = (arr: collections.Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexSub = createIndexSub(ia);
      const oldValue = await indexSub(20);
      expect(oldValue).assertEqual(75);
      expect(ia[2]).assertEqual(55);
      expect(ia[0]).assertEqual(25); // Unchanged
      expect(ia[1]).assertEqual(50); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3300
     * @tc.desc   Promise.race between subtract and timeout (subtract wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 65;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 15);
          resolve(old);
        }, 12);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 20);
      });

      const result = await Promise.race([subTask, timeoutTask]);
      expect(result).assertEqual(65); // Subtract task wins
      expect(ia[0]).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3400
     * @tc.desc   Async subtract with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40;
      let errorCaught = false;

      const safeSub = async (arr: collections.Int32Array, idx: number, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length = 1)
      const result = await safeSub(ia, 1, 10);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(40); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3500
     * @tc.desc   Nested async: subtract with batch value application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 30;
      ia[1] = 60;
      ia[2] = 90;
      const subs = [5, 15, 25]; // Values for each index

      const batchSub = (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.sub(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchSub(ia, [0, 1, 2], subs);
      expect(oldValues).assertDeepEquals([30, 60, 90]);
      expect(ia[0]).assertEqual(25); // 30 - 5
      expect(ia[1]).assertEqual(45); // 60 - 15
      expect(ia[2]).assertEqual(65); // 90 - 25
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3600
     * @tc.desc   Async subtract with closure that enforces value limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      const minValue = 20; // Enforce result ≥ 20

      const createLimitedSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<typeSub63>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old - val;
              if (newVal >= minValue) {
                ArkTSUtils.Atomics.sub(arr, idx, val); // Perform subtract only if in limit
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const limitedSub = createLimitedSub(ia, 0);
      // Valid: 50 - 25 = 25 ≥ 20
      const result1 = await limitedSub(25);
      // Invalid: 25 - 10 = 15 < 20
      const result2 = await limitedSub(10);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(50);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(25);
      expect(ia[0]).assertEqual(25);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3700
     * @tc.desc   Promise.all with subtract and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 70;
      let stateCheckPassed = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 50; // 70 - 20 = 50
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([subTask, stateCheckTask]);
      expect(oldValue[0]).assertEqual(70);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3800
     * @tc.desc   CAS decrement to floor with final subtract
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8;
      const floor = 3;

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      let current = ArkTSUtils.Atomics.load(ia, 0);
      while (current > floor && ArkTSUtils.Atomics.compareExchange(ia, 0, current, current - 2) !== current) {
        current = ArkTSUtils.Atomics.load(ia, 0);
      }
      ArkTSUtils.Atomics.sub(ia, 0, 1); // Final decrement (if above floor)

      expect(ia[0]).assertEqual(Math.max(current - 2 - 1, floor));
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_3900
     * @tc.desc   Async subtract with closure that logs subtract value usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100;
      const valLog: number[] = [];

      const createLoggedSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          valLog.push(val); // Log subtract value before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedSub = createLoggedSub(ia, 0);
      await loggedSub(20); // Log: 20
      await loggedSub(15); // Log: 15
      await loggedSub(10); // Log: 10

      expect(valLog).assertDeepEquals([20, 15, 10]);
      expect(ia[0]).assertEqual(55); // 100 -20-15-10 = 55
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4000
     * @tc.desc   Nested arrow functions: async subtract with conditional value selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 90;
      const threshold = 50;

      const getConditionalVal = (value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const val = value > threshold ? 25 : 15;
            resolve(val);
          }, 6);
        });
      };

      const conditionalSub = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const currentValue = arr[idx];
        const val = await getConditionalVal(currentValue);
        const innerSub = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
        return innerSub();
      };

      const oldValue = await conditionalSub(ia, 0);
      expect(oldValue).assertEqual(90);
      expect(ia[0]).assertEqual(65); // 90 > 50 → subtract 25 (90-25=65)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4100
     * @tc.desc   Nested async: subtract with value derived from previous subtract result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 80;

      const firstSub = (arr: collections.Int32Array): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, 0, 20); // 80 → 60
            resolve(old);
          }, 7);
        });
      };

      const secondSub = async (arr: collections.Int32Array) => {
        const firstOld = await firstSub(arr);
        const derivedVal = firstOld / 4; // Derive value: 80 / 4 = 20
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, 0, derivedVal); // 60 → 40
            resolve(old);
          }, 5);
        });
      };

      const secondOld = await secondSub(ia);
      expect(secondOld).assertEqual(60); // First subtract result is 60
      expect(ia[0]).assertEqual(40); // 60 - 20 = 40
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4200
     * @tc.desc   Promise.race between two subtract tasks with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 95;

      const subTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 30); // 95 → 65
          resolve(old);
        }, 10);
      });

      const subTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 25); // 95→70 or 65→40
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([subTaskA, subTaskB]);
      await Promise.allSettled([subTaskA, subTaskB]);

      expect([95, 65, 70].includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(40); // 95 -30-25 = 40
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4300
     * @tc.desc   Nested arrow functions: async subtract with batch value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40;
      ia[1] = 60;
      const subs = [10, 15]; // Values for index 0 and 1

      const validateValues = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            // Validate all values are positive
            const allValid = values.every(val => val > 0);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidSub = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        const isValid = await validateValues(values);
        if (!isValid) {
          throw new Error('Invalid subtract value');
        }

        return Promise.all(
          indexes.map((idx, i): Promise<number> => {
            const innerSub = () => new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.sub(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
            return innerSub();
          })
        );
      };

      const oldValues = await batchValidSub(ia, [0, 1], subs);
      expect(oldValues).assertDeepEquals([40, 60]);
      expect(ia[0]).assertEqual(30); // 40 - 10 = 30
      expect(ia[1]).assertEqual(45); // 60 - 15 = 45
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4400
     * @tc.desc   Async subtract with closure that tracks operation success rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50; // Total quota
      ia[1] = 0;  // Used quota

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      const consume = 12;
      ArkTSUtils.Atomics.sub(ia, 0, consume);
      ArkTSUtils.Atomics.exchange(ia, 1, ArkTSUtils.Atomics.load(ia, 1) + consume);

      expect(ia[0]).assertEqual(38);
      expect(ia[1]).assertEqual(12);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4500
     * @tc.desc   Promise.all with subtract and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 65;
      let cleanedUp = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after subtract
          cleanedUp = true;
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([subTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(65);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup resets value
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4600
     * @tc.desc   Async subtract with closure that skips duplicate subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 90;
      const usedVals = new Set<number>();

      const createDedupSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            return Promise.resolve(arr[idx]); // Return current value if duplicate
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupSub = createDedupSub(ia, 0);
      const old1 = await dedupSub(15); // New value: 15 → 90→75
      const old2 = await dedupSub(15); // Duplicate: 15 → skip subtract
      const old3 = await dedupSub(20); // New value: 20 →75→55

      expect(old1).assertEqual(90);
      expect(old2).assertEqual(75); // Returns current value (no subtract)
      expect(old3).assertEqual(75);
      expect(ia[0]).assertEqual(55); // 90 -15-20 = 55
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4700
     * @tc.desc   Promise.race between subtract and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      let valueChanged = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 15); // 50→35
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          ia[0] = 100; // Overwrite value after subtract
          valueChanged = true;
          resolve(0);
        }, 15);
      });

      const oldValue = await Promise.race([subTask, changeTask]);
      await Promise.allSettled([subTask, changeTask]);

      expect(oldValue).assertEqual(50); // Subtract task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(100); // Change task overwrites result
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4800
     * @tc.desc   Async subtract and exchange audit on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1;
      ia[1] = 0;

      const oldValue = ArkTSUtils.Atomics.sub(ia, 0, 1);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(0);

      ArkTSUtils.Atomics.exchange(ia, 1, ArkTSUtils.Atomics.load(ia, 1) + 1);
      expect(ia[1]).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_4900
     * @tc.desc   Nested async: subtract with batch value application and result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40;
      ia[1] = 70;
      ia[2] = 100;
      const subs = [10, 25, 30];

      const batchSubAndAggregate = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        const subPromises = indexes.map((idx, i) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, values[i]);
              resolve(old);
            }, 5);
          });
        });

        const oldValues = await Promise.all(subPromises);
        const newValues = indexes.map(idx => arr[idx]);
        return { oldValues, newValues } as typeSub83;
      };

      const values = await batchSubAndAggregate(ia, [0, 1, 2], subs);
      expect(values.oldValues).assertDeepEquals([40, 70, 100]);
      expect(values.newValues).assertDeepEquals([30, 45, 70]); // 40-10, 70-25, 100-30
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5000
     * @tc.desc   Async subtract with closure that tracks cumulative subtract value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 120;
      let cumulativeVal = 0;

      const createCumulativeSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          cumulativeVal += val; // Track total subtracted value
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeSub = createCumulativeSub(ia, 0);
      await cumulativeSub(25); // Cumulative:25 → 120→95
      await cumulativeSub(30); // Cumulative:55 →95→65
      await cumulativeSub(15); // Cumulative:70 →65→50

      expect(cumulativeVal).assertEqual(70);
      expect(ia[0]).assertEqual(50); // 120 -70 =50
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5100
     * @tc.desc   Promise.allSettled with subtract tasks on same index (different values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 80;

      const subTasks = [
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.sub(ia, 0, 15)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.sub(ia, 0, 20)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.sub(ia, 0, 10)), 8))
      ];

      const results = await Promise.allSettled(subTasks);
      const oldValues = results.map(res => (res as PromiseFulfilledResult<number>).value);

      // Old values depend on execution order, but total subtracted is 45
      expect(oldValues.every(v => v >= 35 && v <= 80)).assertEqual(true);
      expect(ia[0]).assertEqual(35); // 80 -15-20-10 = 35
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5200
     * @tc.desc   Async subtract with 32-bit value overflow coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      let retryCount = 0;

      const subWithOverflowRetry = async (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        // Coerce value to 32-bit signed integer (handle overflow)
        const validVal = val >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, validVal);
            resolve(old);
          }, 7);
        });
      };

      // Value exceeds 32 bits (0x10000000A → coerced to 0x0000000A = 10)
      const oldValue = await subWithOverflowRetry(ia, 0, 0x10000000A);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(40); // 50 - 10 = 40
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5300
     * @tc.desc   Promise.race between subtract and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.sub(ia, 0, 25);
          resolve(old);
        }, 30); // Slow subtract task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([subTask, timeoutTask]);
      // Wait for subtract task to complete to check final state
      await Promise.allSettled([subTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(35); // Subtract task still completes later
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5400
     * @tc.desc   Async subtract with closure that enforces unique subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 95;
      const usedVals = new Set<number>();

      const createUniqueSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            throw new Error(`Subtract value ${val} already used`);
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueSub = createUniqueSub(ia, 0);
      const old1 = await uniqueSub(20); // New value: 20 → 95→75
      let errorThrown = false;

      try {
        await uniqueSub(20); // Duplicate value: 20
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(95);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(75); // Only first subtract is applied
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5500
     * @tc.desc   Nested arrow functions: async subtract with value from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 85;

      // Promise chain to get subtract value: 5 → 10 → 15
      const getValStep1 = (): Promise<number> => Promise.resolve(5);
      const getValStep2 = (val: number): Promise<number> => Promise.resolve(val + 5);
      const getValStep3 = (val: number): Promise<number> => Promise.resolve(val + 5);

      const chainSub = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const val = await getValStep1()
          .then(getValStep2)
          .then(getValStep3);
        const innerSub = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 6);
        });
        return innerSub();
      };

      const oldValue = await chainSub(ia, 0);
      expect(oldValue).assertEqual(85);
      expect(ia[0]).assertEqual(70); // 85 - 15 = 70
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5600
     * @tc.desc   Async subtract with closure that logs operation timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 90;
      const timeLog: Array<typeSub93> = [];

      const createTimedSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              timeLog.push({ val, timestamp: Date.now() });
              resolve(old);
            }, 5);
          });
        };
      };

      const timedSub = createTimedSub(ia, 0);
      await timedSub(15);
      await new Promise<void>((resolve) => setTimeout(resolve, 10)); // Add delay between ops
      await timedSub(20);

      expect(timeLog.length).assertEqual(2);
      expect(timeLog[0].val).assertEqual(15);
      expect(timeLog[1].val).assertEqual(20);
      expect(timeLog[1].timestamp - timeLog[0].timestamp).assertLargerOrEqual(10); // Delay between timestamps
      expect(ia[0]).assertEqual(55); // 90 -15-20 = 55
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5700
     * @tc.desc   Nested async: subtract with value derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60;

      const getDerivedVal = (arr: collections.Int32Array, idx: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] / 4; // Derive value: 60 / 4 = 15
            resolve(derived);
          }, 6);
        });
      };

      const derivedSub = async (arr: collections.Int32Array, idx: number) => {
        const val = await getDerivedVal(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedSub(ia, 0);
      expect(oldValue).assertEqual(60);
      expect(ia[0]).assertEqual(45); // 60 - 15 = 45
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5800
     * @tc.desc   Counter add and compareExchange sum update on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 4;  // X
      ia[1] = 6;  // Y
      ia[2] = 10; // X+Y

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.add(ia, 0, 2); // X:4→6
      ArkTSUtils.Atomics.add(ia, 1, 3); // Y:6→9
      const newSum = ArkTSUtils.Atomics.load(ia, 0) + ArkTSUtils.Atomics.load(ia, 1);
      ArkTSUtils.Atomics.compareExchange(ia, 2, 10, newSum); // Update sum

      expect(ia[0]).assertEqual(6);
      expect(ia[1]).assertEqual(9);
      expect(ia[2]).assertEqual(15);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_5900
     * @tc.desc   Async subtract with closure that skips zero subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 80;
      let skipCount = 0;

      const createZeroSkipSub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (val === 0) {
            skipCount++;
            return Promise.resolve(arr[idx]); // Return current value, skip subtract
          }
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const zeroSkipSub = createZeroSkipSub(ia, 0);
      const old1 = await zeroSkipSub(15); // Val≠0 → 80→65
      const old2 = await zeroSkipSub(0); // Val=0 → skip
      const old3 = await zeroSkipSub(20); // Val≠0 →65→45

      expect(skipCount).assertEqual(1);
      expect(old1).assertEqual(80);
      expect(old2).assertEqual(65); // Returns current value (no subtract)
      expect(old3).assertEqual(65);
      expect(ia[0]).assertEqual(45); // 80 -15-20 = 45
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0060
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6000
     * @tc.desc   Nested async: subtract with mixed valid and zero values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      ia[1] = 70;
      const subs: number[] = [10, 0, 15]; // Zero is a valid no-op subtract
      const successIndexes: number[] = [];

      const validateAndBatchSub = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const validVal = typeof values[i] === 'number' ? values[i] : 0;
                if (typeof values[i] === 'number') {
                  successIndexes.push(idx);
                }
                const old = ArkTSUtils.Atomics.sub(arr, idx, validVal);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await validateAndBatchSub(ia, [0, 1, 0], subs);
      expect(successIndexes).assertDeepEquals([0, 1, 0]); // All three subtract calls are valid
      expect(oldValues).assertDeepEquals([50, 70, 40]); // Old values for each subtract
      expect(ia[0]).assertEqual(25); // 50 -10-15 = 25
      expect(ia[1]).assertEqual(70); // Invalid value → subtract 0, no change
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0061
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6100
     * @tc.desc   Async subtract with closure that tracks value change history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 90;
      const changeHistory: Array<typeSub98> = [];

      const createHistorySub = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const before = arr[idx];
              const old = ArkTSUtils.Atomics.sub(arr, idx, val);
              const after = arr[idx];
              changeHistory.push({ before, after, val });
              resolve(old);
            }, 7);
          });
        };
      };

      const historySub = createHistorySub(ia, 0);
      await historySub(20); // 90→70, val=20
      await historySub(15); //70→55, val=15

      expect(changeHistory.length).assertEqual(2);
      expect(changeHistory[0]).assertDeepEquals({ before: 90, after: 70, val: 20 });
      expect(changeHistory[1]).assertDeepEquals({ before: 70, after: 55, val: 15 });
      expect(ia[0]).assertEqual(55);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsSub0062
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6200
     * @tc.desc   Comprehensive async workflow: validate → batch subtract → log → cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60;
      ia[1] = 90;
      ia[2] = 120;
      const subs = [15, 25, 30];
      const log: string[] = [];
      let validationPassed = false;
      let cleanedUp = false;

      // Step 1: Validate all subtract values
      const validateBatch = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            validationPassed = values.every(v => v > 0);
            log.push(`Batch validation: ${validationPassed ? 'passed' : 'failed'}`);
            resolve(validationPassed);
          }, 8);
        });
      };

      // Step 2: Batch subtract
      const runBatch = (arr: collections.Int32Array, indexes: number[], values: number[]): Promise<number[]> => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.sub(arr, idx, values[i]);
                log.push(`Sub index ${idx}: old=${old}, new=${arr[idx]}`);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      // Step 3: Cleanup (reset to initial values)
      const cleanupBatch = (arr: collections.Int32Array, initial: number[]): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            arr[0] = initial[0];
            arr[1] = initial[1];
            arr[2] = initial[2];
            cleanedUp = true;
            log.push('Cleanup: restored initial values');
            resolve();
          }, 10);
        });
      };

      // Execute workflow
      const initialValues = [60, 90, 120];
      const isValid = await validateBatch(subs);
      let oldValues: number[] = [];
      if (isValid) {
        oldValues = await runBatch(ia, [0, 1, 2], subs);
        await cleanupBatch(ia, initialValues);
      }

      // Assertions
      expect(validationPassed).assertEqual(true);
      expect(oldValues).assertDeepEquals(initialValues);
      expect(cleanedUp).assertEqual(true);
      expect(ia).assertDeepEquals(new collections.Int32Array(initialValues));
      expect(log).assertDeepEquals([
        'Batch validation: passed',
        'Sub index 0: old=60, new=45',
        'Sub index 1: old=90, new=65',
        'Sub index 2: old=120, new=90',
        'Cleanup: restored initial values'
      ]);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsSub0063
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6300
     * @tc.desc   Promise.allSettled with valid subtract task and out-of-range index task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsSub0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);

      ia[0] = 75;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.sub(ia, 0, 20)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(ArkTSUtils.Atomics.sub(ia, 2, 20));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      expect(results[0].status).assertEqual('fulfilled');
      expect(results[1].status).assertEqual('rejected');
      const validResult = results[0] as PromiseFulfilledResult<number>;
      expect(validResult.value).assertEqual(75);
      expect(ia[0]).assertEqual(55);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsSub0064
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6400
     * @tc.desc   Verify load/exchange snapshot of two Int32 counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3;  // Val1
      ia[1] = 5;  // Val2
      ia[2] = 8;  // Sum (Val1+Val2)

      // Validate lock-free support for batch operations
      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // Lock-free batch update
      ArkTSUtils.Atomics.add(ia, 0, 2); // Val1: 3→5
      ArkTSUtils.Atomics.sub(ia, 1, 1); // Val2:5→4
      const newSum = ArkTSUtils.Atomics.load(ia, 0) + ArkTSUtils.Atomics.load(ia, 1);
      ArkTSUtils.Atomics.compareExchange(ia, 2, 8, newSum); // Update sum lock-free

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(5);
      expect(ArkTSUtils.Atomics.load(ia, 1)).assertEqual(4);
      expect(ArkTSUtils.Atomics.load(ia, 2)).assertEqual(9);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsSub0065
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6500
     * @tc.desc   Verify resource allocation rollback via sub/add/exchange on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 30; // Resource pool
      ia[1] = 0;  // Allocated amount

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // Allocate 10 resources (lock-free)
      ArkTSUtils.Atomics.sub(ia, 0, 10);
      const allocated = 10;
      // Record allocation (lock-free)
      ArkTSUtils.Atomics.exchange(ia, 1, allocated);

      // Rollback allocation (lock-free)
      ArkTSUtils.Atomics.add(ia, 0, allocated);
      ArkTSUtils.Atomics.exchange(ia, 1, 0);

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(30);
      expect(ArkTSUtils.Atomics.load(ia, 1)).assertEqual(0);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsSub0066
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6600
     * @tc.desc   Verify resource allocation rollback via sub/load/compareExchange on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = -10; // Debt

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.sub(ia, 0, -6); // Repay 6: -10 +6 = -4
      const remaining = ArkTSUtils.Atomics.load(ia, 0);
      ArkTSUtils.Atomics.compareExchange(ia, 0, remaining, 0); // Clear remaining debt

      expect(ia[0]).assertEqual(0);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsSub0067
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUB_6700
     * @tc.desc   Verify two-counter snapshot via load/exchange on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsSub0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25; // Counter A
      ia[1] = 35; // Counter B

      // Atomic snapshot of both counters (load + exchange to lock temporarily)
      const snapshotA = ArkTSUtils.Atomics.load(ia, 0);
      const lockB = ArkTSUtils.Atomics.exchange(ia, 1, -1); // Lock B
      const snapshotB = lockB === -1 ? ArkTSUtils.Atomics.load(ia, 1) : lockB;
      ArkTSUtils.Atomics.exchange(ia, 1, snapshotB); // Unlock B

      expect(snapshotA).assertEqual(25);
      expect(snapshotB).assertEqual(35);
      expect(ArkTSUtils.Atomics.load(ia, 1)).assertEqual(35);
    });
  })
}
