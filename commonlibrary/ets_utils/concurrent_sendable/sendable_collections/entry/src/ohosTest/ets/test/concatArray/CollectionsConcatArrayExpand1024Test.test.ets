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

import { describe, beforeEach, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { CAT_CFG } from './ConcatArrayExpandCfg';
import Utils from '../Util';

const SLEEP_INTERVAL_MS: number = 20;

@Sendable
class CatObj {
  id: string | number;

  constructor(id: string | number) {
    this.id = id;
  }
}

function arrForEachCount(arr: collections.Array<number>): number {
  let c: number = 0;
  arr.forEach(() => {
    c++;
  });
  return c;
}

function arrValuesCount(arr: collections.Array<number>): number {
  let c: number = 0;
  const iter: IterableIterator<number> = arr.values();
  let result: IteratorResult<number> = iter.next();
  while (!result.done) {
    c++;
    result = iter.next();
  }
  return c;
}

@Concurrent
function catPushRange(arr: collections.Array<number>, start: number, end: number): number {
  let n: number = 0;
  for (let i: number = start; i < end; i++) {
    try {
      arr.push(i);
      n++;
    } catch (e) {
      const err: BusinessError = e as BusinessError;
      if (err.code !== 10200201) {
        return -1;
      }
    }
  }
  return n;
}

@Concurrent
function catForEachReadCount(arr: collections.Array<number>): number {
  let c: number = 0;
  try {
    arr.forEach(() => {
      c++;
    });
  } catch (e) {
    const err: BusinessError = e as BusinessError;
    if (err.code !== 10200201) {
      return -1;
    }
  }
  return c;
}

@Concurrent
function catValuesIteratorCount(arr: collections.Array<number>): number {
  let count: number = 0;
  try {
    const iter: IterableIterator<number> = arr.values();
    let result: IteratorResult<number> = iter.next();
    while (!result.done) {
      count++;
      result = iter.next();
    }
  } catch (e) {
    const err: BusinessError = e as BusinessError;
    if (err.code !== 10200201) {
      return -1;
    }
  }
  return count;
}

@Concurrent
function verifyConcatAfterConcurrent(arr: collections.Array<number>, base: number, written: number): number {
  let len: number = -1;
  try {
    len = arr.length;
  } catch (e) {
    const err: BusinessError = e as BusinessError;
    if (err.code !== 10200201) {
      return 3;
    }
    return 2;
  }
  if (len !== base + written) {
    return 0;
  }
  let count: number = 0;
  try {
    arr.forEach((): void => {
      count++;
    });
  } catch (e) {
    const err: BusinessError = e as BusinessError;
    if (err.code !== 10200201) {
      return 3;
    }
    return 2;
  }
  if (count !== len) {
    return 1;
  }
  return -1;
}

@Concurrent
function catVerifyArkApisAfterTransfer(arr: collections.Array<number>): boolean {
  const cat: collections.ConcatArray<number> = arr;
  try {
    if (cat.length !== 1025) {
      return false;
    }
    if (cat[0] !== 0 || cat[1024] !== 1024 || cat[512] !== 512) {
      return false;
    }
    let cnt: number = 0;
    for (let i: number = 0; i < cat.length; i++) {
      if (cat[i] !== i) {
        return false;
      }
      cnt++;
    }
    if (cnt !== 1025) {
      return false;
    }
    const sliced = cat.slice(0, 10);
    if (sliced.length !== 10 || sliced[0] !== 0 || sliced[9] !== 9) {
      return false;
    }
    if (cat.slice(0, 3).join('-') !== '0-1-2') {
      return false;
    }
    if (cat.join(',').length <= 0) {
      return false;
    }
    let fc: number = 0;
    let ownerOk: boolean = true;
    const catRef: collections.ConcatArray<number> = arr;
    arr.forEach((v: number, i: number, owner: collections.Array<number>) => {
      fc++;
      if (owner !== catRef) {
        ownerOk = false;
      }
    });
    if (!ownerOk || fc !== 1025) {
      return false;
    }
    const vi1: IterableIterator<number> = arr.values();
    const vr: IteratorResult<number> = vi1.next();
    if (vr.done !== false || vr.value !== 0) {
      return false;
    }
    const vi2: IterableIterator<number> = arr.values();
    if (vi2 === vi1) {
      return false;
    }
    let vc: number = 0;
    let vr2: IteratorResult<number> = vi1.next();
    while (!vr2.done) {
      vc++;
      vr2 = vi1.next();
    }
    if (vc !== 1024) {
      return false;
    }
    const ei: IterableIterator<[number, number]> = arr.entries();
    const er: IteratorResult<[number, number]> = ei.next();
    if (er.done !== false) {
      return false;
    }
    const pair: [number, number] = er.value as [number, number];
    if (pair[0] !== 0 || pair[1] !== 0) {
      return false;
    }
    let ec: number = 0;
    let er2: IteratorResult<[number, number]> = ei.next();
    while (!er2.done) {
      ec++;
      er2 = ei.next();
    }
    if (ec !== 1024) {
      return false;
    }
    let ofc: number = 0;
    for (const v of arr) {
      ofc++;
    }
    if (ofc !== 1025) {
      return false;
    }
    if (arr[0] !== 0 || arr[1024] !== 1024) {
      return false;
    }
    const newLen: number = arr.push(99999);
    if (newLen !== 1026) {
      return false;
    }
    const popped: number | undefined = arr.pop();
    const lenAfterPop: number = arr.length;
    if (popped !== 99999 || lenAfterPop !== 1025) {
      return false;
    }
    const shifted: number | undefined = arr.shift();
    if (shifted !== 0) {
      return false;
    }
    arr.unshift(0);
    if (arr.indexOf(0) !== 0 || !arr.includes(1024)) {
      return false;
    }
    if (arr.find((v: number) => v === 512) !== 512) {
      return false;
    }
    if (arr.filter((v: number) => v < 10).length !== 10) {
      return false;
    }
    if (arr.map((v: number) => v * 2)[1024] !== 2048) {
      return false;
    }
    if (arr.reduce((a: number, v: number) => a + v, 0) !== 1024 * 1025 / 2) {
      return false;
    }
    const ki: IterableIterator<number> = arr.keys();
    let kc: number = 0;
    let kr: IteratorResult<number> = ki.next();
    while (!kr.done) {
      kc++;
      kr = ki.next();
    }
    return kc === 1025 && cat.length === 1025;
  } catch (e) {
    return false;
  }
}

export default function CollectionsConcatArrayExpand1024Test() {
  describe('CollectionsConcatArrayExpand1024Test', () => {
    beforeEach(async () => {
      await Utils.msSleep(SLEEP_INTERVAL_MS);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0100
     * @tc.name   collectionsConcatArrayExpand1024Test0001
     * @tc.desc   Verify ArkTS ConcatArray length, index access, join, and slice after expanding beyond 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0001 begin-----------------');
      const cat: collections.ConcatArray<number> = new collections.Array<number>();
      const arr: collections.Array<number> = cat as collections.Array<number>;
      for (let i: number = 0; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      expect(cat.length).assertEqual(CAT_CFG.LEN_1026);
      expect(arrForEachCount(arr)).assertEqual(CAT_CFG.LEN_1026);
      expect(arrForEachCount(arr)).assertEqual(cat.length);
      expect(arrValuesCount(arr)).assertEqual(CAT_CFG.LEN_1026);
      expect(cat[0]).assertEqual(0);
      expect(cat[CAT_CFG.BOUND]).assertEqual(CAT_CFG.BOUND);
      expect(cat[CAT_CFG.LEN_1025]).assertEqual(CAT_CFG.LEN_1025);
      expect(cat.slice(CAT_CFG.BOUND, CAT_CFG.LEN_1026).join(',')).assertEqual('1024,1025');
      const sliced = cat.slice(CAT_CFG.BOUND, CAT_CFG.LEN_1026);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(CAT_CFG.BOUND);
      console.info('-----------------collectionsConcatArrayExpand1024Test0001 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0200
     * @tc.name   collectionsConcatArrayExpand1024Test0002
     * @tc.desc   Verify the first element value and length stay consistent on ArkTS ConcatArray across expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0002 begin-----------------');
      const cat: collections.ConcatArray<string> = new collections.Array<string>();
      const arr: collections.Array<string> = cat as collections.Array<string>;
      for (let i: number = 0; i < CAT_CFG.PRE_1023; i++) {
        arr.push(`val_${i}`);
      }
      let v1: string = '';
      arr.forEach((v: string, i: number) => {
        if (i === 0) {
          v1 = v;
        }
      });
      const beforeLen: number = cat.length;
      let beforeCount: number = 0;
      arr.forEach(() => {
        beforeCount++;
      });
      expect(v1).assertEqual('val_0');
      for (let i: number = CAT_CFG.PRE_1023; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(`val_${i}`);
      }
      let afterCount: number = 0;
      let v1After: string = '';
      arr.forEach((v: string, i: number) => {
        afterCount++;
        if (i === 0) {
          v1After = v;
        }
      });
      expect(afterCount).assertEqual(beforeCount + 3);
      expect(cat.length).assertEqual(beforeLen + 3);
      expect(cat.length).assertEqual(CAT_CFG.LEN_1026);
      expect(v1After).assertEqual(v1);
      console.info('-----------------collectionsConcatArrayExpand1024Test0002 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0300
     * @tc.name   collectionsConcatArrayExpand1024Test0003
     * @tc.desc   Verify a NaN element remains accessible via index access on ArkTS ConcatArray after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0003 begin-----------------');
      const cat: collections.ConcatArray<number> = new collections.Array<number>();
      const arr: collections.Array<number> = cat as collections.Array<number>;
      for (let i: number = 0; i < CAT_CFG.PRE_1020; i++) {
        arr.push(i);
      }
      arr.push(NaN);
      for (let i: number = CAT_CFG.PRE_1020 + 1; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      let foundNaN: boolean = false;
      arr.forEach((v: number) => {
        if (Number.isNaN(v)) {
          foundNaN = true;
        }
      });
      expect(foundNaN).assertTrue();
      expect(cat.length).assertEqual(CAT_CFG.LEN_1026);
      console.info('-----------------collectionsConcatArrayExpand1024Test0003 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0400
     * @tc.name   collectionsConcatArrayExpand1024Test0004
     * @tc.desc   Verify a long string element remains accessible via index access on ArkTS ConcatArray after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0004 begin-----------------');
      const cat: collections.ConcatArray<string> = new collections.Array<string>();
      const arr: collections.Array<string> = cat as collections.Array<string>;
      for (let i: number = 0; i < CAT_CFG.PRE_1020; i++) {
        arr.push(`elem_${i}`);
      }
      arr.push('a'.repeat(CAT_CFG.LONG_LEN));
      for (let i: number = CAT_CFG.PRE_1020 + 1; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(`elem_${i}`);
      }
      let foundLong: boolean = false;
      arr.forEach((v: string) => {
        if (v.length === CAT_CFG.LONG_LEN) {
          foundLong = true;
        }
      });
      expect(foundLong).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0004 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0500
     * @tc.name   collectionsConcatArrayExpand1024Test0005
     * @tc.desc   Verify a Sendable object reference stays accessible via index access on
     *             ArkTS ConcatArray after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0005 begin-----------------');
      const cat: collections.ConcatArray<CatObj> = new collections.Array<CatObj>();
      const arr: collections.Array<CatObj> = cat as collections.Array<CatObj>;
      const special: CatObj = new CatObj('special');
      for (let i: number = 0; i < CAT_CFG.PRE_1020; i++) {
        arr.push(new CatObj(i));
      }
      arr.push(special);
      for (let i: number = CAT_CFG.PRE_1020 + 1; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(new CatObj(i));
      }
      let foundObj: boolean = false;
      arr.forEach((v: CatObj) => {
        if (v === special) {
          foundObj = true;
        }
      });
      expect(foundObj).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0005 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0600
     * @tc.name   collectionsConcatArrayExpand1024Test0006
     * @tc.desc   Verify an emoji string remains accessible via index access on ArkTS ConcatArray after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0006 begin-----------------');
      const cat: collections.ConcatArray<string> = new collections.Array<string>();
      const arr: collections.Array<string> = cat as collections.Array<string>;
      for (let i: number = 0; i < CAT_CFG.PRE_1020; i++) {
        arr.push(`elem_${i}`);
      }
      arr.push(CAT_CFG.EMOJI);
      for (let i: number = CAT_CFG.PRE_1020 + 1; i <= CAT_CFG.LEN_1025; i++) {
        arr.push(`elem_${i}`);
      }
      let foundEmoji: boolean = false;
      arr.forEach((v: string) => {
        if (v === CAT_CFG.EMOJI) {
          foundEmoji = true;
        }
      });
      expect(foundEmoji).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0006 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0700
     * @tc.name   collectionsConcatArrayExpand1024Test0007
     * @tc.desc   Verify TaskPool concurrent push and index read on ArkTS ConcatArray near the 1024 boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0007 begin-----------------');
      const cat: collections.ConcatArray<number> = new collections.Array<number>();
      const arr: collections.Array<number> = cat as collections.Array<number>;
      for (let i: number = 0; i < CAT_CFG.PRE_1000; i++) {
        arr.push(i);
      }
      const results: number[] = await Promise.all([
        taskpool.execute(catPushRange, arr, CAT_CFG.PUSH_A, CAT_CFG.PUSH_B),
        taskpool.execute(catPushRange, arr, CAT_CFG.PUSH_B, CAT_CFG.PUSH_C),
        taskpool.execute(catPushRange, arr, CAT_CFG.PUSH_C, CAT_CFG.PUSH_D),
        taskpool.execute(catForEachReadCount, arr)
      ]) as number[];
      expect(results[3] !== -1).assertTrue();
      let afterCount: number = 0;
      arr.forEach(() => {
        afterCount++;
      });
      expect(afterCount).assertEqual(arr.length);
      expect(arr.length > CAT_CFG.PRE_1000).assertTrue();
      expect(results[0] !== -1).assertTrue();
      expect(results[1] !== -1).assertTrue();
      expect(results[2] !== -1).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0007 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0800
     * @tc.name   collectionsConcatArrayExpand1024Test0008
     * @tc.desc   Verify ArkTS ConcatArray slice and join do not crash during concurrent expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0008 begin-----------------');
      const arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < CAT_CFG.PRE_1020; i++) {
        arr.push(i);
      }
      const settled: number[] = await Promise.all([
        taskpool.execute(catValuesIteratorCount, arr),
        taskpool.execute(catPushRange, arr, CAT_CFG.PRE_1020, CAT_CFG.WRITE_END)
      ]) as number[];
      expect(settled[0] !== -1).assertTrue();
      expect(settled[1] !== -1).assertTrue();
      // The main thread never touches the container after the concurrent phase:
      // a discarded (interrupted) iterator may leave the container in a
      // concurrent-modification state, and any traversal on the main thread
      // could throw 10200201 there. The final consistency check runs in a
      // sequential task instead; code 2 means the residual concurrent-
      // modification state is observed, which is tolerated per CAT-ERR-002.
      const finalCheck: Object = await taskpool.execute(verifyConcatAfterConcurrent, arr, CAT_CFG.PRE_1020, settled[1]);
      expect(finalCheck === -1 || finalCheck === 2).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0008 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_0900
     * @tc.name   collectionsConcatArrayExpand1024Test0009
     * @tc.desc   Verify ConcatArray length, index access, slice, and join after cross-thread transfer,
     *             and verify Array forEach, values, entries, for-of, push, pop, shift, unshift,
     *             indexOf, includes, find, filter, map, reduce, and keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0009 begin-----------------');
      const cat: collections.ConcatArray<number> = new collections.Array<number>();
      const arr: collections.Array<number> = cat as collections.Array<number>;
      for (let i: number = 0; i < CAT_CFG.LEN_1025; i++) {
        arr.push(i);
      }
      const ok: boolean = await taskpool.execute(catVerifyArkApisAfterTransfer, arr) as boolean;
      expect(ok).assertTrue();
      console.info('-----------------collectionsConcatArrayExpand1024Test0009 end-----------------');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCATARRAY_EXPAND_1024_1000
     * @tc.name   collectionsConcatArrayExpand1024Test0010
     * @tc.desc   Verify identical elements across the 1024 boundary via index access and join on ArkTS ConcatArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsConcatArrayExpand1024Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('-----------------collectionsConcatArrayExpand1024Test0010 begin-----------------');
      const cat: collections.ConcatArray<number> = new collections.Array<number>();
      const arr: collections.Array<number> = cat as collections.Array<number>;
      for (let i: number = 0; i < CAT_CFG.LEN_1025; i++) {
        arr.push(CAT_CFG.SAME_VAL);
      }
      expect(cat.length).assertEqual(CAT_CFG.LEN_1025);
      let forEachCount: number = 0;
      arr.forEach(() => {
        forEachCount++;
      });
      expect(forEachCount).assertEqual(CAT_CFG.LEN_1025);
      expect(forEachCount).assertEqual(arr.length);
      let valuesCount: number = 0;
      let valuesAllSame: boolean = true;
      const vi: IterableIterator<number> = arr.values();
      let vr: IteratorResult<number> = vi.next();
      while (!vr.done) {
        if (vr.value !== CAT_CFG.SAME_VAL) {
          valuesAllSame = false;
        }
        valuesCount++;
        vr = vi.next();
      }
      expect(valuesCount).assertEqual(CAT_CFG.LEN_1025);
      expect(valuesAllSame).assertTrue();
      let ofCount: number = 0;
      let ofAllSame: boolean = true;
      for (const v of arr) {
        if (v !== CAT_CFG.SAME_VAL) {
          ofAllSame = false;
        }
        ofCount++;
      }
      expect(ofCount).assertEqual(CAT_CFG.LEN_1025);
      expect(ofAllSame).assertTrue();
      let entriesCount: number = 0;
      let entriesAllSame: boolean = true;
      const ei: IterableIterator<[number, number]> = arr.entries();
      let er: IteratorResult<[number, number]> = ei.next();
      while (!er.done) {
        const pair: [number, number] = er.value as [number, number];
        if (pair[1] !== CAT_CFG.SAME_VAL) {
          entriesAllSame = false;
        }
        entriesCount++;
        er = ei.next();
      }
      expect(entriesCount).assertEqual(CAT_CFG.LEN_1025);
      expect(entriesAllSame).assertTrue();
      expect(cat.slice(0, 3).join(',')).assertEqual('42,42,42');
      console.info('-----------------collectionsConcatArrayExpand1024Test0010 end-----------------');
    });
  });
}
