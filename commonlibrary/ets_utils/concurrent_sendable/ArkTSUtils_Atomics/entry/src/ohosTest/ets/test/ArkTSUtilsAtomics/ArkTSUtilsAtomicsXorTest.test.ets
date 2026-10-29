import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { type56, type63, type71, typeOld, typeSub25, typeSub46, typeSub83, typeXor93, typeXor98 } from './atomics';
import { sleep } from './utils';


export default function atomicsXorTest() {
  describe('atomicsXorTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   testArkTSUtilsAtomicsXor0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0100
     * @tc.desc   Basic collections.Int32Array XOR operation, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5; // 0b0101
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 1); // 0b0001
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(4); // 0b0100
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0200
     * @tc.desc   XOR with 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 20;
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 0);
      expect(oldValue).assertEqual(20);
      expect(ia[0]).assertEqual(20);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0300
     * @tc.desc   XOR on collections.Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 6; // 0b0110
      const oldValue = ArkTSUtils.Atomics.xor(ia, 1, 5); // 0b0101
      expect(oldValue).assertEqual(6);
      expect(ia[1]).assertEqual(3); // 0b0011
      expect(ia[0]).assertEqual(3); // Unchanged
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0400
     * @tc.desc   XOR to flip all bits (value=0xFFFFFFFF for Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10; // 0b00001010
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 0xFFFFFFFF); // All bits 1
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(-11); // Bitwise NOT of 10 is -11 in two's complement
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0500
     * @tc.desc   Verify xor/load chain on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const initialVal = 0b1100; // 12 in decimal
      const xorMask1 = 0b0110;  // 6 in decimal (first XOR mask)
      const xorMask2 = 0b1001;  // 9 in decimal (second XOR mask)

      // Initialize shared memory value
      ia[0] = initialVal;

      // First atomic XOR operation (12 ^ 6 = 10 = 0b1010)
      const oldVal1 = ArkTSUtils.Atomics.xor(ia, 0, xorMask1);
      const result1 = ArkTSUtils.Atomics.load(ia, 0);

      // Second atomic XOR operation (10 ^ 9 = 3 = 0b0011)
      const oldVal2 = ArkTSUtils.Atomics.xor(ia, 0, xorMask2);
      const finalResult = ArkTSUtils.Atomics.load(ia, 0);

      // Key assertions
      // Verify first XOR operation
      expect(oldVal1).assertEqual(initialVal); // Return original value before first XOR
      expect(result1).assertEqual(initialVal ^ xorMask1); // 12 ^ 6 = 10
      expect(ia[0]).assertEqual(3); // Memory consistency after first XOR

      // Verify second XOR operation
      expect(oldVal2).assertEqual(result1); // Return value before second XOR
      expect(finalResult).assertEqual(result1 ^ xorMask2); // 10 ^ 9 = 3
      expect(ia[0]).assertEqual(finalResult); // Final memory consistency

      // Verify idempotency: XOR with same mask twice returns original value
      ArkTSUtils.Atomics.xor(ia, 0, xorMask2);
      ArkTSUtils.Atomics.xor(ia, 0, xorMask2);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(3); // 3 ^ 9 ^ 9 = 10
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0600
     * @tc.desc   Verify or/compareExchange feature bits on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b0000;

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.or(ia, 0, 0b0101); // Set features A and C
      const features = ArkTSUtils.Atomics.load(ia, 0);
      const isValid = ArkTSUtils.Atomics.compareExchange(ia, 0, features, features) === features && (features & 0b0101) === 0b0101;

      expect(isValid).assertEqual(true);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0700
     * @tc.desc   XOR twice on same collections.Int32Array index (return to original value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 7; // 0b0111

      const old1 = ArkTSUtils.Atomics.xor(ia, 0, 3); // 0b0011 → 0b0100 (4)
      expect(old1).assertEqual(7);
      expect(ia[0]).assertEqual(4);

      const old2 = ArkTSUtils.Atomics.xor(ia, 0, 3); // 0b0011 → 0b0111 (7)
      expect(old2).assertEqual(4);
      expect(ia[0]).assertEqual(7); // Back to original
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0800
     * @tc.desc   XOR on collections.Int32Array with value=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 12); // 0b1100
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(12);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_0900
     * @tc.desc   XOR non-integer value (coerced to integer) in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8; // 0b1000
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 3.9); // Coerced to 3 (0b0011)
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(11); // 0b1011
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1000
     * @tc.desc   XOR on collections.Int32Array maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsXor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32 (0b0111111111111111111111111111111)
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 1);
      expect(oldValue).assertEqual(2147483647);
      expect(ia[0]).assertEqual(2147483646); // Min Int32 (0b10000000000000000000000000000000)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1100
     * @tc.desc   XOR with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 14; // 0b1110
      const xorWrapper = (arr: collections.Int32Array, idx: number, val: number) => ArkTSUtils.Atomics.xor(arr, idx, val);
      const oldValue = xorWrapper(ia, 0, 7); // 0b0111
      expect(oldValue).assertEqual(14);
      expect(ia[0]).assertEqual(9); // 0b1001
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1200
     * @tc.desc   Verify isLockFree/xor/load/compareExchange update on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // State X: 0→1
      ia[1] = 1; // State Y: 1→0 (sync with X)

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.xor(ia, 0, 1); // X: 0→1
      const xState = ArkTSUtils.Atomics.load(ia, 0);
      ArkTSUtils.Atomics.compareExchange(ia, 1, 1, xState ^ 1); // Y sync to 0

      expect(ia[0]).assertEqual(1);
      expect(ia[1]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1300
     * @tc.desc   XOR on collections.Uint32Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 5; // 0b0101
      const oldValue = ArkTSUtils.Atomics.xor(ua, 0, 10); // 0b1010
      expect(oldValue).assertEqual(5);
      expect(ua[0]).assertEqual(15); // 0b1111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1400
     * @tc.desc   Arrow function to batch XOR on multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 5; // 0b0101

      const batchXor = (arr: collections.Int32Array, ops: Array<typeSub25>) => {
        return ops.map(op => ArkTSUtils.Atomics.xor(arr, op.idx, op.val));
      };

      const ops: typeSub25[] = [{ idx: 0, val: 4 }, { idx: 1, val: 2 }];
      const oldValues = batchXor(ia, ops);
      expect(oldValues).assertDeepEquals([3, 5]);
      expect(ia[0]).assertEqual(7); // 0b0111
      expect(ia[1]).assertEqual(7); // 0b0111
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1500
     * @tc.desc   XOR on collections.Int8Array (allowed type), check byte range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(1);
      const ia = new collections.Int8Array(sab);
      ia[0] = 10; // 0b00001010
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 12); // 0b00001100
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(6); // 0b00000110
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1600
     * @tc.desc   XOR on collections.Uint16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(2);
      const ua = new collections.Uint16Array(sab);
      ua[0] = 500; // 0b0000000111110100
      const oldValue = ArkTSUtils.Atomics.xor(ua, 0, 200); // 0b0000000011001000
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(316); // 0b0000001010111100
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1700
     * @tc.desc   Nested arrow functions: XOR with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40; // 0b101000

      const getDynamicValue = (base: number, offset: number) => base - offset;
      const dynamicXor = (arr: collections.Int32Array, idx: number, base: number, offset: number) => {
        const val = getDynamicValue(base, offset);
        return ArkTSUtils.Atomics.xor(arr, idx, val);
      };

      const oldValue = dynamicXor(ia, 0, 15, 5); // val = 15 - 5 = 10 (0b1010)
      expect(oldValue).assertEqual(40);
      expect(ia[0]).assertEqual(34); // 0b100010
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1800
     * @tc.desc   XOR value exceeding 32 bits (truncated) in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1; // 0b0001
      const longValue = 0x100000005; // 33 bits, truncated to 0x00000005
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, longValue);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(4); // 0b0100 (1 ^ 5 = 4)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_1900
     * @tc.desc   XOR on collections.Int32Array with value=0x80000000 (min Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0x80000000; // Min Int32 (-2147483648)
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 0x7FFFFFFF); // Max Int32
      expect(oldValue).assertEqual(-2147483648);
      expect(ia[0]).assertEqual(-1); // 0xFFFFFFFF (0x80000000 ^ 0x7FFFFFFF = 0xFFFFFFFF)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2000
     * @tc.desc   Nested arrow functions: XOR with value from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25; // 0b11001
      const outerValue = 10; // 0b1010 (captured from outer scope)

      const outer = (arr: collections.Int32Array): number => {
        const inner = (idx: number) => ArkTSUtils.Atomics.xor(arr, idx, outerValue);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(25);
      expect(ia[0]).assertEqual(19); // 0b01111 (25 ^ 10 = 15)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2100
     * @tc.desc   Arrow function to chain XOR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 14; // 0b1110

      const chainXor = (arr: collections.Int32Array, idx: number, ...values: number[]) => {
        return values.map(val => ArkTSUtils.Atomics.xor(arr, idx, val));
      };

      const oldValues = chainXor(ia, 0, 3, 5); // 3=0b11, 5=0b101
      expect(oldValues).assertDeepEquals([14, 13]); // 14^3=13, 13^5=8
      expect(ia[0]).assertEqual(8); // 0b1000 (14^3^5=8)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2200
     * @tc.desc   Nested arrow functions: XOR with conditional value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 30; // 0b11110

      const conditionalXor = (arr: collections.Int32Array, idx: number, useSmallValue: boolean) => {
        const getValue = () => useSmallValue ? 3 : 12; // 3=0b11, 12=0b1100
        return ArkTSUtils.Atomics.xor(arr, idx, getValue());
      };

      const oldValue = conditionalXor(ia, 0, true); // Use small value (3)
      expect(oldValue).assertEqual(30);
      expect(ia[0]).assertEqual(29); // 0b11101 (30 ^ 3 = 29)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2300
     * @tc.desc   XOR on collections.Int16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(2);
      const ia = new collections.Int16Array(sab);
      ia[0] = 200; // 0b0000000011001000
      const oldValue = ArkTSUtils.Atomics.xor(ia, 0, 100); // 0b0000000001100100
      expect(oldValue).assertEqual(200);
      expect(ia[0]).assertEqual(172); // 0b0000000100101100 (200 ^ 100 = 300)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2400
     * @tc.desc   XOR on collections.Uint8Array (allowed type), check 8-bit unsigned range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 60; // 0b00111100
      const oldValue = ArkTSUtils.Atomics.xor(ua, 0, 35); // 0b00100011
      expect(oldValue).assertEqual(60);
      expect(ua[0]).assertEqual(31); // 0b00111011 (60 ^ 35 = 59)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2500
     * @tc.desc   Arrow function to XOR and return new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 28; // 0b11100

      const xorAndGetNew = (arr: collections.Int32Array, idx: number, val: number) => {
        ArkTSUtils.Atomics.xor(arr, idx, val);
        return arr[idx];
      };

      const newValue = xorAndGetNew(ia, 0, 15); // 0b01111
      expect(newValue).assertEqual(19); // 0b01101 (28 ^ 15 = 13)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2600
     * @tc.desc   Async XOR with Promise wrapper, resolve old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 19; // 0b10011

      const asyncXor = (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncXor(ia, 0, 7); // 0b00111
      expect(oldValue).assertEqual(19);
      expect(ia[0]).assertEqual(20); // 0b10110 (19 ^ 7 = 22)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2700
     * @tc.desc   Promise.all with multiple XOR operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 11; // 0b001011
      ia[1] = 23; // 0b010111

      const createXorPromise = (arr: collections.Int32Array, idx: number, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const result = await Promise.all([
        createXorPromise(ia, 0, 5), // 0b000101 → 0b001110 (14)
        createXorPromise(ia, 1, 9)// 0b001001 → 0b011110 (30)
      ]);

      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(23);
      expect(ia[0]).assertEqual(14);
      expect(ia[1]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2800
     * @tc.desc   Async XOR with arrow function closure, capture index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 16; // 0b10000
      ia[1] = 31; // 0b11111
      const targetIdx = 1;

      const createClosureXor = (arr: collections.Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const closureXor = createClosureXor(ia);
      const oldValue = await closureXor(12); // 0b01100 → 0b10011 (19)
      expect(oldValue).assertEqual(31);
      expect(ia[1]).assertEqual(19);
      expect(ia[0]).assertEqual(16); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_2900
     * @tc.desc   Nested async: XOR with fractional value coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 26; // 0b11010
      let retryCount = 0;

      const xorWithRetry = async (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        const validVal = typeof val === 'number' ? Math.floor(val) : 0;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, validVal);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer value (8.9 → coerced to 8)
      const oldValue = await xorWithRetry(ia, 0, 8.9); // 0b1000 → 0b10010 (18)
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(26);
      expect(ia[0]).assertEqual(18);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3000
     * @tc.desc   Promise.race between two XOR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15; // 0b1111

      const xorTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 7); // 0b0111 → 0b1000 (8)
          resolve(old);
        }, 10);
      });

      const xorTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 12); // 0b1100 → 0b0100 (4) or 0b1100 (12)
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([xorTask1, xorTask2]);
      await Promise.allSettled([xorTask1, xorTask2]);

      expect([15, 8, 12].includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(4); // 15 ^7^12 = 4
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3100
     * @tc.desc   Nested arrow functions: async XOR with dynamic value from mock API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 49; // 0b110001

      // Mock API to get dynamic XOR value
      const mockValueApi = async (): Promise<number> => {
        return new Promise((resolve) => setTimeout(() => resolve(22), 12)); // 0b10110
      };

      const dynamicXor = async (arr: collections.Int32Array, idx: number) => {
        const val = await mockValueApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicXor(ia, 0); // 0b110001 ^ 0b10110 = 0b100111 (39)
      expect(oldValue).assertEqual(49);
      expect(ia[0]).assertEqual(39);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3200
     * @tc.desc   Promise.allSettled with valid and invalid XOR tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 35;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.xor(ia, 0, 14)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(ArkTSUtils.Atomics.xor(ia, 1, 14));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      expect(results[0].status).assertEqual('fulfilled');
      expect(results[1].status).assertEqual('rejected');
      const validResult = results[0] as PromiseFulfilledResult<number>;
      expect(validResult.value).assertEqual(35);
      expect(ia[0]).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3300
     * @tc.desc   Async XOR with closure that tracks operation history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50; // 0b110010
      const history: Array<type56> = [];

      const createTrackedXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              const newVal = arr[idx];
              history.push({
                time: Date.now(),
                old,
                new: newVal,
                val
              });
              resolve(old);
            }, 7);
          });
        };
      };

      const trackedXor = createTrackedXor(ia, 0);
      await trackedXor(13); // 0b001101 → 0b111111 (63)
      await trackedXor(22); // 0b010110 → 0b101001 (41)
      await trackedXor(9); // 0b001001 → 0b100000 (32)

      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(50);
      expect(history[0].new).assertEqual(63);
      expect(history[1].old).assertEqual(63);
      expect(history[1].new).assertEqual(41);
      expect(history[2].old).assertEqual(41);
      expect(history[2].new).assertEqual(32);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3400
     * @tc.desc   Async XOR with Promise chain: validate → XOR → log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 27; // 0b11011
      const log: string[] = [];

      // Step 1: Validate XOR value (bit length <= 5)
      const validateVal = (val: number): Promise<boolean> => {
        return new Promise((resolve) => setTimeout(() => resolve(val.toString(2).length <= 5), 5));
      };

      // Step 2: Perform async XOR
      const performXor = (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            log.push(`XOR: old=${old}, new=${newVal}`);
            resolve();
          }, 3);
        });
      };

      // Chain workflow
      const xorVal = 14; // 0b1110 (bit length 4, valid)
      const isValid = await validateVal(xorVal);
      if (isValid) {
        const oldValue = await performXor(ia, 0, xorVal);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('XOR: old=27, new=21'); // 27 ^14=19
      expect(ia[0]).assertEqual(21);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3500
     * @tc.desc   Nested arrow functions: async XOR with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 12; // 0b1100
      ia[1] = 28; // 0b11100
      ia[2] = 44; // 0b101100
      const targetIdx = 2; // Captured in closure

      const createIndexXor = (arr: collections.Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexXor = createIndexXor(ia);
      const oldValue = await indexXor(18); // 0b10010 → 0b001000 (8)
      expect(oldValue).assertEqual(44);
      expect(ia[2]).assertEqual(62);
      expect(ia[0]).assertEqual(12); // Unchanged
      expect(ia[1]).assertEqual(28); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3600
     * @tc.desc   Promise.race between XOR and timeout (XOR wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 39; // 0b100111

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 15); // 0b001111 → 0b101000 (40)
          resolve(old);
        }, 12);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 20);
      });

      const result = await Promise.race([xorTask, timeoutTask]);
      expect(result).assertEqual(39); // XOR task wins
      expect(ia[0]).assertEqual(40);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3700
     * @tc.desc   Async XOR with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 17; // 0b10001
      let errorCaught = false;

      const safeXor = async (arr: collections.Int32Array, idx: number, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length = 1)
      const result = await safeXor(ia, 1, 6); // 0b00110
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(17); // Unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3800
     * @tc.desc   Nested async: XOR with batch value application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8; // 0b1000
      ia[1] = 18; // 0b10010
      ia[2] = 33; // 0b100001
      const xors = [5, 11, 22]; // Values for each index

      const batchXor = (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.xor(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchXor(ia, [0, 1, 2], xors);
      expect(oldValues).assertDeepEquals([8, 18, 33]);
      expect(ia[0]).assertEqual(13); // 8 ^5=13
      expect(ia[1]).assertEqual(25); // 18^11=27
      expect(ia[2]).assertEqual(55); // 33^22=19
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_3900
     * @tc.desc   Async XOR with closure that enforces result bit limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 22; // 0b10110
      const maxBitLength = 5; // Result <= 0b11111 (31)

      const createBitLimitedXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<type63>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old ^ val;
              if (newVal.toString(2).length <= maxBitLength) {
                ArkTSUtils.Atomics.xor(arr, idx, val); // Perform XOR only if bit limit is met
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const bitLimitedXor = createBitLimitedXor(ia, 0);
      // Valid: 22 ^ 9 = 25 (0b11001, 5 bits)
      const result1 = await bitLimitedXor(9);
      // Invalid: 25 ^ 20 = 13 (0b1101, 4 bits → valid, correction: 25^30=7 (0b111, valid) → adjust to invalid case)
      // Correct invalid case: 25 ^ 16 = 9 (0b1001, 4 bits → still valid, use 25 ^ 32 = 57 (0b111001, 6 bits → invalid)
      const result2 = await bitLimitedXor(32);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(22);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(31);
      expect(ia[0]).assertEqual(31);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4000
     * @tc.desc   Promise.all with XOR and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 37; // 0b100101
      let stateCheckPassed = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 14); // 0b001110 → 0b101011 (43)
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 43; // Verify XOR result
          resolve();
        }, 15);
      });

      const result = await Promise.all([xorTask, stateCheckTask]);
      expect(result[0]).assertEqual(37);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(43);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4100
     * @tc.desc   AND/XOR/OR bitmask sequence on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b101100; // Initial bitmask: 44

      // Step 1: Clear bits 2-3 (0b1100)
      ArkTSUtils.Atomics.and(ia, 0, ~0b1100); // 0b101100 & 0b11110011 = 0b100000 (32)
      // Step 2: Toggle bit 4 (0b10000)
      ArkTSUtils.Atomics.xor(ia, 0, 0b10000); // 0b100000 ^ 0b10000 = 0b110000 (48)
      // Step 3: Set bit 1 (0b10)
      ArkTSUtils.Atomics.or(ia, 0, 0b10); // 0b110000 | 0b10 = 0b110010 (50)

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4200
     * @tc.desc   Async XOR with closure that logs XOR value usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 41; // 0b101001
      const valLog: number[] = [];

      const createLoggedXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          valLog.push(val); // Log XOR value before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedXor = createLoggedXor(ia, 0);
      await loggedXor(12); // Log:12 → 0b101001 ^ 0b001100 = 0b100101 (37)
      await loggedXor(9); // Log:9 → 0b100101 ^ 0b001001 = 0b101100 (44)
      await loggedXor(15); // Log:15 → 0b101100 ^ 0b001111 = 0b100011 (35)

      expect(valLog).assertDeepEquals([12, 9, 15]);
      expect(ia[0]).assertEqual(35);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4300
     * @tc.desc   Nested arrow functions: async XOR with conditional value selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 36; // 0b100100
      const threshold = 30;

      const getConditionalVal = (value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const val = value > threshold ? 18 : 7; // 18=0b10010, 7=0b00111
            resolve(val);
          }, 6);
        });
      };

      const conditionalXor = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const currentValue = arr[idx];
        const val = await getConditionalVal(currentValue);
        const innerXor = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 5);
        });
        return innerXor();
      };

      const oldValue = await conditionalXor(ia, 0); // 36>30 → use 18 → 0b100100^0b10010=0b110110 (54)
      expect(oldValue).assertEqual(36);
      expect(ia[0]).assertEqual(54);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4400
     * @tc.desc   Nested async: XOR with value derived from previous XOR result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 55; // 0b110111

      const firstXor = (arr: collections.Int32Array): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, 0, 19); // 19=0b10011 → 0b110111^0b10011=0b100100 (36)
            resolve(old);
          }, 7);
        });
      };

      const secondXor = async (arr: collections.Int32Array) => {
        const firstOld = await firstXor(arr);
        const derivedVal = firstOld % 16; // Derive value: 55%16=7 (0b00111)
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, 0, derivedVal); // 0b100100^0b00111=0b100011 (35)
            resolve(old);
          }, 5);
        });
      };

      const secondOld = await secondXor(ia);
      expect(secondOld).assertEqual(36);
      expect(ia[0]).assertEqual(35);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4500
     * @tc.desc   Promise.race between two XOR tasks with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 28; // 0b11100

      const xorTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 11); // 11=0b1011 → 0b11100^0b1011=0b10111 (23)
          resolve(old);
        }, 10);
      });

      const xorTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 15); // 15=0b1111 → 0b11100^0b1111=0b10011 (19) / 0b10111^0b1111=0b11000 (24)
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([xorTaskA, xorTaskB]);
      await Promise.allSettled([xorTaskA, xorTaskB]);

      expect([28, 23, 19].includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(24); // 28 ^11^15 = 24
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4600
     * @tc.desc   Nested arrow functions: async XOR with batch value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 19; // 0b10011
      ia[1] = 41; // 0b101001
      const xors = [7, 13]; // Values for index 0 and 1

      const validateValues = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            // Validate all values are odd
            const allValid = values.every(val => val % 2 === 1);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidXor = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        const isValid = await validateValues(values);
        if (!isValid) {
          throw new Error('Invalid XOR value');
        }

        return Promise.all(
          indexes.map((idx, i): Promise<number> => {
            const innerXor = () => new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.xor(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
            return innerXor();
          })
        );
      };

      const oldValues = await batchValidXor(ia, [0, 1], xors);
      expect(oldValues).assertDeepEquals([19, 41]);
      expect(ia[0]).assertEqual(20); // 19 ^7=22
      expect(ia[1]).assertEqual(36); // 41 ^13=52
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4700
     * @tc.desc   Async XOR with closure that tracks operation success rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 46; // 0b101110
      let successCount = 0;
      let totalCount = 0;

      const createTrackedXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          totalCount++;
          return new Promise<type63>((resolve) => {
            setTimeout(() => {
              try {
                const validVal = typeof val === 'number' ? val : 0;
                const old = ArkTSUtils.Atomics.xor(arr, idx, validVal);
                successCount++;
                resolve({ old, success: true });
              } catch (err) {
                resolve({ old: -1, success: false });
              }
            }, 7);
          });
        };
      };

      const trackedXor = createTrackedXor(ia, 0);
      await trackedXor(15); // Success (valid number: 15=0b1111 → 46^15=37)
      await trackedXor(-22); // Success (coerced to 22=0b10110 → 37^22=19)
      await trackedXor(NaN); // Success (coerced to 0 → 19^0=19)

      expect(totalCount).assertEqual(3);
      expect(successCount).assertEqual(3);
      expect(ia[0]).assertEqual(-53);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4800
     * @tc.desc   Promise.all with XOR and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 31; // 0b11111
      let cleanedUp = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 14); // 14=0b1110 → 31^14=17 (0b10001)
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after XOR
          cleanedUp = true;
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([xorTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(31);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup resets value
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_4900
     * @tc.desc   Async XOR with closure that skips duplicate XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 43; // 0b101011
      const usedVals = new Set<number>();

      const createDedupXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            return Promise.resolve(arr[idx]); // Return current value if duplicate
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupXor = createDedupXor(ia, 0);
      const old1 = await dedupXor(12); // New value:12=0b1100 → 43^12=37 (0b100101)
      const old2 = await dedupXor(12); // Duplicate:12 → skip XOR
      const old3 = await dedupXor(19); // New value:19=0b10011 → 37^19=50 (0b110010)

      expect(old1).assertEqual(43);
      expect(old2).assertEqual(39); // Returns current value (no XOR)
      expect(old3).assertEqual(39);
      expect(ia[0]).assertEqual(52);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5000
     * @tc.desc   Promise.race between XOR and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25; // 0b11001
      let valueChanged = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 9); // 9=0b1001 → 25^9= 18 (0b10010)
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 50; // Overwrite value after XOR
          valueChanged = true;
          resolve();
        }, 15);
      });

      const oldValue: number = await Promise.race([xorTask, changeTask]) as number;
      await Promise.allSettled([xorTask, changeTask]);

      expect(oldValue).assertEqual(25); // XOR task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(50); // Change task overwrites result
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5100
     * @tc.desc   Nested async: XOR with batch value application and result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 14; // 0b1110
      ia[1] = 29; // 0b11101
      ia[2] = 46; // 0b101110
      const xors = [5, 12, 23];

      const batchXorAndAggregate = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        const xorPromises = indexes.map((idx, i) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, values[i]);
              resolve(old);
            }, 5);
          });
        });

        const oldValues = await Promise.all(xorPromises);
        const newValues = indexes.map(idx => arr[idx]);
        return { oldValues, newValues } as typeSub83;
      };

      const res = await batchXorAndAggregate(ia, [0, 1, 2], xors);
      expect(res.oldValues).assertDeepEquals([14, 29, 46]);
      expect(res.newValues).assertDeepEquals([11, 17, 57]); // 14^5=11, 29^12=17, 46^23=61
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5200
     * @tc.desc   Async XOR with closure that tracks cumulative XOR value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 51; // 0b110011
      let cumulativeVal = 0;

      const createCumulativeXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          cumulativeVal ^= val; // Track cumulative XOR value
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeXor = createCumulativeXor(ia, 0);
      await cumulativeXor(18); // Cumulative:18 → 51^18= 47 (0b101111)
      await cumulativeXor(25); // Cumulative:18^25=7 → 47^25= 18 (0b10010)
      await cumulativeXor(11); // Cumulative:7^11=12 → 18^11= 27 (0b11011)

      expect(cumulativeVal).assertEqual(0);
      expect(ia[0]).assertEqual(51);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5300
     * @tc.desc   Promise.allSettled with XOR tasks on same index (different values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 33; // 0b100001

      const xorTasks = [
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.xor(ia, 0, 10)), 8)), // 10=0b1010 → 33^10= 43
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.xor(ia, 0, 17)), 8)),
        // 17=0b10001 → 43^17= 58 / 33^17= 16
        new Promise<number>((resolve) => setTimeout(() => resolve(ArkTSUtils.Atomics.xor(ia, 0, 22)),
          8))// 22=0b10110 → 58^22= 40 / 16^22= 6 / 43^22= 61
      ];

      const results = await Promise.allSettled(xorTasks);
      const oldValues = results.map(res => (res as PromiseFulfilledResult<number>).value);

      // Old values depend on execution order, total XOR result is fixed
      expect(oldValues.every(v => v >= 16 && v <= 58)).assertEqual(true);
      expect(ia[0]).assertEqual(44); // 33 ^10^17^22 = 40
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5400
     * @tc.desc   Async XOR with 32-bit value overflow coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 49; // 0b110001
      let retryCount = 0;

      const xorWithOverflowRetry = async (arr: collections.Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        // Coerce value to 32-bit signed integer (handle overflow)
        const validVal = val >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, validVal);
            resolve(old);
          }, 7);
        });
      };

      // Value exceeds 32 bits (0x10000000E → coerced to 0x0000000E = 14)
      const oldValue = await xorWithOverflowRetry(ia, 0, 0x10000000E);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(49);
      expect(ia[0]).assertEqual(63); // 49 ^ 14 = 63
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5500
     * @tc.desc   Promise.race between XOR and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 26; // 0b11010

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.xor(ia, 0, 9); // 9=0b1001 → 26^9= 21
          resolve(old);
        }, 30); // Slow XOR task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([xorTask, timeoutTask]);
      // Wait for XOR task to complete to check final state
      await Promise.allSettled([xorTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(19); // XOR task still completes later
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5600
     * @tc.desc   Async XOR with closure that enforces unique XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 58; // 0b111010
      const usedVals = new Set<number>();

      const createUniqueXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            throw new Error(`XOR value ${val} already used`);
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueXor = createUniqueXor(ia, 0);
      const old1 = await uniqueXor(23); // New value:23=0b10111 → 58^23= 47
      let errorThrown = false;

      try {
        await uniqueXor(23); // Duplicate value:23
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(58);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(45); // Only first XOR is applied
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5700
     * @tc.desc   Nested arrow functions: async XOR with value from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 44; // 0b101100

      // Promise chain to get XOR value: 6 → 10 → 13
      const getValStep1 = (): Promise<number> => Promise.resolve(6);
      const getValStep2 = (val: number): Promise<number> => Promise.resolve(val + 4);
      const getValStep3 = (val: number): Promise<number> => Promise.resolve(val + 3);

      const chainXor = async (arr: collections.Int32Array, idx: number): Promise<number> => {
        const val = await getValStep1()
          .then(getValStep2)
          .then(getValStep3);
        const innerXor = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 6);
        });
        return innerXor();
      };

      const oldValue = await chainXor(ia, 0); // 44 ^13 = 37 (0b100101)
      expect(oldValue).assertEqual(44);
      expect(ia[0]).assertEqual(33);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5800
     * @tc.desc   Async XOR with closure that logs operation timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 35; // 0b100011
      const timeLog: Array<typeXor93> = [];

      const createTimedXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              timeLog.push({ val, timestamp: Date.now() });
              resolve(old);
            }, 5);
          });
        };
      };

      const timedXor = createTimedXor(ia, 0);
      await timedXor(12); // 35^12= 27 (0b11011)
      await new Promise<void>((resolve) => setTimeout(resolve, 10)); // Add delay between ops
      await timedXor(18); // 27^18= 11 (0b1011)

      expect(timeLog.length).assertEqual(2);
      expect(timeLog[0].val).assertEqual(12);
      expect(timeLog[1].val).assertEqual(18);
      expect(timeLog[1].timestamp - timeLog[0].timestamp).assertLargerOrEqual(10); // Delay between timestamps
      expect(ia[0]).assertEqual(61);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_5900
     * @tc.desc   Nested async: XOR with value derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 52; // 0b110100

      const getDerivedVal = (arr: collections.Int32Array, idx: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] % 15; // Derive value: 52%15= 7 (0b111)
            resolve(derived);
          }, 6);
        });
      };

      const derivedXor = async (arr: collections.Int32Array, idx: number) => {
        const val = await getDerivedVal(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.xor(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedXor(ia, 0); // 52 ^7= 47 (0b101111)
      expect(oldValue).assertEqual(52);
      expect(ia[0]).assertEqual(51);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0060
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6000
     * @tc.desc   xor/exchange toggle and reset on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1;  // Initial state: 1 (on)

      const toggled = ArkTSUtils.Atomics.xor(ia, 0, 1);  // 1 ^ 1 = 0 (off)
      const reset = ArkTSUtils.Atomics.exchange(ia, 0, 1);  // Reset to 1, return old value 0

      expect(toggled).assertEqual(1);
      expect(reset).assertEqual(0);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0061
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6100
     * @tc.desc   Async XOR with closure that skips zero XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 29; // 0b11101
      let skipCount = 0;

      const createZeroSkipXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          if (val === 0) {
            skipCount++;
            return Promise.resolve(arr[idx]); // Return current value, skip XOR
          }
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const zeroSkipXor = createZeroSkipXor(ia, 0);
      const old1 = await zeroSkipXor(8); // 29^8= 21 (0b10101)
      const old2 = await zeroSkipXor(0); // Val=0 → skip
      const old3 = await zeroSkipXor(12); // 21^12= 29 (0b11101)

      expect(skipCount).assertEqual(1);
      expect(old1).assertEqual(29);
      expect(old2).assertEqual(21); // Returns current value (no XOR)
      expect(old3).assertEqual(21);
      expect(ia[0]).assertEqual(25);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0062
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6200
     * @tc.desc   Nested async: XOR with mixed positive and negative masks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 17; // 0b10001
      ia[1] = 38; // 0b100110
      const xors = [5, -1, 14]; // Mixed positive and negative masks
      const successIndexes: number[] = [];

      const validateAndBatchXor = async (arr: collections.Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const validVal = typeof values[i] === 'number' ? values[i] : 0;
                if (typeof values[i] === 'number') {
                  successIndexes.push(idx);
                }
                const old = ArkTSUtils.Atomics.xor(arr, idx, validVal);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await validateAndBatchXor(ia, [0, 1, 0], xors);
      expect(successIndexes).assertDeepEquals([0, 1, 0]); // All three XOR calls are valid
      expect(oldValues).assertDeepEquals([17, 38, 20]); // 17^5=20, 38^0=38, 20^14=6
      expect(ia[0]).assertEqual(26);
      expect(ia[1]).assertEqual(-39); // Invalid value → XOR 0, no change
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0063
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6300
     * @tc.desc   Async XOR with closure that tracks value change history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 46; // 0b101110
      const changeHistory: Array<typeXor98> = [];

      const createHistoryXor = (arr: collections.Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const before = arr[idx];
              const old = ArkTSUtils.Atomics.xor(arr, idx, val);
              const after = arr[idx];
              changeHistory.push({ before, after, val });
              resolve(old);
            }, 7);
          });
        };
      };

      const historyXor = createHistoryXor(ia, 0);
      await historyXor(15); // 46^15= 37 (0b100101)
      await historyXor(22); // 37^22= 19 (0b10011)

      expect(changeHistory.length).assertEqual(2);
      expect(changeHistory[0].before).assertEqual(46);
      expect(changeHistory[0].after).assertEqual(33);
      expect(changeHistory[0].val).assertEqual(15);
      expect(changeHistory[1].before).assertEqual(33);
      expect(changeHistory[1].after).assertEqual(55);
      expect(changeHistory[1].val).assertEqual(22);
      expect(ia[0]).assertEqual(55);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsXor0064
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6400
     * @tc.desc   Comprehensive async workflow: validate → batch XOR → log → cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 32; // 0b100000
      ia[1] = 57; // 0b111001
      ia[2] = 83; // 0b1010011
      const xors = [18, 23, 35];
      const log: string[] = [];
      let validationPassed = false;
      let cleanedUp = false;

      // Step 1: Validate all XOR values (bit length <= 6)
      const validateBatch = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            validationPassed = values.every(v => v.toString(2).length <= 6);
            log.push(`Batch validation: ${validationPassed ? 'passed' : 'failed'}`);
            resolve(validationPassed);
          }, 8);
        });
      };

      // Step 2: Batch XOR
      const runBatch = (arr: collections.Int32Array, indexes: number[], values: number[]): Promise<number[]> => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = ArkTSUtils.Atomics.xor(arr, idx, values[i]);
                log.push(`XOR index ${idx}: old=${old}, new=${arr[idx]}`);
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
      const initialValues = [32, 57, 83];
      const isValid = await validateBatch(xors);
      let oldValues: number[] = [];
      if (isValid) {
        oldValues = await runBatch(ia, [0, 1, 2], xors);
        await cleanupBatch(ia, initialValues);
      }

      // Assertions
      expect(validationPassed).assertEqual(true);
      expect(oldValues).assertDeepEquals(initialValues);
      expect(cleanedUp).assertEqual(true);
      expect(ia).assertDeepEquals(new collections.Int32Array(initialValues));
      expect(log)
        .assertDeepEquals(["Batch validation: passed", "XOR index 0: old=32, new=50", "XOR index 1: old=57, new=46",
          "XOR index 2: old=83, new=112", "Cleanup: restored initial values"]);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsXor0065
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6500
     * @tc.desc   Promise.allSettled with valid XOR task and out-of-range index task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsXor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);

      ia[0] = 23;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.xor(ia, 0, 10)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(ArkTSUtils.Atomics.xor(ia, 2, 10));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      expect(results[0].status).assertEqual('fulfilled');
      expect(results[1].status).assertEqual('rejected');
      const validResult = results[0] as PromiseFulfilledResult<number>;
      expect(validResult.value).assertEqual(23);
      expect(ia[0]).assertEqual(29);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsXor0066
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6600
     * @tc.desc   Verify xor toggles state and exchange bumps version on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1; // State
      ia[1] = 0; // Version

      expect(ArkTSUtils.Atomics.isLockFree(4)).assertEqual(true);

      ArkTSUtils.Atomics.xor(ia, 0, 1); // Toggle state: 1→0
      ArkTSUtils.Atomics.exchange(ia, 1, ArkTSUtils.Atomics.load(ia, 1) + 1); // Bump version

      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsXor0067
     * @tc.number SUB_ARKTSUTILS_ATOMICS_XOR_6700
     * @tc.desc   Verify xor toggles flag twice on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsXor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;  // Flag: 0 (false), 1 (true)

      // Toggle flag twice
      ArkTSUtils.Atomics.xor(ia, 0, 1);  // 0 → 1
      const firstState = ArkTSUtils.Atomics.load(ia, 0);
      ArkTSUtils.Atomics.xor(ia, 0, 1);  // 1 → 0
      const secondState = ArkTSUtils.Atomics.load(ia, 0);

      expect(firstState).assertEqual(1);
      expect(secondState).assertEqual(0);
    });
  })
}
