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
import { TYPEDARRAY_CFG } from './TypedArrayExpandCfg';

function sumFromZeroTo(n: number): number {
  return n * (n + 1) / 2;
}

function createSequentialInt32Array(size: number): collections.Int32Array {
  const arr: collections.Int32Array = new collections.Int32Array(size);
  for (let i = 0; i < size; i++) {
    arr[i] = i;
  }
  return arr;
}

@Concurrent
function readExpandedBufferRange(buf: collections.ArrayBuffer, start: number, end: number): number {
  const view: collections.Int32Array = new collections.Int32Array(buf);
  let sum = 0;
  for (let i = start; i < end; i++) {
    sum += view[i];
  }
  return sum;
}

@Concurrent
function receiveTypedArrayTask(arr: collections.Int32Array): number {
  let sum = 0;
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum;
}

@Concurrent
function concurrentSetTask(arr: collections.Int32Array, start: number, end: number, value: number): string {
  for (let i = start; i < end; i++) {
    try {
      arr[i] = value;
    } catch (e) {
      return 'concurrent set failed at index ' + i;
    }
  }
  return '';
}

@Concurrent
function verifyTypedArrayExpandCopy(pre: number, len: number, bound: number, int8Max: number): number {
  const oldArr: collections.Int8Array = new collections.Int8Array(pre);
  for (let i = 0; i < pre; i++) {
    oldArr[i] = i % int8Max;
  }
  const newArr: collections.Int8Array = new collections.Int8Array(len);
  newArr.set(oldArr);
  if (oldArr.byteLength !== pre) {
    return 0;
  }
  if (newArr.byteLength !== len) {
    return 1;
  }
  for (let i = 0; i < pre; i++) {
    if (newArr[i] !== oldArr[i]) {
      return 10 + i;
    }
  }
  if (newArr[pre] !== 0) {
    return 2;
  }
  if (newArr[bound] !== 0) {
    return 3;
  }
  return -1;
}

