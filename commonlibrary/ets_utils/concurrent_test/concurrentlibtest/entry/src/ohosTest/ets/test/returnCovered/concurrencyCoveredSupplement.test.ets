import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool, worker } from '@kit.ArkTS';
import { sleep } from './utils';


export default function concurrencyCoveredSupplement() {
  describe('concurrencyCoveredSupplement', () => {
    afterEach(async () => {
      await sleep(10)
    })

    // ==================== Section 1: Collections constructors 10200012 (without new) ====================

    /**
     * @tc.name   concurrencyCoveredSupplement001
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0101
     * @tc.desc   Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let valid = new collections.Array<number>();
        let ctor = collections.Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Array<number>(1);
        let ctor = collections.Array as Function;
        (ctor as Function)(1);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Array<number>(1, 2, 3);
        let ctor = collections.Array as Function;
        (ctor as Function)(1, 2, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let arrayPara = [1, 2, 3];
        let array = new collections.Array<number>(...arrayPara);
        let ctor = collections.Array as Function;
        (ctor as Function)(...arrayPara);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement002
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0102
     * @tc.desc   Map constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let valid = new collections.Map<number, string>();
        let ctor = collections.Map as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Map<number, string>([[1, 'a'], [2, 'b']]);
        let ctor = collections.Map as Function;
        (ctor as Function)([[1, 'a'], [2, 'b']]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement003
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0103
     * @tc.desc   Set constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let valid = new collections.Set<number>();
        let ctor = collections.Set as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Set<number>([1, 2, 3]);
        let ctor = collections.Set as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement004
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0104
     * @tc.desc   ArrayBuffer constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let valid = new collections.ArrayBuffer(8);
        let ctor = collections.ArrayBuffer as Function;
        (ctor as Function)(8);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement005
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0105
     * @tc.desc   Int8Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Int8Array();
        let ctor = collections.Int8Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int8Array(4);
        let ctor = collections.Int8Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int8Array([1, 2, 3]);
        let ctor = collections.Int8Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int8Array(buffer);
        let ctor = collections.Int8Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int8Array(buffer, 0, 4);
        let ctor = collections.Int8Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement006
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0106
     * @tc.desc   Uint8Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Uint8Array();
        let ctor = collections.Uint8Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8Array(4);
        let ctor = collections.Uint8Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8Array([1, 2, 3]);
        let ctor = collections.Uint8Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8Array(buffer);
        let ctor = collections.Uint8Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8Array(buffer, 0, 4);
        let ctor = collections.Uint8Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement007
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0107
     * @tc.desc   Int16Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Int16Array();
        let ctor = collections.Int16Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int16Array(4);
        let ctor = collections.Int16Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int16Array([1, 2, 3]);
        let ctor = collections.Int16Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int16Array(buffer);
        let ctor = collections.Int16Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int16Array(buffer, 0, 4);
        let ctor = collections.Int16Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement008
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0108
     * @tc.desc   Uint16Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Uint16Array();
        let ctor = collections.Uint16Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint16Array(4);
        let ctor = collections.Uint16Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint16Array([1, 2, 3]);
        let ctor = collections.Uint16Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint16Array(buffer);
        let ctor = collections.Uint16Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint16Array(buffer, 0, 4);
        let ctor = collections.Uint16Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement009
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0109
     * @tc.desc   Int32Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Int32Array();
        let ctor = collections.Int32Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int32Array(4);
        let ctor = collections.Int32Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int32Array([1, 2, 3]);
        let ctor = collections.Int32Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int32Array(buffer);
        let ctor = collections.Int32Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Int32Array(buffer, 0, 4);
        let ctor = collections.Int32Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement010
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0110
     * @tc.desc   Uint32Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Uint32Array();
        let ctor = collections.Uint32Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint32Array(4);
        let ctor = collections.Uint32Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint32Array([1, 2, 3]);
        let ctor = collections.Uint32Array as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint32Array(buffer);
        let ctor = collections.Uint32Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint32Array(buffer, 0, 4);
        let ctor = collections.Uint32Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement011
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0111
     * @tc.desc   Uint8ClampedArray constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Uint8ClampedArray();
        let ctor = collections.Uint8ClampedArray as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8ClampedArray(4);
        let ctor = collections.Uint8ClampedArray as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8ClampedArray([1, 2, 3]);
        let ctor = collections.Uint8ClampedArray as Function;
        (ctor as Function)([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8ClampedArray(buffer);
        let ctor = collections.Uint8ClampedArray as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Uint8ClampedArray(buffer, 0, 4);
        let ctor = collections.Uint8ClampedArray as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    /**
     * @tc.name   concurrencyCoveredSupplement012
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0112
     * @tc.desc   Float32Array constructor cannot be directly invoked 10200012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(16);
      try {
        let valid = new collections.Float32Array();
        let ctor = collections.Float32Array as Function;
        (ctor as Function)();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Float32Array(4);
        let ctor = collections.Float32Array as Function;
        (ctor as Function)(4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Float32Array([1.1, 2.2, 3.3]);
        let ctor = collections.Float32Array as Function;
        (ctor as Function)([1.1, 2.2, 3.3]);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Float32Array(buffer);
        let ctor = collections.Float32Array as Function;
        (ctor as Function)(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
      try {
        let valid = new collections.Float32Array(buffer, 0, 4);
        let ctor = collections.Float32Array as Function;
        (ctor as Function)(buffer, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200012);
      }
    });

    // ==================== Section 2: Collections input param gaps ====================

    /**
     * @tc.name   concurrencyCoveredSupplement013
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0113
     * @tc.desc   Array constructor input param coverage: empty array and non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = []
      let arr1 = [1, 2, 3]
      let emptyArr: collections.Array<number> = new collections.Array<number>(...arr);
      expect(emptyArr.length).assertEqual(0);
      let nonEmptyArr: collections.Array<number> = new collections.Array<number>(...arr1);
      expect(nonEmptyArr.length).assertEqual(3);
      let ofEmpty: collections.Array<number> = collections.Array.of<number>(...arr);
      expect(ofEmpty.length).assertEqual(0);
      let ofNonEmpty: collections.Array<number> = collections.Array.of<number>(...arr1);
      expect(ofNonEmpty.length).assertEqual(3);
      let pushEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2);
      let pushResult = pushEmptyArr.push(...arr);
      expect(pushResult).assertEqual(2);
      let pushResult2 = pushEmptyArr.push(...arr1);
      expect(pushResult2).assertEqual(5);
      let unshiftEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2);
      let unshiftResult = unshiftEmptyArr.unshift(...arr);
      expect(unshiftResult).assertEqual(2);
      let unshiftNonEmptyArr: collections.Array<number> = new collections.Array<number>(1);
      let unshiftResult2 = unshiftNonEmptyArr.unshift(...arr1);
      expect(unshiftResult2).assertEqual(4);
    });

    /**
     * @tc.name   concurrencyCoveredSupplement014
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0114
     * @tc.desc   Map constructor input param coverage: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let mapNull: collections.Map<number | null | undefined, string | null | undefined> =
        new collections.Map<number | null | undefined, string | null | undefined>(null);
      expect(mapNull.size).assertEqual(0);
      let mapEmpty: collections.Map<number | null | undefined, string | null | undefined> =
        new collections.Map<number | null | undefined, string | null | undefined>([]);
      expect(mapEmpty.size).assertEqual(0);
      let mapUndefined: collections.Map<number | null | undefined, string | null | undefined> =
        new collections.Map<number | null | undefined, string | null | undefined>(undefined);
      expect(mapUndefined.size).assertEqual(0);
    });

    /**
     * @tc.name   concurrencyCoveredSupplement015
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0115
     * @tc.desc   Set constructor input param coverage: null, empty array, non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let setNull: collections.Set<number | null | undefined> = new collections.Set<number | null | undefined>(null);
      expect(setNull.size).assertEqual(0);
      let setUndefined: collections.Set<number | null | undefined> =
        new collections.Set<number | null | undefined>(undefined);
      expect(setUndefined.size).assertEqual(0);
      let setEmpty: collections.Set<number | null | undefined> = new collections.Set<number | null | undefined>([]);
      expect(setEmpty.size).assertEqual(0);
      let setNonEmpty: collections.Set<number | null | undefined> =
        new collections.Set<number | null | undefined>([1, 2, 3]);
      expect(setNonEmpty.size).assertEqual(3);
    });

    /**
     * @tc.name   concurrencyCoveredSupplement039
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0139
     * @tc.desc   ArkTSUtils.lockAsync mode param out of enum range throws 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('concurrencyCoveredSupplement039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let lock = ArkTSUtils.locks.AsyncLock.request('testLock39');
        await lock.lockAsync(() => {
        }, 3 as ArkTSUtils.locks.AsyncLockMode);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });
  })
}
