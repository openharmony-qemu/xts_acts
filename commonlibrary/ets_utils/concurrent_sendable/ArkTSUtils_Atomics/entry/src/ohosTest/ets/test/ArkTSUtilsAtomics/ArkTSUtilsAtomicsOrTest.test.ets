import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { typeOr26, typeOr52, typeOr60, typeOr75, typeOr80, typeOr87, typeOr97 } from './atomics';
import { sleep } from './utils';


export default function atomicsOrTest() {
  describe('atomicsOrTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   testArkTSUtilsAtomicsOr0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0100
     * @tc.desc   Basic collections.Int32Array OR operation, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1010; // 10
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0b0110); // 6
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(0b1110); // 14
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0200
     * @tc.desc   OR with 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25;
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0);
      expect(oldValue).assertEqual(25);
      expect(ia[0]).assertEqual(25);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0300
     * @tc.desc   OR with all 1s (0xFFFFFFFF), result in -1 for Int32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 100;
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0xFFFFFFFF);
      expect(oldValue).assertEqual(100);
      expect(ia[0]).assertEqual(-1);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0400
     * @tc.desc   OR on collections.Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1;
      ia[1] = 0b100; // 4
      const oldValue = ArkTSUtils.Atomics.or(ia, 1, 0b011); // 3
      expect(oldValue).assertEqual(4);
      expect(ia[1]).assertEqual(0b111); // 7
      expect(ia[0]).assertEqual(1); // Unchanged
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0500
     * @tc.desc   Verify isLockFree/add/xor/or/compareExchange chain on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;

      // Verify lock-free before chaining operations
      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      // Operation chain: add → xor → or → compareExchange
      ArkTSUtils.Atomics.add(ia, 0, 3); // 5 + 3 = 8
      ArkTSUtils.Atomics.xor(ia, 0, 4); // 8 ^ 4 = 12
      ArkTSUtils.Atomics.or(ia, 0, 2); // 12 | 2 = 14
      const final = ArkTSUtils.Atomics.compareExchange(ia, 0, 14, 14);

      expect(final).assertEqual(14);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(14);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0600
     * @tc.desc   OR twice on same index, accumulate bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0001; // 1

      const old1 = ArkTSUtils.Atomics.or(ia, 0, 0b0010); // 2
      expect(old1).assertEqual(1);
      expect(ia[0]).assertEqual(0b0011); // 3

      const old2 = ArkTSUtils.Atomics.or(ia, 0, 0b0100); // 4
      expect(old2).assertEqual(3);
      expect(ia[0]).assertEqual(0b0111); // 7
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0700
     * @tc.desc   OR with non-integer value (coerced to integer) for collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b100; // 4
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 3.9); // Coerced to 3
      expect(oldValue).assertEqual(4);
      expect(ia[0]).assertEqual(0b111); // 7
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0800
     * @tc.desc   OR on collections.Int32Array with maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 1);
      expect(oldValue).assertEqual(2147483647);
      expect(ia[0]).assertEqual(2147483647); // Overflow to min Int32
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_0900
     * @tc.desc   OR with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 12; // 0b1100
      const orWrapper = (arr: collections.Int32Array, idx: number, val: number) => ArkTSUtils.Atomics.or(arr, idx, val);
      const oldValue = orWrapper(ia, 0, 5); // 0b0101
      expect(oldValue).assertEqual(12);
      expect(ia[0]).assertEqual(13); // 0b1101
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1000
     * @tc.desc   Nested arrow functions: OR inside inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 7; // 0b0111

      const outerFunc = (arr: collections.Int32Array): number => {
        const innerOr = (idx: number, val: number) => ArkTSUtils.Atomics.or(arr, idx, val);
        return innerOr(0, 8); // 0b1000
      };

      const oldValue = outerFunc(ia);
      expect(oldValue).assertEqual(7);
      expect(ia[0]).assertEqual(15); // 0b1111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1100
     * @tc.desc   Verify isLockFree/or/load/exchange feature bits on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0001; // Base feature

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.or(ia, 0, 0b0010); // Activate feature
      const activated = ArkTSUtils.Atomics.load(ia, 0);
      ArkTSUtils.Atomics.exchange(ia, 0, 0b0001); // Rollback

      expect(activated).assertEqual(0b0011);
      expect(ia[0]).assertEqual(0b0001);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1200
     * @tc.desc   OR on collections.Int32Array with mask having single set bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1010; // 10
      const mask = 0b0010; // Single bit set
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, mask);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(10); // Bit already set, no change
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1300
     * @tc.desc   Arrow function to batch OR on multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 5; // 0b0101

      const batchOr = (arr: collections.Int32Array, ops: Array<typeOr26>) => {
        return ops.map(op => ArkTSUtils.Atomics.or(arr, op.idx, op.val));
      };

      const oldValues = batchOr(ia, [{ idx: 0, val: 4 }, { idx: 1, val: 2 }]);
      expect(oldValues).assertDeepEquals([3, 5]);
      expect(ia[0]).assertEqual(7); // 0b0111
      expect(ia[1]).assertEqual(7); // 0b0111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1400
     * @tc.desc   Nested arrow functions: OR with dynamic mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8; // 0b1000

      const getMask = (bit: number) => 1 << bit;
      const dynamicOr = (arr: collections.Int32Array, idx: number, bit: number) => {
        const mask = getMask(bit);
        return ArkTSUtils.Atomics.or(arr, idx, mask);
      };

      const oldValue = dynamicOr(ia, 0, 2); // Mask = 0b0100
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(12); // 0b1100
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1500
     * @tc.desc   OR on collections.Int32Array with mask exceeding 32 bits (truncated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1; // 0b0001
      const longMask = 0x100000001; // 33 bits, truncated to 0x00000001
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, longMask);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(1); // Truncated mask matches existing bit
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1600
     * @tc.desc   OR on collections.Int32Array with mask=0xFFFFFFFF (all bits set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 42;
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0xFFFFFFFF);
      expect(oldValue).assertEqual(42);
      expect(ia[0]).assertEqual(-1); // All bits set for Int32 is -1
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1700
     * @tc.desc   Nested arrow functions: OR with bitwise shift in inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3

      const outer = (arr: collections.Int32Array): number => {
        const inner = (idx: number, shift: number) => {
          const mask = 1 << shift;
          return ArkTSUtils.Atomics.or(arr, idx, mask);
        };
        return inner(0, 3); // Mask = 0b1000
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(11); // 0b1011
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1800
     * @tc.desc   OR on collections.Int32Array with mask from arrow function return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10; // 0b1010
      const getMask = () => 0b0101; // 5
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, getMask());
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(15); // 0b1111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_1900
     * @tc.desc   OR on collections.Int32Array with mask=0x80000000 (sign bit), flip sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1; // Positive value (0x00000001)
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0x80000000); // Sign bit mask
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(-2147483647); // Negative value (0x80000001)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2000
     * @tc.desc   Nested arrow functions: OR with mask from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0101; // 5
      const outerMask = 0b1010; // 10

      const outer = (arr: collections.Int32Array): number => {
        const inner = (idx: number) => ArkTSUtils.Atomics.or(arr, idx, outerMask);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(15); // 0b1111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2100
     * @tc.desc   Arrow function to chain OR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      const chainOr = (arr: collections.Int32Array, idx: number, ...masks: number[]) => {
        return masks.map(mask => ArkTSUtils.Atomics.or(arr, idx, mask));
      };

      const oldValues = chainOr(ia, 0, 1, 2, 4, 8);
      expect(oldValues).assertDeepEquals([0, 1, 3, 7]);
      expect(ia[0]).assertEqual(15); // 0b1111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2200
     * @tc.desc   Nested arrow functions: OR with conditional mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsOr0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3; // 0b0011

      const conditionalOr = (arr: collections.Int32Array, idx: number, useMaskA: boolean) => {
        const getMask = () => useMaskA ? 0b0100 : 0b1000;
        return ArkTSUtils.Atomics.or(arr, idx, getMask());
      };

      const oldValue = conditionalOr(ia, 0, true); // Use mask 0b0100
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(7); // 0b0111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2300
     * @tc.desc   Async OR with Promise wrapper, return old value in resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1010; // 10

      const asyncOr = (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.or(arr, idx, val);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncOr(ia, 0, 0b0110); // 6
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(0b1110); // 14
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2400
     * @tc.desc   Promise.all with multiple OR operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 5; // 0b0101

      const createOrPromise = (arr: collections.Int32Array, idx: number, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const old = await Promise.all([
        createOrPromise(ia, 0, 4), // 0b0100
        createOrPromise(ia, 1, 2)// 0b0010
      ]);

      expect(old[0]).assertEqual(3);
      expect(old[1]).assertEqual(5);
      expect(ia[0]).assertEqual(7); // 0b0111
      expect(ia[1]).assertEqual(7); // 0b0111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2500
     * @tc.desc   Async OR with arrow function closure, capture mask and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8; // 0b1000

      const createOrClosure = (arr: collections.Int32Array, idx: number, mask: number) => {
        return async () => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              resolve(old);
            }, 10);
          });
        };
      };

      const orClosure = createOrClosure(ia, 0, 0b0111); // 7
      const oldValue = await orClosure();
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(15); // 0b1111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2600
     * @tc.desc   Nested async: OR with fractional mask coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3
      let retryCount = 0;

      const orWithRetry = async (arr: collections.Int32Array, idx: number, mask: number): Promise<number> => {
        retryCount++;
        // Coerce non-integer mask to integer
        const validMask = Number.isInteger(mask) ? mask : Math.floor(Number(mask));

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, validMask);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer mask (3.9 → coerced to 3)
      const oldValue = await orWithRetry(ia, 0, 3.9);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(3); // Mask 3 matches existing bits
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2700
     * @tc.desc   Promise.race between two OR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      const orTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b0011); // 3
          resolve(old);
        }, 10);
      });

      const orTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([orTask1, orTask2]);
      // Wait for both tasks to complete to check final value
      await Promise.allSettled([orTask1, orTask2]);

      expect([0, 3].includes(winnerOld)).assertTrue(); // Either task can win first
      expect(ia[0]).assertEqual(15); // Final OR result is 0b1111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2800
     * @tc.desc   Nested arrow functions: async OR with dynamic mask from API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1000; // 8

      // Mock API to get dynamic mask
      const mockMaskApi = async (): Promise<number> => {
        return new Promise((resolve) => setTimeout(() => resolve(0b0111), 12)); // 7
      };

      const dynamicOr = async (arr: collections.Int32Array, idx: number) => {
        const mask = await mockMaskApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicOr(ia, 0);
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(15); // 0b1111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_2900
     * @tc.desc   Async OR with closure that tracks operation history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const history: Array<typeOr60> = [];

      const createTrackedOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              const newVal = arr[idx];
              history.push({ time: Date.now(), old, new: newVal });
              resolve(old);
            }, 7);
          });
        };
      };

      const trackedOr = createTrackedOr(ia, 0);
      await trackedOr(1); // 0b0001
      await trackedOr(2); // 0b0010
      await trackedOr(4); // 0b0100

      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(0);
      expect(history[0].new).assertEqual(1);
      expect(history[1].old).assertEqual(1);
      expect(history[1].new).assertEqual(3);
      expect(history[2].old).assertEqual(3);
      expect(history[2].new).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3000
     * @tc.desc   Async OR with Promise chain: validate → OR → log result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0101; // 5
      const log: string[] = [];

      // Step 1: Validate mask is non-negative
      const validateMask = (mask: number): Promise<boolean> => {
        return new Promise((resolve) => setTimeout(() => resolve(mask >= 0), 5));
      };

      // Step 2: Perform async OR
      const performOr = (arr: collections.Int32Array, idx: number, mask: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            log.push(`OR: old=${old}, new=${newVal}`);
            resolve();
          }, 3);
        });
      };

      // Chain all steps
      const mask = 0b0011; // 3
      const isValid = await validateMask(mask);
      if (isValid) {
        const oldValue = await performOr(ia, 0, mask);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('OR: old=5, new=7');
      expect(ia[0]).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3100
     * @tc.desc   Nested arrow functions: async OR with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 2; // 0b10
      ia[1] = 4; // 0b100
      const targetIndex = 1; // Captured in closure

      const createIndexOr = (arr: collections.Int32Array) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, targetIndex, mask);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexOr = createIndexOr(ia);
      const oldValue = await indexOr(0b011); // 3
      expect(oldValue).assertEqual(4);
      expect(ia[1]).assertEqual(7); // 0b111
      expect(ia[0]).assertEqual(2); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3200
     * @tc.desc   Promise.race between OR and timeout, return OR result first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1000; // 8

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b0111); // 7
          resolve(old);
        }, 15);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 30);
      });

      const result = await Promise.race([orTask, timeoutTask]);
      expect(result).assertEqual(8); // OR task wins
      expect(ia[0]).assertEqual(15); // 0b1111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3300
     * @tc.desc   Async OR with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      const safeOr = async (arr: collections.Int32Array, idx: number, mask: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length is 1)
      const result = await safeOr(ia, 1, 3);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(5); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3400
     * @tc.desc   Nested async: OR with batch mask application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      ia[2] = 0;
      const masks = [1, 2, 4]; // Masks for each index

      const batchOr = (arr: collections.Int32Array, indexes: number[], masks: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.or(arr, idx, masks[i]);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchOr(ia, [0, 1, 2], masks);
      expect(oldValues).assertDeepEquals([0, 0, 0]);
      expect(ia[0]).assertEqual(1);
      expect(ia[1]).assertEqual(2);
      expect(ia[2]).assertEqual(4);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3500
     * @tc.desc   Async OR with closure that enforces mask limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3
      const maxMask = 0b0100; // 4 (limit mask to 4)

      const createLimitedOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          const validMask = mask > maxMask ? maxMask : mask;
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, validMask);
              resolve(old);
            }, 8);
          });
        };
      };

      const limitedOr = createLimitedOr(ia, 0);
      // Mask 6 exceeds limit, use maxMask 4
      const oldValue = await limitedOr(6);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(7); // 3 | 4 = 7
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3600
     * @tc.desc   Promise.all with OR and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1000; // 8
      let stateCheckPassed = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b0111); // 7
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 15; // 8 | 7 = 15
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([orTask, stateCheckTask]);
      expect(oldValue[0]).assertEqual(8);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(15);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3700
     * @tc.desc   Async OR with dependency flag and compareExchange validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0100; // Dependency feature (enabled)
      ia[1] = 0b0000; // Target feature

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      if (ArkTSUtils.Atomics.load(ia, 0) & 0b0100) {
        ArkTSUtils.Atomics.or(ia, 1, 0b1000); // Activate target
      }
      const target = ArkTSUtils.Atomics.load(ia, 1);
      ArkTSUtils.Atomics.compareExchange(ia, 1, target, target); // Validate

      expect(target).assertEqual(0b1000);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3800
     * @tc.desc   Async OR with closure that logs mask usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const maskLog: number[] = [];

      const createLoggedOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          maskLog.push(mask); // Log mask before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedOr = createLoggedOr(ia, 0);
      await loggedOr(1); // Mask 1 (0b0001)
      await loggedOr(2); // Mask 2 (0b0010)
      await loggedOr(4); // Mask 4 (0b0100)
      await loggedOr(8); // Mask 8 (0b1000)

      expect(maskLog).assertDeepEquals([1, 2, 4, 8]);
      expect(ia[0]).assertEqual(15); // 0 | 1 | 2 | 4 | 8 = 15
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_3900
     * @tc.desc   Nested arrow functions: async OR with conditional mask selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1000; // 8
      const threshold = 10;

      const getConditionalMask = (value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const mask = value < threshold ? 0b0011 : 0b0110;
            resolve(mask);
          }, 6);
        });
      };

      const conditionalOr = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const currentValue = arr[idx];
        const mask = await getConditionalMask(currentValue);
        const innerOr = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
        return innerOr();
      };

      const oldValue = await conditionalOr(ia, 0);
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(11); // 8 (0b1000) | 3 (0b0011) = 11
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4000
     * @tc.desc   Async OR with closure that enforces value range after operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3
      const maxValue = 10; // Enforce value ≤ 10 after OR

      const createRangeOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<typeOr75>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old | mask;
              if (newVal <= maxValue) {
                ArkTSUtils.Atomics.or(arr, idx, mask); // Perform OR only if in range
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const rangeOr = createRangeOr(ia, 0);
      // Mask 4: 3 | 4 = 7 ≤ 10 (success)
      const result1 = await rangeOr(4);
      // Mask 8: 7 | 8 = 15 > 10 (failure)
      const result2 = await rangeOr(8);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(3);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(7);
      expect(ia[0]).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4100
     * @tc.desc   Promise.race between two OR tasks with different masks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0000; // 0

      const orTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b0011); // 3
          resolve(old);
        }, 10);
      });

      const orTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([orTaskA, orTaskB]);
      // Wait for both tasks to complete to check final value
      await Promise.allSettled([orTaskA, orTaskB]);

      expect([0, 3, 12].includes(winnerOld)).assertTrue(); // Winner depends on task execution order
      expect(ia[0]).assertEqual(15); // Final OR result: 3 | 12 = 15
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4200
     * @tc.desc   Nested arrow functions: async OR with batch mask validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      const masks = [0b0011, 0b1100]; // Masks for index 0 and 1

      const validateMasks = (masks: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            // Validate all masks are non-negative
            const allValid = masks.every(mask => mask >= 0);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidOr = async (arr: collections.Int32Array, indexes: number[], masks: number[]) => {
        const isValid = await validateMasks(masks);
        if (!isValid) {
          throw new Error('Invalid mask');
        }

        return Promise.all(
          indexes.map((idx, i): Promise<number> => {
            const innerOr = () => new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.or(arr, idx, masks[i]);
                resolve(old);
              }, 5);
            });
            return innerOr();
          })
        );
      };

      const oldValues = await batchValidOr(ia, [0, 1], masks);
      expect(oldValues).assertDeepEquals([0, 0]);
      expect(ia[0]).assertEqual(3); // 0 | 3 = 3
      expect(ia[1]).assertEqual(12); // 0 | 12 = 12
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4300
     * @tc.desc   Async OR with closure that tracks operation success rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      let successCount = 0;
      let totalCount = 0;

      const createTrackedOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          totalCount++;
          return new Promise<typeOr80>((resolve) => {
            setTimeout(() => {
              try {
                const old = ArkTSUtils.Atomics.or(arr, idx, mask);
                successCount++;
                resolve({ old, success: true });
              } catch (err) {
                resolve({ old: -1, success: false });
              }
            }, 7);
          });
        };
      };

      const trackedOr = createTrackedOr(ia, 0);
      await trackedOr(1); // Success
      await trackedOr(2); // Success
      await trackedOr(4); // Success
      // Simulate failure (invalid mask type, but coerced to 0)
      // await trackedOr('8');

      expect(totalCount).assertEqual(3);
      expect(successCount).assertEqual(3); // Coerced mask still counts as success
      expect(ia[0]).assertEqual(7); // 0 | 1 | 2 | 4 | 0 = 7
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4400
     * @tc.desc   Promise.all with OR and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3
      let cleanedUp = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after OR
          cleanedUp = true;
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([orTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(3);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup reset value
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4500
     * @tc.desc   Async OR with closure that skips duplicate masks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const usedMasks = new Set<number>();

      const createDedupOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          if (usedMasks.has(mask)) {
            return Promise.resolve(arr[idx]); // Return current value if mask is duplicate
          }
          usedMasks.add(mask);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupOr = createDedupOr(ia, 0);
      const old1 = await dedupOr(1); // New mask: 1
      const old2 = await dedupOr(1); // Duplicate mask: 1 (skip OR)
      const old3 = await dedupOr(2); // New mask: 2

      expect(old1).assertEqual(0);
      expect(old2).assertEqual(1); // Returns current value (no OR)
      expect(old3).assertEqual(1);
      expect(ia[0]).assertEqual(3); // 0 | 1 | 2 = 3
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4600
     * @tc.desc   Promise.race between OR and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0001; // 1
      let valueChanged = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 0b0010); // 2
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          ia[0] = 0b1000; // 8 (Change value after OR)
          valueChanged = true;
          resolve(0);
        }, 15);
      });

      const oldValue: number = await Promise.race([orTask, changeTask]);
      await Promise.allSettled([orTask, changeTask]);

      expect(oldValue).assertEqual(1); // OR task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(8); // Change task overwrites OR result
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4700
     * @tc.desc   Async OR with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      const safeOr = async (arr: collections.Int32Array, idx: number, mask: number): Promise<number | null> => {
        try {
          if (typeof mask !== 'number') {
            throw new Error('Mask must be number');
          }
          return await new Promise<number>((resolve) => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with non-number mask (string)
      const result = await safeOr(ia, -1, 3);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(5); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4800
     * @tc.desc   Nested async: OR with batch mask application and result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      ia[2] = 0;
      const masks = [1, 2, 4];

      const batchOrAndAggregate = async (arr: collections.Int32Array, indexes: number[], masks: number[]): Promise<typeOr87> => {
        const orPromises = indexes.map((idx, i) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, masks[i]);
              resolve(old);
            }, 5);
          });
        });

        const oldValues = await Promise.all(orPromises);
        const newValues = indexes.map(idx => arr[idx]);
        return { oldValues, newValues } as typeOr87;
      };

      const result = await batchOrAndAggregate(ia, [0, 1, 2], masks);
      expect(result.oldValues).assertDeepEquals([0, 0, 0]);
      expect(result.newValues).assertDeepEquals([1, 2, 4]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_4900
     * @tc.desc   Async OR with closure that tracks cumulative mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      let cumulativeMask = 0;

      const createCumulativeOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          cumulativeMask |= mask; // Track cumulative mask
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeOr = createCumulativeOr(ia, 0);
      await cumulativeOr(1); // Cumulative: 1
      await cumulativeOr(2); // Cumulative: 3
      await cumulativeOr(4); // Cumulative: 7

      expect(cumulativeMask).assertEqual(7);
      expect(ia[0]).assertEqual(7); // Matches cumulative mask
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5000
     * @tc.desc   Promise.allSettled with OR tasks on same index (different masks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      const orTasks = [
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.or(ia, 0, 1)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.or(ia, 0, 2)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.or(ia, 0, 4)), 8))
      ];

      const results = await Promise.allSettled(orTasks);
      const oldValues = results.map(res => (res as PromiseFulfilledResult<number>).value);

      // Old values depend on execution order, but sum of masks is 7
      expect(oldValues.every(v => v >= 0 && v <= 7)).assertEqual(true);
      expect(ia[0]).assertEqual(7); // 0 | 1 | 2 | 4 = 7
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5100
     * @tc.desc   Async OR with 32-bit mask overflow coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0001; // 1
      let retryCount = 0;

      const orWithOverflowRetry = async (arr: collections.Int32Array, idx: number, mask: number): Promise<number> => {
        retryCount++;
        // Coerce mask to 32-bit signed integer (handle overflow)
        const validMask = mask >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, validMask);
            resolve(old);
          }, 7);
        });
      };

      // Mask exceeds 32 bits (0x100000001 → coerced to 0x00000001)
      const oldValue = await orWithOverflowRetry(ia, 0, 0x100000001);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(1); // Coerced mask matches existing bit
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5200
     * @tc.desc   Promise.race between OR and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.or(ia, 0, 3);
          resolve(old);
        }, 30); // Slow OR task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([orTask, timeoutTask]);
      // Wait for OR task to complete to check final state
      await Promise.allSettled([orTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(7); // OR task still completes later
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5300
     * @tc.desc   Async OR with closure that enforces unique mask usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const usedMasks = new Set<number>();

      const createUniqueOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          if (usedMasks.has(mask)) {
            throw new Error(`Mask ${mask} already used`);
          }
          usedMasks.add(mask);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueOr = createUniqueOr(ia, 0);
      const old1 = await uniqueOr(1); // New mask: 1
      let errorThrown = false;

      try {
        await uniqueOr(1); // Duplicate mask: 1
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(0);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(1); // Only first OR is applied
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5400
     * @tc.desc   Nested arrow functions: async OR with mask from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0100; // 4

      // Promise chain to get mask: 1 → 2 → 3
      const getMaskStep1 = (): Promise<number> => Promise.resolve(1);
      const getMaskStep2 = (val: number): Promise<number> => Promise.resolve(val + 1);
      const getMaskStep3 = (val: number): Promise<number> => Promise.resolve(val + 1);

      const chainOr = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const mask = await getMaskStep1()
          .then(getMaskStep2)
          .then(getMaskStep3);
        const innerOr = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          }, 6);
        });
        return innerOr();
      };

      const oldValue = await chainOr(ia, 0);
      expect(oldValue).assertEqual(4);
      expect(ia[0]).assertEqual(7); // 4 | 3 = 7
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5500
     * @tc.desc   Async OR with closure that logs operation timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const timeLog: Array<typeOr97> = [];

      const createTimedOr = (arr: collections.Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.or(arr, idx, mask);
              timeLog.push({ mask, timestamp: Date.now() });
              resolve(old);
            }, 5);
          });
        };
      };

      const timedOr = createTimedOr(ia, 0);
      await timedOr(1);
      await new Promise<void>((resolve) => setTimeout(resolve, 10)); // Add delay between ops
      await timedOr(2);

      expect(timeLog.length).assertEqual(2);
      expect(timeLog[0].mask).assertEqual(1);
      expect(timeLog[1].mask).assertEqual(2);
      expect(ia[0]).assertEqual(3); // 0 | 1 | 2 = 3
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsOr0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5600
     * @tc.desc   Nested async: OR with mask derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsOr0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0011; // 3

      const getDerivedMask = (arr: collections.Int32Array, idx: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] << 2; // Derive mask: 3 << 2 = 12 (0b1100)
            resolve(derived);
          }, 6);
        });
      };

      const derivedOr = async (arr: collections.Int32Array, idx: number) => {
        const mask = await getDerivedMask(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedOr(ia, 0);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(15); // 3 | 12 = 15
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsOr0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5700
     * @tc.desc   OR with collections.Int32Array and zero old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 15);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(15);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsOr0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_OR_5800
     * @tc.desc   OR with collections.Int32Array and mask=0, no change to value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsOr0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 99;
      const oldValue = ArkTSUtils.Atomics.or(ia, 0, 0);
      expect(oldValue).assertEqual(99);
      expect(ia[0]).assertEqual(99);
    });
  })
}