@Concurrent
function verifyTypedArrayAllMethodsAfterTransfer(arr: collections.Int32Array): string {
  if (arr.length !== 1025) {
    return 'length mismatch: ' + arr.length;
  }
  if (arr.byteLength !== 4100) {
    return 'byteLength mismatch: ' + arr.byteLength;
  }
  if (arr.byteOffset !== 0) {
    return 'byteOffset mismatch: ' + arr.byteOffset;
  }
  if (collections.Int32Array.BYTES_PER_ELEMENT !== 4) {
    return 'BYTES_PER_ELEMENT mismatch: ' + collections.Int32Array.BYTES_PER_ELEMENT;
  }
  const buf: collections.ArrayBuffer = arr.buffer;
  if (buf.byteLength !== 4100) {
    return 'buffer byteLength mismatch: ' + buf.byteLength;
  }
  if (Number(arr[0]) !== 0 || Number(arr[1024]) !== 1024) {
    return 'index access mismatch';
  }
  const src: collections.Int32Array = new collections.Int32Array(5);
  for (let i = 0; i < 5; i++) {
    src[i] = i * 10;
  }
  arr.set(src, 0);
  if (Number(arr[4]) !== 40) {
    return 'set from typed array mismatch';
  }
  arr.set([1, 2, 3], 0);
  if (Number(arr[0]) !== 1 || Number(arr[2]) !== 3) {
    return 'set from plain array mismatch';
  }
  const sub: collections.Int32Array = arr.subarray(0, 10);
  if (sub.length !== 10) {
    return 'subarray length mismatch: ' + sub.length;
  }
  const sliced: collections.Int32Array = arr.slice(0, 5);
  if (sliced.length !== 5 || Number(sliced[0]) !== 1) {
    return 'slice mismatch';
  }
  arr.fill(0, 0, 5);
  if (Number(arr[0]) !== 0 || Number(arr[4]) !== 0) {
    return 'fill mismatch';
  }
  arr[10] = 999;
  if (arr.indexOf(999) !== 10) {
    return 'indexOf mismatch: ' + arr.indexOf(999);
  }
  if (arr.indexOf(99999) !== -1) {
    return 'indexOf missing value mismatch: ' + arr.indexOf(99999);
  }
  if (!arr.includes(999)) {
    return 'includes mismatch';
  }
  if (arr.find((v: number): boolean => v === 999) !== 999) {
    return 'find mismatch';
  }
  if (arr.findIndex((v: number): boolean => v === 999) !== 10) {
    return 'findIndex mismatch: ' + arr.findIndex((v: number): boolean => v === 999);
  }
  const mapped: collections.Int32Array = arr.map((v: number): number => v * 2);
  if (Number(mapped[10]) !== 1998) {
    return 'map mismatch';
  }
  const filtered: collections.Int32Array = arr.filter((v: number): boolean => v === 5);
  if (filtered.length !== 1 || Number(filtered[0]) !== 5) {
    return 'filter mismatch: ' + filtered.length;
  }
  const reduced: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
  if (reduced !== 525779) {
    return 'reduce mismatch: ' + reduced;
  }
  const joined: string = arr.join(',');
  if (joined.split(',').length !== 1025) {
    return 'join mismatch: ' + joined.split(',').length;
  }
  if (Number(arr.at(10)) !== 999) {
    return 'at positive index mismatch';
  }
  if (Number(arr.at(-1)) !== 1024) {
    return 'at negative index mismatch';
  }
  let forEachCount = 0;
  let forEachOwnerValid = true;
  arr.forEach((v: number, i: number, owner: collections.Int32Array): void => {
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
  const keyIter = arr.keys();
  const firstKey = keyIter.next();
  if (firstKey.done !== false || firstKey.value !== 0) {
    return 'keys first element mismatch';
  }
  while (!keyIter.next().done) {
    keyCount++;
  }
  if (keyCount !== 1024) {
    return 'keys count mismatch: ' + keyCount;
  }
  let valueCount = 0;
  const valueIter = arr.values();
  const firstValue = valueIter.next();
  if (firstValue.done !== false) {
    return 'values first element mismatch';
  }
  while (!valueIter.next().done) {
    valueCount++;
  }
  if (valueCount !== 1024) {
    return 'values count mismatch: ' + valueCount;
  }
  let entryCount = 0;
  const entryIter = arr.entries();
  const firstEntry = entryIter.next();
  if (firstEntry.done !== false) {
    return 'entries first element mismatch';
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
  const i8View: collections.Int8Array = new collections.Int8Array(buf);
  const i16View: collections.Int16Array = new collections.Int16Array(buf);
  const f32View: collections.Float32Array = new collections.Float32Array(buf);
  if (i8View.byteLength !== 4100 || i16View.byteLength !== 4100 || f32View.byteLength !== 4100) {
    return 'multi view byteLength mismatch';
  }
  return '';
}

export default function TypedArrayExpand1024Test(): void {
  describe('TypedArrayExpand1024Test', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0100
     * @tc.name typedArrayExpand1024Test0001
     * @tc.desc Verifies that expanding an Int8Array from 1023 to 1025 copies all elements and zero-fills the tail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: Object = await taskpool.execute(verifyTypedArrayExpandCopy,
        TYPEDARRAY_CFG.PRE_1023, TYPEDARRAY_CFG.LEN_1025, TYPEDARRAY_CFG.BOUND, TYPEDARRAY_CFG.INT8_MAX);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0200
     * @tc.name typedArrayExpand1024Test0002
     * @tc.desc Verifies that Infinity, -Infinity and NaN in a Float32Array are preserved after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Float32Array = new collections.Float32Array(TYPEDARRAY_CFG.PRE_1023);
      for (let i = 0; i < TYPEDARRAY_CFG.PRE_1020; i++) {
        oldArr[i] = i * 1.1;
      }
      oldArr[TYPEDARRAY_CFG.PRE_1020] = Infinity;
      oldArr[1021] = -Infinity;
      oldArr[1022] = NaN;
      const newArr: collections.Float32Array = new collections.Float32Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(Infinity);
      expect(newArr[1021]).assertEqual(-Infinity);
      expect(Number.isNaN(newArr[1022])).assertTrue();
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.I32_BYTES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0300
     * @tc.name typedArrayExpand1024Test0003
     * @tc.desc Verifies that the Int32Array boundary values are preserved after expanding from 1023 to 1025 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.PRE_1023);
      for (let i = 0; i < 1021; i++) {
        oldArr[i] = i;
      }
      oldArr[1021] = TYPEDARRAY_CFG.INT32_MIN;
      oldArr[1022] = TYPEDARRAY_CFG.INT32_MAX;
      const newArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.INT32_MIN);
      expect(newArr[1022]).assertEqual(TYPEDARRAY_CFG.INT32_MAX);
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.I32_BYTES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0400
     * @tc.name typedArrayExpand1024Test0004
     * @tc.desc Verifies that Int8Array boundary values across 1024 element threshold are preserved after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Int8Array = new collections.Int8Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = TYPEDARRAY_CFG.INT8_MIN;
      oldArr[1021] = TYPEDARRAY_CFG.INT8_MAX;
      oldArr[1022] = 0;
      const newArr: collections.Int8Array = new collections.Int8Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(TYPEDARRAY_CFG.INT8_MIN);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.INT8_MAX);
      expect(newArr[1022]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0500
     * @tc.name typedArrayExpand1024Test0005
     * @tc.desc Verifies the difference of special value handling between integer and float arrays after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldI8: collections.Int8Array = new collections.Int8Array(TYPEDARRAY_CFG.PRE_1023);
      oldI8[TYPEDARRAY_CFG.PRE_1020] = Infinity;
      oldI8[1021] = NaN;
      const newI8: collections.Int8Array = new collections.Int8Array(TYPEDARRAY_CFG.LEN_1025);
      newI8.set(oldI8);
      expect(newI8[TYPEDARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(newI8[1021]).assertEqual(0);
      const oldF32: collections.Float32Array = new collections.Float32Array(TYPEDARRAY_CFG.PRE_1023);
      oldF32[TYPEDARRAY_CFG.PRE_1020] = Infinity;
      oldF32[1021] = -Infinity;
      oldF32[1022] = NaN;
      const newF32: collections.Float32Array = new collections.Float32Array(TYPEDARRAY_CFG.LEN_1025);
      newF32.set(oldF32);
      expect(newF32[TYPEDARRAY_CFG.PRE_1020]).assertEqual(Infinity);
      expect(newF32[1021]).assertEqual(-Infinity);
      expect(Number.isNaN(newF32[1022])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0600
     * @tc.name typedArrayExpand1024Test0006
     * @tc.desc Verifies that Uint8Array boundary values zero and 255 are preserved after expanding to 1025 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Uint8Array = new collections.Uint8Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = 0;
      oldArr[1021] = TYPEDARRAY_CFG.UINT8_MAX;
      const newArr: collections.Uint8Array = new collections.Uint8Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.UINT8_MAX);
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.LEN_1025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0700
     * @tc.name typedArrayExpand1024Test0007
     * @tc.desc Verifies that Uint8ClampedArray clamping rule for negative, overflow and infinity survives expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = -1;
      oldArr[1021] = 256;
      oldArr[1022] = Infinity;
      const newArr: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.UINT8_MAX);
      expect(newArr[1022]).assertEqual(TYPEDARRAY_CFG.UINT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0800
     * @tc.name typedArrayExpand1024Test0008
     * @tc.desc Verifies that the Int16Array boundary values are preserved after expanding to 1025 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Int16Array = new collections.Int16Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = TYPEDARRAY_CFG.INT16_MIN;
      oldArr[1021] = TYPEDARRAY_CFG.INT16_MAX;
      const newArr: collections.Int16Array = new collections.Int16Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(TYPEDARRAY_CFG.INT16_MIN);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.INT16_MAX);
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.I16_BYTES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_0900
     * @tc.name typedArrayExpand1024Test0009
     * @tc.desc Verifies that the Uint16Array boundary values are preserved after expanding to 1025 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Uint16Array = new collections.Uint16Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = 0;
      oldArr[1021] = TYPEDARRAY_CFG.UINT16_MAX;
      const newArr: collections.Uint16Array = new collections.Uint16Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.UINT16_MAX);
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.I16_BYTES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1000
     * @tc.name typedArrayExpand1024Test0010
     * @tc.desc Verifies that the Uint32Array boundary values are preserved after expanding to 1025 elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Uint32Array = new collections.Uint32Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr[TYPEDARRAY_CFG.PRE_1020] = 0;
      oldArr[1021] = TYPEDARRAY_CFG.UINT32_MAX;
      const newArr: collections.Uint32Array = new collections.Uint32Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      expect(newArr[TYPEDARRAY_CFG.PRE_1020]).assertEqual(0);
      expect(newArr[1021]).assertEqual(TYPEDARRAY_CFG.UINT32_MAX);
      expect(newArr.byteLength).assertEqual(TYPEDARRAY_CFG.I32_BYTES);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1100
     * @tc.name typedArrayExpand1024Test0011
     * @tc.desc Verifies that multiple typed array views over one ArrayBuffer stay byte aligned after expansion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldBuf: collections.ArrayBuffer = new collections.ArrayBuffer(TYPEDARRAY_CFG.BUF_4096);
      const oldI32View: collections.Int32Array = new collections.Int32Array(oldBuf);
      oldI32View[0] = 0x12345678;
      const oldI8View: collections.Int8Array = new collections.Int8Array(oldBuf);
      expect(oldI8View[0]).assertEqual(0x78);
      const newBuf: collections.ArrayBuffer = new collections.ArrayBuffer(TYPEDARRAY_CFG.I32_BYTES);
      const newI8View: collections.Int8Array = new collections.Int8Array(newBuf);
      const newI32View: collections.Int32Array = new collections.Int32Array(newBuf);
      newI8View.set(oldI8View);
      expect(newI32View[0]).assertEqual(0x12345678);
      expect(newI8View[0]).assertEqual(0x78);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1200
     * @tc.name typedArrayExpand1024Test0012
     * @tc.desc Verifies that a shared collections ArrayBuffer is readable across taskpool tasks via sendable reference.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(TYPEDARRAY_CFG.I32_BYTES);
      const view: collections.Int32Array = new collections.Int32Array(buf);
      for (let i = 0; i < TYPEDARRAY_CFG.LEN_1025; i++) {
        view[i] = i;
      }
      const results: number[] = await Promise.all([
        taskpool.execute(readExpandedBufferRange, buf, 0, TYPEDARRAY_CFG.SEG_A) as Promise<number>,
        taskpool.execute(readExpandedBufferRange, buf, TYPEDARRAY_CFG.SEG_A, TYPEDARRAY_CFG.SEG_B) as Promise<number>,
        taskpool.execute(readExpandedBufferRange, buf, TYPEDARRAY_CFG.SEG_B, TYPEDARRAY_CFG.LEN_1025) as Promise<number>
      ]);
      const total: number = results[0] + results[1] + results[2];
      expect(total).assertEqual(sumFromZeroTo(TYPEDARRAY_CFG.BOUND));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1300
     * @tc.name typedArrayExpand1024Test0013
     * @tc.desc Verifies concurrent tasks reading disjoint ranges of an expanded ArrayBuffer observe consistent data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Int32Array = createSequentialInt32Array(TYPEDARRAY_CFG.LEN_1025);
      const results: number[] = await Promise.all([
        taskpool.execute(readExpandedBufferRange, arr.buffer, 0, TYPEDARRAY_CFG.SEG_A) as Promise<number>,
        taskpool.execute(readExpandedBufferRange, arr.buffer,
          TYPEDARRAY_CFG.SEG_A, TYPEDARRAY_CFG.SEG_B) as Promise<number>,
        taskpool.execute(readExpandedBufferRange, arr.buffer,
          TYPEDARRAY_CFG.SEG_B, TYPEDARRAY_CFG.LEN_1025) as Promise<number>
      ]);
      const total: number = results[0] + results[1] + results[2];
      expect(total).assertEqual(sumFromZeroTo(TYPEDARRAY_CFG.BOUND));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1400
     * @tc.name typedArrayExpand1024Test0014
     * @tc.desc Verifies that an Int32Array with 1025 elements transfers fully to a taskpool via structured cloning.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Int32Array = createSequentialInt32Array(TYPEDARRAY_CFG.LEN_1025);
      const sum: number = await (taskpool.execute(receiveTypedArrayTask, arr) as Promise<number>);
      expect(sum).assertEqual(sumFromZeroTo(TYPEDARRAY_CFG.BOUND));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1500
     * @tc.name typedArrayExpand1024Test0015
     * @tc.desc Verifies that writing disjoint ranges of an expanded Int32Array concurrently does not corrupt the array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const oldArr: collections.Int32Array = createSequentialInt32Array(TYPEDARRAY_CFG.PRE_1023);
      const newArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      const errs: string[] = await Promise.all([
        taskpool.execute(concurrentSetTask, newArr, 0, TYPEDARRAY_CFG.SEG_A, 100) as Promise<string>,
        taskpool.execute(concurrentSetTask, newArr, TYPEDARRAY_CFG.SEG_A, TYPEDARRAY_CFG.SEG_B, 200) as Promise<string>,
        taskpool.execute(concurrentSetTask, newArr,
          TYPEDARRAY_CFG.SEG_B, TYPEDARRAY_CFG.LEN_1025, 300) as Promise<string>
      ]);
      expect(errs[0]).assertEqual('');
      expect(errs[1]).assertEqual('');
      expect(errs[2]).assertEqual('');
      expect(newArr.length).assertEqual(TYPEDARRAY_CFG.LEN_1025);
      expect(Number(newArr[0])).assertEqual(100);
      expect(Number(newArr[341])).assertEqual(100);
      expect(Number(newArr[TYPEDARRAY_CFG.SEG_A])).assertEqual(200);
      expect(Number(newArr[683])).assertEqual(200);
      expect(Number(newArr[TYPEDARRAY_CFG.SEG_B])).assertEqual(300);
      expect(Number(newArr[TYPEDARRAY_CFG.BOUND])).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1600
     * @tc.name typedArrayExpand1024Test0016
     * @tc.desc Verifies that all properties and methods of an Int32Array remain usable after transfer across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: collections.Int32Array = createSequentialInt32Array(TYPEDARRAY_CFG.LEN_1025);
      const failPromise: Promise<string> = taskpool.execute(
        verifyTypedArrayAllMethodsAfterTransfer, arr) as Promise<string>;
      const failReason: string = await failPromise;
      expect(failReason).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_COLLECTIONS_TYPEDARRAY_EXPANSION_1024_1700
     * @tc.name typedArrayExpand1024Test0017
     * @tc.desc Verifies filling a constant value across 1024 keeps every, indexOf, includes and filter consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typedArrayExpand1024Test0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oldArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.PRE_1023);
      oldArr.fill(TYPEDARRAY_CFG.FILL_42);
      expect(oldArr.every((v: number): boolean => v === TYPEDARRAY_CFG.FILL_42)).assertTrue();
      expect(oldArr.indexOf(TYPEDARRAY_CFG.FILL_42)).assertEqual(0);
      expect(oldArr.includes(TYPEDARRAY_CFG.FILL_42)).assertTrue();
      expect(oldArr.filter((v: number): boolean => v === TYPEDARRAY_CFG.FILL_42)
        .length).assertEqual(TYPEDARRAY_CFG.PRE_1023);
      const newArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.LEN_1025);
      newArr.set(oldArr);
      newArr.fill(TYPEDARRAY_CFG.FILL_42, TYPEDARRAY_CFG.PRE_1023);
      expect(newArr.every((v: number): boolean => v === TYPEDARRAY_CFG.FILL_42)).assertTrue();
      expect(newArr.indexOf(TYPEDARRAY_CFG.FILL_42)).assertEqual(0);
      expect(newArr.filter((v: number): boolean => v === TYPEDARRAY_CFG.FILL_42)
        .length).assertEqual(TYPEDARRAY_CFG.LEN_1025);
      const infArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.LEN_1025);
      infArr.fill(Infinity);
      expect(infArr.every((v: number): boolean => v === 0)).assertTrue();
      const nanArr: collections.Int32Array = new collections.Int32Array(TYPEDARRAY_CFG.LEN_1025);
      nanArr.fill(NaN);
      expect(nanArr.every((v: number): boolean => v === 0)).assertTrue();
      const f32Arr: collections.Float32Array = new collections.Float32Array(TYPEDARRAY_CFG.LEN_1025);
      f32Arr.fill(Infinity);
      expect(f32Arr.every((v: number): boolean => v === Infinity)).assertTrue();
      f32Arr.fill(NaN);
      expect(f32Arr.every((v: number): boolean => Number.isNaN(v))).assertTrue();
      const clampedArr: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(TYPEDARRAY_CFG.LEN_1025);
      clampedArr.fill(Infinity);
      expect(clampedArr.every((v: number): boolean => v === TYPEDARRAY_CFG.UINT8_MAX)).assertTrue();
      clampedArr.fill(-Infinity);
      expect(clampedArr.every((v: number): boolean => v === 0)).assertTrue();
    });
  });
}
