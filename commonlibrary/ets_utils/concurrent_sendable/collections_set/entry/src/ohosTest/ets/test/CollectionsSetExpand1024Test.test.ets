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
import { SET_CFG } from './SetExpandCfg';

@Sendable
class SendableObj {
  id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

function setSizeFromValues(set: collections.Set<number>): number {
  let count = 0;
  try {
    const iter: Iterator<number> = set.values();
    while (!iter.next().done) {
      count++;
    }
  } catch (e) {
    // ignore concurrent modification error
  }
  return count;
}

@Concurrent
function concurrentAddTask(set: collections.Set<number>, start: number, end: number): number {
  let added = 0;
  for (let i = start; i < end; i++) {
    try {
      set.add(i);
      added++;
    } catch (e) {
      // ignore concurrent modification error
    }
  }
  return added;
}

@Concurrent
function readerTask(set: collections.Set<number>): number {
  let count = 0;
  try {
    set.forEach((): void => {
      count++;
    });
  } catch (e) {
    // ignore concurrent modification error
  }
  return count;
}

@Concurrent
function writerTask(set: collections.Set<number>, start: number, end: number): number {
  let added = 0;
  for (let i = start; i < end; i++) {
    try {
      set.add(i);
      added++;
    } catch (e) {
      // ignore concurrent modification error
    }
  }
  return added;
}

@Concurrent
function progressTask(set: collections.Set<number>): number {
  let added = 0;
  let rehashObserved = false;
  try {
    for (let i = 1000; i < 1100; i++) {
      set.add(i);
      added++;
      if (!rehashObserved && Number(set.size) > 1024) {
        rehashObserved = true;
        taskpool.Task.sendData({ 'rehashed': 1 });
      }
      if (i % 10 === 0) {
        taskpool.Task.sendData({ 'progress': added });
      }
    }
    // Guarantee a final progress report carrying the completed add count.
    taskpool.Task.sendData({ 'progress': added });
  } catch (e) {
    // ignore concurrent modification error
  }
  return added;
}

@Concurrent
function verifySetAllMethodsAfterTransfer(set: collections.Set<number>): string {
  try {
    if (set.size !== 1025) {
      return 'size mismatch: ' + set.size;
    }
    if (!set.has(0) || !set.has(1024) || set.has(99999)) {
      return 'has mismatch';
    }
    set.add(99999);
    if (!set.has(99999)) {
      return 'add mismatch';
    }
    set.add(99999);
    if (Number(set.size) !== 1026) {
      return 'duplicate add size mismatch: ' + set.size;
    }
    if (!set.delete(99999)) {
      return 'delete mismatch';
    }
    if (set.delete(99999)) {
      return 'delete missing mismatch';
    }
    let forEachCount: number = 0;
    let forEachOwnerValid = true;
    set.forEach((v: number, k: number, owner: collections.Set<number>): void => {
      forEachCount++;
      if (owner !== set) {
        forEachOwnerValid = false;
      }
    });
    if (forEachCount !== 1025) {
      return 'forEach count mismatch: ' + forEachCount;
    }
    if (!forEachOwnerValid) {
      return 'forEach owner mismatch';
    }
    const vi1: Iterator<number> = set.values();
    const vr: IteratorResult<number> = vi1.next();
    if (vr.done !== false || vr.value !== 0) {
      return 'values first mismatch';
    }
    const vi2: Iterator<number> = set.values();
    if (vi2 === vi1) {
      return 'values iterator reuse mismatch';
    }
    let valueCount: number = 0;
    while (!vi1.next().done) {
      valueCount++;
    }
    if (valueCount !== 1024) {
      return 'values count mismatch: ' + valueCount;
    }
    let keyCount: number = 0;
    const keyIter: Iterator<number> = set.keys();
    while (!keyIter.next().done) {
      keyCount++;
    }
    if (keyCount !== 1025) {
      return 'keys count mismatch: ' + keyCount;
    }
    let ofCount: number = 0;
    for (const v of set) {
      ofCount++;
    }
    if (ofCount !== 1025) {
      return 'for-of count mismatch: ' + ofCount;
    }
    // clear() must operate on the transferred Set itself, not a throwaway instance.
    set.clear();
    // Number() escapes flow-analysis narrowing of set.size (to literal 1025 from the
    // earlier check), so the comparison against 0 is not flagged as no-overlap.
    if (Number(set.size) !== 0) {
      return 'clear mismatch';
    }
    return '';
  } catch (e) {
    // Any Set method failure surfaces as a non-empty reason, failing the assertion
    // in collectionsSetExpand1024Test0018 instead of a taskpool rejection.
    return 'unexpected exception during verification';
  }
}

@Concurrent
function verifySet0001Elements(set: collections.Set<number>): number {
  for (let i = 0; i < SET_CFG.PRE_1023; i++) {
    set.add(i);
  }
  if (set.size !== SET_CFG.PRE_1023) {
    return 0;  // Size mismatch, return first indicator
  }
  for (let i = 0; i < SET_CFG.PRE_1023; i++) {
    if (!set.has(i)) {
      return i;  // Return first missing index
    }
  }
  let count = 0;
  set.forEach((): void => {
    count++;
  });
  if (count !== SET_CFG.PRE_1023) {
    return 1001;  // forEach count mismatch, return unique indicator
  }
  const iter: Iterator<number> = set.values();
  let valuesCount = 0;
  while (!iter.next().done) {
    valuesCount++;
  }
  if (valuesCount !== SET_CFG.PRE_1023) {
    return 1002;  // values() count mismatch, return unique indicator
  }
  return -1;  // All verifications passed
}

@Concurrent
function verifySet0002Elements(set: collections.Set<number>): number {
  for (let i = 0; i < SET_CFG.PRE_1023; i++) {
    set.add(i);
  }
  set.add(SET_CFG.PRE_1023);
  set.add(SET_CFG.BOUND);
  set.add(SET_CFG.LEN_1025);
  if (set.size !== SET_CFG.LEN_1026) {
    return 0;  // Size mismatch, return first indicator
  }
  for (let i = 0; i <= SET_CFG.LEN_1025; i++) {
    if (!set.has(i)) {
      return i;  // Return first missing index
    }
  }
  return -1;  // All verifications passed
}

export default function CollectionsSetExpand1024Test(): void {
  describe('CollectionsSetExpand1024Test', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0100
     * @tc.name collectionsSetExpand1024Test0001
     * @tc.desc Verifies adding 1023 elements to an empty Set keeps size, has and forEach consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      const result: Object = await taskpool.execute(verifySet0001Elements, set);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0200
     * @tc.name collectionsSetExpand1024Test0002
     * @tc.desc Verifies adding the 1024th and 1025th elements triggers rehash without losing elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      const result: Object = await taskpool.execute(verifySet0002Elements, set);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0300
     * @tc.name collectionsSetExpand1024Test0003
     * @tc.desc Verifies delete of representative elements after expansion leaves no residue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      expect(set.delete(0)).assertTrue();
      expect(set.delete(512)).assertTrue();
      expect(set.delete(SET_CFG.PRE_1023)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.has(512)).assertFalse();
      expect(set.has(SET_CFG.PRE_1023)).assertFalse();
      expect(set.has(1)).assertTrue();
      expect(set.has(SET_CFG.BOUND)).assertTrue();
      expect(set.size).assertEqual(SET_CFG.PRE_1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0400
     * @tc.name collectionsSetExpand1024Test0004
     * @tc.desc Verifies has results stay identical before and after rehash across 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1023; i++) {
        set.add(i);
      }
      const beforeExp: boolean = set.has(500);
      for (let i = SET_CFG.PRE_1023; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      const afterExp: boolean = set.has(500);
      expect(beforeExp).assertTrue();
      expect(afterExp).assertTrue();
      expect(beforeExp).assertEqual(afterExp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0500
     * @tc.name collectionsSetExpand1024Test0005
     * @tc.desc Verifies adds before and after rehash neither lose nor duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1023; i++) {
        set.add(i);
      }
      set.add(SET_CFG.SPECIAL_A);
      for (let i = SET_CFG.PRE_1023; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      set.add(SET_CFG.SPECIAL_B);
      expect(set.has(SET_CFG.SPECIAL_A)).assertTrue();
      expect(set.has(SET_CFG.SPECIAL_B)).assertTrue();
      expect(set.size).assertEqual(SET_CFG.LEN_1028);
      set.add(SET_CFG.SPECIAL_A);
      expect(set.size).assertEqual(SET_CFG.LEN_1028);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0600
     * @tc.name collectionsSetExpand1024Test0006
     * @tc.desc Verifies NaN stays a single element per SameValueZero across rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add(i);
      }
      set.add(NaN);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      expect(set.has(NaN)).assertTrue();
      set.add(NaN);
      expect(set.size).assertEqual(SET_CFG.LEN_1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0700
     * @tc.name collectionsSetExpand1024Test0007
     * @tc.desc Verifies -0 and +0 are the same element per SameValueZero across rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 1; i <= SET_CFG.PRE_1020; i++) {
        set.add(i);
      }
      set.add(0);
      set.add(-0);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      expect(set.has(0)).assertTrue();
      expect(set.has(-0)).assertTrue();
      expect(set.size).assertEqual(SET_CFG.LEN_1026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_0900
     * @tc.name collectionsSetExpand1024Test0009
     * @tc.desc Verifies a 100000-character string element survives rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<string> = new collections.Set<string>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add('elem_' + i);
      }
      const longElem: string = 'a'.repeat(SET_CFG.LONG_LEN);
      set.add(longElem);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add('elem_' + i);
      }
      expect(set.has(longElem)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1000
     * @tc.name collectionsSetExpand1024Test0010
     * @tc.desc Verifies a multi-byte emoji string element survives rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<string> = new collections.Set<string>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add('elem_' + i);
      }
      const emojiElem: string = '测试😀🎉🔥';
      set.add(emojiElem);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add('elem_' + i);
      }
      // has() uses value equality, so a multi-byte emoji must survive rehash intact.
      expect(set.has(emojiElem)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1100
     * @tc.name collectionsSetExpand1024Test0011
     * @tc.desc Verifies a zero-width character string element is distinct across rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<string> = new collections.Set<string>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add('elem_' + i);
      }
      const zeroWidthElem: string = 'a​b';
      set.add(zeroWidthElem);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add('elem_' + i);
      }
      expect(set.has(zeroWidthElem)).assertTrue();
      expect(set.has('ab')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1200
     * @tc.name collectionsSetExpand1024Test0012
     * @tc.desc Verifies object elements are compared by reference identity across rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<SendableObj> = new collections.Set<SendableObj>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add(new SendableObj(i));
      }
      const objElem: SendableObj = new SendableObj(SET_CFG.SPECIAL_A);
      set.add(objElem);
      for (let i = 1021; i <= SET_CFG.LEN_1025; i++) {
        set.add(new SendableObj(i));
      }
      expect(set.has(objElem)).assertTrue();
      expect(set.has(new SendableObj(SET_CFG.SPECIAL_A))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1300
     * @tc.name collectionsSetExpand1024Test0013
     * @tc.desc Verifies repeated delete after expansion keeps size and remaining elements correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      for (let i = 0; i < 100; i++) {
        expect(set.delete(i)).assertTrue();
      }
      expect(set.size).assertEqual(926);
      expect(set.has(0)).assertFalse();
      expect(set.has(100)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1400
     * @tc.name collectionsSetExpand1024Test0014
     * @tc.desc Verifies concurrent adds near the 1024 boundary neither duplicate nor exceed the total range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1000; i++) {
        set.add(i);
      }
      const results: number[] = await Promise.all([
        taskpool.execute(concurrentAddTask, set, SET_CFG.PRE_1000, SET_CFG.SEG_MID_A) as Promise<number>,
        taskpool.execute(concurrentAddTask, set, SET_CFG.SEG_MID_A, SET_CFG.SEG_MID_B) as Promise<number>,
        taskpool.execute(concurrentAddTask, set, SET_CFG.SEG_MID_B, SET_CFG.WRITE_END) as Promise<number>
      ]);
      const addedSum: number = results[0] + results[1] + results[2];
      // Every counted add must be present: size equals the base elements plus the
      // counted adds, proving no element was lost and none added spuriously.
      expect(set.size).assertEqual(SET_CFG.PRE_1000 + addedSum);
      // No element may fall outside the written value range [0, WRITE_END).
      let outOfRangeCount = 0;
      const valIter: Iterator<number> = set.values();
      let step: IteratorResult<number> = valIter.next();
      while (!step.done) {
        if (step.value < 0 || step.value >= SET_CFG.WRITE_END) {
          outOfRangeCount++;
        }
        step = valIter.next();
      }
      expect(outOfRangeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1500
     * @tc.name collectionsSetExpand1024Test0015
     * @tc.desc Verifies a read task started during a write task crossing 1024 neither crashes nor loses reads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1020; i++) {
        set.add(i);
      }
      const writeEnd: number = 1030;
      const results: number[] = await Promise.all([
        taskpool.execute(readerTask, set) as Promise<number>,
        taskpool.execute(writerTask, set, SET_CFG.PRE_1020, writeEnd) as Promise<number>
      ]);
      // Writer must not claim more successes than its 10 attempts.
      expect(results[1]).assertLessOrEqual(writeEnd - SET_CFG.PRE_1020);
      // Every counted add must be present: no loss and no spurious element.
      expect(set.size).assertEqual(SET_CFG.PRE_1020 + results[1]);
      // The reader's forEach may be terminated early by a concurrent-modification
      // exception (returning a partial count), so no lower bound is asserted.
      expect(results[0]).assertLessOrEqual(SET_CFG.PRE_1020 + results[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1600
     * @tc.name collectionsSetExpand1024Test0016
     * @tc.desc Verifies forEach count and values iteration length equal size after delete on a rehashed Set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i <= SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      set.delete(0);
      set.delete(512);
      set.delete(SET_CFG.PRE_1023);
      let count = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(set.size);
      expect(set.size).assertEqual(SET_CFG.PRE_1023);
      expect(setSizeFromValues(set)).assertEqual(set.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1700
     * @tc.name collectionsSetExpand1024Test0017
     * @tc.desc Verifies taskpool progress reporting works while a Set rehashes across 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1000; i++) {
        set.add(i);
      }
      const progressList: number[] = [];
      let rehashObserved = false;
      const task: taskpool.Task = new taskpool.Task(progressTask, set);
      const callback = (data: Object): void => {
        const record: Record<string, number> = data as Record<string, number>;
        if (record['progress'] !== undefined) {
          progressList.push(record['progress']);
        }
        if (record['rehashed'] !== undefined) {
          rehashObserved = true;
        }
      };
      task.onReceiveData(callback);
      const result: number = await (taskpool.execute(task) as Promise<number>);
      task.onReceiveData();
      expect(result).assertEqual(100);
      expect(progressList.length).assertLargerOrEqual(1);
      // Progress reports must arrive strictly increasing and stay within [1, 100].
      for (let i = 1; i < progressList.length; i++) {
        expect(progressList[i]).assertLarger(progressList[i - 1]);
      }
      for (let i = 0; i < progressList.length; i++) {
        expect(progressList[i]).assertLargerOrEqual(1);
        expect(progressList[i]).assertLessOrEqual(100);
      }
      // The task must observe the Set's size first exceeding 1024 and report it:
      // this directly witnesses the rehash boundary instead of only inferring it
      // from progress values.
      expect(rehashObserved).assertTrue();
      // The final report must carry a progress value near the completed count.
      const lastProgress: number = progressList.length > 0 ? progressList[progressList.length - 1] : 0;
      expect(lastProgress).assertLargerOrEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1800
     * @tc.name collectionsSetExpand1024Test0018
     * @tc.desc Verifies Set properties and methods (size, has, add, delete, forEach, values,
     *         keys, for-of, clear) remain usable after transfer across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.LEN_1025; i++) {
        set.add(i);
      }
      const failPromise: Promise<string> = taskpool.execute(
        verifySetAllMethodsAfterTransfer, set) as Promise<string>;
      const failReason: string = await failPromise;
      expect(failReason).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_SET_EXPANSION_1024_1900
     * @tc.name collectionsSetExpand1024Test0019
     * @tc.desc Verifies repeatedly adding the same element keeps size unchanged across rehash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsSetExpand1024Test0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set: collections.Set<number> = new collections.Set<number>();
      for (let i = 0; i < SET_CFG.PRE_1023; i++) {
        set.add(i);
      }
      for (let i = 0; i < 100; i++) {
        set.add(0);
      }
      expect(set.size).assertEqual(SET_CFG.PRE_1023);
      set.add(SET_CFG.BOUND);
      expect(set.size).assertEqual(SET_CFG.BOUND);
      for (let i = 0; i < 100; i++) {
        set.add(0);
      }
      expect(set.size).assertEqual(SET_CFG.BOUND);
      set.add(SET_CFG.LEN_1025);
      expect(set.size).assertEqual(SET_CFG.LEN_1025);
      set.add(NaN);
      expect(set.size).assertEqual(SET_CFG.LEN_1026);
      set.add(NaN);
      expect(set.size).assertEqual(SET_CFG.LEN_1026);
      expect(set.has(NaN)).assertTrue();
      set.add(-0);
      expect(set.size).assertEqual(SET_CFG.LEN_1026);
      expect(set.has(-0)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(setSizeFromValues(set)).assertEqual(set.size);
    });
  });
}
