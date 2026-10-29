import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { atomicAddGenerator } from './atomics';
import { sleep } from './utils';


export default function atomicsAddTest() {
  describe('atomicsAddTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0100
     * @tc.desc   Test with negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 20);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, -5);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(20);
      expect(newValue).assertEqual(15);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0200
     * @tc.desc   Test with zero value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 5);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 0);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(5);
      expect(newValue).assertEqual(5);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0300
     * @tc.desc   Test add through Int32Array and Uint32Array views over one buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(16);
      const i32a = new collections.Int32Array(sab);
      const u32a = new collections.Uint32Array(sab);

      // Initialize the first element
      i32a[0] = 100;

      // Both views should see the same initial value
      expect(i32a[0]).assertEqual(100);
      expect(u32a[0]).assertEqual(100);

      // Perform add using the collections.Int32Array view
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 50);

      // Both views should see the updated value
      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);
      expect(u32a[0]).assertEqual(150);

      // Perform add using the collections.Uint32Array view
      const oldValue2 = ArkTSUtils.Atomics.add(u32a, 0, 50);

      // Both views should see the updated value
      expect(oldValue2).assertEqual(150);
      expect(i32a[0]).assertEqual(200);
      expect(u32a[0]).assertEqual(200);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0400
     * @tc.desc   Test add basic, overflow, zero and negative value on collections.Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const u8a = new collections.Uint8Array(sab);

      // Test 1: Basic addition
      u8a[0] = 100;
      const oldValue1 = ArkTSUtils.Atomics.add(u8a, 0, 50);
      expect(oldValue1).assertEqual(100);
      expect(u8a[0]).assertEqual(150);

      // Test 2: Addition causing overflow
      u8a[0] = 250;
      const oldValue2 = ArkTSUtils.Atomics.add(u8a, 0, 10);
      expect(oldValue2).assertEqual(250);
      expect(u8a[0]).assertEqual(4); // 250 + 10 = 260, which wraps to 4 for Uint8

      // Test 3: Adding zero
      u8a[0] = 75;
      const oldValue3 = ArkTSUtils.Atomics.add(u8a, 0, 0);
      expect(oldValue3).assertEqual(75);
      expect(u8a[0]).assertEqual(75);

      // Test 4: Adding negative value
      u8a[0] = 50;
      const oldValue4 = ArkTSUtils.Atomics.add(u8a, 0, -10);
      expect(oldValue4).assertEqual(50);
      expect(u8a[0]).assertEqual(40);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0500
     * @tc.desc   Test with negative value and overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const minValue = -2147483648; // Minimum value for Int32

      ArkTSUtils.Atomics.store(ta, 0, minValue);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, -1);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(minValue);
      expect(newValue).assertEqual(2147483647); // Overflow to maximum value
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0600
     * @tc.desc   Test with zero initial value and multiple additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      const valuesToAdd = [1, -2, 3, -4, 5];
      let expectedValue = 0;

      for (const value of valuesToAdd) {
        const oldValue = ArkTSUtils.Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(3); // 1 - 2 + 3 - 4 + 5 = 3
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0700
     * @tc.desc   Test with non-zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const initialValue = 100;

      ArkTSUtils.Atomics.store(ta, 0, initialValue);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 50);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(initialValue);
      expect(newValue).assertEqual(initialValue + 50);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0800
     * @tc.desc   Test with different indices in the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(16); // 4 elements of Int32
      const ta = new collections.Int32Array(sab);

      // Initialize all elements
      ArkTSUtils.Atomics.store(ta, 0, 10);
      ArkTSUtils.Atomics.store(ta, 1, 20);
      ArkTSUtils.Atomics.store(ta, 2, 30);
      ArkTSUtils.Atomics.store(ta, 3, 40);

      // Add to each element
      const oldValue0 = ArkTSUtils.Atomics.add(ta, 0, 5);
      const oldValue1 = ArkTSUtils.Atomics.add(ta, 1, 5);
      const oldValue2 = ArkTSUtils.Atomics.add(ta, 2, 5);
      const oldValue3 = ArkTSUtils.Atomics.add(ta, 3, 5);

      // Verify old values
      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);
      expect(oldValue2).assertEqual(30);
      expect(oldValue3).assertEqual(40);

      // Verify new values
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(15);
      expect(ArkTSUtils.Atomics.load(ta, 1)).assertEqual(25);
      expect(ArkTSUtils.Atomics.load(ta, 2)).assertEqual(35);
      expect(ArkTSUtils.Atomics.load(ta, 3)).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_0900
     * @tc.desc   Test with ArkTSUtils.Atomics.compareExchange after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 10);

      // Compare and exchange if value is 10
      const oldValue = ArkTSUtils.Atomics.compareExchange(ta, 0, 10, 20);

      expect(oldValue).assertEqual(10);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1000
     * @tc.desc   Test with ArkTSUtils.Atomics.exchange after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 10);

      // Exchange the value
      const oldValue = ArkTSUtils.Atomics.exchange(ta, 0, 20);

      expect(oldValue).assertEqual(10);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1100
     * @tc.desc   Test with large buffer size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const bufferSize = 1024 * 4; // 1024 Int32 elements
      const sab = new collections.ArrayBuffer(bufferSize);
      const ta = new collections.Int32Array(sab);
      const index = 512; // Middle index

      const oldValue = ArkTSUtils.Atomics.add(ta, index, 100);
      const newValue = ArkTSUtils.Atomics.load(ta, index);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(100);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1200
     * @tc.desc   Verify add on Uint8Array with wraparound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const u8a = new collections.Uint8Array(sab);
      u8a [0] = 50
      // Test 1= 50;
      const oldValue1 = ArkTSUtils.Atomics.add(u8a, 0, 30);
      expect(oldValue1).assertEqual(50);
      expect(u8a[0]).assertEqual(80);

      // Test 2= 200;
      u8a [1] = 200
      const oldValue2 = ArkTSUtils.Atomics.add(u8a, 1, 100);
      expect(oldValue2).assertEqual(200);
      expect(u8a[1]).assertEqual(44); // 200 + 100 = 300, which wraps to 44 for Uint8

      // Test 3= 75;
      u8a [2] = 75
      const oldValue3 = ArkTSUtils.Atomics.add(u8a, 2, 0);
      expect(oldValue3).assertEqual(75);
      expect(u8a[2]).assertEqual(75);

      // Test 4= 25;
      u8a [3] = 25
      const oldValue4 = ArkTSUtils.Atomics.add(u8a, 3, -10);
      expect(oldValue4).assertEqual(25);
      expect(u8a[3]).assertEqual(15);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1300
     * @tc.desc   Test ArkTSUtils.Atomics.add with multiple operations on the same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);

      // Initialize with 0
      i32a[0] = 0;

      // Perform multiple add operations
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 10);
      const oldValue2 = ArkTSUtils.Atomics.add(i32a, 0, 20);
      const oldValue3 = ArkTSUtils.Atomics.add(i32a, 0, 30);

      // Verify old values
      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(10);
      expect(oldValue3).assertEqual(30);

      // Verify final value (0 + 10 + 20 + 30 = 60)
      expect(i32a[0]).assertEqual(60);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1400
     * @tc.desc   Test ArkTSUtils.Atomics.add with large negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 1000000;

      // Add a large negative value
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, -2000000);
      const newValue = ArkTSUtils.Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(1000000);

      // Verify the new value is correct (1000000 + (-2000000) = -1000000)
      expect(newValue).assertEqual(-1000000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1500
     * @tc.desc   Test ArkTSUtils.Atomics.add with different data types in the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(8);

      // Create different views on the same buffer
      const u8a = new collections.Uint8Array(sab);
      const u16a = new collections.Uint16Array(sab);
      const u32a = new collections.Uint32Array(sab);

      // Initialize using collections.Uint8Array
      u8a[0] = 0xFF;
      u8a[1] = 0xFF;
      u8a[2] = 0xFF;
      u8a[3] = 0xFF;

      // Add to collections.Uint16Array view
      const oldValue16 = ArkTSUtils.Atomics.add(u16a, 0, 1);

      // Add to collections.Uint32Array view
      const oldValue32 = ArkTSUtils.Atomics.add(u32a, 0, 1);

      // Verify old values
      expect(oldValue16).assertEqual(0xFFFF);
      expect(oldValue32).assertEqual(4294901760);

      // Verify final values
      expect(u32a[0]).assertEqual(0xFFFF0001);
      expect(u16a[0]).assertEqual(0x0001);
      expect(u16a[1]).assertEqual(65535);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1600
     * @tc.desc   Test with typed array view on different buffer offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta1 = new collections.Int32Array(sab, 0, 2); // First two Int32 elements
      const ta2 = new collections.Int32Array(sab, 4, 1); // Second Int32 element only

      ArkTSUtils.Atomics.store(ta1, 1, 100);

      const oldValue = ArkTSUtils.Atomics.add(ta2, 0, 50);
      const newValue = ArkTSUtils.Atomics.load(ta2, 0);

      expect(oldValue).assertEqual(100);
      expect(newValue).assertEqual(150);
      expect(ArkTSUtils.Atomics.load(ta1, 1)).assertEqual(150); // Should reflect the change
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1700
     * @tc.desc   Test with multiple typed array views on the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta1 = new collections.Int32Array(sab);
      const ta2 = new collections.Uint32Array(sab);

      ArkTSUtils.Atomics.store(ta1, 0, -1); // Represented as 4294967295 in Uint32

      const oldValue1 = ArkTSUtils.Atomics.add(ta1, 0, 1);
      const newValue1 = ArkTSUtils.Atomics.load(ta1, 0);
      const newValue2 = ArkTSUtils.Atomics.load(ta2, 0);

      expect(oldValue1).assertEqual(-1);
      expect(newValue1).assertEqual(0);
      expect(newValue2).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1800
     * @tc.desc   Test with ArkTSUtils.Atomics.add in a loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      const iterations = 1000;

      for (let i = 0; i < iterations; i++) {
        const oldValue = ArkTSUtils.Atomics.add(ta, 0, 1);
        expect(oldValue).assertEqual(i);
      }

      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(iterations);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_1900
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.load in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      const oldValue1 = ArkTSUtils.Atomics.add(ta, 0, 10);
      const value1 = ArkTSUtils.Atomics.load(ta, 0);

      const oldValue2 = ArkTSUtils.Atomics.add(ta, 0, 20);
      const value2 = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue1).assertEqual(0);
      expect(value1).assertEqual(10);
      expect(oldValue2).assertEqual(10);
      expect(value2).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2000
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.sub in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 10);
      const oldValue = ArkTSUtils.Atomics.sub(ta, 0, 5);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(10);
      expect(newValue).assertEqual(5);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2100
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.and in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 15); // Binary: 1111
      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 7); // Binary: 0111
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(15);
      expect(newValue).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2200
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.or in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 7); // Binary: 0111
      const oldValue = ArkTSUtils.Atomics.or(ta, 0, 8); // Binary: 1000
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(7);
      expect(newValue).assertEqual(15); // Binary: 1111
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2300
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.xor in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      ArkTSUtils.Atomics.add(ta, 0, 15); // Binary: 1111
      const oldValue = ArkTSUtils.Atomics.xor(ta, 0, 7); // Binary: 0111
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(15);
      expect(newValue).assertEqual(8); // Binary: 1000
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2400
     * @tc.desc   Test add with negative value and underflow on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 100;

      // Add a negative value
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, -50);
      const newValue = ArkTSUtils.Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(100);

      // Verify the new value is correct (100 + (-50) = 50)
      expect(newValue).assertEqual(50);

      // Add a negative value that causes underflow
      i32a[0] = -2147483648; // Minimum Int32 value
      const oldValue2 = ArkTSUtils.Atomics.add(i32a, 0, -1);
      const newValue2 = ArkTSUtils.Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue2).assertEqual(-2147483648);

      // Verify the new value wraps around to maximum Int32 value
      expect(newValue2).assertEqual(2147483647);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2500
     * @tc.desc   Test with ArkTSUtils.Atomics.add and ArkTSUtils.Atomics.isLockFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      // Check if Int32 is lock-free
      const isLockFree = ArkTSUtils.Atomics.isLockFree(collections.Int32Array.BYTES_PER_ELEMENT);

      // Perform add operation
      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 10);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(isLockFree).assertEqual(true); // Int32 should be lock-free on most platforms
      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(10);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2600
     * @tc.desc   Test with collections.Uint16Array and multiple additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Uint16Array(sab);

      const additions = [100, 200, 300];
      let expectedValue = 0;

      for (const value of additions) {
        const oldValue = ArkTSUtils.Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(600);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2700
     * @tc.desc   Test with collections.Uint8Array and multiple additions with overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);

      const additions = [200, 100];
      let expectedValue = 0;

      for (const value of additions) {
        const oldValue = ArkTSUtils.Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue = (expectedValue + value) % 256; // Uint8 wraps around
      }

      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(44); // (200 + 100) % 256 = 44
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2800
     * @tc.desc   Verify ArkTSUtils.Atomics.add correctly handles large positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 2147483647; // Maximum 32-bit integer value

      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 1);

      expect(oldValue).assertEqual(2147483647);
      expect(i32a[0]).assertEqual(-2147483648); // Overflow should wrap around
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_2900
     * @tc.desc   Verify ArkTSUtils.Atomics.add correctly handles large negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = -2147483648; // Minimum 32-bit integer value

      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, -1);

      expect(oldValue).assertEqual(-2147483648);
      expect(i32a[0]).assertEqual(2147483647); // Underflow should wrap around
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3000
     * @tc.desc   Verify main-thread Atomics.wait blocks the notify timer and times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Start waiting for the value to change
      const waitPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          const result = ArkTSUtils.Atomics.wait(i32a, 0, 0, 5000); // Wait up to 5 seconds
          resolve(result);
        }, 0);
      });

      // Simulate async add operation using setTimeout
      setTimeout(() => {
        ArkTSUtils.Atomics.add(i32a, 0, 10);
        ArkTSUtils.Atomics.notify(i32a, 0, 1);
      }, 100); // Perform add after 100ms

      const waitResult = await waitPromise;
      const finalValue = i32a[0];

      expect(waitResult).assertEqual('timed-out'); // Notify cannot run while main thread is blocked
      expect(finalValue).assertEqual(0); // Timer callback has not run yet
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3100
     * @tc.desc   Verify nested atomic operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;

      // Perform add on index 0, then use the old value to add to index 1
      const oldValue0 = ArkTSUtils.Atomics.add(i32a, 0, 5);
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 1, oldValue0);

      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3200
     * @tc.desc   Verify ArkTSUtils.Atomics.add works with Promise-based asynchronous operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Function that performs add operation and returns a promise
      const atomicAddPromise = (arr: collections.Int32Array, index: number, value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.add(arr, index, value);
            resolve(oldValue);
          }, 100);
        });
      };

      const oldValue = await atomicAddPromise(i32a, 0, 15);

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(15);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3300
     * @tc.desc   Verify multiple workers can safely perform atomic adds on the same location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAdd0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      const workerCount = 5;
      const addsPerWorker = 1000;

      // Simulate multiple workers using async functions
      const workerFunctions: Promise<void>[] = [];

      for (let i = 0; i < workerCount; i++) {
        const workerFunction = new Promise<void>((resolve) => {
          setTimeout(() => {
            for (let j = 0; j < addsPerWorker; j++) {
              ArkTSUtils.Atomics.add(i32a, 0, 1);
            }
            resolve();
          }, 0);
        });

        workerFunctions.push(workerFunction);
      }

      // Wait for all "workers" to finish
      await Promise.all(workerFunctions);

      // Calculate expected value
      const expectedValue = workerCount * addsPerWorker;

      expect(i32a[0]).assertEqual(expectedValue);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3400
     * @tc.desc   Verify multiple atomic add operations can be coordinated with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;
      i32a[2] = 30;

      // Function to perform atomic add and return a promise
      const atomicAdd = (index: number, value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.add(i32a, index, value);
            resolve(oldValue);
          }, Math.random() * 100);
        });
      };

      // Perform multiple atomic adds concurrently
      const results = await Promise.all([
        atomicAdd(0, 5),
        atomicAdd(1, 10),
        atomicAdd(2, 15)
      ]);

      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(20);
      expect(results[2]).assertEqual(30);

      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
      expect(i32a[2]).assertEqual(45);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3500
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.load for consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Perform add operation
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 5);

      // Load the new value
      const newValue = ArkTSUtils.Atomics.load(i32a, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(5);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3600
     * @tc.desc   Verify nested promises can safely perform atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Nested promise function
      const nestedAtomicAdd = async (): Promise<number> => {
        return new Promise(async (resolve) => {
          // First level promise
          await new Promise<void>((resolveInner) => setTimeout(resolveInner, 50));

          // Perform atomic add
          const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 10);

          // Second level promise
          await new Promise<void>((resolveInner) => setTimeout(resolveInner, 50));

          resolve(oldValue);
        });
      };

      const oldValue = await nestedAtomicAdd();

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(10);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3700
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.compareExchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;

      // First add 5
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 5);

      // Compare exchange if value is 15, set to 20
      const oldValue2 = ArkTSUtils.Atomics.compareExchange(i32a, 0, 15, 20);

      expect(oldValue1).assertEqual(10);
      expect(oldValue2).assertEqual(15);
      expect(i32a[0]).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3800
     * @tc.desc   Verify a chain of promises can perform sequential atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Function to create a promise that performs an atomic add
      const createAddPromise = (value: number) => {
        return () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.add(i32a, 0, value);
            resolve(oldValue);
          }, 10);
        });
      };

      // Create a chain of promises
      const result = await createAddPromise(5)()
        .then(createAddPromise(10))
        .then(createAddPromise(15));

      expect(result).assertEqual(15); // Should be the old value from the last add
      expect(i32a[0]).assertEqual(30); // 5 + 10 + 15 = 30
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_3900
     * @tc.desc   Verify ArkTSUtils.Atomics.add works with collections.ArrayBuffer of maximum size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Create a large collections.ArrayBuffer (2^24 bytes is the maximum for many browsers)
      const maxSize = 16777216; // 2^24 bytes
      const sab = new collections.ArrayBuffer(maxSize);
      const i32a = new collections.Int32Array(sab);

      // Test at the beginning
      i32a[0] = 100;
      let oldValue = ArkTSUtils.Atomics.add(i32a, 0, 50);
      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);

      // Test in the middle
      const middleIndex = (maxSize / 4) / 2;
      i32a[middleIndex] = 200;
      oldValue = ArkTSUtils.Atomics.add(i32a, middleIndex, 100);
      expect(oldValue).assertEqual(200);
      expect(i32a[middleIndex]).assertEqual(300);

      // Test at the end
      const endIndex = (maxSize / 4) - 1;
      i32a[endIndex] = 300;
      oldValue = ArkTSUtils.Atomics.add(i32a, endIndex, 150);
      expect(oldValue).assertEqual(300);
      expect(i32a[endIndex]).assertEqual(450);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4000
     * @tc.desc   Verify ArkTSUtils.Atomics.add handles adding zero correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 42;

      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 0);

      expect(oldValue).assertEqual(42);
      expect(i32a[0]).assertEqual(42); // Value should remain unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4100
     * @tc.desc   Verify atomic operations work with asynchronous iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      const valuesToAdd = [5, 10, 15, 20];
      const results: number[] = [];

      for await (const result of atomicAddGenerator(valuesToAdd, i32a)) {
        results.push(result);
      }

      expect(results).assertDeepEquals([0, 5, 15, 30]);
      expect(i32a[0]).assertEqual(50); // 5 + 10 + 15 + 20 = 50
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4200
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);

      // Store initial value
      ArkTSUtils.Atomics.store(i32a, 0, 100);

      // Perform add operation
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 50);

      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4300
     * @tc.desc   Verify Promise.race works correctly with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Create promises that perform atomic adds after different delays
      const promise1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 10);
          resolve(oldValue);
        }, 100);
      });

      const promise2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 20);
          resolve(oldValue);
        }, 50);
      });

      const promise3 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 30);
          resolve(oldValue);
        }, 150);
      });

      // Race the promises
      const winner = await Promise.race([promise1, promise2, promise3]);

      // The winner should be promise2 (shortest delay)
      expect(winner).assertEqual(0);

      // Allow some time for other promises to complete
      await new Promise<void>(resolve => setTimeout(resolve, 200));

      // Final value should be 10 + 20 + 30 = 60
      expect(i32a[0]).assertEqual(60);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4400
     * @tc.desc   Verify ArkTSUtils.Atomics.add works with different TypedArray views of the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);

      // Create different views of the same buffer
      const i32a = new collections.Int32Array(sab);
      const u16a = new collections.Uint16Array(sab);

      // Set initial value using collections.Int32Array
      i32a[0] = 0x12345678;

      // Perform add using collections.Int32Array
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 0x00000001);

      expect(oldValue).assertEqual(0x12345678);
      expect(i32a[0]).assertEqual(0x12345679);

      // Verify the bytes using collections.Uint16Array view
      expect(u16a[0]).assertEqual(0x5679); // Lower 16 bits
      expect(u16a[1]).assertEqual(0x1234); // Upper 16 bits
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4500
     * @tc.desc   Verify ArkTSUtils.Atomics.add works with large indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(1024 * 4); // 1024 integers
      const i32a = new collections.Int32Array(sab);

      // Set value at a large index
      const largeIndex = 1023;
      i32a[largeIndex] = 1000;

      const oldValue = ArkTSUtils.Atomics.add(i32a, largeIndex, 500);

      expect(oldValue).assertEqual(1000);
      expect(i32a[largeIndex]).assertEqual(1500);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4600
     * @tc.desc   Verify async/await can handle multiple atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;
      let arr:number[]=[]

      // Async function that performs atomic adds
      const performAdds = async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 50));

        const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 5);

        await new Promise<void>(resolve => setTimeout(resolve, 50));

        const oldValue2 = ArkTSUtils.Atomics.add(i32a, 1, 10);
        arr.push(oldValue1)
        arr.push(oldValue2)
        return arr;
      };

      const result = await performAdds();

      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4700
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;

      // First add 5
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 5);

      // Exchange the value
      const oldValue2 = ArkTSUtils.Atomics.exchange(i32a, 0, 100);

      expect(oldValue1).assertEqual(10);
      expect(oldValue2).assertEqual(15);
      expect(i32a[0]).assertEqual(100);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4800
     * @tc.desc   Verify atomic operations can be wrapped in promises with timeouts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Function that performs atomic add with timeout
      const atomicAddWithTimeout = (value: number, timeout: number): Promise<number> => {
        return Promise.race([
          new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldValue = ArkTSUtils.Atomics.add(i32a, 0, value);
              resolve(oldValue);
            }, timeout);
          }),
          new Promise<never>((_, reject) => {
            setTimeout(() => {
              reject(new Error('Operation timed out'));
            }, timeout * 2);
          })
        ]);
      };

      const oldValue = await atomicAddWithTimeout(10, 100);

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(10);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_4900
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0b1010; // 10 in decimal

      // First add 0b0101 (5)
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 0b0101);

      // Then perform AND with 0b1100 (12)
      const oldValue2 = ArkTSUtils.Atomics.and(i32a, 0, 0b1100);

      expect(oldValue1).assertEqual(0b1010); // 10
      expect(oldValue2).assertEqual(0b1111); // 15
      expect(i32a[0]).assertEqual(0b1100); // 12
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5000
     * @tc.desc   Verify nested function performs repeated atomic adds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Nested function that performs atomic add
      let nestedAdd = (value: number) => {
        return ArkTSUtils.Atomics.add(i32a, 0, value);
      }

      // Perform multiple nested adds
      for (let i = 0; i < 10; i++) {
        nestedAdd(i);
      }

      // Sum from 0 to 9 is 45
      expect(i32a[0]).assertEqual(45);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5100
     * @tc.desc   Verify ArkTSUtils.Atomics.add can be combined with ArkTSUtils.Atomics.or
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0b1010; // 10 in decimal

      // First add 0b0011 (3)
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 0, 0b0011);

      // Then perform OR with 0b1100 (12)
      const oldValue2 = ArkTSUtils.Atomics.or(i32a, 0, 0b1100);

      expect(oldValue1).assertEqual(0b1010); // 10
      expect(oldValue2).assertEqual(0b1101); // 13
      expect(i32a[0]).assertEqual(0b1101 | 0b1100); // 13 | 12 = 13
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAdd0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5200
     * @tc.desc   Verify Promise-based multiple atomic adds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 0;

      // Function that returns a promise performing performing atomic add
      let atomicAddPromise = (value: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.add(i32a, 0, value);
            resolve(oldValue);
          }, 50);
        });
      }

      // Perform multiple multiple atomic adds with promises
      await Promise.all([
        atomicAddPromise(10),
        atomicAddPromise(20),
        atomicAddPromise(30)
      ]);

      // Wait a bit to ensure all promises-based adds have completed
      await new Promise<void>(resolve => setTimeout(resolve, 100));

      // 10 + 20 + 30 = 60
      expect(i32a[0]).assertEqual(60);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5300
     * @tc.desc   Test ArkTSUtils.Atomics.add with multiple indices in the same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(8); // 2 elements of 4 bytes each
      const i32a = new collections.Int32Array(sab);

      // Initialize both elements
      i32a[0] = 10;
      i32a[1] = 20;

      // Add to first element
      const oldValue0 = ArkTSUtils.Atomics.add(i32a, 0, 5);

      // Add to second element
      const oldValue1 = ArkTSUtils.Atomics.add(i32a, 1, 10);

      // Verify old values
      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);

      // Verify new values
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5400
     * @tc.desc   Verify Promise.allSettled works with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const i32a = new collections.Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;

      // Create promises that perform atomic adds
      const promise1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 5);
          resolve(oldValue);
        }, 50);
      });

      // Create a promise that rejects
      const promise2 = new Promise<number>((_, reject) => {
        setTimeout(() => {
          reject(new Error('Intentional error'));
        }, 100);
      });

      const results = await Promise.allSettled([promise1, promise2]);

      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);

      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Intentional error');

      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(20); // Unchanged
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5500
     * @tc.desc   Test ArkTSUtils.Atomics.add with collections.Int32Array and zero value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAdd0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const i32a = new collections.Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 100;

      // Add zero
      const oldValue = ArkTSUtils.Atomics.add(i32a, 0, 0);
      const newValue = ArkTSUtils.Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(100);

      // Verify the value remains the same (100 + 0 = 100)
      expect(newValue).assertEqual(100);
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5600
     * @tc.desc   Test with collections.Int32Array and zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 1000);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(1000);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5700
     * @tc.desc   Test with collections.Uint32Array and zero addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ArkTSUtils.Atomics.store(ta, 0, 123456789);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 0);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(123456789);
      expect(newValue).assertEqual(123456789); // Adding zero should not change the value
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsAdd0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_ADD_5800
     * @tc.desc   Test with collections.Int16Array and zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAdd0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(2);
      const ta = new collections.Int16Array(sab);

      const oldValue = ArkTSUtils.Atomics.add(ta, 0, 32767); // Maximum value for Int16
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(32767);
      done();
    });
  })
}
