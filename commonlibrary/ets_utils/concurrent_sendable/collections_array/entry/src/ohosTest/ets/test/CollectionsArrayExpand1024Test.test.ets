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
import { collections, taskpool } from '@kit.ArkTS';
import { ARRAY_CFG } from './ArrayExpandCfg';

@Sendable
class SendableObj {
  id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

@Concurrent
function concurrentPushTask(arr: collections.Array<number>, start: number, end: number): number {
  let pushed = 0;
  for (let i = start; i < end; i++) {
    try {
      arr.push(i);
      pushed++;
    } catch (e) {
    }
  }
  return pushed;
}

@Concurrent
function readerTask(arr: collections.Array<number>): number {
  let count = 0;
  try {
    arr.forEach((): void => {
      count++;
    });
  } catch (e) {
  }
  return count;
}

@Concurrent
function writerTask(arr: collections.Array<number>, start: number, end: number): number {
  let pushed = 0;
  for (let i = start; i < end; i++) {
    try {
      arr.push(i);
      pushed++;
    } catch (e) {
    }
  }
  return pushed;
}

@Concurrent
function progressTask(arr: collections.Array<number>): number {
  let pushed = 0;
  let expansionObserved = false;
  for (let i = 1000; i < 1100; i++) {
    arr.push(i);
    pushed++;
    if (!expansionObserved && Number(arr.length) > 1024) {
      expansionObserved = true;
      taskpool.Task.sendData({ 'expanded': 1 });
    }
    if (i % 10 === 0) {
      taskpool.Task.sendData({ 'progress': pushed });
    }
  }
  taskpool.Task.sendData({ 'progress': pushed });
  return pushed;
}

@Concurrent
function verifyArrayAllMethodsAfterTransfer(arr: collections.Array<number>): string {
  if (arr.length !== 1025) {
    return 'length mismatch: ' + arr.length;
  }
  if (arr[0] !== 0 || arr[1024] !== 1024) {
    return 'index access mismatch';
  }
  arr.push(99999);
  if (Number(arr.length) !== 1026) {
    return 'push mismatch';
  }
  if (arr.pop() !== 99999) {
    return 'pop mismatch';
  }
  if (arr.length !== 1025) {
    return 'length after pop mismatch';
  }
  if (arr.shift() !== 0) {
    return 'shift mismatch';
  }
  if (Number(arr.length) !== 1024) {
    return 'length after shift mismatch';
  }
  arr.unshift(0);
  if (arr.length !== 1025) {
    return 'unshift mismatch';
  }
  arr.splice(0, 1, 100);
  if (Number(arr[0]) !== 100) {
    return 'splice insert mismatch';
  }
  arr.splice(0, 1, 0);
  if (arr.indexOf(0) !== 0) {
    return 'indexOf mismatch: ' + arr.indexOf(0);
  }
  if (arr.indexOf(99999) !== -1) {
    return 'indexOf missing mismatch: ' + arr.indexOf(99999);
  }
  if (!arr.includes(1024)) {
    return 'includes mismatch';
  }
  if (arr.includes(99999)) {
    return 'includes missing mismatch';
  }
  if (arr.find((v: number): boolean => v === 512) !== 512) {
    return 'find mismatch';
  }
  if (arr.findIndex((v: number): boolean => v === 512) !== 512) {
    return 'findIndex mismatch';
  }
  if (arr.find((v: number): boolean => v === 99999) !== undefined) {
    return 'find missing mismatch';
  }
  if (!arr.some((v: number): boolean => v === 1024)) {
    return 'some mismatch';
  }
  if (!arr.every((v: number): boolean => v >= 0)) {
    return 'every mismatch';
  }
  const filtered: collections.Array<number> = arr.filter((v: number): boolean => v < 10);
  if (!filtered.includes(0)) {
    return 'filter includes mismatch';
  }
  if (filtered.includes(99999)) {
    return 'filter excludes mismatch';
  }
  let filterCount = 0;
  arr.forEach((v: number): void => {
    if (v < 10) {
      filterCount++;
    }
  });
  if (filterCount !== 10) {
    return 'filter count mismatch: ' + filterCount;
  }
  const mapped: collections.Array<number> = arr.map((v: number): number => v * 2);
  if (mapped[0] !== 0 || mapped[1024] !== 2048) {
    return 'map mismatch';
  }
  const reduced: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
  if (reduced !== 1024 * 1025 / 2) {
    return 'reduce mismatch: ' + reduced;
  }
  const sliced: collections.Array<number> = arr.slice(0, 5);
  if (sliced.length !== 5) {
    return 'slice mismatch';
  }
  const joined: string = arr.join(',');
  if (joined.split(',').length !== 1025) {
    return 'join mismatch: ' + joined.split(',').length;
  }
  const concatSrc: collections.Array<number> = new collections.Array<number>();
  concatSrc.push(99999);
  const concat: collections.Array<number> = arr.concat(concatSrc);
  if (concat.length !== 1026) {
    return 'concat mismatch';
  }
  if (arr.at(0) !== 0) {
    return 'at positive mismatch';
  }
  if (arr.at(-1) !== 1024) {
    return 'at negative mismatch';
  }
  let forEachCount = 0;
  let forEachOwnerValid = true;
  arr.forEach((v: number, i: number, owner: collections.Array<number>): void => {
    forEachCount++;
    if (owner !== arr) {
      forEachOwnerValid = false;
    }
  });
  if (forEachCount !== 1025) {
    return 'forEach count mismatch: ' + forEachCount;
  }
  if (!forEachOwnerValid) {
    return 'forEach owner mismatch';
  }
  let keyCount = 0;
  const keyIter: Iterator<number> = arr.keys();
  const firstKey: IteratorResult<number> = keyIter.next();
  if (firstKey.done !== false || firstKey.value !== 0) {
    return 'keys first mismatch';
  }
  while (!keyIter.next().done) {
    keyCount++;
  }
  if (keyCount !== 1024) {
    return 'keys count mismatch: ' + keyCount;
  }
  let valueCount = 0;
  const valueIter: Iterator<number> = arr.values();
  const firstValue: IteratorResult<number> = valueIter.next();
  if (firstValue.done !== false) {
    return 'values first mismatch';
  }
  while (!valueIter.next().done) {
    valueCount++;
  }
  if (valueCount !== 1024) {
    return 'values count mismatch: ' + valueCount;
  }
  let entryCount = 0;
  const entryIter: Iterator<number[]> = arr.entries();
  const firstEntry: IteratorResult<number[]> = entryIter.next();
  if (firstEntry.done !== false) {
    return 'entries first mismatch';
  }
  while (!entryIter.next().done) {
    entryCount++;
  }
  if (entryCount !== 1024) {
    return 'entries count mismatch: ' + entryCount;
  }
  let ofCount = 0;
  for (const v of arr) {
    ofCount++;
  }
  if (ofCount !== 1025) {
    return 'for-of count mismatch: ' + ofCount;
  }
  try {
    const fillSrc: collections.Array<number> = arr.slice(0, arr.length);
    fillSrc.fill(7);
    if (fillSrc[0] !== 7 || fillSrc[fillSrc.length - 1] !== 7) {
      return 'fill mismatch';
    }
  } catch (e) {
    return 'fill throw';
  }
  try {
    const cwSrc: collections.Array<number> = arr.slice(0, arr.length);
    cwSrc.copyWithin(0, 3, 6);
    if (cwSrc[0] !== 3 || cwSrc[1] !== 4 || cwSrc[2] !== 5) {
      return 'copyWithin mismatch';
    }
  } catch (e) {
    return 'copyWithin throw';
  }
  try {
    const revSrc: collections.Array<number> = arr.slice(0, arr.length);
    revSrc.reverse();
    if (revSrc[0] !== 1024 || revSrc[revSrc.length - 1] !== 0) {
      return 'reverse mismatch';
    }
  } catch (e) {
    return 'reverse throw';
  }
  try {
    const sortSrc: collections.Array<number> = arr.slice(0, arr.length);
    sortSrc.reverse();
    sortSrc.sort((a: number, b: number): number => a - b);
    if (sortSrc[0] !== 0 || sortSrc[sortSrc.length - 1] !== 1024) {
      return 'sort mismatch';
    }
  } catch (e) {
    return 'sort throw';
  }
  return '';
}

@Concurrent
function verifyArray2048Elements(arr: collections.Array<number>): number {
  for (let i = 0; i < 2048; i++) {
    arr.push(i);
  }
  if (arr.length !== 2048) {
    return 0;  // Length mismatch, return first index indicator
  }
  for (let i = 0; i < 2048; i++) {
    if (arr[i] !== i) {
      return i;  // Return first mismatched index
    }
  }
  return -1;  // All elements verified
}

export default function CollectionsArrayExpand1024Test(): void {
  describe('CollectionsArrayExpand1024Test', () => {

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0100
     * @tc.name collectionsArrayExpand1024Test0001
     * @tc.desc Verifies pushing 1023 elements into an empty Array keeps length and index access correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        arr.push(i * 2);
      }
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1023);
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        expect(arr[i]).assertEqual(i * 2);
      }
      let count = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(ARRAY_CFG.PRE_1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0200
     * @tc.name collectionsArrayExpand1024Test0002
     * @tc.desc Verifies pushing the 1024th and 1025th elements preserves all prior index values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        arr.push(i * 2);
      }
      arr.push(2046);
      arr.push(2048);
      arr.push(2050);
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1026);
      expect(arr[0]).assertEqual(0);
      expect(arr[ARRAY_CFG.PRE_1023]).assertEqual(2046);
      expect(arr[ARRAY_CFG.BOUND]).assertEqual(2048);
      expect(arr[ARRAY_CFG.LEN_1025]).assertEqual(2050);
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        expect(arr[i]).assertEqual(i * 2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0300
     * @tc.name collectionsArrayExpand1024Test0003
     * @tc.desc Verifies splice deletes representative elements after expansion without residue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      arr.splice(0, 1);
      arr.splice(511, 1);
      arr.splice(1021, 1);
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1023);
      expect(arr[0]).assertEqual(1);
      expect(arr.includes(0)).assertFalse();
      expect(arr.includes(512)).assertFalse();
      expect(arr.includes(ARRAY_CFG.PRE_1023)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0400
     * @tc.name collectionsArrayExpand1024Test0004
     * @tc.desc Verifies index reads before and after expansion return the same value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<string> = new collections.Array<string>();
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        arr.push('val_' + i);
      }
      const beforeExp: string = arr[500];
      for (let i = ARRAY_CFG.PRE_1023; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push('val_' + i);
      }
      expect(arr[500]).assertEqual(beforeExp);
      expect(beforeExp).assertEqual('val_500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0500
     * @tc.name collectionsArrayExpand1024Test0005
     * @tc.desc Verifies pushes before and after the expansion threshold neither lose nor duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        arr.push(i);
      }
      arr.push(ARRAY_CFG.SPECIAL_A);
      for (let i = ARRAY_CFG.BOUND; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      arr.push(ARRAY_CFG.SPECIAL_B);
      expect(arr[ARRAY_CFG.PRE_1023]).assertEqual(ARRAY_CFG.SPECIAL_A);
      expect(arr[ARRAY_CFG.LEN_1026]).assertEqual(ARRAY_CFG.SPECIAL_B);
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1027);
      let specialACount = 0;
      arr.forEach((v: number): void => {
        if (v === ARRAY_CFG.SPECIAL_A) {
          specialACount++;
        }
      });
      expect(specialACount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0600
     * @tc.name collectionsArrayExpand1024Test0006
     * @tc.desc Verifies a NaN element survives expansion at the 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push(i);
      }
      arr.push(NaN);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      expect(Number.isNaN(arr[ARRAY_CFG.PRE_1020])).assertTrue();
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0700
     * @tc.name collectionsArrayExpand1024Test0007
     * @tc.desc Verifies -0 and +0 are kept as distinct array elements across expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push(i);
      }
      arr.push(0);
      arr.push(-0);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      expect(arr[ARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(1 / arr[ARRAY_CFG.PRE_1020]).assertEqual(Infinity);
      expect(1 / arr[ARRAY_CFG.PRE_1020 + 1]).assertEqual(-Infinity);
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1027);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_0900
     * @tc.name collectionsArrayExpand1024Test0009
     * @tc.desc Verifies a 100000-character string element survives expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<string> = new collections.Array<string>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push('elem_' + i);
      }
      const longElem: string = 'a'.repeat(ARRAY_CFG.LONG_LEN);
      arr.push(longElem);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push('elem_' + i);
      }
      expect(arr[ARRAY_CFG.PRE_1020]).assertEqual(longElem);
      expect(arr[ARRAY_CFG.PRE_1020].length).assertEqual(ARRAY_CFG.LONG_LEN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1000
     * @tc.name collectionsArrayExpand1024Test0010
     * @tc.desc Verifies a multi-byte emoji string element survives expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<string> = new collections.Array<string>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push('elem_' + i);
      }
      const emojiElem: string = '测试😀🎉🔥';
      arr.push(emojiElem);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push('elem_' + i);
      }
      expect(arr[ARRAY_CFG.PRE_1020]).assertEqual(emojiElem);
      expect(arr[ARRAY_CFG.PRE_1020].length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1100
     * @tc.name collectionsArrayExpand1024Test0011
     * @tc.desc Verifies a zero-width character string element survives expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<string> = new collections.Array<string>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push('elem_' + i);
      }
      const zeroWidthElem: string = 'a​b';
      arr.push(zeroWidthElem);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push('elem_' + i);
      }
      expect(arr[ARRAY_CFG.PRE_1020]).assertEqual(zeroWidthElem);
      expect(arr[ARRAY_CFG.PRE_1020].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1200
     * @tc.name collectionsArrayExpand1024Test0012
     * @tc.desc Verifies an object element is retained by reference identity across expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<SendableObj> = new collections.Array<SendableObj>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push(new SendableObj(i));
      }
      const objElem: SendableObj = new SendableObj(ARRAY_CFG.SPECIAL_A);
      arr.push(objElem);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(new SendableObj(i));
      }
      expect(arr[ARRAY_CFG.PRE_1020]).assertEqual(objElem);
      expect(arr[ARRAY_CFG.PRE_1020].id).assertEqual(ARRAY_CFG.SPECIAL_A);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1300
     * @tc.name collectionsArrayExpand1024Test0013
     * @tc.desc Verifies repeated splice removal after expansion keeps length and remaining order correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      for (let i = 0; i < 100; i++) {
        arr.splice(0, 1);
      }
      expect(arr.length).assertEqual(926);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1400
     * @tc.name collectionsArrayExpand1024Test0014
     * @tc.desc Verifies concurrent pushes near the 1024 boundary lose no successfully pushed elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1000; i++) {
        arr.push(i);
      }
      const results: number[] = await Promise.all([
        taskpool.execute(concurrentPushTask, arr, ARRAY_CFG.PRE_1000, ARRAY_CFG.SEG_MID_A) as Promise<number>,
        taskpool.execute(concurrentPushTask, arr, ARRAY_CFG.SEG_MID_A, ARRAY_CFG.SEG_MID_B) as Promise<number>,
        taskpool.execute(concurrentPushTask, arr, ARRAY_CFG.SEG_MID_B, ARRAY_CFG.WRITE_END) as Promise<number>
      ]);
      const pushedSum: number = results[0] + results[1] + results[2];
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1000 + pushedSum);
      const seen: Set<number> = new Set<number>();
      let dupCount = 0;
      arr.forEach((v: number): void => {
        if (seen.has(v)) {
          dupCount++;
        } else {
          seen.add(v);
        }
      });
      expect(dupCount).assertEqual(0);
      let outOfRangeCount = 0;
      arr.forEach((v: number): void => {
        if (v < 0 || v >= ARRAY_CFG.WRITE_END) {
          outOfRangeCount++;
        }
      });
      expect(outOfRangeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1500
     * @tc.name collectionsArrayExpand1024Test0015
     * @tc.desc Verifies a read task started during a write task crossing 1024 neither crashes nor loses reads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push(i);
      }
      const writeEnd: number = 1030;
      const results: number[] = await Promise.all([
        taskpool.execute(readerTask, arr) as Promise<number>,
        taskpool.execute(writerTask, arr, ARRAY_CFG.PRE_1020, writeEnd) as Promise<number>
      ]);
      expect(results[1]).assertLessOrEqual(writeEnd - ARRAY_CFG.PRE_1020);
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1020 + results[1]);
      let corruptCount = 0;
      arr.forEach((v: number): void => {
        if (v < 0 || v >= writeEnd) {
          corruptCount++;
        }
      });
      expect(corruptCount).assertEqual(0);
      // The reader must observe at least every initial element and at most every
      // successfully written element, so its count stays within [PRE_1020, PRE_1020 + written].
      expect(results[0]).assertLargerOrEqual(ARRAY_CFG.PRE_1020);
      expect(results[0]).assertLessOrEqual(ARRAY_CFG.PRE_1020 + results[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1600
     * @tc.name collectionsArrayExpand1024Test0016
     * @tc.desc Verifies forEach traversal count equals length after splice on an expanded array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      arr.splice(0, 1);
      arr.splice(511, 1);
      arr.splice(1021, 1);
      let count = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(arr.length);
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1700
     * @tc.name collectionsArrayExpand1024Test0017
     * @tc.desc Verifies taskpool progress reporting works while an Array expands across 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1000; i++) {
        arr.push(i);
      }
      const progressList: number[] = [];
      let expansionObserved = false;
      const task: taskpool.Task = new taskpool.Task(progressTask, arr);
      const callback = (data: Object): void => {
        const record: Record<string, number> = data as Record<string, number>;
        if (record['progress'] !== undefined) {
          progressList.push(record['progress']);
        }
        if (record['expanded'] !== undefined) {
          expansionObserved = true;
        }
      };
      task.onReceiveData(callback);
      const result: number = await (taskpool.execute(task) as Promise<number>);
      task.onReceiveData();
      expect(result).assertEqual(100);
      expect(progressList.length).assertLargerOrEqual(1);
      for (let i = 1; i < progressList.length; i++) {
        expect(progressList[i]).assertLarger(progressList[i - 1]);
      }
      for (let i = 0; i < progressList.length; i++) {
        expect(progressList[i]).assertLargerOrEqual(1);
        expect(progressList[i]).assertLessOrEqual(100);
      }
      // The task must observe the Array's length first exceeding 1024 and report it:
      // this directly witnesses the expansion boundary instead of only inferring it
      // from progress values.
      expect(expansionObserved).assertTrue();
      const lastProgress: number = progressList.length > 0 ? progressList[progressList.length - 1] : 0;
      expect(lastProgress).assertLargerOrEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1800
     * @tc.name collectionsArrayExpand1024Test0018
     * @tc.desc Verifies an Array expanded to 2048 elements keeps length and all index values correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      const result: Object = await taskpool.execute(verifyArray2048Elements, arr);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_1900
     * @tc.name collectionsArrayExpand1024Test0019
     * @tc.desc Verifies assigning an out-of-range index across the 1024 boundary throws a
     *         recoverable error without corrupting the array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      arr.push(0);
      let outOfRangeThrew = false;
      try {
        arr[ARRAY_CFG.BOUND] = ARRAY_CFG.BOUND;
      } catch (e) {
        outOfRangeThrew = true;
      }
      expect(outOfRangeThrew).assertTrue();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_2000
     * @tc.name collectionsArrayExpand1024Test0020
     * @tc.desc Verifies collections.ArrayBuffer elements survive expansion with correct byte lengths.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<collections.ArrayBuffer> = new collections.Array<collections.ArrayBuffer>();
      for (let i = 0; i < ARRAY_CFG.PRE_1020; i++) {
        arr.push(new collections.ArrayBuffer(ARRAY_CFG.AB_BYTES));
      }
      const bufElem: collections.ArrayBuffer = new collections.ArrayBuffer(ARRAY_CFG.AB_BYTES);
      arr.push(bufElem);
      for (let i = 1021; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(new collections.ArrayBuffer(ARRAY_CFG.AB_BYTES));
      }
      expect(arr[ARRAY_CFG.PRE_1020].byteLength).assertEqual(ARRAY_CFG.AB_BYTES);
      expect(arr[ARRAY_CFG.LEN_1025].byteLength).assertEqual(ARRAY_CFG.AB_BYTES);
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_2100
     * @tc.name collectionsArrayExpand1024Test0021
     * @tc.desc Verifies normal index access on an expanded Array remains correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i <= ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[ARRAY_CFG.BOUND]).assertEqual(ARRAY_CFG.BOUND);
      expect(arr[ARRAY_CFG.LEN_1025]).assertEqual(ARRAY_CFG.LEN_1025);
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1026);
      const probes: number[] = [-1, NaN, Infinity, -Infinity, Number.MAX_SAFE_INTEGER];
      for (let i = 0; i < probes.length; i++) {
        let indexSafe = false;
        try {
          const probeValue: number | undefined = arr[probes[i]];
          indexSafe = (probeValue === undefined);
        } catch (e) {
          indexSafe = true;
        }
        expect(indexSafe).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_2200
     * @tc.name collectionsArrayExpand1024Test0022
     * @tc.desc Verifies all Array properties and methods remain usable after transfer across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      const failPromise: Promise<string> = taskpool.execute(
        verifyArrayAllMethodsAfterTransfer, arr) as Promise<string>;
      const failReason: string = await failPromise;
      expect(failReason).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_ARRAY_EXPANSION_1024_2300
     * @tc.name collectionsArrayExpand1024Test0023
     * @tc.desc Verifies filling a constant value across 1024 keeps every, indexOf, filter and reduce consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('collectionsArrayExpand1024Test0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i = 0; i < ARRAY_CFG.PRE_1023; i++) {
        arr.push(ARRAY_CFG.FILL_42);
      }
      expect(arr.length).assertEqual(ARRAY_CFG.PRE_1023);
      expect(arr.every((v: number): boolean => v === ARRAY_CFG.FILL_42)).assertTrue();
      expect(arr.indexOf(ARRAY_CFG.FILL_42)).assertEqual(0);
      expect(arr.indexOf(99)).assertEqual(-1);
      expect(arr.includes(ARRAY_CFG.FILL_42)).assertTrue();
      expect(arr.includes(99)).assertFalse();
      expect(arr.filter((v: number): boolean => v === ARRAY_CFG.FILL_42).length).assertEqual(ARRAY_CFG.PRE_1023);
      for (let i = 0; i < 2; i++) {
        arr.push(ARRAY_CFG.FILL_42);
      }
      expect(arr.length).assertEqual(ARRAY_CFG.LEN_1025);
      expect(arr.every((v: number): boolean => v === ARRAY_CFG.FILL_42)).assertTrue();
      expect(arr.filter((v: number): boolean => v === ARRAY_CFG.FILL_42).length).assertEqual(ARRAY_CFG.LEN_1025);
      arr.fill(0);
      expect(arr.every((v: number): boolean => v === 0)).assertTrue();
      expect(arr.filter((v: number): boolean => v === 0).length).assertEqual(ARRAY_CFG.LEN_1025);
      const sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(0);
    });
  });
}
