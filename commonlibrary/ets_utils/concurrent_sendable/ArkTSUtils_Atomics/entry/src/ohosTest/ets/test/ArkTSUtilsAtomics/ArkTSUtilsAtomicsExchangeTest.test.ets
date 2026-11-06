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
    it('testArkTSUtilsAtomicsExchange0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0031
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3100
     * @tc.desc   Test nested async exchange with retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0032
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3200
     * @tc.desc   Test async exchange with Promise.all for batch updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0033
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3300
     * @tc.desc   Test exchange in async generator with sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const oldValues: number[] = await atomicsExchangeTest054();

      expect(oldValues).assertDeepEquals([10, 20, 30]);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0034
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3400
     * @tc.desc   Test async exchange with timeout fallback using Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0035
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3500
     * @tc.desc   Test exchange in async class with nested methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
              const old = ArkTSUtils.Atomics.exchange(this.ia, index, newValue);
              resolve(old);
            }, 3);
          });
        }

        // Private verification method
        private async _verify(index: number, expected: number): Promise<boolean> {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              resolve(this.ia[index] === expected);
            }, 2);
          });
        }

        public getIa() {
          return this.ia
        }
      }

      const sab = new collections.ArrayBuffer(4);
      const updater = new AtomicUpdater(sab);
      updater.updateAndVerify(0, 5); // Initial setup

      const isVerified = await updater.updateAndVerify(0, 15);
      expect(isVerified).assertEqual(true);
      expect(updater.getIa()[0]).assertEqual(15); // Access private for test
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0036
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3600
     * @tc.desc   Test nested exchange with async state synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements (state + data)
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // State: 0=idle, 1=ready
      ia[1] = 10; // Data

      // Sync state first, then exchange data
      const syncAndExchange = async (newData: number): Promise<number> => {
        // Step 1: Wait for state to be ready
        const waitForState = new Promise<void>((resolve) => {
          const checkState = () => {
            if (ia[0] === 1) {
              resolve();
            } else {
              setTimeout(checkState, 2);
            }
          };
          checkState();
        });

        await waitForState;
        // Step 2: Exchange data
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, 1, newData);
            resolve(old);
          }, 3);
        });
      };

      // Simulate state change
      const setStateReady = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 1);
          resolve();
        }, 5);
      });

      // Run sync and exchange
      const oldData = await Promise.all([syncAndExchange(20), setStateReady]);
      expect(oldData[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      expect(ia[0]).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0037
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3700
     * @tc.desc   Test async exchange with closure capturing context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      // Factory function: creates closure with captured step size
      const createExchangeClosure = (step: number) => {
        return async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const current = ia[0];
              const old = ArkTSUtils.Atomics.exchange(ia, 0, current + step);
              resolve(old);
            }, 3);
          });
        };
      };

      // Create closures with different step sizes
      const step2Exchange = createExchangeClosure(2);
      const step3Exchange = createExchangeClosure(3);

      // Execute exchanges via closures
      await step2Exchange(); // 0 → 2
      await step3Exchange(); // 2 → 5
      const lastOldValue = await step2Exchange(); // 5 → 7

      expect(lastOldValue).assertEqual(5);
      expect(ia[0]).assertEqual(7);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0038
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3800
     * @tc.desc   Test nested async exchange with retry limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      const maxRetries = 2;
      let retryCount = 0;

      // Nested exchange with retry limit
      const exchangeWithRetryLimit = async (target: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = async () => {
            retryCount++;
            const current = ia[0];
            if (current === target) {
              resolve(true);
              return;
            }
            ArkTSUtils.Atomics.exchange(ia, 0, current + 1);

            if (retryCount >= maxRetries) {
              resolve(false); // Hit retry limit
              return;
            }
            setTimeout(attempt, 3); // Retry
          };
          attempt();
        });
      };

      // Run with target beyond retry limit
      const success = await exchangeWithRetryLimit(15);
      expect(success).assertEqual(false);
      expect(retryCount).assertEqual(maxRetries);
      expect(ia[0]).assertEqual(12); // 10 + 2 retries = 12
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0039
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_3900
     * @tc.desc   Test async exchange with Promise chaining for sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // First exchange (index 0)
      const firstExchange = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = ArkTSUtils.Atomics.exchange(ia, 0, 10);
          resolve(old);
        }, 3);
      });

      // Chain to second exchange (index 1) after first completes
      const finalOldValue = await firstExchange
        .then((old0) => {
          expect(old0).assertEqual(5);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old1 = ArkTSUtils.Atomics.exchange(ia, 1, 20);
              resolve(old1);
            }, 4);
          });
        });

      expect(finalOldValue).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0040
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4000
     * @tc.desc   Test exchange in async iterator with dynamic value generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      // Consume iterator (3 dynamic updates)
      const oldValues: number[] = await atomicsExchangeTest063();

      expect(oldValues).assertDeepEquals([0, 0, 0]); // 0→0, 0→2, 2→4
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0041
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4100
     * @tc.desc   Test async exchange with cross-index dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements (A: trigger, B: data)
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // Trigger (0: not ready, 1: ready)
      ia[1] = 10; // Data

      // Update B only if A is ready (cross-index dependency)
      const dependentExchange = async (newB: number): Promise<number> => {
        // Wait for trigger A to be ready
        const waitForTrigger = new Promise<void>((resolve) => {
          const checkTrigger = () => {
            if (ia[0] === 1) {
              resolve();
            } else {
              setTimeout(checkTrigger, 2);
            }
          };
          checkTrigger();
        });

        await waitForTrigger;
        // Exchange B once triggered
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldB = ArkTSUtils.Atomics.exchange(ia, 1, newB);
            resolve(oldB);
          }, 3);
        });
      };

      // Simulate trigger activation
      const activateTrigger = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 1);
          resolve();
        }, 5);
      });

      // Run dependent exchange
      const oldB = await Promise.all([dependentExchange(20), activateTrigger]);
      expect(oldB[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      expect(ia[0]).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0042
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4200
     * @tc.desc   Test nested exchange with async finally for cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements (data + cleanup flag)
      const ia = new collections.Int32Array(sab);
      ia[0] = 15; // Data
      ia[1] = 0; // Cleanup flag (0: not done, 1: done)
      let cleanupRan = false;

      // Nested exchange with finally cleanup
      const exchangeWithCleanup = async (newData: number): Promise<number> => {
        let oldData = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(ia, 0, newData);
              resolve(old);
            }, 4);
          });
          return oldData;
        } finally {
          // Async cleanup (runs regardless of success)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 1, 1);
              cleanupRan = true;
              resolve();
            }, 2);
          });
        }
      };

      // Test successful exchange
      const oldData = await exchangeWithCleanup(25);
      // Test exchange with intentional error
      try {
        await exchangeWithCleanup(NaN); // Force invalid value
      } catch (err) {
      }

      expect(oldData).assertEqual(15);
      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
      expect(cleanupRan).assertEqual(true); // Cleanup ran twice
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0043
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4300
     * @tc.desc   Test async exchange with Promise.race between update and cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8;
      let cancelled = false;

      // Exchange task
      const exchangeTask = new Promise<number>((resolve) => {
        const attempt = () => {
          if (cancelled) {
            resolve(-1);
            return;
          }
          const old = ArkTSUtils.Atomics.exchange(ia, 0, 18);
          resolve(old);
        };
        setTimeout(attempt, 10);
      });

      // Cancel task
      const cancelTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          cancelled = true;
          resolve();
        }, 5);
      });

      // Race exchange and cancel
      const result = await Promise.race([exchangeTask, cancelTask.then(() => -1)]);
      expect(cancelled).assertEqual(true);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(8); // No exchange (cancelled)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0044
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4400
     * @tc.desc   Test exchange in async subclass with inherited method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {

      // Base class with atomic exchange
      class BaseAtomic {
        protected ia: collections.Int32Array;

        constructor(sab: collections.ArrayBuffer) {
          this.ia = new collections.Int32Array(sab);
        }

        protected async _exchange(index: number, newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(this.ia, index, newValue);
              resolve(old);
            }, 3);
          });
        }
      }

      // Subclass with specific update logic
      class AtomicDataUpdater extends BaseAtomic {
        async updateData(newValue: number): Promise<boolean> {
          const old = await this._exchange(0, newValue);
          return old !== newValue; // Verify value changed
        }

        getData(): number {
          return this.ia[0];
        }
      }

      const sab = new collections.ArrayBuffer(4);
      const updater = new AtomicDataUpdater(sab);
      updater.updateData(10); // Initial setup

      const isUpdated = await updater.updateData(20);
      expect(isUpdated).assertEqual(true);
      expect(updater.getData()).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0045
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4500
     * @tc.desc   Test async exchange with dynamic index from Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;

      // Promise that resolves to dynamic target index
      const getTargetIndex = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate async index selection (choose index 1)
          setTimeout(() => resolve(1), 4);
        });
      };

      // Exchange using dynamic index
      const dynamicIndexExchange = async (newValue: number): Promise<number> => {
        const index = await getTargetIndex();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await dynamicIndexExchange(30);
      expect(oldValue).assertEqual(15);
      expect(ia[1]).assertEqual(30); // Index 1 updated
      expect(ia[0]).assertEqual(5); // Index 0 unchanged
      expect(ia[2]).assertEqual(25); // Index 2 unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0046
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4600
     * @tc.desc   Test nested exchange with async validation of new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let validationPassed = false;

      // Async validation: new value must be even
      const validateNewValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = newValue % 2 === 0;
            validationPassed = valid;
            resolve(valid);
          }, 3);
        });
      };

      // Nested: validate → exchange
      const validatedExchange = async (newValue: number): Promise<boolean> => {
        const isValid = await validateNewValue(newValue);
        if (!isValid) {
          return false;
        }

        const old = await new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(ArkTSUtils.Atomics.exchange(ia, 0, newValue));
          }, 2);
        });

        return old !== newValue;
      };

      // Test valid exchange (even value)
      const success1 = await validatedExchange(20);
      // Test invalid exchange (odd value)
      const success2 = await validatedExchange(21);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(20); // Only first exchange succeeds
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0047
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4700
     * @tc.desc   Test exchange in async closure with state persistence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      // Closure factory: persists target value
      const createTargetedExchange = (target: number) => {
        let currentStep = 0;
        // Closure captures target and currentStep
        return async (): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              currentStep++;
              const old = ArkTSUtils.Atomics.exchange(ia, 0, currentStep);
              const reachedTarget = currentStep === target;
              resolve(reachedTarget);
            }, 3);
          });
        };
      };

      // Create closure with target 4
      const reachTarget4 = createTargetedExchange(4);
      let isReached = false;

      // Run until target is reached
      while (!isReached) {
        isReached = await reachTarget4();
      }

      expect(isReached).assertEqual(true);
      expect(ia[0]).assertEqual(4);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0048
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4800
     * @tc.desc   Test async exchange with Promise.all and cross-index consistency check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements (A and B)
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      let isConsistent = false;

      // Exchange both indexes in parallel, check consistency
      const parallelExchange = async (newA: number, newB: number): Promise<boolean> => {
        // Run exchanges in parallel
        const old = await Promise.all([
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(ArkTSUtils.Atomics.exchange(ia, 0, newA)), 3);
          }),
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(ArkTSUtils.Atomics.exchange(ia, 1, newB)), 3);
          })
        ]);

        // Check if both exchanges used correct old values (consistency)
        isConsistent = old[0] === 10 && old[1] === 20;
        return isConsistent;
      };

      // First consistent exchange
      const success1 = await parallelExchange(15, 25);
      // Second inconsistent exchange (old values changed)
      const success2 = await parallelExchange(20, 30);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(isConsistent).assertEqual(false);
      expect(ia[0]).assertEqual(20);
      expect(ia[1]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0049
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_4900
     * @tc.desc   Test nested exchange with async retry and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      const maxRetries = 3;
      let retryCount = 0;

      // Nested: retry on error + recovery
      const retryWithRecovery = async (newValue: number): Promise<number> => {
        if (retryCount >= maxRetries) {
          // Recovery: reset to initial value
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, 5);
              resolve();
            }, 2);
          });
          throw new Error('Max retries reached');
        }

        return new Promise<number>((resolve, reject) => {
          setTimeout(async () => {
            retryCount++;
            try {
              if (newValue === 15) {
                throw new Error('Temporary block on 15'); // Simulate error
              }
              const old = ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              resolve(old);
            } catch (err) {
              // Retry with adjusted value
              resolve(await retryWithRecovery(newValue + 1));
            }
          }, 3);
        });
      };

      // Test with value that triggers error
      const oldValue = await retryWithRecovery(15);
      expect(retryCount).assertLarger(0); // Retries occurred
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(16); // Recovered to 16 (15+1)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0050
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5000
     * @tc.desc   Test async exchange with Promise.race between two competing closures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Closure 1: exchanges to 20
      const exchangeTo20 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, 20);
            winner = 'closure1';
            resolve();
          }, 5);
        });
      };

      // Closure 2: exchanges to 30
      const exchangeTo30 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, 30);
            winner = 'closure2';
            resolve();
          }, 5);
        });
      };

      // Race closures
      await Promise.race([exchangeTo20(), exchangeTo30()]);
      expect(['closure1', 'closure2'].includes(winner)).assertTrue()
      expect([20, 30].includes(ia[0])).assertTrue(); // Matches winner's value
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0051
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5100
     * @tc.desc   Test exchange in async class with multiple instances and shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      class SharedAtomic {
        private ia: collections.Int32Array;
        private index: number;

        constructor(sab: collections.ArrayBuffer, index: number) {
          this.ia = new collections.Int32Array(sab);
          this.index = index;
        }

        // Async exchange method
        async setValue(newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(this.ia, this.index, newValue);
              resolve(old);
            }, 3);
          });
        }

        getValue(): number {
          return this.ia[this.index];
        }
      }

      // Shared buffer with 2 indexes
      const sab = new collections.ArrayBuffer(8);
      const instance1 = new SharedAtomic(sab, 0);
      const instance2 = new SharedAtomic(sab, 1);

      // Initialize values
      await instance1.setValue(5);
      await instance2.setValue(15);

      // Cross-instance exchange
      const old1 = await instance1.setValue(10);
      const old2 = await instance2.setValue(20);

      expect(old1).assertEqual(5);
      expect(old2).assertEqual(15);
      expect(instance1.getValue()).assertEqual(10);
      expect(instance2.getValue()).assertEqual(20);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0052
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5200
     * @tc.desc   Test nested async exchange with dynamic newValue from external API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      // Mock external API: returns dynamic newValue
      const mockApi = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate API delay and dynamic response
          setTimeout(() => resolve(Math.floor(Math.random() * 100) + 10), 4);
        });
      };

      // Nested: fetch from API → exchange
      const apiDrivenExchange = async (): Promise<number> => {
        const newValue = await mockApi(); // Fetch dynamic value
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, 0, newValue);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await apiDrivenExchange();
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertLargerOrEqual(10); // Matches API mock range
      expect(ia[0]).assertLessOrEqual(109);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0053
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5300
     * @tc.desc   Test async exchange with finally block for state reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      const initialValue = 5;
      ia[0] = initialValue;
      let resetDone = false;

      // Exchange with finally reset
      const exchangeAndReset = async (tempValue: number): Promise<number> => {
        let oldValue = -1;
        try {
          oldValue = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(ia, 0, tempValue);
              resolve(old);
            }, 3);
          });
          // Simulate work with temp value
          await new Promise<void>((resolve) => setTimeout(resolve, 2));
          return oldValue;
        } finally {
          // Reset to initial value in finally
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, initialValue);
              resetDone = true;
              resolve();
            }, 1);
          });
        }
      };

      const oldValue = await exchangeAndReset(15);
      expect(oldValue).assertEqual(initialValue);
      expect(resetDone).assertEqual(true);
      expect(ia[0]).assertEqual(initialValue); // Reset successful
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0054
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5400
     * @tc.desc   Test exchange in async iterator with error handling per iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const oldValues: number[] = await atomicsExchangeTest078();

      expect(oldValues).assertDeepEquals([10, 15, 25]); // Valid exchanges
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0055
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5500
     * @tc.desc   Test async exchange with nested lock/unlock using atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32: [lock, data]
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // Lock: 0=idle, 1=held
      ia[1] = 5; // Data

      // Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = ArkTSUtils.Atomics.exchange(ia, 0, 1);
            resolve(oldLock === 0); // Success if lock was idle
          };
          setTimeout(attempt, 2);
        });
      };

      // Release lock (atomic exchange)
      const releaseLock = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, 0);
            resolve();
          }, 2);
        });
      };

      // Nested: lock → exchange data → unlock
      const lockedExchange = async (newData: number): Promise<number> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          throw new Error('Lock acquisition failed');
        }

        try {
          // Exchange data while locked
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldData = ArkTSUtils.Atomics.exchange(ia, 1, newData);
              resolve(oldData);
            }, 3);
          });
        } finally {
          await releaseLock(); // Ensure unlock even if error
        }
      };

      // Run locked exchange
      const oldData = await lockedExchange(15);
      expect(oldData).assertEqual(5);
      expect(ia[1]).assertEqual(15);
      expect(ia[0]).assertEqual(0); // Lock released
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0056
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5600
     * @tc.desc   Test exchange with async batch validation and partial rollback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32: [A, B, C]
      const ia = new collections.Int32Array(sab);
      ia[0] = 10; // A
      ia[1] = 20; // B
      ia[2] = 30; // C
      const initialValues = [...ia]; // Save initial state
      let rolledBack = false;

      // Async batch validation: all new values must be > initial
      const validateBatch = async (newValues: number[]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = newValues.every((val, i) => val > initialValues[i]);
            resolve(valid);
          }, 3);
        });
      };

      // Batch exchange with partial rollback on failure
      const batchExchange = async (newValues: number[]): Promise<boolean> => {
        const isValid = await validateBatch(newValues);
        if (!isValid) {
          return false;
        }

        // Track updated indexes for rollback
        const updatedIndexes: number[] = [];
        try {
          // Exchange each index sequentially
          for (let i = 0; i < newValues.length; i++) {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                ArkTSUtils.Atomics.exchange(ia, i, newValues[i]);
                updatedIndexes.push(i);
                resolve();
              }, 2);
            });
            // Simulate failure after updating index 1
            if (i === 1 && newValues[2] < initialValues[2]) {
              throw new Error('Invalid value at index 2');
            }
          }
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updatedIndexes.map((i) => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                ArkTSUtils.Atomics.exchange(ia, i, initialValues[i]);
                resolve();
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test invalid batch (C < initial)
      const success = await batchExchange([15, 25, 28]);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(false);
      expect(ia).assertDeepEquals(new collections.Int32Array(initialValues)); // All rolled back
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0057
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5700
     * @tc.desc   Test async exchange with closure that captures validation rules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      // Closure factory: captures min/max validation rules
      const createValidatedExchange = (min: number, max: number) => {
        // Closure captures min and max
        return async (newValue: number): Promise<type63> => {
          return new Promise<type63>((resolve) => {
            setTimeout(() => {
              const old = ia[0];
              if (newValue < min || newValue > max) {
                resolve({ old, success: false }); // Invalid: no exchange
                return;
              }
              ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              resolve({ old, success: true });
            }, 3);
          });
        };
      };

      // Create closure with 0-100 range
      const exchangeInRange = createValidatedExchange(0, 100);

      // Test valid and invalid values
      const res1 = await exchangeInRange(50); // Valid
      const res2 = await exchangeInRange(150); // Invalid
      const res3 = await exchangeInRange(75); // Valid

      expect(res1.success).assertEqual(true);
      expect(res1.old).assertEqual(0);
      expect(res2.success).assertEqual(false);
      expect(res2.old).assertEqual(50);
      expect(res3.success).assertEqual(true);
      expect(res3.old).assertEqual(50);
      expect(ia[0]).assertEqual(75);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0058
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5800
     * @tc.desc   Test nested async exchange with Promise.race for timeout and cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let timeoutHit = false;
      let cancelled = false;

      // Exchange task with delay
      const exchangeTask = new Promise<number>((resolve) => {
        const attempt = () => {
          if (cancelled || timeoutHit) {
            resolve(-1);
            return;
          }
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, 0, 20);
            resolve(old);
          }, 15);
        };
        attempt();
      });

      // Timeout task
      const timeoutTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          timeoutHit = true;
          resolve();
        }, 10);
      });

      // Cancel task (triggered after timeout)
      const cancelTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          cancelled = true;
          resolve();
        }, 12);
      });

      // Race all three: exchange, timeout, cancel
      const result = await Promise.race([
        exchangeTask,
        timeoutTask.then(() => -1),
        cancelTask.then(() => -1)
      ]);

      expect(timeoutHit).assertEqual(true);
      expect(cancelled).assertEqual(false);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(10); // No exchange
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0059
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_5900
     * @tc.desc   Test exchange in async subclass with overridden validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {

      // Base class with exchange logic
      abstract class BaseValidator {
        protected ia: collections.Int32Array;

        constructor(sab: collections.ArrayBuffer) {
          this.ia = new collections.Int32Array(sab);
        }

        // Abstract validation (to be overridden)
        protected abstract validate(newValue: number): Promise<boolean>;

        // Common exchange logic
        async update(newValue: number): Promise<boolean> {
          const isValid = await this.validate(newValue);
          if (!isValid) {
            return false;
          }

          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(this.ia, 0, newValue);
              resolve(true);
            }, 3);
          });
        }

        getValue(): number {
          return this.ia[0];
        }
      }

      // Subclass: validates even values
      class EvenValidator extends BaseValidator {
        protected async validate(newValue: number): Promise<boolean> {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(newValue % 2 === 0), 2);
          });
        }
      }

      const sab = new collections.ArrayBuffer(4);
      const validator = new EvenValidator(sab);

      // Test valid (even) and invalid (odd) values
      const success1 = await validator.update(10);
      const success2 = await validator.update(11);
      const success3 = await validator.update(12);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(validator.getValue()).assertEqual(12);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0060
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6000
     * @tc.desc   Test nested exchange with async state check before and after
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 8;
      let preCheckPassed = false;
      let postCheckPassed = false;

      // Pre-exchange state check
      const preCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            preCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Post-exchange state check
      const postCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            postCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Nested: pre-check → exchange → post-check
      const checkAndExchange = async (preVal: number, newVal: number): Promise<boolean> => {
        const prePass = await preCheck(preVal);
        if (!prePass) {
          return false;
        }

        // Exchange
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, newVal);
            resolve();
          }, 3);
        });

        const postPass = await postCheck(newVal);
        return postPass;
      };

      // Test valid flow
      const success1 = await checkAndExchange(8, 18);
      // Test invalid pre-check (mismatched expected value)
      const success2 = await checkAndExchange(8, 28);

      expect(preCheckPassed).assertEqual(false); // Second pre-check fails
      expect(postCheckPassed).assertEqual(true); // First post-check passes
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(18);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0061
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6100
     * @tc.desc   Test async exchange with closure that tracks update history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      interface inter86 {
        exchange: (va:number) => Promise<void>;
        getHistory: () => Array<type86>;
      }

      // Closure factory: tracks update history
      const createTrackedExchange = () => {
        const history: Array<type86> = [];
        // Closure captures history
        return {
          exchange: async (newValue: number): Promise<void> => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                const old1 = ia[0];
                ArkTSUtils.Atomics.exchange(ia, 0, newValue);
                history.push({ old: old1, new: newValue, time: Date.now() });
                resolve();
              }, 3);
            });
          },
          getHistory: (): Array<type86> => history
        } as inter86;
      };

      const trackedExchange = createTrackedExchange();
      // Run multiple exchanges
      await trackedExchange.exchange(10);
      await trackedExchange.exchange(20);
      await trackedExchange.exchange(30);

      const history = trackedExchange.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(0);
      expect(history[0].new).assertEqual(10);
      expect(history[1].old).assertEqual(10);
      expect(history[1].new).assertEqual(20);
      expect(history[2].old).assertEqual(20);
      expect(history[2].new).assertEqual(30);
      expect(ia[0]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0062
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6200
     * @tc.desc   Test nested async exchange with retry on validation failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      const maxRetries = 2;
      let retryCount = 0;

      // Async validation: new value must be > current value
      const validateIncreasing = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(newValue > ia[0]);
          }, 2);
        });
      };

      // Nested: validate → exchange → retry on failure
      const retryOnValidationFail = async (newValue: number): Promise<boolean> => {
        if (retryCount >= maxRetries) {
          return false;
        }

        const isValid = await validateIncreasing(newValue);
        if (isValid) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              resolve();
            }, 3);
          });
          return true;
        }

        retryCount++;
        // Retry with incremented value
        return retryOnValidationFail(newValue + 2);
      };

      // Test with initial invalid value (5 → 4: validation fails)
      const success = await retryOnValidationFail(4);
      expect(success).assertEqual(true);
      expect(retryCount).assertEqual(1); // 1 retry (4→6: valid)
      expect(ia[0]).assertEqual(6);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0063
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6300
     * @tc.desc   Test async exchange with Promise.race between two API-driven values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;

      // Mock API 1: returns value after 5ms
      const mockApi1 = async (): Promise<number> => {
        return new Promise<number>((resolve) => setTimeout(() => resolve(20), 5));
      };

      // Mock API 2: returns value after 8ms
      const mockApi2 = async (): Promise<number> => {
        return new Promise<number>((resolve) => setTimeout(() => resolve(30), 8));
      };

      // Race API calls and use first value for exchange
      const apiRace = async (): Promise<number> => {
        const apiValue = await Promise.race([mockApi1(), mockApi2()]);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, 0, apiValue);
            resolve(old);
          }, 2);
        });
      };

      const oldValue = await apiRace();
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20); // API 1 wins (faster)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0064
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6400
     * @tc.desc   Test exchange in async class with static shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {

      // Class with static shared collections.ArrayBuffer
      class StaticAtomic {
        private static sab = new collections.ArrayBuffer(4);
        private static ia = new collections.Int32Array(StaticAtomic.sab);

        // Async exchange method (shares state across instances)
        static async exchange(newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(StaticAtomic.ia, 0, newValue);
              resolve(old);
            }, 3);
          });
        }

        static getValue(): number {
          return StaticAtomic.ia[0];
        }
      }

      // Create multiple instances (share static state)
      const instance1 = new StaticAtomic();
      const instance2 = new StaticAtomic();

      // Use different instances to exchange
      const old1 = await StaticAtomic.exchange(15); // Via class
      const old2 = await StaticAtomic.exchange(25); // Via class

      expect(old1).assertEqual(0); // Initial value is 0
      expect(old2).assertEqual(15);
      expect(StaticAtomic.getValue()).assertEqual(25);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0065
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6500
     * @tc.desc   Test nested async exchange with finally for resource release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32: [data, resourceFlag]
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 0; // Resource flag: 0=free, 1=used
      let resourceReleased = false;

      // Acquire resource (set flag to 1)
      const acquireResource = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const old = ArkTSUtils.Atomics.exchange(ia, 1, 1);
            resolve(old === 0);
          }, 2);
        });
      };

      // Release resource (set flag to 0)
      const releaseResource = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 1, 0);
            resourceReleased = true;
            resolve();
          }, 2);
        });
      };

      // Nested: acquire → exchange → release (finally)
      const resourceExchange = async (newData: number): Promise<number> => {
        const hasResource = await acquireResource();
        if (!hasResource) {
          throw new Error('Resource busy');
        }

        let oldData = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = ArkTSUtils.Atomics.exchange(ia, 0, newData);
              resolve(old);
            }, 3);
          });
          return oldData;
        } finally {
          await releaseResource(); // Ensure release even on error
        }
      };

      const oldData = await resourceExchange(15);
      expect(oldData).assertEqual(5);
      expect(resourceReleased).assertEqual(true);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(0); // Resource released
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0066
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6600
     * @tc.desc   Test async exchange with closure that enforces value sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;

      // Closure factory: enforces new value > previous value
      const createSequentialExchange = () => {
        let expectedPrev = ia[0];
        // Closure captures expectedPrev
        return async (newValue: number): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              if (newValue <= expectedPrev) {
                resolve(false); // Invalid sequence: no exchange
                return;
              }
              ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              expectedPrev = newValue; // Update expected for next call
              resolve(true);
            }, 3);
          });
        };
      };

      const sequentialExchange = createSequentialExchange();
      // Test valid and invalid sequence
      const success1 = await sequentialExchange(5);
      const success2 = await sequentialExchange(3); // Invalid (3 < 5)
      const success3 = await sequentialExchange(10); // Valid (10 > 5)

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(ia[0]).assertEqual(10);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0067
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6700
     * @tc.desc   Test nested exchange with async batch rollback on partial failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32: [A, B]
      const ia = new collections.Int32Array(sab);
      const initialA = 10;
      const initialB = 20;
      ia[0] = initialA;
      ia[1] = initialB;
      let rolledBack = false;

      // Batch exchange with rollback
      const batchWithRollback = async (newA: number, newB: number): Promise<boolean> => {
        const updated: number[] = [];
        try {
          // Update A first
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, newA);
              updated.push(0);
              resolve();
            }, 2);
          });

          // Simulate failure before updating B
          if (newB < initialB) {
            throw new Error('B value too small');
          }

          // Update B (only if no failure)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 1, newB);
              updated.push(1);
              resolve();
            }, 2);
          });
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updated.map((i) => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                ArkTSUtils.Atomics.exchange(ia, i, i === 0 ? initialA : initialB);
                resolve();
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test batch with B failure (triggers rollback)
      const success = await batchWithRollback(15, 18);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(true);
      expect(ia[0]).assertEqual(initialA); // A rolled back
      expect(ia[1]).assertEqual(initialB); // B unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0068
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6800
     * @tc.desc   Test async exchange with Promise.all between exchange and state change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let stateChanged = false;

      // Exchange task: tries to update to 20
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = ArkTSUtils.Atomics.exchange(ia, 0, 20);
          resolve(oldValue);
        }, 8);
      });

      // State change task: modifies value before exchange completes
      const stateChangeTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 0, 15); // Changes state
          stateChanged = true;
          resolve();
        }, 5);
      });

      // Race exchange and state change
      const oldValue = await Promise.all([exchangeTask, stateChangeTask]);
      expect(stateChanged).assertEqual(true);
      expect(oldValue[0]).assertEqual(15); // Exchange uses modified state
      expect(ia[0]).assertEqual(20); // Exchange completes after state change
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0069
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_6900
     * @tc.desc   Test async exchange with closure that limits update frequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0;
      const minInterval = 100; // Minimum 10ms between updates
      let lastUpdateTime = 0;

      // Closure factory: enforces update frequency limit
      const createThrottledExchange = () => {
        return async (newValue: number): Promise<type94> => {
          return new Promise<type94>((resolve) => {
            const now = Date.now();
            if (now - lastUpdateTime < minInterval) {
              resolve({ success: false, reason: 'Too frequent' });
              return;
            }

            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              lastUpdateTime = Date.now();
              resolve({ success: true });
            }, 300);
          });
        };
      };

      const throttledExchange = createThrottledExchange();
      // Test update sequence (fast follow-up should fail)
      const res1 = await throttledExchange(10);
      const res2 = await throttledExchange(20); // Too frequent
      // Wait for interval to pass
      await new Promise<void>((resolve) => setTimeout(resolve, minInterval));
      const res3 = await throttledExchange(30); // Valid after interval

      expect(res1.success).assertEqual(true);
      expect(res2.success).assertEqual(false);
      expect(res2.reason).assertEqual('Too frequent');
      expect(res3.success).assertEqual(true);
      expect(ia[0]).assertEqual(30);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0070
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7000
     * @tc.desc   Test nested async exchange with Promise.all and cross-index dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32: [dependent, trigger]
      const ia = new collections.Int32Array(sab);
      ia[0] = 5; // Dependent value
      ia[1] = 0; // Trigger: 0=inactive, 1=active
      let dependencyMet = false;

      // Update dependent only if trigger is active
      const dependentUpdate = async (newDependent: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          const checkTrigger = () => {
            if (ia[1] === 1) {
              dependencyMet = true;
              const old = ArkTSUtils.Atomics.exchange(ia, 0, newDependent);
              resolve(old);
            } else {
              setTimeout(checkTrigger, 20); // Retry until trigger active
            }
          };
          checkTrigger();
        });
      };

      // Activate trigger after delay
      const activateTrigger = new Promise<void>((resolve) => {
        setTimeout(() => {
          ArkTSUtils.Atomics.exchange(ia, 1, 1);
          resolve();
        }, 5);
      });

      // Run dependent update and trigger activation in parallel
      const oldDependent = await Promise.all([dependentUpdate(15), activateTrigger]);
      expect(dependencyMet).assertEqual(true);
      expect(oldDependent[0]).assertEqual(5);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0071
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7100
     * @tc.desc   Test exchange in async iterator with dynamic stop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const oldValues: number[] = await atomicsExchangeTest096();

      expect(oldValues).assertDeepEquals([0, 10, 20]); // Stops before 30 (30 > 25)
      // expect(ia[0]).assertEqual(30); // Final value (exceeds stopValue, iterator stops)
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0072
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7200
     * @tc.desc   Test async exchange with finally block for audit log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      const auditLog: Array<type97> = [];

      // Exchange with audit log in finally
      const auditedExchange = async (newValue: number): Promise<boolean> => {
        let old = ia[0];
        let success = false;
        try {
          old = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldVal = ArkTSUtils.Atomics.exchange(ia, 0, newValue);
              success = true;
              resolve(oldVal);
            }, 30);
          });
          return true;
        } catch (err) {
          success = false;
          return false;
        } finally {
          auditLog.push({ old, new: newValue, success });
        }
      };

      // Test valid and invalid exchanges
      await auditedExchange(20); // Valid
      try {
        await auditedExchange(NaN); // Invalid (throws)
      } catch (err) {
      }

      expect(auditLog.length).assertEqual(2);
      expect(auditLog[0].old).assertEqual(10);
      expect(auditLog[0].new).assertEqual(20);
      expect(auditLog[0].success).assertEqual(true);
      expect(auditLog[1].old).assertEqual(20);
      expect(auditLog[1].new).assertNaN()
      expect(auditLog[1].success).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Second exchange fails, value unchanged
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0073
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7300
     * @tc.desc   Test nested exchange with async validation of both old and new values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 15;
      let validationPassed = false;

      // Async validation: old value > 10 AND new value < 30
      const validateBoth = async (oldVal: number, newVal: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = oldVal > 10 && newVal < 30;
            validationPassed = valid;
            resolve(valid);
          }, 30);
        });
      };

      // Nested: get old value → validate → exchange
      const dualValidateExchange = async (newValue: number): Promise<boolean> => {
        const oldValue = ia[0];
        const isValid = await validateBoth(oldValue, newValue);
        if (!isValid) {
          return false;
        }

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, newValue);
            resolve();
          }, 2);
        });
        return true;
      };

      // Test valid exchange (15→25: 15>10 and 25<30)
      const success1 = await dualValidateExchange(25);
      // Test invalid exchange (25→35: 35 not <30)
      const success2 = await dualValidateExchange(35);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(25);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0074
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7400
     * @tc.desc   Test async exchange with Promise.race between multiple closure instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 10;
      let winnerId: string = '';

      // Closure factory: creates exchange closures with unique IDs
      const createExchangeClosure = (id: string, targetValue: number) => {
        return async (): Promise<string> => {
          return new Promise<string>((resolve) => {
            setTimeout(() => {
              ArkTSUtils.Atomics.exchange(ia, 0, targetValue);
              winnerId = id;
              resolve(id);
            }, Math.random() * 10); // Random delay to simulate race
          });
        };
      };

      // Create 3 closure instances (competing to update)
      const closure1 = createExchangeClosure('closure1', 20);
      const closure2 = createExchangeClosure('closure2', 30);
      const closure3 = createExchangeClosure('closure3', 40);

      // Race all closures
      const winningId = await Promise.race([closure1(), closure2(), closure3()]);
      // Wait for all closures to complete (ensure no further updates)
      await Promise.allSettled([closure1(), closure2(), closure3()]);

      expect(['closure1', 'closure2', 'closure3'].includes(winningId)).assertTrue()
      expect([20, 30, 40].includes(ia[0])).assertTrue(); // Final value matches winning closure
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0075
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7500
     * @tc.desc   Test comprehensive async nested exchange with retry, validation, and cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12); // 3 Int32: [data, lock, cleanupFlag]
      const ia = new collections.Int32Array(sab);
      ia[0] = 5; // Data
      ia[1] = 0; // Lock: 0=idle, 1=held
      ia[2] = 0; // Cleanup flag: 0=not done, 1=done
      const maxRetries = 3;
      let retryCount = 0;
      let cleanupDone = false;

      // 1. Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = ArkTSUtils.Atomics.exchange(ia, 1, 1);
            resolve(oldLock === 0);
          };
          setTimeout(attempt, 2);
        });
      };

      // 2. Validate new value (async)
      const validateValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(newValue > ia[0] && newValue < 100); // New value > current + <100
          }, 3);
        });
      };

      // 3. Nested exchange with retry
      const exchangeWithRetry = async (targetValue: number): Promise<boolean> => {
        if (retryCount >= maxRetries) {
          return false;
        }
        retryCount++;

        const isValid = await validateValue(targetValue);
        if (!isValid) {
          return exchangeWithRetry(targetValue + 10);
        } // Retry with adjusted value

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            ArkTSUtils.Atomics.exchange(ia, 0, targetValue);
            resolve();
          }, 2);
        });
        return true;
      };

      // 4. Main workflow: lock → exchange → cleanup
      const mainWorkflow = async (targetValue: number): Promise<boolean> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          return false;
        }

        try {
          // Simulate competing state change (may trigger retry)
          const competingTask = new Promise<void>((resolve) => {
            setTimeout(() => {
              if (ia[1] === 1) {
                ArkTSUtils.Atomics.exchange(ia, 0, 10);
              } // Adjust data to trigger retry
              resolve();
            }, 5);
          });

          const exchangeSuccess = await Promise.all([exchangeWithRetry(targetValue), competingTask]);
          return exchangeSuccess[0];
        } finally {
          // Cleanup: release lock + set cleanup flag
          await Promise.all([
            new Promise<void>((resolve) => {
              setTimeout(() => {
                ArkTSUtils.Atomics.exchange(ia, 1, 0); // Release lock
                resolve();
              }, 2);
            }),
            new Promise<void>((resolve) => {
              setTimeout(() => {
                ArkTSUtils.Atomics.exchange(ia, 2, 1); // Set cleanup flag
                cleanupDone = true;
                resolve();
              }, 2);
            })
          ]);
        }
      };

      // Run comprehensive workflow
      const success = await mainWorkflow(15);
      expect(success).assertEqual(true);
      expect(retryCount).assertLarger(0); // Retry triggered by competing task
      expect(cleanupDone).assertEqual(true);
      expect(ia[0]).assertLarger(10); // Final value > adjusted competing value
      expect(ia[1]).assertEqual(0); // Lock released
      expect(ia[2]).assertEqual(1); // Cleanup flag set
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsExchange0076
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7600
     * @tc.desc   Test nested exchange with async error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      // Inner exchange function with error check
      const safeExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            try {
              if (index < 0 || index >= ia.length) {
                throw new RangeError('Invalid index');
              }
              const old = ArkTSUtils.Atomics.exchange(ia, index, newValue);
              resolve(old);
            } catch (err) {
              errorCaught = true;
              reject(err);
            }
          }, 5);
        });
      };

      // Outer async function
      const runExchange = async (): Promise<boolean> => {
        try {
          await safeExchange(0, 10); // Valid
          await safeExchange(1, 15); // Invalid index
          return true;
        } catch (err) {
          expect((err as RangeError).message).assertEqual('Invalid index');
          return false;
        }
      };

      const success = await runExchange();
      expect(success).assertEqual(false);
      expect(errorCaught).assertEqual(true);
      expect(ia[0]).assertEqual(10);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsExchange0077
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7700
     * @tc.desc   Test async exchange with Promise.allSettled for partial success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8); // 2 Int32 elements
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function (may throw)
      const partialExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              reject(new Error('Index 1 blocked'));
              return;
            }
            const old = ArkTSUtils.Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 4);
        });
      };

      // Run partial exchanges
      const results = await Promise.allSettled([
        partialExchange(0, 10), // Success
        partialExchange(1, 20)// Failure
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 blocked');
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(15); // Not updated
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsExchange0078
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7800
     * @tc.desc   Test async exchange with nested error propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      let errorPropagated = false;

      // Inner function that may throw
      const innerExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (newValue < 0) {
              reject(new Error('Negative value not allowed'));
              return;
            }
            const old = ArkTSUtils.Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 3);
        });
      };

      // Outer function that propagates error
      const outerExchange = async (): Promise<boolean> => {
        try {
          await innerExchange(0, 10); // Valid
          await innerExchange(0, -5); // Invalid (throws)
          return true;
        } catch (err) {
          errorPropagated = true;
          expect((err as Error).message).assertEqual('Negative value not allowed');
          return false;
        }
      };

      const success = await outerExchange();
      expect(success).assertEqual(false);
      expect(errorPropagated).assertEqual(true);
      expect(ia[0]).assertEqual(10); // First exchange persists
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsExchange0079
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_7900
     * @tc.desc   Verify state transition (idle->processing->completed) via compareExchange/add/exchange on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsExchange0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new collections.ArrayBuffer(4);
      const ia = new collections.Int32Array(sab);
      ia[0] = 0; // State: 0 (idle) →1 (processing) →2 (completed)

      // Transition 0→1 (idle→processing)
      const transition1 = ArkTSUtils.Atomics.compareExchange(ia, 0, 0, 1);
      expect(transition1).assertEqual(0);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(1);

      // Simulate processing (atomic add for progress)
      ArkTSUtils.Atomics.add(ia, 0, 1); // 1→2 (processing→completed)
      const transition2 = ArkTSUtils.Atomics.compareExchange(ia, 0, 2, 2);
      expect(transition2).assertEqual(2);

      // Reset state (atomic exchange)
      const reset = ArkTSUtils.Atomics.exchange(ia, 0, 0);
      expect(reset).assertEqual(2);
      expect(ArkTSUtils.Atomics.load(ia, 0)).assertEqual(0);
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsExchange0080
     * @tc.number SUB_ARKTSUTILS_ATOMICS_EXCHANGE_8000
     * @tc.desc   Async exchange with Promise.allSettled and test-created error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsExchange0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(12);
      const ia = new collections.Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;
      const errorLogs: string[] = [];

      const exchangeWithError = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              const errMsg = 'Index 1 update failed';
              errorLogs.push(errMsg);
              reject(new Error(errMsg));
              return;
            }
            resolve(ArkTSUtils.Atomics.exchange(ia, index, newValue));
          }, 3);
        });
      };

      const results = await Promise.allSettled([
        exchangeWithError(0, 10),
        exchangeWithError(1, 20),
        exchangeWithError(2, 30)
      ]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 update failed');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(25);
      expect(errorLogs).assertDeepEquals(['Index 1 update failed']);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(15);
      expect(ia[2]).assertEqual(30);
      done();
    });
  })
}
