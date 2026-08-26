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