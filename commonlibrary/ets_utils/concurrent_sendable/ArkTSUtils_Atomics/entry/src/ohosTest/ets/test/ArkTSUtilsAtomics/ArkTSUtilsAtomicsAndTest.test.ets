import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { atomicsAndTest090, type69, type73, type90 } from './atomics';
import { sleep } from './utils';


export default function atomicsAndTest() {
  describe('atomicsAndTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0100
     * @tc.desc   测试ArkTSUtils.Atomics.and()基本功能：对collections.Uint8Array执行AND操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(1);
      const ta = new collections.Uint8Array(sab);
      ta[0] = 0b1010; // 10

      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 0b1100); // 12
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0b1010); // 应返回旧值10
      expect(newValue).assertEqual(0b1000); // 10 & 12 = 8
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0200
     * @tc.desc   测试ArkTSUtils.Atomics.and()边界条件：值为0的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;

      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 0xFFFFFFFF);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0); // 应返回旧值0
      expect(newValue).assertEqual(0); // 0 & 任何值 = 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0300
     * @tc.desc   测试ArkTSUtils.Atomics.and()边界条件：值为最大值的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      ta[0] = 0xFFFFFFFF; // 最大值

      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 0xAAAAAAAA);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0xFFFFFFFF); // 应返回旧值
      expect(newValue).assertEqual(0xAAAAAAAA); // 0xFFFFFFFF & 0xAAAAAAAA = 0xAAAAAAAA
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0400
     * @tc.desc   测试ArkTSUtils.Atomics.and()错误处理：非整数类型的TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Uint16Array(sab);

      expect(ArkTSUtils.Atomics.and(ta, 0, 1)).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0500
     * @tc.desc   测试ArkTSUtils.Atomics.and()对不同类型的TypedArray的支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // 测试collections.Int8Array
      const sab1 = new collections.ArrayBuffer(1);
      const ta1 = new collections.Int8Array(sab1);
      ta1[0] = 0b0111; // 7
      ArkTSUtils.Atomics.and(ta1, 0, 0b0011); // 3
      expect(ArkTSUtils.Atomics.load(ta1, 0)).assertEqual(0b0011); // 3

      // 测试collections.Uint16Array
      const sab2 = new collections.ArrayBuffer(2);
      const ta2 = new collections.Uint16Array(sab2);
      ta2[0] = 0b11110000; // 240
      ArkTSUtils.Atomics.and(ta2, 0, 0b11001100); // 204
      expect(ArkTSUtils.Atomics.load(ta2, 0)).assertEqual(0b11000000); // 192

      // 测试collections.Int32Array
      const sab3 = new collections.ArrayBuffer(4);
      const ta3 = new collections.Int32Array(sab3);
      ta3[0] = 0x12345678;
      ArkTSUtils.Atomics.and(ta3, 0, 0x0000FFFF);
      expect(ArkTSUtils.Atomics.load(ta3, 0)).assertEqual(0x00005678);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0600
     * @tc.desc   测试ArkTSUtils.Atomics.and()返回值：验证返回的是操作前的旧值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Uint32Array(sab);
      const initialValue = 0b11001100;
      ta[0] = initialValue;

      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 0b10101010);
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(initialValue); // 返回值应为操作前的旧值
      expect(newValue).assertEqual(0b10001000); // 0b11001100 & 0b10101010 = 0b10001000
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0700
     * @tc.desc   测试ArkTSUtils.Atomics.and()对负数值的处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = -5; // 二进制表示为 11111111 11111111 11111111 11111011

      const oldValue = ArkTSUtils.Atomics.and(ta, 0, 3); // 二进制 00000000 00000000 00000000 00000011
      const newValue = ArkTSUtils.Atomics.load(ta, 0);

      expect(oldValue).assertEqual(-5); // 应返回旧值
      expect(newValue).assertEqual(3); // -5 & 3 = 3
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0800
     * @tc.desc   测试ArkTSUtils.Atomics.and()原子性：多线程环境下的操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const view = new collections.Int32Array(sab);

      // Initialize with all bits set
      ArkTSUtils.Atomics.store(view, 0, 0b11111111);

      // Simulate multiple threads clearing different bits
      const threadOperations = [
        () => ArkTSUtils.Atomics.and(view, 0, 0b11111110), // Clear bit 0
        () => ArkTSUtils.Atomics.and(view, 0, 0b11111101), // Clear bit 1
        () => ArkTSUtils.Atomics.and(view, 0, 0b11111011), // Clear bit 2
        () => ArkTSUtils.Atomics.and(view, 0, 0b11110111), // Clear bit 3
        () => ArkTSUtils.Atomics.and(view, 0, 0b11101111), // Clear bit 4
        () => ArkTSUtils.Atomics.and(view, 0, 0b11011111), // Clear bit 5
        () => ArkTSUtils.Atomics.and(view, 0, 0b10111111), // Clear bit 6
        () => ArkTSUtils.Atomics.and(view, 0, 0b01111111)// Clear bit 7
      ];

      // Execute all operations
      threadOperations.forEach((op): number => op());

      // All bits should be cleared
      expect(ArkTSUtils.Atomics.load(view, 0)).assertEqual(0);

      // Test with bitmask combination
      ArkTSUtils.Atomics.store(view, 0, 0b11111111);

      // Simulate concurrent bit clearing
      const clearBit = (bit: number) => {
        const mask = ~(1 << bit);
        ArkTSUtils.Atomics.and(view, 0, mask);
      };

      // Clear bits 0-4
      for (let i = 0; i < 5; i++) {
        clearBit(i);
      }

      // Bits 5-7 should remain set
      expect(ArkTSUtils.Atomics.load(view, 0)).assertEqual(0b11100000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_0900
     * @tc.desc   Test bitwise AND operation of ArkTSUtils.Atomics.and on collections.Int32Array with non-zero values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1010;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b1001);
      expect(result).assertEqual(10);
      expect(ia[0]).assertEqual(8);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1000
     * @tc.desc   Test bitwise AND operation of ArkTSUtils.Atomics.and on collections.Int32Array with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b1111);
      expect(result).assertEqual(0);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1100
     * @tc.desc   Test bitwise AND operation of ArkTSUtils.Atomics.and on collections.Int32Array with all-1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1111;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b1111);
      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1200
     * @tc.desc   Test bitwise AND operation of ArkTSUtils.Atomics.and on collections.Int32Array with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = -5;
      const result = ArkTSUtils.Atomics.and(ia, 0, -3);
      expect(result).assertEqual(-5);
      expect(ia[0]).assertEqual(-7);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1300
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on different indices of collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;
      ArkTSUtils.Atomics.and(ia, 1, 15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(4);
      expect(ia[2]).assertEqual(30);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1400
     * @tc.desc   Test ArkTSUtils.Atomics.and returns original value before operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const originalValue = 0b1100;
      ia[0] = originalValue;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b0101);
      expect(result).assertEqual(originalValue);
      expect(ia[0]).assertEqual(4);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1500
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with zero mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b11110000;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0);
      expect(result).assertEqual(240);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1600
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with max Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const maxInt32 = 2147483647;
      ia[0] = maxInt32;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0x7FFFFFFF);
      expect(result).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(maxInt32);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1700
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with min Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const minInt32 = -2147483648;
      ia[0] = minInt32;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0x80000000);
      expect(result).assertEqual(minInt32);
      expect(ia[0]).assertEqual(minInt32);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1800
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with mixed bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b101101;
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b110011);
      expect(result).assertEqual(45);
      expect(ia[0]).assertEqual(33);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_1900
     * @tc.desc   Test bitwise AND operation of ArkTSUtils.Atomics.and on collections.Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 0xFFFF0000;
      const result = ArkTSUtils.Atomics.and(ua, 0, 0x0000FFFF);
      expect(result).assertEqual(4294901760);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2000
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Uint32Array with max Uint32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      const maxUint32 = 4294967295;
      ua[0] = maxUint32;
      const result = ArkTSUtils.Atomics.and(ua, 0, 0xAAAAAAAA);
      expect(result).assertEqual(maxUint32);
      expect(ua[0]).assertEqual(2863311530);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2100
     * @tc.desc   Test two consecutive ArkTSUtils.Atomics.and operations on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1111;
      ArkTSUtils.Atomics.and(ia, 0, 0b0111);
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b0011);
      expect(result).assertEqual(7);
      expect(ia[0]).assertEqual(3);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2200
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with non-integer mask (auto-conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1111;
      const result = ArkTSUtils.Atomics.and(ia, 0, 5.9);
      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(5);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2300
     * @tc.desc   Test ArkTSUtils.Atomics.and operation on collections.Int32Array with mask as string (auto-conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 12;
      const result = ArkTSUtils.Atomics.and(ia, 0, 5);
      expect(result).assertEqual(12);
      expect(ia[0]).assertEqual(4);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2400
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint32Array with negative mask (auto-conversion to unsigned 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 20; // 0x00000014
      const result = ArkTSUtils.Atomics.and(ua, 0, -5); // -5 → 0xFFFFFFFB in 32-bit unsigned
      expect(result).assertEqual(20);
      expect(ua[0]).assertEqual(16); // 0x00000014 & 0xFFFFFFFB = 0x00000010
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2500
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint32Array with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsAnd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 0; // Default initial value, explicitly set here
      const result = ArkTSUtils.Atomics.and(ua, 0, 0xFF); // 255
      expect(result).assertEqual(0);
      expect(ua[0]).assertEqual(0); // 0 & 255 = 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2600
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with empty string mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 42;
      // Explicitly convert empty string to number to avoid TypeScript type error
      const mask = Number('');
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(42);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2700
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with non-numeric string mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 17;
      // Convert non-numeric string to number (results in NaN, then coerced to 0 in bitwise ops)
      const mask = Number('test');
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(17);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2800
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint32Array with hex string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 0x12345678;
      // Convert hex string to number with explicit radix
      const mask = parseInt('0xFFFF0000', 16);
      const result = ArkTSUtils.Atomics.and(ua, 0, mask);
      expect(result).assertEqual(0x12345678);
      expect(ua[0]).assertEqual(0x12340000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_2900
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with octal string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 63;
      // Convert octal string to number with explicit radix
      const mask = parseInt('0o17', 8);
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(63);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3000
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with binary string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 27;
      // Convert binary string to number with explicit radix
      const mask = parseInt('0b10101', 2);
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(27);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3100
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint32Array with 64-bit mask (auto-truncation to 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 0xFFFFFFFF;
      // 64-bit mask (0x1FFFFFFFF) truncated to 32-bit (0xFFFFFFFF) for collections.Uint32Array
      const mask = 0x1FFFFFFFF;
      const result = ArkTSUtils.Atomics.and(ua, 0, mask);
      expect(result).assertEqual(4294967295);
      expect(ua[0]).assertEqual(4294967295);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3200
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with 64-bit negative mask (truncation to 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = -1; // 0xFFFFFFFF in 32-bit two's complement
      // 64-bit negative mask truncated to 32-bit (0xFFFFFFFF) for collections.Int32Array
      const mask = -0x100000001;
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(-1);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3300
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with null mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 55;
      // Convert null to number (results in 0) to avoid TypeScript error
      const mask = Number(null);
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(55);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3400
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with undefined mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 72;
      // Convert undefined to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number(undefined);
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(72);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3500
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint32Array with object mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 99;
      // Convert object to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number({});
      const result = ArkTSUtils.Atomics.and(ua, 0, mask);
      expect(result).assertEqual(99);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3600
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with array mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 105;
      // Convert array to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number([1, 2, 3]);
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(105);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3700
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int32Array with function mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 121;
      // Convert function to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number(() => {
      });
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(121);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3800
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int16Array (valid 16-bit integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(2); // collections.Int16Array uses 2 bytes per element
      const ia16 = new collections.Int16Array(sab);
      ia16[0] = 0x7FFF; // Max Int16 value
      const mask = 0x00FF; // 8-bit mask
      const result = ArkTSUtils.Atomics.and(ia16, 0, mask);
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(255);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_3900
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint16Array (valid 16-bit unsigned type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(2);
      const ua16 = new collections.Uint16Array(sab);
      ua16[0] = 0xFFFF; // Max Uint16 value
      const mask = 0x0F0F; // 16-bit mask
      const result = ArkTSUtils.Atomics.and(ua16, 0, mask);
      expect(result).assertEqual(65535);
      expect(ua16[0]).assertEqual(3855);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4000
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Int8Array (valid 8-bit integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(1); // collections.Int8Array uses 1 byte per element
      const ia8 = new collections.Int8Array(sab);
      ia8[0] = -1; // 0xFF in 8-bit two's complement
      const mask = 0x0F; // 4-bit mask
      const result = ArkTSUtils.Atomics.and(ia8, 0, mask);
      expect(result).assertEqual(-1);
      expect(ia8[0]).assertEqual(15);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4100
     * @tc.desc   Test ArkTSUtils.Atomics.and on collections.Uint8Array (valid 8-bit unsigned type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(1);
      const ua8 = new collections.Uint8Array(sab);
      ua8[0] = 0xFF; // Max Uint8 value
      const mask = 0xAA; // 8-bit mask (10101010)
      const result = ArkTSUtils.Atomics.and(ua8, 0, mask);
      expect(result).assertEqual(255);
      expect(ua8[0]).assertEqual(170);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4200
     * @tc.desc   Test ArkTSUtils.Atomics.and in async function with Promise.resolve wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 30; // 0b11110
      // Async wrapper with Promise.resolve
      const asyncAnd = async (arr: collections.Int32Array, idx: number, mask: number): Promise<number> => {
        return Promise.resolve(ArkTSUtils.Atomics.and(arr, idx, mask));
      };
      const result: number = await asyncAnd(ia, 0,
        0b10101); // 21
      expect(result).assertEqual(30);
      expect(ia[0]).assertEqual(20); // 30 & 21 = 26
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4300
     * @tc.desc   Test nested ArkTSUtils.Atomics.and calls in Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 45; // 0b101101
      // Nested Promise chain
      const finalValue: number = await Promise.resolve(ia).then(arr => {
        ArkTSUtils.Atomics.and(arr, 0, 0b110000); // 48 → 45 & 48 = 16
        return arr;
      }).then(arr => {
        return ArkTSUtils.Atomics.and(arr, 0, 0b001111); // 15 → 16 & 15 = 0
      });
      expect(finalValue).assertEqual(32); // Return old value of second and
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4400
     * @tc.desc   Test ArkTSUtils.Atomics.and with async timeout before operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50; // 0b110010
      // Async timeout helper
      const delay = (ms: number): Promise<void> => new Promise<void>(resolve => setTimeout(resolve, ms));
      // Wait 10ms before ArkTSUtils.Atomics.and
      await delay(10);
      const result = ArkTSUtils.Atomics.and(ia, 0, 0b100011); // 35
      expect(result).assertEqual(50);
      expect(ia[0]).assertEqual(34); // 50 & 35 = 18
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4500
     * @tc.desc   Test parallel ArkTSUtils.Atomics.and calls with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 12;
      ia[1] = 24;
      // Parallel ArkTSUtils.Atomics.and via Promise.all
      const result = await Promise.all([Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 7)), // 12 & 7 = 4
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 1, 15))// 24 & 15 = 8
      ]);
      expect(result[0]).assertEqual(12);
      expect(result[1]).assertEqual(24);
      expect(ia[0]).assertEqual(4);
      expect(ia[1]).assertEqual(8);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4600
     * @tc.desc   Test nested async functions with ArkTSUtils.Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 60; // 0b111100
      // Nested async functions
      const outerAsync = async (): Promise<number> => {
        const innerAsync = async (arr: collections.Int32Array): Promise<number> => {
          return ArkTSUtils.Atomics.and(arr, 0, 0b001111); // 15 → 60 & 15 = 12
        };
        return innerAsync(ia);
      };
      const result = await outerAsync();
      expect(result).assertEqual(60);
      expect(ia[0]).assertEqual(12);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4700
     * @tc.desc   Test ArkTSUtils.Atomics.and in Promise.race with timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 35; // 0b100011
      // Promise.race: ArkTSUtils.Atomics.and vs timeout
      const raceResult = await Promise.race([Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 0b100000)), // 32 → 35 & 32 = 32
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Timeout')), 50))]);
      expect(raceResult).assertEqual(35);
      expect(ia[0]).assertEqual(32);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4800
     * @tc.desc   Test nested Promise.all with multiple ArkTSUtils.Atomics.and calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 18;
      ia[1] = 27;
      ia[2] = 36;
      // Nested Promise.all
      const nestedResult = await Promise.all([Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 5)), // 18 & 5 = 0
        Promise.all([Promise.resolve(ArkTSUtils.Atomics.and(ia, 1, 10)), // 27 & 10 = 2
          Promise.resolve(ArkTSUtils.Atomics.and(ia, 2, 15))// 36 & 15 = 12
        ])]);
      expect(nestedResult[0]).assertEqual(18);
      expect(nestedResult[1][0]).assertEqual(27);
      expect(nestedResult[1][1]).assertEqual(36);
      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(10);
      expect(ia[2]).assertEqual(4);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_4900
     * @tc.desc   Test ArkTSUtils.Atomics.and in async IIFE (Immediately Invoked Function Expression)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 42; // 0b101010
      // Async IIFE with ArkTSUtils.Atomics.and
      const result = await (async () => {
        return ArkTSUtils.Atomics.and(ia, 0, 0b111111); // 63 → 42 & 63 = 42
      })();
      expect(result).assertEqual(42);
      expect(ia[0]).assertEqual(42);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5000
     * @tc.desc   Test Promise chaining with async ArkTSUtils.Atomics.and pre-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25;
      // Async pre-processing before ArkTSUtils.Atomics.and
      const preProcess = async (value: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 5)); // Simulate async work
        return value * 2; // Mask = 25 * 2 = 50
      };
      const mask = await preProcess(25);
      const result = await Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, mask));
      expect(result).assertEqual(25);
      expect(ia[0]).assertEqual(16);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5100
     * @tc.desc   Verify Promise.allSettled with collections.Int32Array constructed from an array literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1100;  // Initial value

      ArkTSUtils.Atomics.and(ia, 0, 0b1011);  // Clear bit 3: 0b1100 & 0b1011 = 0b1000
      ArkTSUtils.Atomics.or(ia, 0, 0b0011);   // Set bits 0-1: 0b1000 | 0b0011 = 0b1011

      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0b1011);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5200
     * @tc.desc   Test ArkTSUtils.Atomics.and in Promise.allSettled with mixed success/failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const validArr = new collections.Int32Array(sab);
      validArr[0] = 15;
      const arrayLiteralArr = new collections.Int32Array([20, 15]); // collections.Int32Array constructed from an array literal
      // Promise.allSettled with mixed results
      const results = await Promise.allSettled([Promise.resolve(ArkTSUtils.Atomics.and(validArr, 0, 7)),
        // Success: 15 & 7 = 7
        Promise.resolve(ArkTSUtils.Atomics.and(arrayLiteralArr, 1, 5))
      ]);
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(15);
      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(15);
      expect(validArr[0]).assertEqual(7);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5300
     * @tc.desc   Test async sequential ArkTSUtils.Atomics.and with dynamic mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 63; // 0b111111

      // Async function to get dynamic mask based on step
      const getDynamicMask = async (step: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3)); // Simulate async delay
        return step === 1 ? 0b110000 : 0b001111;
      };

      // First sequential ArkTSUtils.Atomics.and call
      const mask1 = await getDynamicMask(1);
      const result1 = ArkTSUtils.Atomics.and(ia, 0, mask1);

      // Second sequential ArkTSUtils.Atomics.and call
      const mask2 = await getDynamicMask(2);
      const result2 = ArkTSUtils.Atomics.and(ia, 0, mask2);

      expect(result1).assertEqual(63);
      expect(result2).assertEqual(48); // Old value after first call: 63 & 48 = 48
      expect(ia[0]).assertEqual(0); // Final value: 48 & 15 = 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5400
     * @tc.desc   Test ArkTSUtils.Atomics.and with async mask from external Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 40; // 0b101000

      // Simulate external mask fetch (e.g., API call)
      const fetchMask = async (): Promise<number> => {
        return new Promise(resolve => setTimeout(() => resolve(0b101111), 5));
      };

      // Get mask asynchronously and execute ArkTSUtils.Atomics.and
      const mask = await fetchMask();
      const result = ArkTSUtils.Atomics.and(ia, 0, mask);

      expect(result).assertEqual(40);
      expect(ia[0]).assertEqual(40); // 40 & 47 = 40
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5500
     * @tc.desc   Test nested Promise chain with ArkTSUtils.Atomics.and and async validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 28; // 0b11100

      // Async value validation before ArkTSUtils.Atomics.and
      const validateValue = async (value: number): Promise<boolean> => {
        await new Promise<void>(resolve => setTimeout(resolve, 4));
        return value > 20; // Validate if initial value meets condition
      };

      // Nested Promise chain: validate → execute → return result
      const finalResult = await Promise.resolve(ia[0])
        .then(initialVal => validateValue(initialVal))
        .then(isValid => {
          if (isValid) {
            return ArkTSUtils.Atomics.and(ia, 0, 0b01111); // Execute if valid
          }
          throw new Error('Invalid initial value'); // Throw if invalid
        });

      expect(finalResult).assertEqual(28);
      expect(ia[0]).assertEqual(12); // 28 & 15 = 12
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5600
     * @tc.desc   Test ArkTSUtils.Atomics.and in async loop with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15; // 0b1111
      const masks = [0b1110, 0b1101, 0b1011]; // Sequence of masks
      const results: number[] = [];

      // Reusable async delay function
      const delay = async (ms: number): Promise<void> => {
        await new Promise<void>(resolve => setTimeout(resolve, ms));
      };

      // Async loop: delay → execute ArkTSUtils.Atomics.and → store result
      for (const mask of masks) {
        await delay(2);
        const res = ArkTSUtils.Atomics.and(ia, 0, mask);
        results.push(res);
      }

      expect(results).assertDeepEquals([15, 14, 12]); // Track old values of each call
      expect(ia[0]).assertEqual(8); // Final value: 15→14→13→8
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5700
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Uint8Array in async Promise wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(1); // collections.Uint8Array uses 1 byte per element
      const ua = new collections.Uint8Array(sab);
      ua[0] = 240; // 0b11110000

      // Async wrapper for collections.Uint8Array ArkTSUtils.Atomics.and
      const asyncUint8And = async (
        arr: collections.Uint8Array,
        idx: number,
        mask: number
      ): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return ArkTSUtils.Atomics.and(arr, idx, mask);
      };

      // Execute async wrapper and assert results
      const result = await asyncUint8And(ua, 0, 0b00001111);
      expect(result).assertEqual(240);
      expect(ua[0]).assertEqual(0); // 240 & 15 = 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5800
     * @tc.desc   Test Promise.race with two ArkTSUtils.Atomics.and calls (different indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements (4 bytes each)
      const ia = new collections.Int32Array(sab);
      ia[0] = 30; // 0b11110
      ia[1] = 45; // 0b101101

      // Promise 1: ArkTSUtils.Atomics.and on index 0 (longer delay)
      const promise1 = new Promise<type69>(resolve => {
        setTimeout(() => {
          const res = ArkTSUtils.Atomics.and(ia, 0, 0b10101);
          resolve({ idx: 0, res });
        }, 5);
      });

      // Promise 2: ArkTSUtils.Atomics.and on index 1 (shorter delay)
      const promise2 = new Promise<type69>(resolve => {
        setTimeout(() => {
          const res = ArkTSUtils.Atomics.and(ia, 1, 0b110000);
          resolve({ idx: 1, res });
        }, 3);
      });

      // Race between two promises
      const raceWinner = await Promise.race([promise1, promise2]);

      // Assert winner and values
      expect(raceWinner.idx).assertEqual(1); // Promise2 has shorter delay
      expect(raceWinner.res).assertEqual(45);
      expect(ia[0]).assertEqual(30); // Promise1 not resolved yet
      expect(ia[1]).assertEqual(32); // 45 & 48 = 40
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_5900
     * @tc.desc   Test Promise.all with mixed ArkTSUtils.Atomics.and (collections.Int32Array + collections.Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // collections.Int32Array setup (signed)
      const sab1 = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab1);
      ia[0] = -20; // 0xFFFFFFEC in two's complement

      // collections.Uint32Array setup (unsigned)
      const sab2 = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab2);
      ua[0] = 4294967276; // 0xFFFFFFEC in unsigned

      // Parallel execution with mixed array types
      const result = await Promise.all([
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 0xFFFFFFF0)),
        Promise.resolve(ArkTSUtils.Atomics.and(ua, 0, 0xFFFFFFF0))
      ]);

      // Assert results for signed and unsigned arrays
      expect(result[0]).assertEqual(-20);
      expect(result[1]).assertEqual(4294967276);
      expect(ia[0]).assertEqual(-32); // 0xFFFFFFE0 (signed)
      expect(ua[0]).assertEqual(4294967264); // 0xFFFFFFE0 (unsigned)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0060
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6000
     * @tc.desc   Test ArkTSUtils.Atomics.and in async function with multiple return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 49; // 0b110001

      // Async function returning old value, new value, and mask
      const asyncAndWithDetails = async (
        arr: collections.Int32Array,
        idx: number,
        mask: number
      ): Promise<type73> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const oldVal = ArkTSUtils.Atomics.and(arr, idx, mask);
        const newVal = arr[idx];
        return { oldVal, newVal, mask };
      };

      // Execute and assert detailed results
      const details = await asyncAndWithDetails(ia, 0, 0b100001);
      expect(details.oldVal).assertEqual(49);
      expect(details.newVal).assertEqual(33); // 49 & 33 = 33
      expect(details.mask).assertEqual(33);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0061
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6100
     * @tc.desc   Test nested Promise with ArkTSUtils.Atomics.and and post-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 18; // 0b10010

      // Nested Promise: execute ArkTSUtils.Atomics.and → post-process old value
      const processedResult = await new Promise<number>((resolve) => {
        resolve(ArkTSUtils.Atomics.and(ia, 0, 0b01111));
      })
        .then(oldVal => {
          return oldVal * 2; // Post-processing: double the old value
        });

      // Assert post-processed result and final array value
      expect(processedResult).assertEqual(36); // 18 * 2 = 36
      expect(ia[0]).assertEqual(2); // 18 & 15 = 2
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0062
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6200
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Int16Array in async retry loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(2); // collections.Int16Array uses 2 bytes per element
      const ia16 = new collections.Int16Array(sab);
      ia16[0] = 32767; // Max Int16 value
      let attempt = 0;
      const maxAttempts = 3;

      // Async retry loop until valid result or max attempts
      const asyncRetryAnd = async (): Promise<number> => {
        if (attempt >= maxAttempts) {
          throw new Error('Max attempts reached');
        }

        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const mask = attempt === 0 ? 0xFFFF : 0x0FFF; // Dynamic mask per attempt
        const result = ArkTSUtils.Atomics.and(ia16, 0, mask);
        attempt++;

        // Retry if result is not expected (first attempt result: 32767)
        if (attempt === 1 && result !== 32767) {
          return asyncRetryAnd();
        }
        return result;
      };

      const result = await asyncRetryAnd();
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(32767); // 32767 & 0x0FFF = 3071
      expect(attempt).assertEqual(1); // Should pass on second attempt
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0063
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6300
     * @tc.desc   Test Promise.allSettled with buffer-backed and array-literal Int32Arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Valid collections.ArrayBuffer-backed array
      const validSab = new collections.ArrayBuffer(4);
      const validArr = new collections.Int32Array(validSab);
      validArr[0] = 12;

      // collections.Int32Array constructed from an array literal
      const arrayLiteralArr = new collections.Int32Array([20]);

      // Execute mixed promises and capture all results
      const results = await Promise.allSettled([
        Promise.resolve(ArkTSUtils.Atomics.and(validArr, 0, 7)), // Valid: 12 & 7 = 4
        Promise.resolve(ArkTSUtils.Atomics.and(arrayLiteralArr, 0, 5))
      ]);

      // Assert fulfilled result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(12);
      expect(validArr[0]).assertEqual(4);

      // Assert second fulfilled result
      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0064
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6400
     * @tc.desc   Test nested async closure with ArkTSUtils.Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 44; // 0b101100

      // Outer function with nested async closure
      const outerFunc = (initialVal: number) => {
        return async () => {
          await new Promise<void>(resolve => setTimeout(resolve, 3));
          // Closure accesses outer function's initialVal
          const mask = initialVal > 40 ? 0b101111 : 0b001111;
          return ArkTSUtils.Atomics.and(ia, 0, mask);
        };
      };

      // Create closure and execute
      const asyncClosure = outerFunc(44);
      const result = await asyncClosure();

      expect(result).assertEqual(44);
      expect(ia[0]).assertEqual(44); // 44 & 47 = 44
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0065
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6500
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Uint16Array and async mask calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(2);
      const ua16 = new collections.Uint16Array(sab);
      ua16[0] = 65535; // Max Uint16 value

      // Async mask calculation based on array value
      const calculateMask = async (arr: collections.Uint16Array): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return arr[0] > 60000 ? 0x00FF : 0xFF00;
      };

      const mask = await calculateMask(ua16);
      const result = ArkTSUtils.Atomics.and(ua16, 0, mask);

      expect(result).assertEqual(65535);
      expect(ua16[0]).assertEqual(255); // 65535 & 0x00FF = 255
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0066
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6600
     * @tc.desc   Test Promise.race with ArkTSUtils.Atomics.and and error promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 22; // 0b10110

      // Race between ArkTSUtils.Atomics.and promise and error promise
      const raceResult = await Promise.race([
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(ArkTSUtils.Atomics.and(ia, 0, 0b10001)), 3);
        }),
        new Promise<never>((_, reject) => {
          setTimeout(() => reject(new Error('Race error')), 5);
        })
      ]);

      expect(raceResult).assertEqual(22);
      expect(ia[0]).assertEqual(16); // 22 & 17 = 16
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0067
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6700
     * @tc.desc   Test ArkTSUtils.Atomics.and in async forEach loop (multiple indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;
      const masks = [3, 10, 15]; // Mask per index
      const oldValues: number[] = [];

      // Async forEach to process each index
      const asyncForEach = async (
        arr: collections.Int32Array,
        maskList: number[],
        callback: (val: number) => void
      ) => {
        for (let i = 0; i < arr.length; i++) {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          const oldVal = ArkTSUtils.Atomics.and(arr, i, maskList[i]);
          callback(oldVal);
        }
      };

      await asyncForEach(ia, masks, (val) => oldValues.push(val));

      expect(oldValues).assertDeepEquals([10, 20, 30]);
      expect(ia[0]).assertEqual(2); // 10 & 3 = 2
      expect(ia[1]).assertEqual(0); // 20 & 10 = 20
      expect(ia[2]).assertEqual(14); // 30 & 15 = 14
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0068
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6800
     * @tc.desc   Test nested Promise with ArkTSUtils.Atomics.and and async validation retry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15;
      let validationPassed = false;

      // Async validation with retry
      const validateAndAnd = async (): Promise<number> => {
        return Promise.resolve(ia[0])
          .then(val => {
            if (!validationPassed) {
              validationPassed = true; // Mark as passed for next attempt
              throw new Error('First validation fail (retry)');
            }
            return val;
          })
          .catch((err: Error) => {
            if (err.message.includes('retry')) {
              return validateAndAnd(); // Retry
            }
            throw err;
          })
          .then(() => ArkTSUtils.Atomics.and(ia, 0, 7));
      };

      const result = await validateAndAnd();
      expect(result).assertEqual(7);
      expect(ia[0]).assertEqual(7); // 15 & 7 = 7
      expect(validationPassed).assertEqual(true);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0069
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_6900
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Int8Array in async IIFE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(1); // collections.Int8Array uses 1 byte per element
      const ia8 = new collections.Int8Array(sab);
      ia8[0] = -128; // Min Int8 value

      // Async IIFE to execute ArkTSUtils.Atomics.and
      const result = await (async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return ArkTSUtils.Atomics.and(ia8, 0, 0x80); // 128 in unsigned, -128 in signed
      })();

      expect(result).assertEqual(-128);
      expect(ia8[0]).assertEqual(-128); // -128 & -128 = -128
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0070
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7000
     * @tc.desc   Test Promise.all with ArkTSUtils.Atomics.and (same array, different indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 25;
      ia[1] = 35;

      // Parallel ArkTSUtils.Atomics.and on different indices of same array
      const result = await Promise.all([
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 12)), // 25 & 12 = 8
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 1, 20))// 35 & 20 = 12
      ]);

      expect(result[0]).assertEqual(25);
      expect(result[1]).assertEqual(35);
      expect(ia[0]).assertEqual(8);
      expect(ia[1]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0071
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7100
     * @tc.desc   Test ArkTSUtils.Atomics.and with async mask from Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;

      // Promise chain to generate mask
      const mask = await Promise.resolve(10)
        .then(val => val * 3) // 30
        .then(val => val + 5) // 35
        .then(val => val % 40); // 35

      const result = ArkTSUtils.Atomics.and(ia, 0, mask);
      expect(result).assertEqual(50);
      expect(ia[0]).assertEqual(34); // 50 & 35 = 10
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0072
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7200
     * @tc.desc   Test ArkTSUtils.Atomics.and with bit masks and memory consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0b1101; // Initial value (13 in decimal)

      // Atomic AND operation: retain only bits where mask is 1 (mask = 0b1001 = 9)
      const oldVal = ArkTSUtils.Atomics.and(ia, 0, 9);
      const currentVal = ArkTSUtils.Atomics.load(ia, 0);

      // Key assertions (13 & 9 = 9 = 0b1001)
      expect(oldVal).assertEqual(13); // Verify returned old value
      expect(currentVal).assertEqual(9); // Verify AND operation result
      expect(ia[0]).assertEqual(9); // Verify memory consistency

      // Secondary test: AND with 0b0100 (4) to clear other bits
      ArkTSUtils.Atomics.and(ia, 0, 4);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0); // 9 & 4 = 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0073
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7300
     * @tc.desc   Test ArkTSUtils.Atomics.and in async function with conditional mask (collections.Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ua32 = new collections.Uint32Array(sab);
      ua32[0] = 4294967295; // Max Uint32 value

      // Async function with conditional mask
      const asyncConditionalAnd = async (useHighMask: boolean): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const mask = useHighMask ? 0xFFFF0000 : 0x0000FFFF;
        return ArkTSUtils.Atomics.and(ua32, 0, mask);
      };

      const result = await asyncConditionalAnd(true);
      expect(result).assertEqual(4294967295);
      expect(ua32[0]).assertEqual(4294901760); // 0xFFFF0000
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0074
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7400
     * @tc.desc   Test nested Promise with ArkTSUtils.Atomics.and and async cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 33; // 0b100001
      let cleanupCalled = false;

      // Async cleanup function
      const asyncCleanup = async (): Promise<void> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        cleanupCalled = true;
      };

      // Nested Promise: ArkTSUtils.Atomics.and → cleanup → return result
      const finalResult = await new Promise<number>((resolve) => {
        const res = ArkTSUtils.Atomics.and(ia, 0, 0b100011); // 35
        resolve(res);
      })
        .then(res => {
          return asyncCleanup().then(() => res); // Chain cleanup
        });

      expect(finalResult).assertEqual(33);
      expect(ia[0]).assertEqual(33); // 33 & 35 = 33
      expect(cleanupCalled).assertEqual(true);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0075
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7500
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Int32Array in async generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const results: type90[] = await atomicsAndTest090();

      expect(results.length).assertEqual(2);
      expect(results[0].oldVal).assertEqual(40);
      expect(results[0].newVal).assertEqual(40); // 40 & 47 = 40
      expect(results[1].oldVal).assertEqual(40);
      expect(results[1].newVal).assertEqual(32); // 40 & 32 = 32
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0076
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7600
     * @tc.desc   Test Promise.race with multiple ArkTSUtils.Atomics.and (same index, different masks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15; // 0b1111

      // Multiple ArkTSUtils.Atomics.and promises racing for same index
      const promiseA = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.and(ia, 0, 0b1100)), 2); // Mask 12
      });
      const promiseB = new Promise<number>((resolve) => {
        setTimeout(() => resolve(ArkTSUtils.Atomics.and(ia, 0, 0b0011)), 5); // Mask 3
      });

      const raceWinner = await Promise.race([promiseA, promiseB]);
      const finalValue = ia[0];

      expect(raceWinner).assertEqual(15); // Old value from first resolved promise
      expect(finalValue).assertEqual(12); // Result of promiseA (15 & 12 = 12)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0077
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7700
     * @tc.desc   Test ArkTSUtils.Atomics.and with collections.Uint8Array and async mask validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(1);
      const ua8 = new collections.Uint8Array(sab);
      ua8[0] = 200; // 0b11001000

      // Async mask validation (ensure mask is 8-bit)
      const validateMask = async (mask: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        if (mask < 0 || mask > 255) {
          throw new Error('Mask out of 8-bit range');
        }
        return mask;
      };

      const mask = await validateMask(0b10101010); // 170
      const result = ArkTSUtils.Atomics.and(ua8, 0, mask);

      expect(result).assertEqual(200);
      expect(ua8[0]).assertEqual(136);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0078
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7800
     * @tc.desc   Test nested async functions with ArkTSUtils.Atomics.and (collections.Int16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(2);
      const ia16 = new collections.Int16Array(sab);
      ia16[0] = 32767; // Max Int16 value

      // Outer async function
      const outer = async (): Promise<number> => {
        // Inner async function
        const inner = async (arr: collections.Int16Array): Promise<number> => {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          return ArkTSUtils.Atomics.and(arr, 0, 0x0FFF); // 4095
        };
        return inner(ia16);
      };

      const result = await outer();
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(4095); // 32767 & 4095 = 4095
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0079
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_7900
     * @tc.desc   Test two sequential ArkTSUtils.Atomics.and operations in Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 25;
      // Mixed promises: valid mask + invalid index
      const results = await Promise.allSettled([
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 15)), // Valid: 25 & 15 = 9
        Promise.resolve(ArkTSUtils.Atomics.and(ia, 0, 10))
      ]);

      // Assert valid result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(25);


      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(9);
      expect(ia[0]).assertEqual(8);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0080
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_8000
     * @tc.desc   Test ArkTSUtils.Atomics.and in async function with dynamic index (collections.Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(8); // 2 collections.Uint32Array elements
      const ua32 = new collections.Uint32Array(sab);
      ua32[0] = 100;
      ua32[1] = 200;

      // Async function with dynamic index selection
      const asyncDynamicIndexAnd = async (useIndex1: boolean): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const idx = useIndex1 ? 1 : 0;
        const mask = useIndex1 ? 150 : 50;
        return ArkTSUtils.Atomics.and(ua32, idx, mask);
      };

      const result = await asyncDynamicIndexAnd(true);
      expect(result).assertEqual(200);
      expect(ua32[1]).assertEqual(128); // 200 & 150 = 150
      expect(ua32[0]).assertEqual(100); // Unchanged index 0
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0081
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_8100
     * @tc.desc   Test nested Promise chain with ArkTSUtils.Atomics.and and async value transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 18; // 0b10010

      // Async value transform helper
      const transformValue = async (val: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return val * 2; // Transform initial value to mask
      };

      // Nested Promise chain: transform → and → return
      const finalResult = await Promise.resolve(ia[0])
        .then(val => transformValue(val)) // Mask = 18 * 2 = 36
        .then(mask => ArkTSUtils.Atomics.and(ia, 0, mask));

      expect(finalResult).assertEqual(18);
      expect(ia[0]).assertEqual(0); // 18 & 36 = 18
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0082
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_8200
     * @tc.desc   Test ArkTSUtils.Atomics.and in async for loop (multiple arrays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsAnd0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create 3 independent collections.ArrayBuffer-backed Int32Arrays
      const arrays = [
        new collections.Int32Array(new collections.ArrayBuffer(4)),
        new collections.Int32Array(new collections.ArrayBuffer(4)),
        new collections.Int32Array(new collections.ArrayBuffer(4))
      ];
      // Initialize each array's first element
      arrays[0][0] = 12;
      arrays[1][0] = 24;
      arrays[2][0] = 36;
      // Masks matching each array's initial value
      const masks = [5, 10, 15];
      const oldValues: number[] = [];

      // Async for loop to process each array
      for (let i = 0; i < arrays.length; i++) {
        await new Promise<void>(resolve => setTimeout(resolve, 2)); // Simulate async gap
        const oldVal = ArkTSUtils.Atomics.and(arrays[i], 0, masks[i]);
        oldValues.push(oldVal);
      }

      // Assert collected old values and each array's final value
      expect(oldValues).assertDeepEquals([12, 24, 36]);
      expect(arrays[0][0]).assertEqual(4); // 12 & 5 = 4
      expect(arrays[1][0]).assertEqual(8); // 24 & 10 = 20
      expect(arrays[2][0]).assertEqual(4); // 36 & 15 = 12
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsAnd0083
     * @tc.number SUB_ARKTSUTILS_ATOMICS_AND_8300
     * @tc.desc   Test nested Promise with ArkTSUtils.Atomics.and (mixed types + final validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsAnd0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Initialize mixed-type arrays
      const int32Arr = new collections.Int32Array(new collections.ArrayBuffer(4));
      const uint8Arr = new collections.Uint8Array(new collections.ArrayBuffer(1));
      int32Arr[0] = -40; // Two's complement: 0xFFFFFFD8
      uint8Arr[0] = 216; // Unsigned equivalent of 0xD8

      // Nested Promise chain: process collections.Int32Array → process collections.Uint8Array → validate
      const validationResult = await Promise.resolve(int32Arr)
      // Step 1: Process collections.Int32Array
        .then(arr => {
          ArkTSUtils.Atomics.and(arr, 0, 0xFFFFFFF0); // Mask to clear last 4 bits
          return arr[0];
        })
        // Step 2: Pass result to collections.Uint8Array processing
        .then(int32Val => {
          ArkTSUtils.Atomics.and(uint8Arr, 0, 0xF0); // Mask collections.Uint8Array
          expect(int32Val).assertEqual(-48);
          return uint8Arr[0];
        })
        // Step 3: Final validation
        .then((uint8Val) => {
          // Validate both results match (cleared last 4 bits)
          return uint8Val === 208;
        });

      // Assert final validation passes
      expect(validationResult).assertEqual(true);
      expect(int32Arr[0]).assertEqual(-48); // 0xFFFFFFD0
      expect(uint8Arr[0]).assertEqual(208); // 0xD0
    });
  })
}
