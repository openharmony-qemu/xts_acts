/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import { MAP_CFG } from './MapExpandCfg';
import Utils from './Util';

const MAP_BOUNDARY_CAPACITY: number = MAP_CFG.BOUND;

@Sendable
class SendableMapObjectKey {
  id: string;

  constructor(id: string) {
    this.id = id;
  }
}


@Concurrent
function concurrentMapInsertTask(
  map: collections.Map<number, number>,
  start: number,
  end: number
): number {
  let inserted: number = 0;
  for (let index = start; index < end; index++) {
    try {
      map.set(index, index * 2);
      inserted++;
    } catch (_error) {
      // A structural concurrent-modification error is an allowed outcome here.
    }
  }
  return inserted;
}

@Concurrent
function concurrentMapReadTask(map: collections.Map<number, number>): number {
  let count: number = 0;
  try {
    map.forEach(() => {
      count++;
    });
  } catch (_error) {
    // A structural concurrent-modification error is an allowed outcome here.
  }
  return count;
}

@Concurrent
function concurrentMapWriterTask(
  map: collections.Map<number, number>,
  start: number,
  end: number
): number {
  let written: number = 0;
  for (let index = start; index < end; index++) {
    try {
        map.set(index, index);
        written++;
    } catch (_error) {
      // A structural concurrent-modification error is an allowed outcome here.
    }
  }
  return written;
}

@Concurrent
async function progressMapInsertTask(
  map: collections.Map<number, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  try {
    let inserted: number = 0;
    for (let batchStart = 1000; batchStart < 1100; batchStart += 10) {
      const batchEnd: number = batchStart + 10;
      const batchInserted: number = await lock.lockAsync(() => {
        let written: number = 0;
        for (let index = batchStart; index < batchEnd; index++) {
          map.set(index, index);
          written++;
        }
        return written;
      });
      inserted += batchInserted;
      taskpool.Task.sendData(inserted);
    }
    return inserted;
  } catch (_error) {
    return -1;
  }
}

@Concurrent
function verifyMapMethodsAfterTransfer(map: collections.Map<number, string>): boolean {
  try {
    if (map.size !== 1025) {
      return false;
    }
    if (!map.has(0) || !map.has(1024) || map.has(99999)) {
      return false;
    }
    if (map.get(0) !== 'value_0' || map.get(1024) !== 'value_1024' || map.get(99999) !== undefined) {
      return false;
    }

    map.set(99999, 'temporary');
    if (map.get(99999) !== 'temporary') {
      return false;
    }
    map.set(0, 'updated_value_0');
    if (map.get(0) !== 'updated_value_0') {
      return false;
    }
    if (!map.delete(99999) || map.delete(99999)) {
      return false;
    }

    let forEachCount: number = 0;
    let forEachOwnerIsMap: boolean = true;
    map.forEach((_value: string, _key: number, owner: collections.Map<number, string>) => {
      forEachCount++;
      if (owner !== map) {
        forEachOwnerIsMap = false;
      }
    });
    if (!forEachOwnerIsMap || forEachCount !== 1025) {
      return false;
    }

    const keyIterator = map.keys();
    const firstKey = keyIterator.next();
    if (firstKey.done || firstKey.value !== 0) {
      return false;
    }
    const nextKeyIterator = map.keys();
    if (nextKeyIterator === keyIterator) {
      return false;
    }
    let keyCount: number = 1;
    while (!keyIterator.next().done) {
      keyCount++;
    }
    if (keyCount !== 1025) {
      return false;
    }

    const valueIterator = map.values();
    const firstValue = valueIterator.next();
    if (firstValue.done || firstValue.value !== 'updated_value_0') {
      return false;
    }
    const nextValueIterator = map.values();
    if (nextValueIterator === valueIterator) {
      return false;
    }
    let valueCount: number = 1;
    while (!valueIterator.next().done) {
      valueCount++;
    }
    if (valueCount !== 1025) {
      return false;
    }

    const entryIterator = map.entries();
    const firstEntry = entryIterator.next();
    if (firstEntry.done || firstEntry.value[0] !== 0 || firstEntry.value[1] !== 'updated_value_0') {
      return false;
    }
    const nextEntryIterator = map.entries();
    if (nextEntryIterator === entryIterator) {
      return false;
    }
    let entryCount: number = 1;
    while (!entryIterator.next().done) {
      entryCount++;
    }
    if (entryCount !== 1025) {
      return false;
    }

    let forOfCount: number = 0;
    for (const _entry of map) {
      forOfCount++;
    }
    if (forOfCount !== 1025) {
      return false;
    }

    map.clear();
    const clearedKey = map.keys().next();
    return clearedKey.done === true;
  } catch (_error) {
    return false;
  }
}

