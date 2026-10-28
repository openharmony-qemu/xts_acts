import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import {
  atomicsExchangeTest054,
  atomicsExchangeTest063,
  atomicsExchangeTest078,
  atomicsExchangeTest096,
  type63,
  type86,
  type94,
  type97
} from './atomics';
import { sleep } from './utils';


export default function atomicsExchangeTest() {
  describe('atomicsExchangeTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0100
     * @tc.desc   Test exchange at non-zero index of collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(8);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1;
      ia[1] = 20;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 1, 30);
      expect(oldValue).assertEqual(20);
      expect(ia[1]).assertEqual(30);
      expect(ia[0]).assertEqual(1);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0200
     * @tc.desc   Test exchange with zero value in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(100);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0300
     * @tc.desc   Test multiple consecutive exchange calls on collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;

      const old1 = ArkTSUtils.Atomics.exchange(ia, 0, 20);
      const old2 = ArkTSUtils.Atomics.exchange(ia, 0, 30);
      const old3 = ArkTSUtils.Atomics.exchange(ia, 0, 40);

      expect(old1).assertEqual(10);
      expect(old2).assertEqual(20);
      expect(old3).assertEqual(30);
      expect(ia[0]).assertEqual(40);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0400
     * @tc.desc   Test exchange with maximum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const maxInt32 = 2147483647;
      ia[0] = maxInt32;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, -1);
      expect(oldValue).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(-1);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0500
     * @tc.desc   Test exchange with minimum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const minInt32 = -2147483648;
      ia[0] = minInt32;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 0);
      expect(oldValue).assertEqual(minInt32);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0600
     * @tc.desc   Test exchange on large collections.ArrayBuffer (collections.Int32Array with index 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(32); // 8 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[5] = 123;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 5, 456);
      expect(oldValue).assertEqual(123);
      expect(ia[5]).assertEqual(456);
      expect(ia[4]).assertEqual(0);
      expect(ia[6]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0700
     * @tc.desc   Test value overflow for collections.Uint8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 255;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 260); // 260 mod 256 = 4
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(4);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0800
     * @tc.desc   Test value underflow for collections.Int8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ia = new collections.Int8Array(sab);
      ia[0] = -128;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, -130); // -130 mod 128 = 126
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(126);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_0900
     * @tc.desc   Test exchange with same old and new value in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 50;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 50);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(50);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1000
     * @tc.desc   Verify exchange/compareExchange lock and relock on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsExchange0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // 0: unlocked, 1: locked

      // Lock (atomic exchange)
      const lockResult = ArkTSUtils.Atomics.exchange(ia, 0, 1);
      expect(lockResult).assertEqual(0); // Lock acquired
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(1);

      // Try lock again (should fail)
      const failedLock = ArkTSUtils.Atomics.compareExchange(ia, 0, 0, 1);
      expect(failedLock).assertEqual(1);

      // Unlock (atomic exchange)
      const unlockResult = ArkTSUtils.Atomics.exchange(ia, 0, 0);
      expect(unlockResult).assertEqual(1); // Lock released
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1100
     * @tc.desc   Test exchange with large positive value in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1000000;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 2000000);
      expect(oldValue).assertEqual(1000000);
      expect(ia[0]).assertEqual(2000000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1200
     * @tc.desc   Test exchange with large negative value in collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = -500000;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, -1000000);
      expect(oldValue).assertEqual(-500000);
      expect(ia[0]).assertEqual(-1000000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1300
     * @tc.desc   Test exchange on collections.Uint16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(2);
      const ua = new collections.Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 65536); // 65536 mod 65536 = 0
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1400
     * @tc.desc   Test exchange on collections.Int16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(2);
      const ia = new collections.Int16Array(sab);
      ia[0] = 32767;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 32768); // 32768 mod 65536 = -32768
      expect(oldValue).assertEqual(32767);
      expect(ia[0]).assertEqual(-32768);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1500
     * @tc.desc   Test exchange on multiple indexes of collections.Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;

      const old0 = ArkTSUtils.Atomics.exchange(ia, 0, 100);
      const old1 = ArkTSUtils.Atomics.exchange(ia, 1, 200);
      const old2 = ArkTSUtils.Atomics.exchange(ia, 2, 300);

      expect(old0).assertEqual(10);
      expect(old1).assertEqual(20);
      expect(old2).assertEqual(30);
      expect(ia[0]).assertEqual(100);
      expect(ia[1]).assertEqual(200);
      expect(ia[2]).assertEqual(300);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0016
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1600
     * @tc.desc   Test exchange on collections.Uint8Array with mid-range value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 128;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 64);
      expect(oldValue).assertEqual(128);
      expect(ua[0]).assertEqual(64);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0017
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1700
     * @tc.desc   Test exchange on collections.Int8Array with mid-range negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ia = new collections.Int8Array(sab);
      ia[0] = -64;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 64);
      expect(oldValue).assertEqual(-64);
      expect(ia[0]).assertEqual(64);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0018
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1800
     * @tc.desc   Test exchange with zero index and zero initial value in collections.Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab); // Initial value is 0 by default
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 1000000);
      expect(oldValue).assertEqual(0);
      expect(ua[0]).assertEqual(1000000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0019
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_1900
     * @tc.desc   Verify exchange/load/add sequence on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsExchange0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10; // Total resources

      // Allocate 3 resources (atomic exchange + sub)
      const currentResources = ArkTSUtils.Atomics.exchange(ia, 0, ArkTSUtils.Atomics.load(ia, 0) - 3);
      const remaining = ArkTSUtils.Atomics.load(ia, 0);

      expect(currentResources).assertEqual(10);
      expect(remaining).assertEqual(7);
      // Revert allocation
      ArkTSUtils.Atomics.add(ia, 0, 3);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(10);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0020
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2000
     * @tc.desc   Test exchange with maximum Uint8 value (255) to minimum (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 255;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0021
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2100
     * @tc.desc   Test exchange with minimum Int8 value (-128) to maximum (127)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ia = new collections.Int8Array(sab);
      ia[0] = -128;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 127);
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(127);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0022
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2200
     * @tc.desc   Test exchange on collections.Int16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(2);
      const ia = new collections.Int16Array(sab);
      ia[0] = 50;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(100);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0023
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2300
     * @tc.desc   Test exchange on collections.Uint16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(2);
      const ua = new collections.Uint16Array(sab);
      ua[0] = 500;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 1000);
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(1000);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0024
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2400
     * @tc.desc   Test exchange on collections.Int32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 1;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(2);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0025
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2500
     * @tc.desc   Test exchange on collections.Uint32Array with value 4294967294 (max-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      const value = 4294967294; // Uint32 max is 4294967295
      ua[0] = value;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(value);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0026
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2600
     * @tc.desc   Test exchange on collections.Int8Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ia = new collections.Int8Array(sab);
      ia[0] = -1;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0027
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2700
     * @tc.desc   Test exchange on collections.Uint8Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(1);
      const ua = new collections.Uint8Array(sab);
      ua[0] = 1;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(2);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0028
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2800
     * @tc.desc   Test exchange on collections.Int32Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = -1;
      const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0029
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_2900
     * @tc.desc   Test exchange on collections.Uint32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsExchange0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new collections.ArrayBuffer(4);
      const ua = new collections.Uint32Array(sab);
      ua[0] = 1;
      const oldValue = ArkTSUtils.Atomics.exchange(ua, 0, 100);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(100);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0030
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3000
     * @tc.desc   Test async exchange with Promise.race between two updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Task 1: Exchange to 20
      const task1 = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 20);
          winner = 'task1';
          resolve();
        }, 5);
      });

      // Task 2: Exchange to 30 (same initial value)
      const task2 = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 30);
          winner = 'task2';
          resolve();
        }, 5);
      });

      // Race tasks and wait for completion
      await Promise.race([task1, task2]);
      await Promise.all([task1, task2]);

      expect(['task1', 'task2'].includes(winner)).assertTrue();
      expect([20, 30].includes(ia[0])).assertTrue(); // Matches winning task's value
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3100
     * @tc.desc   Test nested async exchange with retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const target = 3;
      let retryCount = 0;

      // Nested async retry function
      const retryExchange = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(async () => {
            const current = ia[0];
            if (current >= target) {
              resolve(true);
              return;
            }
            ArkTSUtils.Atomics.exchange(ia, 0, current + 1);
            retryCount++;
            // Recursive retry
            resolve(await retryExchange());
          }, 30);
        });
      };

      // Simulate competing update to trigger retries
      const competingTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 1); // Reset to cause retry
          resolve();
        }, 80);
      });

      const isComplete = await Promise.all([retryExchange(), competingTask]);
      expect(isComplete[0]).assertEqual(true);
      expect(ia[0]).assertEqual(target);
      expect(retryCount).assertLargerOrEqual(target); // Retries occurred
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3200
     * @tc.desc   Test async exchange with Promise.all for batch updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function for single index
      const batchExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = ArkTSUtils.Atomics.exchange(ia, index, newValue);
            resolve(oldValue);
          }, 4);
        });
      };

      // Run batch updates in parallel
      const old = await Promise.all([
        batchExchange(0, 10),
        batchExchange(1, 20)
      ]);

      expect(old[0]).assertEqual(5);
      expect(old[1]).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3300
     * @tc.desc   Test exchange in async generator with sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsExchangeTest054();

      expect(oldValues).assertDeepEquals([10, 20, 30]);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3400
     * @tc.desc   Test async exchange with timeout fallback using Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8;
      let timeoutTriggered = false;

      // Slow exchange task (delayed to trigger timeout)
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.exchange(ia, 0, 18);
          resolve(old);
        }, 20);
      });

      // Timeout task
      const timeoutTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          timeoutTriggered = true;
          resolve(-1); // Fallback value
        }, 10);
      });

      // Race exchange and timeout
      const result = await Promise.race([exchangeTask, timeoutTask]);
      expect(timeoutTriggered).assertEqual(true);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(8); // No exchange (timeout won)
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3500
     * @tc.desc   Test exchange in async class with nested methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class AtomicUpdater {
        private ia: collections.Int32Array;

        constructor(sab: collections.ArrayBuffer) {
          this.ia = new collections.Int32Array(sab);
        }

        // Nested async method: exchange + verification
        async updateAndVerify(index: number, newValue: number): Promise<boolean> {
          const oldValue = await this._exchange(index, newValue);
          return this._verify(index, newValue);
        }

        // Private exchange method
        private async _exchange(index: number, newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
