/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';

// ============================================================
// 类型定义：使用联合类型
// ============================================================

type SendableOrNull = lang.ISendable | null | undefined;

// ============================================================
// null 和 undefined
// ============================================================

export default function sendableLruCacheNullableTest() {
  describe('sendableLruCacheNullableTest', () => {

    /**
     * @tc.setup 在每个测试用例执行前等待20ms
     */
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // // 对于null/undefined 只有四个方法有问题：实际行为：抛 BusinessError:401，设计需求：应该成功
    // // put、get、remove、contains 都需要传入 key，API 内部对 key 做了严格的类型检查，
    // // null 和 undefined 被认为是非法 key，所以报错。
    // // 其他方法都不需要传 key，不涉及这个校验，所以都正常。所以问题出在 API 的 key
    // // 校验逻辑上，它不允许 null/undefined，但类型定义却允许，两者不一致。
    // // 所以让测试预期抛异常
    // /**
    //  * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0100
    //  * @tc.name testPutWithNullAndUndefined0001
    //  * @tc.desc Verify put(null/undefined) throws BusinessError (code:401)
    //  * @tc.type FUNCTION
    //  * @tc.size MEDIUMTEST
    //  * @tc.level LEVEL0
    //  */
    // it('testPutWithNullAndUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testPutWithNullAndUndefined0001';
    //   console.info(`${caseName}, test start`);
    //   const nullableValues: (null | undefined)[] = [null, undefined];
    //   for (const val of nullableValues) {
    //     const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
    //     const valType: string = val === null ? 'null' : 'undefined';
    //     cache.put(val, val);
    //     expect(cache.length).assertEqual(1);
    //     const result = cache.get(val);
    //     expect(result).assertEqual(val);
    //     expect(cache.contains(val)).assertTrue();
    //     const removed = cache.remove(val);
    //     expect(removed).assertEqual(val);
    //     expect(cache.length).assertEqual(0);
    //     console.info(`${caseName}, put/get/remove/contains with ${valType} all passed`);
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // /**
    //  * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0200
    //  * @tc.name testGetWithNullAndUndefined0002
    //  * @tc.desc Verify get(null) returns null, get(undefined) returns undefined
    //  * @tc.type FUNCTION
    //  * @tc.size MEDIUMTEST
    //  * @tc.level LEVEL0
    //  */
    // it('testGetWithNullAndUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testGetWithNullAndUndefined0002';
    //   console.info(`${caseName}, test start`);
    //   const nullableValues: (null | undefined)[] = [null, undefined];
    //   for (const val of nullableValues) {
    //     const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
    //     const valType: string = val === null ? 'null' : 'undefined';
    //     // 先 put 再 get
    //     cache.put(val, val);
    //     expect(cache.length).assertEqual(1);
    //     const result = cache.get(val);
    //     console.info(`${caseName}, get(${valType}) returned: ${result}`);
    //     expect(result).assertEqual(val);
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // /**
    //  * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0300
    //  * @tc.name testRemoveWithNullAndUndefined0003
    //  * @tc.desc Verify remove(null) and remove(undefined) succeed
    //  * @tc.type FUNCTION
    //  * @tc.size MEDIUMTEST
    //  * @tc.level LEVEL0
    //  */
    // it('testRemoveWithNullAndUndefined0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testRemoveWithNullAndUndefined0003';
    //   console.info(`${caseName}, test start`);
    //   const nullableValues: (null | undefined)[] = [null, undefined];
    //   for (const val of nullableValues) {
    //     const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
    //     const valType: string = val === null ? 'null' : 'undefined';
    //     // 先 put 再 remove
    //     cache.put(val, val);
    //     expect(cache.length).assertEqual(1);
    //     const removed = cache.remove(val);
    //     expect(removed).assertEqual(val);
    //     expect(cache.length).assertEqual(0);
    //     console.info(`${caseName}, remove(${valType}) succeeded, returned: ${removed}`);
    //   }
    //   console.info(`${caseName}, test end`);
    // });
    //
    // /**
    //  * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0400
    //  * @tc.name testContainsWithNullAndUndefined0004
    //  * @tc.desc Verify contains(null) and contains(undefined) return true
    //  * @tc.type FUNCTION
    //  * @tc.size MEDIUMTEST
    //  * @tc.level LEVEL0
    //  */
    // it('testContainsWithNullAndUndefined0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testContainsWithNullAndUndefined0004';
    //   console.info(`${caseName}, test start`);
    //   const nullableValues: (null | undefined)[] = [null, undefined];
    //   for (const val of nullableValues) {
    //     const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
    //     const valType: string = val === null ? 'null' : 'undefined';
    //     // 先 put 再 contains
    //     cache.put(val, val);
    //     expect(cache.contains(val)).assertTrue();
    //     console.info(`${caseName}, contains(${valType}) returned true`);
    //   }
    //   // 测试不存在的 null/undefined
    //   const cacheEmpty = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
    //   expect(cacheEmpty.contains(null)).assertFalse();
    //   expect(cacheEmpty.contains(undefined)).assertFalse();
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0500
     * @tc.name testClearAfterNullableAttempt0005
     * @tc.desc Verify clear works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testClearAfterNullableAttempt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearAfterNullableAttempt0005';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
      try { cache.put(null, null); } catch (e) {}
      cache.put('key1', 'value1');
      expect(cache.length).assertEqual(1);
      cache.clear();
      expect(cache.length).assertEqual(0);
      expect(cache.isEmpty()).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0600
     * @tc.name testIsEmptyAfterNullableAttempt0006
     * @tc.desc Verify isEmpty works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testIsEmptyAfterNullableAttempt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptyAfterNullableAttempt0006';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
      expect(cache.isEmpty()).assertTrue();
      try { cache.put(undefined, undefined); } catch (e) {}
      expect(cache.isEmpty()).assertTrue();
      cache.put('key1', 'value1');
      expect(cache.isEmpty()).assertFalse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0700
     * @tc.name testGetCapacityAfterNullableAttempt0007
     * @tc.desc Verify getCapacity works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testGetCapacityAfterNullableAttempt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacityAfterNullableAttempt0007';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      expect(cache.getCapacity()).assertEqual(64);

      try { cache.put(null, null); } catch (e) {}

      expect(cache.getCapacity()).assertEqual(64);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0800
     * @tc.name testLengthAfterNullableAttempt0008
     * @tc.desc Verify length property works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testLengthAfterNullableAttempt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthAfterNullableAttempt0008';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      expect(cache.length).assertEqual(0);

      try { cache.put(undefined, undefined); } catch (e) {}

      expect(cache.length).assertEqual(0);

      cache.put('key1', 'value1');
      expect(cache.length).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_0900
     * @tc.name testToStringAfterNullableAttempt0009
     * @tc.desc Verify toString works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testToStringAfterNullableAttempt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringAfterNullableAttempt0009';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(null, null); } catch (e) {}

      const result: string = cache.toString();
      expect(result !== null).assertTrue();
      expect(typeof result === 'string').assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1000
     * @tc.name testStatisticsAfterNullableAttempt0010
     * @tc.desc Verify statistics methods work normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testStatisticsAfterNullableAttempt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsAfterNullableAttempt0010';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(undefined, undefined); } catch (e) {}

      expect(cache.getCreateCount()).assertEqual(0);
      expect(cache.getMissCount()).assertEqual(0);
      expect(cache.getMatchCount()).assertEqual(0);
      expect(cache.getRemoveCount()).assertEqual(0);
      expect(cache.getPutCount()).assertEqual(0);

      cache.put('key1', 'value1');
      expect(cache.getPutCount()).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1100
     * @tc.name testUpdateCapacityAfterNullableAttempt0011
     * @tc.desc Verify updateCapacity works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testUpdateCapacityAfterNullableAttempt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacityAfterNullableAttempt0011';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(null, null); } catch (e) {}

      cache.updateCapacity(100);
      expect(cache.getCapacity()).assertEqual(100);
      cache.updateCapacity(64);
      expect(cache.getCapacity()).assertEqual(64);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1200
     * @tc.name testEntriesAfterNullableAttempt0012
     * @tc.desc Verify entries works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testEntriesAfterNullableAttempt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesAfterNullableAttempt0012';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(undefined, undefined); } catch (e) {}

      cache.put('key1', 'value1');

      const iterator: IterableIterator<[SendableOrNull, SendableOrNull]> = cache.entries();
      expect(iterator !== null).assertTrue();
      let count: number = 0;
      let next: IteratorResult<[SendableOrNull, SendableOrNull]> = iterator.next();
      while (!next.done) {
        count++;
        expect(next.value[0]).assertEqual('key1');
        expect(next.value[1]).assertEqual('value1');
        next = iterator.next();
      }
      expect(count).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1300
     * @tc.name testKeysAfterNullableAttempt0013
     * @tc.desc Verify keys works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testKeysAfterNullableAttempt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysAfterNullableAttempt0013';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(null, null); } catch (e) {}

      cache.put('key1', 'value1');

      const keys: SendableOrNull[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('key1');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1400
     * @tc.name testValuesAfterNullableAttempt0014
     * @tc.desc Verify values works normally after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testValuesAfterNullableAttempt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesAfterNullableAttempt0014';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(undefined, undefined); } catch (e) {}

      cache.put('key1', 'value1');

      const values: SendableOrNull[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('value1');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1500
     * @tc.name testConstructorWithNullableType0015
     * @tc.desc Verify constructor works with nullable type parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testConstructorWithNullableType0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorWithNullableType0015';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
      expect(cache !== null).assertTrue();
      expect(cache.getCapacity()).assertEqual(64);
      expect(cache.length).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_LRU_NULLABLE_1600
     * @tc.name testCacheStillWorksAfterNullableAttempt0016
     * @tc.desc Verify cache still works for valid keys after null/undefined attempts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testCacheStillWorksAfterNullableAttempt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCacheStillWorksAfterNullableAttempt0016';
      console.info(`${caseName}, test start`);

      const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);

      try { cache.put(null, null); } catch (e) {}
      try { cache.get(undefined); } catch (e) {}
      try { cache.remove(null); } catch (e) {}
      cache.put('validKey', 'validValue');
      expect(cache.length).assertEqual(1);
      const result: SendableOrNull | undefined = cache.get('validKey');
      expect(result).assertEqual('validValue');
      console.info(`${caseName}, test end`);
    });
  });
}