@Concurrent
function verifyCompleteNumberMapOnWorker(end: number): boolean {
  try {
    const map = new collections.Map<number, number>();
    for (let index = 0; index < end; index++) {
      map.set(index, index * 2);
    }
    if (map.size !== end) {
      return false;
    }

    let forEachCount: number = 0;
    let entriesCorrect: boolean = true;
    map.forEach((value: number, key: number) => {
      if (value !== key * 2) {
        entriesCorrect = false;
      }
      forEachCount++;
    });
    if (!entriesCorrect || forEachCount !== end) {
      return false;
    }

    for (let index = 0; index < end; index++) {
      if (!map.has(index) || map.get(index) !== index * 2) {
        return false;
      }
    }
    return true;
  } catch (_error) {
    return false;
  }
}

export default function CollectionsMapExpand1024Test(): void {
  describe('CollectionsMapExpand1024Test', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0100
     * @tc.name   collectionsMapExpand1024Test0001
     * @tc.desc   EXP_MAP_001: Fill a Map with 1023 numeric keys before the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: Object = await taskpool.execute(verifyCompleteNumberMapOnWorker, MAP_BOUNDARY_CAPACITY - 1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0200
     * @tc.name   collectionsMapExpand1024Test0002
     * @tc.desc   EXP_MAP_002: Preserve 0 to 1025 across the 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: Object = await taskpool.execute(verifyCompleteNumberMapOnWorker, MAP_BOUNDARY_CAPACITY + 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0300
     * @tc.name   collectionsMapExpand1024Test0003
     * @tc.desc   EXP_MAP_003: Delete representative keys after crossing the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, number>();
      expect(Utils.fillNumberMap(map, 0, 1026)).assertTrue();
      expect(map.delete(0)).assertTrue();
      expect(map.delete(512)).assertTrue();
      expect(map.delete(1023)).assertTrue();
      expect(map.has(0)).assertFalse();
      expect(map.has(512)).assertFalse();
      expect(map.has(1023)).assertFalse();
      expect(map.has(1)).assertTrue();
      expect(map.has(1024)).assertTrue();
      expect(map.size).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0400
     * @tc.name   collectionsMapExpand1024Test0004
     * @tc.desc   EXP_MAP_004: A value read before and after the boundary remains the same.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, string>();
      for (let index = 0; index < 1023; index++) {
        map.set(index, `value_${index}`);
      }
      const beforeExpansion = map.get(500);
      for (let index = 1023; index <= 1025; index++) {
        map.set(index, `value_${index}`);
      }
      expect(beforeExpansion).assertEqual('value_500');
      expect(map.get(500)).assertEqual(beforeExpansion);
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0500
     * @tc.name   collectionsMapExpand1024Test0005
     * @tc.desc   EXP_MAP_005: Preserve keys inserted before and after the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, string>();
      for (let index = 0; index < 1023; index++) {
        map.set(index, `value_${index}`);
      }
      map.set(9999, 'special_before');
      for (let index = 1023; index <= 1025; index++) {
        map.set(index, `value_${index}`);
      }
      map.set(8888, 'special_after');
      expect(map.has(9999)).assertTrue();
      expect(map.has(8888)).assertTrue();
      expect(map.get(9999)).assertEqual('special_before');
      expect(map.get(8888)).assertEqual('special_after');
      expect(map.size).assertEqual(1028);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0600
     * @tc.name   collectionsMapExpand1024Test0006
     * @tc.desc   EXP_MAP_006: Keep a NaN key available across the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, string>();
      for (let index = 0; index < 1020; index++) {
        map.set(index, `value_${index}`);
      }
      map.set(NaN, 'nan_value');
      for (let index = 1021; index <= 1025; index++) {
        map.set(index, `value_${index}`);
      }
      expect(map.has(NaN)).assertTrue();
      expect(map.get(NaN)).assertEqual('nan_value');
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0700
     * @tc.name   collectionsMapExpand1024Test0007
     * @tc.desc   EXP_MAP_007: Treat 0 and -0 as an update to one numeric key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, string>();
      for (let index = 1; index <= 1020; index++) {
        map.set(index, `value_${index}`);
      }
      map.set(0, 'zero_value');
      map.set(-0, 'negative_zero_value');
      for (let index = 1021; index <= 1025; index++) {
        map.set(index, `value_${index}`);
      }
      expect(map.has(0)).assertTrue();
      expect(map.has(-0)).assertTrue();
      expect(map.get(0)).assertEqual('negative_zero_value');
      expect(map.get(-0)).assertEqual('negative_zero_value');
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0800
     * @tc.name   collectionsMapExpand1024Test0008
     * @tc.desc   EXP_MAP_008 replacement: Sendable object keys preserve identity at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<SendableMapObjectKey, string>();
      for (let index = 0; index < 1020; index++) {
        map.set(new SendableMapObjectKey(`key_${index}`), `value_${index}`);
      }
      const firstKey = new SendableMapObjectKey('symbol-like-boundary');
      const distinctKey = new SendableMapObjectKey('symbol-like-boundary');
      map.set(firstKey, 'symbol_like_value');
      for (let index = 1021; index <= 1025; index++) {
        map.set(new SendableMapObjectKey(`key_${index}`), `value_${index}`);
      }
      expect(map.has(firstKey)).assertTrue();
      expect(map.get(firstKey)).assertEqual('symbol_like_value');
      expect(map.has(distinctKey)).assertFalse();
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_0900
     * @tc.name   collectionsMapExpand1024Test0009
     * @tc.desc   EXP_MAP_009: Preserve a 100000-character string key at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<string, number>();
      for (let index = 0; index < 1020; index++) {
        map.set(`key_${index}`, index);
      }
      const longKey = 'a'.repeat(100000);
      map.set(longKey, 9999);
      for (let index = 1021; index <= 1025; index++) {
        map.set(`key_${index}`, index);
      }
      expect(map.has(longKey)).assertTrue();
      expect(map.get(longKey)).assertEqual(9999);
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1000
     * @tc.name   collectionsMapExpand1024Test0010
     * @tc.desc   EXP_MAP_010: Preserve an emoji string key at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<string, number>();
      for (let index = 0; index < 1020; index++) {
        map.set(`key_${index}`, index);
      }
      const emojiKey = '🧪🎈🎉🔟';
      map.set(emojiKey, 8888);
      for (let index = 1021; index <= 1025; index++) {
        map.set(`key_${index}`, index);
      }
      expect(map.has(emojiKey)).assertTrue();
      expect(map.get(emojiKey)).assertEqual(8888);
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1100
     * @tc.name   collectionsMapExpand1024Test0011
     * @tc.desc   EXP_MAP_011: Distinguish a zero-width-space string key at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<string, number>();
      for (let index = 0; index < 1020; index++) {
        map.set(`key_${index}`, index);
      }
      const zeroWidthKey = 'a\u200Bb';
      map.set(zeroWidthKey, 7777);
      for (let index = 1021; index <= 1025; index++) {
        map.set(`key_${index}`, index);
      }
      expect(map.has(zeroWidthKey)).assertTrue();
      expect(map.get(zeroWidthKey)).assertEqual(7777);
      expect(map.has('ab')).assertFalse();
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1200
     * @tc.name   collectionsMapExpand1024Test0012
     * @tc.desc   EXP_MAP_012: Preserve object-reference key identity at the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<SendableMapObjectKey, number>();
      for (let index = 0; index < 1020; index++) {
        map.set(new SendableMapObjectKey(String(index)), index);
      }
      const specialKey = new SendableMapObjectKey('special');
      map.set(specialKey, 9999);
      for (let index = 1021; index <= 1025; index++) {
        map.set(new SendableMapObjectKey(String(index)), index);
      }
      expect(map.has(specialKey)).assertTrue();
      expect(map.get(specialKey)).assertEqual(9999);
      expect(map.has(new SendableMapObjectKey('special'))).assertFalse();
      expect(map.size).assertEqual(1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1300
     * @tc.name   collectionsMapExpand1024Test0013
     * @tc.desc   EXP_MAP_013: Delete 100 keys after crossing the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, number>();
      for (let index = 0; index <= 1025; index++) {
        map.set(index, index);
      }
      for (let index = 0; index < 100; index++) {
        expect(map.delete(index)).assertTrue();
      }
      expect(map.size).assertEqual(926);
      expect(map.has(0)).assertFalse();
      expect(map.has(100)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1400
     * @tc.name   collectionsMapExpand1024Test0014
     * @tc.desc   EXP_MAP_014: Tolerate three concurrent TaskPool writers around 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, number>();
      expect(Utils.fillNumberMap(map, 0, 1000)).assertTrue();
      const results: Object[] = await Promise.all([
        taskpool.execute(concurrentMapInsertTask, map, 1000, 1034),
        taskpool.execute(concurrentMapInsertTask, map, 1034, 1067),
        taskpool.execute(concurrentMapInsertTask, map, 1067, 1100)
      ]);
      let insertedCount: number = 0;
      for (let index = 0; index < results.length; index++) {
        const inserted = results[index];
        expect(typeof inserted === 'number').assertTrue();
        if (typeof inserted === 'number') {
          expect(inserted).assertLargerOrEqual(0);
          insertedCount += inserted;
        }
      }
      expect(map.size).assertEqual(1000 + insertedCount);
      let visibleCount: number = 0;
      for (let index = 1000; index < 1100; index++) {
        if (map.has(index)) {
          visibleCount++;
          expect(map.get(index)).assertEqual(index * 2);
        }
      }
      expect(visibleCount).assertEqual(insertedCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1500
     * @tc.name   collectionsMapExpand1024Test0015
     * @tc.desc   EXP_MAP_015: Tolerate a concurrent reader and writer around 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'collectionsMapExpand1024Test0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        const map = new collections.Map<number, number>();
        for (let index = 0; index < 1020; index++) {
          map.set(index, index);
        }
        const results: Object[] = await Promise.all([
          taskpool.execute(concurrentMapReadTask, map),
          taskpool.execute(concurrentMapWriterTask, map, 1020, 1030)
        ]);
        const readerCount: Object = results[0];
        const writtenCount: Object = results[1];
        expect(typeof readerCount === 'number').assertTrue();
        expect(typeof writtenCount === 'number').assertTrue();
        if (typeof readerCount === 'number') {
          // The reader must observe at least every initial element and at most every
          // successfully written element, so its count stays within [1020, 1020 + written].
          expect(readerCount).assertLargerOrEqual(1020);
          expect(readerCount).assertLessOrEqual(map.size);
        }
        if (typeof writtenCount === 'number') {
          expect(writtenCount).assertLessOrEqual(10);
          expect(map.size).assertEqual(1020 + writtenCount);
          let visibleCount: number = 0;
          for (let index = 1020; index < 1030; index++) {
            if (map.has(index)) {
              visibleCount++;
              expect(map.get(index)).assertEqual(index);
            }
          }
          expect(visibleCount).assertEqual(writtenCount);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1600
     * @tc.name   collectionsMapExpand1024Test0016
     * @tc.desc   EXP_MAP_016: forEach count matches size after representative deletes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, number>();
      for (let index = 0; index <= 1025; index++) {
        map.set(index, index);
      }
      expect(map.delete(0)).assertTrue();
      expect(map.delete(512)).assertTrue();
      expect(map.delete(1023)).assertTrue();
      let count: number = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(map.size);
      expect(map.size).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1700
     * @tc.name   collectionsMapExpand1024Test0017
     * @tc.desc   EXP_MAP_017: Receive TaskPool insertion progress around 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, number>();
      const lock = new ArkTSUtils.locks.AsyncLock();
      for (let index = 0; index < 1000; index++) {
        map.set(index, index);
      }
      const progressList: number[] = [];
      const task = new taskpool.Task(progressMapInsertTask, map, lock);
      task.onReceiveData((data: Object) => {
        if (typeof data === 'number') {
          progressList.push(data);
        }
      });
      try {
        const result: Object = await taskpool.execute(task);
        expect(result).assertEqual(100);
        expect(progressList.length).assertLargerOrEqual(1);
        expect(map.size).assertEqual(1100);
        expect(map.has(1099)).assertTrue();
      } finally {
        task.onReceiveData();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1800
     * @tc.name   collectionsMapExpand1024Test0018
     * @tc.desc   EXP_MAP_018: Verify supported Map APIs after TaskPool transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, string>();
      for (let index = 0; index < 1025; index++) {
        map.set(index, `value_${index}`);
      }
      const result: Object = await taskpool.execute(verifyMapMethodsAfterTransfer, map);
      expect(result).assertEqual(true);
      expect(map.size).assertEqual(0);
      expect(map.keys().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_MAP_EXPANSION_1024_1900
     * @tc.name   collectionsMapExpand1024Test0019
     * @tc.desc   EXP_MAP_019: Repeated keys stay unique while crossing the boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapExpand1024Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new collections.Map<number, number>();
      for (let index = 0; index < 1023; index++) {
        map.set(index, index);
      }
      for (let index = 0; index < 100; index++) {
        map.set(0, 0);
      }
      expect(map.size).assertEqual(1023);
      map.set(1023, 1023);
      expect(map.size).assertEqual(1024);
      map.set(1024, 1024);
      expect(map.size).assertEqual(1025);
      for (let index = 0; index < 100; index++) {
        map.set(0, 0);
      }
      expect(map.size).assertEqual(1025);
      map.set(1025, 1025);
      expect(map.size).assertEqual(1026);
      for (let index = 0; index <= 1025; index++) {
        expect(map.get(index)).assertEqual(index);
      }
      map.set(NaN, NaN);
      expect(map.size).assertEqual(1027);
      expect(Number.isNaN(map.get(NaN))).assertTrue();
      map.set(NaN, -2);
      expect(map.size).assertEqual(1027);
      expect(map.get(NaN)).assertEqual(-2);
      map.set(-0, -0);
      expect(map.size).assertEqual(1027);
      const negativeZeroValue = map.get(0);
      expect(negativeZeroValue === 0).assertTrue();
      if (negativeZeroValue !== undefined) {
        expect(1 / negativeZeroValue < 0).assertTrue();
      }
      let entriesCorrect: boolean = true;
      map.forEach((value: number, key: number) => {
        if (Number.isNaN(key)) {
          if (value !== -2) {
            entriesCorrect = false;
          }
        } else if (key === 0) {
          if (value !== 0) {
            entriesCorrect = false;
          }
        } else if (value !== key) {
          entriesCorrect = false;
        }
      });
      expect(entriesCorrect).assertTrue();
    });
  });
}
