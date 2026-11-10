'use static';

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

import {
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

class TaggedSlot {
  tag: string = 'slot';
  size: int = 2;
}

class FrozenShape {
  buffer: ArrayBuffer = new ArrayBuffer(16);
  byteOffset: int = 0;
  byteLength: int = 16;
  length: int = 2;
}

interface LengthBag {
  length: int;
}

interface ViewEnvelope {
  data: BigInt64Array;
}

interface NestedLeaf {
  value: int;
}

interface NestedMid {
  leaf: NestedLeaf;
}

interface NestedTop {
  mid: NestedMid;
}

interface ConfigPair {
  a: int;
  b: string;
}

class ViewHolder {
  data: BigInt64Array = new BigInt64Array(2);
  id: int = 1;
}

class StaticView {
  static data: BigInt64Array = new BigInt64Array(1);
  id: int = 0;
}

class NullableView {
  view: BigInt64Array | null = null;
}

class CycleLink {
  next: CycleLink | null = null;
  tag: string = 'c';
}

class SelfLink {
  data: int = 3;
  self: SelfLink | null = null;
}

class SlotKey {
  tag: string = 'k';
}

class AsyncMethodHolder {
  async asyncMethod(): Promise<void> {
  }
  plainMethod(): void {
  }
}

function buildBigInt64Array(): BigInt64Array {
  return new BigInt64Array(3);
}

function probeBigInt64(checker: util.types, value: Object): boolean {
  return checker.isBigInt64Array(value);
}

class WordStore {
  slot: BigInt64Array = new BigInt64Array(1);

  write(value: bigint): void {
    this.slot.$_set(0, value);
  }

  read(): bigint {
    return this.slot.$_get(0);
  }
}

class WordFactory {
  static build(host: ArrayBuffer): BigInt64Array {
    return new BigInt64Array(host, 8, 1);
  }
}

interface VerdictBag {
  ok: boolean;
}

function labelForBigInt64(flag: boolean): string {
  if (flag) {
    return 'signed64';
  }
  return 'other';
}

function seedIntoArray(target: BigInt64Array, seed: bigint): void {
  target.$_set(0, seed);
}

function presentWindow(host: ArrayBuffer): BigInt64Array | undefined {
  return new BigInt64Array(host, 8, 1);
}

export default function typesIsBigInt64ArrayTest(): void {
  describe('TypesIsBigInt64ArrayTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0100
     * @tc.name testTypesIsBigInt64Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a BigInt64Array that spans a whole sixteen byte ArrayBuffer; accepts the BigInt64Array built by of from the two scalar bigint arguments 3 and 4; accepts the two element BigInt64Array produced by slice from index 1 to index 3; accepts a BigInt64Array built on a sliced sixteen byte ArrayBuffer; iterating a Set holding an Int8Array and a BigInt64Array yields exactly one isBigInt64Array hit.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for a BigInt64Array that spans a whole sixteen byte ArrayBuffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.length).assertEqual(2);
        expect(bigInt64View.byteLength).assertEqual(16);
      }

      // --- [2] Verify isBigInt64Array returns true for the BigInt64Array built by of from the two scalar bigint arguments 3 and 4 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let built: BigInt64Array = BigInt64Array.of(BigInt(3), BigInt(4));
        expect(built.length).assertEqual(2);
        let first: bigint = built.$_get(0);
        expect(first.toString()).assertEqual('3');
        expect(bigInt64Probe.isBigInt64Array(built)).assertTrue();
      }

      // --- [3] Verify isBigInt64Array returns true for the two element BigInt64Array produced by slice from index 1 to index 3 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let base: BigInt64Array = new BigInt64Array(4);
        let part: BigInt64Array = base.slice(1, 3);
        let verdict: boolean = bigInt64Probe.isBigInt64Array(part);
        expect(verdict).assertTrue();
        expect(part.length).assertEqual(2);
      }

      // --- [4] Verify isBigInt64Array returns true for a BigInt64Array built on a sliced sixteen byte ArrayBuffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let part: ArrayBuffer = new ArrayBuffer(24).slice(0, 16);
        let bigInt64View: BigInt64Array = new BigInt64Array(part);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.length).assertEqual(2);
      }

      // --- [5] Verify iterating a Set holding an Int8Array and a BigInt64Array yields exactly one isBigInt64Array hit ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bag: Set<Object> = new Set<Object>();
        bag.add(new Int8Array(1));
        bag.add(new BigInt64Array(1));
        let iterator: IterableIterator<Object> = bag.values();
        let step: IteratorResult<Object> = iterator.next();
        let hits: int = 0;
        while (!step.done) {
          let item: Object = step.value!;
          if (bigInt64Probe.isBigInt64Array(item)) {
            hits = hits + 1;
          }
          step = iterator.next();
        }
        expect(hits).assertEqual(1);
        expect(bag.size).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0200
     * @tc.name testTypesIsBigInt64Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a BigInt64Array reversed within its own buffer and the element order is inverted; the buffer property of a BigInt64Array still points at the original ArrayBuffer after the judgement; four judgements through two util.types instances yield true only for the BigInt64Array; a mixed seven entry candidate table yields exactly one BigInt64Array hit; the BigInt64Array positions in a three candidate pool accumulate into the bitmask 5, which is one plus four.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array still returns true for a BigInt64Array reversed within its own buffer and the element order is inverted ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(3);
        bigInt64View.$_set(0, BigInt(1));
        bigInt64View.$_set(1, BigInt(2));
        bigInt64View.$_set(2, BigInt(3));
        let reversed: BigInt64Array = bigInt64View.reverse();
        expect(bigInt64Checker.isBigInt64Array(reversed)).assertTrue();
        expect(bigInt64View.$_get(0)).assertEqual(BigInt(3));
        expect(bigInt64View.$_get(2)).assertEqual(BigInt(1));
        expect(reversed.length).assertEqual(3);
      }

      // --- [2] Verify the buffer property of a BigInt64Array still points at the original ArrayBuffer after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(bigInt64View.buffer).assertEqual(ab);
      }

      // --- [3] Verify four judgements through two util.types instances yield true only for the BigInt64Array ---
      {
        let bigInt64Checker: util.types = new util.types();
        let other: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let big: BigUint64Array = new BigUint64Array(2);
        let buffer: ArrayBuffer = new ArrayBuffer(16);
        let view: DataView = new DataView(buffer);
        let r1: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        let r2: boolean = other.isBigInt64Array(big);
        let r3: boolean = bigInt64Checker.isBigInt64Array(buffer);
        let r4: boolean = other.isBigInt64Array(view);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(r3).assertFalse();
        expect(r4).assertFalse();
      }

      // --- [4] Verify a mixed seven entry candidate table yields exactly one BigInt64Array hit ---
      {
        let bigInt64Probe: util.types = new util.types();
        let candidates: Array<Object> = [new Date(0), new Map<string, int>(), Double.NaN as Object,
          (-1) as Object, 'txt', new Uint8Array(2), new BigInt64Array(1)];
        let hits: int = 0;
        for (let i: int = 0; i < candidates.length; i++) {
          if (bigInt64Probe.isBigInt64Array(candidates[i])) {
            hits++;
          }
        }
        expect(hits).assertEqual(1);
      }

      // --- [5] Verify the BigInt64Array positions in a three candidate pool accumulate into the bitmask 5, which is one plus four ---
      {
        let bigInt64Probe: util.types = new util.types();
        let pool: Array<Object> = [new BigInt64Array(1), new Uint8Array(1), new BigInt64Array(1)];
        let mask: int = 0;
        for (let i: int = 0; i < pool.length; i++) {
          if (bigInt64Probe.isBigInt64Array(pool[i])) {
            mask = mask | (1 << i);
          }
        }
        expect(mask).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0300
     * @tc.name testTypesIsBigInt64Array003
     * @tc.desc Merged batch (1 test): Basic construction and recognition: the branch chosen by the judgement is the BigInt64Array branch and not the Uint8Array branch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the branch chosen by the judgement is the BigInt64Array branch and not the Uint8Array branch ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        let hit: string = '';
        if (bigInt64Probe.isBigInt64Array(bigInt64View)) {
          hit = 'big';
        }
        if (bigInt64Probe.isBigInt64Array(uint8View)) {
          hit = 'bad';
        }
        expect(hit).assertEqual('big');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0400
     * @tc.name testTypesIsBigInt64Array004
     * @tc.desc Merged batch (5 tests): Boundary values: accepts the zero length BigInt64Array and the single element BigInt64Array; accepts a BigInt64Array over a zero byte buffer and one whose element holds 2147483647; rejects the strings 'str', the empty string and the single digit string; rejects Uint8Array, Uint8ClampedArray, BigUint64Array, Date and RegExp values; one host buffer carries single element windows at byteOffset 0 and 16 plus three and hundred element windows.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for the zero length BigInt64Array and the single element BigInt64Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let empty: BigInt64Array = new BigInt64Array(0);
        let single: BigInt64Array = new BigInt64Array(1);
        expect(bigInt64Probe.isBigInt64Array(empty)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(single)).assertTrue();
        expect(empty.length).assertEqual(0);
        expect(single.length).assertEqual(1);
      }

      // --- [2] Verify a BigInt64Array over a zero byte buffer and one whose element holds 2147483647 are both accepted ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.byteLength).assertEqual(0);
        let bigInt64Probe_2: util.types = new util.types();
        let bigInt64View_2: BigInt64Array = new BigInt64Array(1);
        bigInt64View_2.$_set(0, 2147483647);
        expect(bigInt64Probe_2.isBigInt64Array(bigInt64View_2)).assertTrue();
        expect(bigInt64View_2.length).assertEqual(1);
      }

      // --- [3] Verify isBigInt64Array returns false for the strings 'str', the empty string and the single digit string ---
      {
        let bigInt64Checker: util.types = new util.types();
        let word: string = 'str';
        let blank: string = '';
        let digit: string = '0';
        expect(bigInt64Checker.isBigInt64Array(word)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(blank)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(digit)).assertFalse();
      }

      // --- [4] Verify isBigInt64Array returns false for Uint8Array, Uint8ClampedArray, BigUint64Array, Date and RegExp values ---
      {
        let bigInt64Checker: util.types = new util.types();
        let u8z: Uint8Array = new Uint8Array(0);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(2);
        let bu: BigUint64Array = new BigUint64Array(2);
        let buz: BigUint64Array = new BigUint64Array(0);
        let d: Date = new Date(1700000000000);
        let re: RegExp = new RegExp('big');
        expect(bigInt64Checker.isBigInt64Array(u8z)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(clamped)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(bu)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(buz)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(d)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(re)).assertFalse();
      }

      // --- [5] Verify one host buffer carries single element windows at byteOffset 0 and 16 plus three and hundred element windows ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(824);
        let left: BigInt64Array = new BigInt64Array(host, 0, 1);
        let right: BigInt64Array = new BigInt64Array(host, 16, 1);
        let tri: BigInt64Array = new BigInt64Array(host, 0, 3);
        let wide: BigInt64Array = new BigInt64Array(host, 24, 100);
        expect(bigInt64Probe.isBigInt64Array(left)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(right)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(tri)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(wide)).assertTrue();
        expect(right.byteOffset).assertEqual(16);
        expect(wide.length).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0500
     * @tc.name testTypesIsBigInt64Array005
     * @tc.desc Merged batch (5 tests): Boundary values: accepts the single element BigInt64Array window at byteOffset 8 of a sixteen byte buffer; accepts a subarray derived from a single element BigInt64Array window; rejects the ArrayBuffer behind a BigInt64Array and for a zero byte ArrayBuffer; a single element BigInt64Array window over an eight byte buffer reports byteLength 8; a full width BigInt64Array and a single element window of the same buffer are both true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for the single element BigInt64Array window at byteOffset 8 of a sixteen byte buffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 8, 1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.byteOffset).assertEqual(8);
        expect(bigInt64View.byteLength).assertEqual(8);
      }

      // --- [2] Verify isBigInt64Array returns true for a subarray derived from a single element BigInt64Array window ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 1);
        let again: BigInt64Array = bigInt64View.subarray(0, 1);
        expect(bigInt64Probe.isBigInt64Array(again)).assertTrue();
        expect(again.byteLength).assertEqual(8);
      }

      // --- [3] Verify isBigInt64Array returns false for the ArrayBuffer behind a BigInt64Array and for a zero byte ArrayBuffer ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let ab: ArrayBuffer = bigInt64View.buffer;
        let zero: ArrayBuffer = new ArrayBuffer(0);
        expect(bigInt64Checker.isBigInt64Array(ab)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(zero)).assertFalse();
      }

      // --- [4] Verify a single element BigInt64Array window over an eight byte buffer reports byteLength 8 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.byteLength).assertEqual(8);
        expect(bigInt64View.length).assertEqual(1);
      }

      // --- [5] Verify a full width BigInt64Array and a single element window of the same buffer are both true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let full: BigInt64Array = new BigInt64Array(ab);
        let window: BigInt64Array = new BigInt64Array(ab, 8, 1);
        expect(bigInt64Probe.isBigInt64Array(full)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(window)).assertTrue();
        expect(window.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0600
     * @tc.name testTypesIsBigInt64Array006
     * @tc.desc Merged batch (5 tests): Boundary values: isBigInt64Array accepts a view holding the int64 maximum 9223372036854775807 whose top byte is 127; accepts views written with 2^63 and the uint64 maximum wrap to the int64 minimum and -1; the verdict stays true as the same variable is reassigned from a two element to a five element and to a one element BigInt64Array; a single element window at byteOffset 8 is accepted; a while loop counts exactly two non zero bytes among the sixteen behind a BigInt64Array after elements 255 and 256 are written.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array accepts a view holding the int64 maximum 9223372036854775807 whose top byte is 127 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 1);
        bigInt64View.$_set(0, BigInt('9223372036854775807'));
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        let bytes: Uint8Array = new Uint8Array(host);
        expect(bytes.$_get(8)).assertEqual(255);
        expect(bytes.$_get(14)).assertEqual(255);
        expect(bytes.$_get(15)).assertEqual(127);
      }

      // --- [2] Verify views written with 2^63 and the uint64 maximum wrap to the int64 minimum and -1 and are both accepted ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        bigInt64View.$_set(0, BigInt('9223372036854775808'));
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        let wrapped: bigint = bigInt64View.$_get(0);
        expect(wrapped.toString()).assertEqual('-9223372036854775808');
        let bigInt64Probe_2: util.types = new util.types();
        let bigInt64View_2: BigInt64Array = new BigInt64Array(1);
        bigInt64View_2.$_set(0, BigInt('18446744073709551615'));
        let expected: string = '-1';
        let wrapped_2: bigint = bigInt64View_2.$_get(0);
        expect(wrapped_2.toString()).assertEqual(expected);
        expect(bigInt64Probe_2.isBigInt64Array(bigInt64View_2)).assertTrue();
      }

      // --- [3] Verify the verdict stays true as the same variable is reassigned from a two element to a five element and to a one element BigInt64Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let view: BigInt64Array = new BigInt64Array(2);
        expect(view.length).assertEqual(2);
        expect(bigInt64Probe.isBigInt64Array(view)).assertTrue();

        view = new BigInt64Array(5);
        expect(view.length).assertEqual(5);
        expect(bigInt64Probe.isBigInt64Array(view)).assertTrue();

        view = new BigInt64Array(1);
        expect(view.length).assertEqual(1);
        expect(bigInt64Probe.isBigInt64Array(view)).assertTrue();
      }

      // --- [4] Verify a single element window at byteOffset 8 is accepted while an out-of-bounds window and a misaligned offset raise RangeError ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 1);
        bigInt64View.$_set(0, BigInt(1));
        let bytes: Uint8Array = new Uint8Array(host);
        expect(bytes.$_get(8)).assertEqual(1);
        expect(bytes.$_get(9)).assertEqual(0);
        expect(bytes.$_get(15)).assertEqual(0);
        expect(bigInt64View.byteOffset).assertEqual(8);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        let bigInt64Probe_2: util.types = new util.types();
        let host_2: ArrayBuffer = new ArrayBuffer(16);
        try {
          new BigInt64Array(host_2, 8, 2);
          expect().assertFail();
        } catch (overrunErr) {
          expect(overrunErr.name).assertEqual('RangeError');
        }
        try {
          new BigInt64Array(host_2, 20, 1);
          expect().assertFail();
        } catch (offsetErr) {
          expect(offsetErr.name).assertEqual('RangeError');
        }
        expect(bigInt64Probe_2.isBigInt64Array(new BigInt64Array(host_2, 8, 1))).assertTrue();
        expect(bigInt64Probe_2.isBigInt64Array(new BigInt64Array(host_2))).assertTrue();
      }

      // --- [5] Verify a while loop counts exactly two non zero bytes among the sixteen behind a BigInt64Array after elements 255 and 256 are written ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        bigInt64View.$_set(0, BigInt(255));
        bigInt64View.$_set(1, BigInt(256));
        let bytes: Uint8Array = new Uint8Array(host);
        let index: int = 0;
        let nonZero: int = 0;
        while (index < 16) {
          if (bytes.$_get(index) > 0) {
            nonZero = nonZero + 1;
          }
          index = index + 1;
        }
        expect(nonZero).assertEqual(2);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0700
     * @tc.name testTypesIsBigInt64Array007
     * @tc.desc Merged batch (1 test): Boundary values: the length and the first element of an int array are unchanged after the judgement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the length and the first element of an int array are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let list: int[] = [1, 2, 3];
        bigInt64Probe.isBigInt64Array(list);
        expect(list.length).assertEqual(3);
        expect(list[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0800
     * @tc.name testTypesIsBigInt64Array008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int values 1, -1 and 0 and double values 3.14 and -3.14; rejects NaN, positive infinity and negative infinity; rejects the boolean values true and false; at returns the trailing element as a plain bigint that the typed array predicate rejects; rejects Int8Array, Int16Array, Int32Array, Uint8Array, Uint16Array, Uint32Array, Float32Array and Float64Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns false for the int values 1, -1 and 0 and double values 3.14 and -3.14 ---
      {
        let bigInt64Checker: util.types = new util.types();
        let one: int = 1;
        let neg: int = -1;
        let zero: int = 0;
        expect(bigInt64Checker.isBigInt64Array(one)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(neg)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(zero)).assertFalse();
        let bigInt64Checker_2: util.types = new util.types();
        let pi: double = 3.14;
        let neg_2: double = -3.14;
        expect(bigInt64Checker_2.isBigInt64Array(pi)).assertFalse();
        expect(bigInt64Checker_2.isBigInt64Array(neg_2)).assertFalse();
      }

      // --- [2] Verify isBigInt64Array returns false for NaN, positive infinity and negative infinity ---
      {
        let bigInt64Checker: util.types = new util.types();
        let nan: double = Double.NaN;
        let inf: double = Double.POSITIVE_INFINITY;
        let ninf: double = Double.NEGATIVE_INFINITY;
        expect(bigInt64Checker.isBigInt64Array(nan)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(inf)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(ninf)).assertFalse();
      }

      // --- [3] Verify isBigInt64Array returns false for the boolean values true and false ---
      {
        let bigInt64Checker: util.types = new util.types();
        expect(bigInt64Checker.isBigInt64Array(true)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(false)).assertFalse();
      }

      // --- [4] Verify at returns the trailing element as a plain bigint that the typed array predicate rejects ---
      {
        let bigInt64Probe: util.types = new util.types();
        let source: BigInt64Array = new BigInt64Array([5n, 6n, 7n]);
        let last: bigint | undefined = source.at(-1);
        let held: bigint = 0n;
        if (last !== undefined) {
          held = last;
        }
        expect(held).assertEqual(7n);
        expect(bigInt64Probe.isBigInt64Array(source)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(held)).assertFalse();
      }

      // --- [5] Verify isBigInt64Array returns false for Int8Array, Int16Array, Int32Array, Uint8Array, Uint16Array, Uint32Array, Float32Array and Float64Array ---
      {
        let bigInt64Checker: util.types = new util.types();
        let int8View: Int8Array = new Int8Array(2);
        let int16View: Int16Array = new Int16Array(2);
        expect(bigInt64Checker.isBigInt64Array(int8View)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(int16View)).assertFalse();
        let int32View: Int32Array = new Int32Array(2);
        let uint8View: Uint8Array = new Uint8Array(2);
        expect(bigInt64Checker.isBigInt64Array(int32View)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(uint8View)).assertFalse();
        let uint16View: Uint16Array = new Uint16Array(2);
        let uint32View: Uint32Array = new Uint32Array(2);
        expect(bigInt64Checker.isBigInt64Array(uint16View)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(uint32View)).assertFalse();
        let float32View: Float32Array = new Float32Array(2);
        let float64View: Float64Array = new Float64Array(2);
        expect(bigInt64Checker.isBigInt64Array(float32View)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(float64View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_0900
     * @tc.name testTypesIsBigInt64Array009
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the four byte ArrayBuffer produced by slicing an eight byte buffer; rejects an Error instance carrying a message; rejects a Map key iterator and for a Set value iterator; rejects a plain class instance carrying a tag and a size field; rejects an interface object literal holding an int and a string field.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns false for the four byte ArrayBuffer produced by slicing an eight byte buffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let sliced: ArrayBuffer = new ArrayBuffer(8).slice(0, 4);
        expect(bigInt64Probe.isBigInt64Array(sliced)).assertFalse();
        expect(sliced.byteLength).assertEqual(4);
      }

      // --- [2] Verify isBigInt64Array returns false for an Error instance carrying a message ---
      {
        let bigInt64Probe: util.types = new util.types();
        let er: Error = new Error('boom');
        expect(bigInt64Probe.isBigInt64Array(er)).assertFalse();
        expect(er.message).assertEqual('boom');
      }

      // --- [3] Verify isBigInt64Array returns false for a Map key iterator and for a Set value iterator ---
      {
        let bigInt64Checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        let mk: IterableIterator<string> = m.keys();
        let sv: IterableIterator<int> = s.values();
        expect(bigInt64Checker.isBigInt64Array(mk)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(sv)).assertFalse();
      }

      // --- [4] Verify isBigInt64Array returns false for a plain class instance carrying a tag and a size field ---
      {
        let bigInt64Probe: util.types = new util.types();
        let slot: TaggedSlot = new TaggedSlot();
        expect(bigInt64Probe.isBigInt64Array(slot)).assertFalse();
        expect(slot.size).assertEqual(2);
      }

      // --- [5] Verify isBigInt64Array returns false for an interface object literal holding an int and a string field ---
      {
        let bigInt64Probe: util.types = new util.types();
        let cfg: ConfigPair = { a: 7, b: 'k' };
        expect(bigInt64Probe.isBigInt64Array(cfg)).assertFalse();
        expect(cfg.a).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1000
     * @tc.name testTypesIsBigInt64Array010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a structural impostor that copies the buffer, byteOffset, byteLength and length attributes; rejects an interface object that only carries a length field; rejects a plain arrow function and for an async arrow function; a two node cycle and a self referencing object are both rejected without raising an exception; an Object variable stays false as it is reassigned from a class instance to an int array and to a Date.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns false for a structural impostor that copies the buffer, byteOffset, byteLength and length attributes ---
      {
        let bigInt64Probe: util.types = new util.types();
        let fake: FrozenShape = new FrozenShape();
        expect(bigInt64Probe.isBigInt64Array(fake)).assertFalse();
        expect(fake.byteLength).assertEqual(16);
        expect(fake.length).assertEqual(2);
      }

      // --- [2] Verify isBigInt64Array returns false for an interface object that only carries a length field ---
      {
        let bigInt64Probe: util.types = new util.types();
        let like: LengthBag = { length: 2 };
        expect(bigInt64Probe.isBigInt64Array(like)).assertFalse();
        expect(like.length).assertEqual(2);
      }

      // --- [3] Verify isBigInt64Array returns false for a plain arrow function and for an async arrow function ---
      {
        let bigInt64Checker: util.types = new util.types();
        let plain: Function = (): int => {
          return 2;
        };
        let af: Function = async (): Promise<void> => {
        };
        expect(bigInt64Checker.isBigInt64Array(plain)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(af)).assertFalse();
      }

      // --- [4] Verify a two node cycle and a self referencing object are both rejected without raising an exception ---
      {
        let bigInt64Checker: util.types = new util.types();
        let first: CycleLink = new CycleLink();
        let second: CycleLink = new CycleLink();
        first.next = second;
        second.next = first;
        let verdict: boolean = bigInt64Checker.isBigInt64Array(first);
        expect(verdict).assertFalse();
        let bigInt64Checker_2: util.types = new util.types();
        let node: SelfLink = new SelfLink();
        node.self = node;
        expect(bigInt64Checker_2.isBigInt64Array(node)).assertFalse();
      }

      // --- [5] Verify an Object variable stays false as it is reassigned from a class instance to an int array and to a Date ---
      {
        let bigInt64Checker: util.types = new util.types();
        let dynamic: Object = new TaggedSlot();
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertFalse();
        let list: int[] = [1, 2];
        dynamic = list;
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertFalse();
        dynamic = new Date(0);
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1100
     * @tc.name testTypesIsBigInt64Array011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: a byte written through a shared Uint8Array is readable; rejects a three level nested object literal; rejects a DataView over an eight byte ArrayBuffer; an Object variable switches from true to false as it is reassigned from a BigInt64Array to a BigUint64Array and to an Int32Array; writing an element into a BigInt64Array does not change its true classification.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a byte written through a shared Uint8Array is readable while the BigInt64Array stays true and the Uint8Array stays false ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 2);
        let uint8View: Uint8Array = new Uint8Array(ab);
        uint8View.$_set(0, 1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(uint8View)).assertFalse();
        expect(uint8View.$_get(0)).assertEqual(1);
      }

      // --- [2] Verify isBigInt64Array returns false for a three level nested object literal ---
      {
        let bigInt64Probe: util.types = new util.types();
        let top: NestedTop = { mid: { leaf: { value: 1 } } };
        expect(bigInt64Probe.isBigInt64Array(top)).assertFalse();
        expect(top.mid.leaf.value).assertEqual(1);
      }

      // --- [3] Verify isBigInt64Array returns false for a DataView over an eight byte ArrayBuffer ---
      {
        let bigInt64Checker: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(8));
        expect(bigInt64Checker.isBigInt64Array(dv)).assertFalse();
      }

      // --- [4] Verify an Object variable switches from true to false as it is reassigned from a BigInt64Array to a BigUint64Array and to an Int32Array ---
      {
        let bigInt64Checker: util.types = new util.types();
        let dynamic: Object = new BigInt64Array(1);
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertTrue();
        dynamic = new BigUint64Array(1);
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertFalse();
        dynamic = new Int32Array(1);
        expect(bigInt64Checker.isBigInt64Array(dynamic)).assertFalse();
      }

      // --- [5] Verify writing an element into a BigInt64Array does not change its true classification ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        bigInt64View.$_set(0, 12);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1200
     * @tc.name testTypesIsBigInt64Array012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: interleaving a Uint8Array judgement between two BigInt64Array judgements does not change the results; rejects an async class method reference and for a plain class method reference; two consecutive calls on the same Uint8Array return equal false booleans; the judgement sequence true, false, true over one BigInt64Array and one Uint8Array; isBigInt64Array stays true for its own view.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify interleaving a Uint8Array judgement between two BigInt64Array judgements does not change the results ---
      {
        let bigInt64Checker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 1);
        let uint8View: Uint8Array = new Uint8Array(ab, 8, 4);
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(uint8View)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [2] Verify isBigInt64Array returns false for an async class method reference and for a plain class method reference ---
      {
        let bigInt64Checker: util.types = new util.types();
        let holder: AsyncMethodHolder = new AsyncMethodHolder();
        expect(bigInt64Checker.isBigInt64Array(holder.asyncMethod)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(holder.plainMethod)).assertFalse();
      }

      // --- [3] Verify two consecutive calls on the same Uint8Array return equal false booleans ---
      {
        let bigInt64Checker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(2);
        let first: boolean = bigInt64Checker.isBigInt64Array(uint8View);
        let second: boolean = bigInt64Checker.isBigInt64Array(uint8View);
        expect(first).assertEqual(second);
        expect(first).assertFalse();
      }

      // --- [4] Verify the judgement sequence true, false, true over one BigInt64Array and one Uint8Array ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        let r1: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        let r2: boolean = bigInt64Checker.isBigInt64Array(uint8View);
        let r3: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        expect(r1).assertTrue();
        expect(r2).assertFalse();
        expect(r3).assertTrue();
      }

      // --- [5] Verify isBigInt64Array stays true for its own view while BigUint64Array and Float64Array siblings over one buffer are false ---
      {
        let bigInt64Checker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 1);
        let bu: BigUint64Array = new BigUint64Array(ab, 8, 1);
        let float64View: Float64Array = new Float64Array(ab, 8, 1);
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(bu)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(float64View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1300
     * @tc.name testTypesIsBigInt64Array013
     * @tc.desc Merged batch (5 tests): Primitive value rejection: an element written as a bigint through a BigInt64Array is read back as a bigint; the negated result is false for a BigInt64Array and true for a Uint8Array; a BigInt64Array's backing buffer is false for the view predicates; isBigInt64Array rejects a BigUint64Array copied from a -1 view that reads the uint64 maximum; rejects a promise resolved with an int.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an element written as a bigint through a BigInt64Array is read back as a bigint while its sibling Uint8Array stays false ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 0, 2);
        let uint8View: Uint8Array = new Uint8Array(ab, 8, 4);
        bigInt64View.$_set(1, BigInt(3));
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(uint8View)).assertFalse();
        expect(bigInt64View.$_get(1)).assertEqual(BigInt(3));
      }

      // --- [2] Verify the negated result is false for a BigInt64Array and true for a Uint8Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        expect(!bigInt64Probe.isBigInt64Array(bigInt64View)).assertFalse();
        expect(!bigInt64Probe.isBigInt64Array(uint8View)).assertTrue();
      }

      // --- [3] Verify a BigInt64Array's backing buffer is false for the view predicates but isArrayBuffer and isAnyArrayBuffer true ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let host: ArrayBuffer = bigInt64View.buffer;
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(host)).assertFalse();
        expect(bigInt64Checker.isBigUint64Array(host)).assertFalse();
        expect(bigInt64Checker.isArrayBufferView(host)).assertFalse();
        expect(bigInt64Checker.isTypedArray(host)).assertFalse();
        expect(bigInt64Checker.isArrayBuffer(host)).assertTrue();
        expect(bigInt64Checker.isAnyArrayBuffer(host)).assertTrue();
      }

      // --- [4] Verify isBigInt64Array rejects a BigUint64Array copied from a -1 view that reads the uint64 maximum, while the source stays true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let source: BigInt64Array = new BigInt64Array(1);
        source.$_set(0, BigInt(-1));
        let wide: BigUint64Array = new BigUint64Array(source);
        let unsigned: bigint = wide.$_get(0);
        expect(unsigned.toString()).assertEqual('18446744073709551615');
        expect(bigInt64Probe.isBigInt64Array(wide)).assertFalse();
        expect(bigInt64Probe.isBigInt64Array(source)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array returns false for a promise resolved with an int ---
      {
        let bigInt64Checker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(bigInt64Checker.isBigInt64Array(p)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1400
     * @tc.name testTypesIsBigInt64Array014
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of other objects, covering DataViews, int and string arrays, Maps, Sets and weak containers.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array accepts two BigInt64Array views while rejecting a DataView over the same buffer and a backing ArrayBuffer ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let dv: DataView = new DataView(bigInt64View.buffer);
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let secondView: BigInt64Array = new BigInt64Array(ab);
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(dv)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(secondView)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(secondView.buffer)).assertFalse();
      }

      // --- [2] Verify isBigInt64Array returns false for a three element int array and for an empty int array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let plain: int[] = [1, 2, 3];
        let blank: int[] = [];
        expect(bigInt64Probe.isBigInt64Array(plain)).assertFalse();
        expect(bigInt64Probe.isBigInt64Array(blank)).assertFalse();
        expect(plain.length).assertEqual(3);
      }

      // --- [3] Verify isBigInt64Array returns false for a two element string array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let names: string[] = ['big', 'int64'];
        expect(bigInt64Probe.isBigInt64Array(names)).assertFalse();
        expect(names.length).assertEqual(2);
      }

      // --- [4] Verify isBigInt64Array returns false for a Map container and for a Set container and WeakMap and for a WeakSet container ---
      {
        let bigInt64Checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        expect(bigInt64Checker.isBigInt64Array(m)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(s)).assertFalse();
        let bigInt64Checker_2: util.types = new util.types();
        let key: SlotKey = new SlotKey();
        let wm: WeakMap<SlotKey, int> = new WeakMap<SlotKey, int>();
        wm.set(key, 5);
        let ws: WeakSet<SlotKey> = new WeakSet<SlotKey>();
        ws.add(key);
        expect(bigInt64Checker_2.isBigInt64Array(wm)).assertFalse();
        expect(bigInt64Checker_2.isBigInt64Array(ws)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1500
     * @tc.name testTypesIsBigInt64Array015
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isBigInt64Array accepts two windows whose byteLengths 8 and 16 sum to the 24 byte buffer; accepts the two element subarray taken from a four element BigInt64Array; accepts a BigInt64Array built with byteOffset 8 and an omitted element count over a sixteen byte buffer; a two element window keeps offset 16, size 16 and length 2 and an empty trailing window keeps offset 16 with zero lengths; a subarray and a slice taken from one four element BigInt64Array are both true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array accepts two windows whose byteLengths 8 and 16 sum to the 24 byte buffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let head: BigInt64Array = new BigInt64Array(ab, 0, 1);
        let rest: BigInt64Array = new BigInt64Array(ab, 8, 2);
        expect(head.byteLength + rest.byteLength).assertEqual(ab.byteLength);
        expect(head.byteLength).assertEqual(8);
        expect(rest.byteLength).assertEqual(16);
        expect(bigInt64Probe.isBigInt64Array(head)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(rest)).assertTrue();
      }

      // --- [2] Verify isBigInt64Array returns true for the two element subarray taken from a four element BigInt64Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let base: BigInt64Array = new BigInt64Array(4);
        let sub: BigInt64Array = base.subarray(1, 3);
        expect(bigInt64Probe.isBigInt64Array(sub)).assertTrue();
        expect(sub.length).assertEqual(2);
      }

      // --- [3] Verify isBigInt64Array returns true for a BigInt64Array built with byteOffset 8 and an omitted element count over a sixteen byte buffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 8);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.byteOffset).assertEqual(8);
        expect(bigInt64View.length).assertEqual(1);
      }

      // --- [4] Verify a two element window keeps offset 16, size 16 and length 2 and an empty trailing window keeps offset 16 with zero lengths ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 16, 2);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64View.byteOffset).assertEqual(16);
        expect(bigInt64View.byteLength).assertEqual(16);
        expect(bigInt64View.length).assertEqual(2);
        expect(bigInt64View.buffer.byteLength).assertEqual(32);
        let bigInt64Probe_2: util.types = new util.types();
        let ab_2: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View_2: BigInt64Array = new BigInt64Array(ab_2, 16, 0);
        expect(bigInt64Probe_2.isBigInt64Array(bigInt64View_2)).assertTrue();
        expect(bigInt64View_2.byteOffset).assertEqual(16);
        expect(bigInt64View_2.byteLength).assertEqual(0);
        expect(bigInt64View_2.length).assertEqual(0);
      }

      // --- [5] Verify a subarray and a slice taken from one four element BigInt64Array are both true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let base: BigInt64Array = new BigInt64Array(4);
        let sub: BigInt64Array = base.subarray(0, 2);
        let copy: BigInt64Array = base.slice(2, 4);
        let flags: boolean[] = [bigInt64Probe.isBigInt64Array(sub), bigInt64Probe.isBigInt64Array(copy)];
        expect(flags[0]).assertTrue();
        expect(flags[1]).assertTrue();
        expect(copy.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1600
     * @tc.name testTypesIsBigInt64Array016
     * @tc.desc Merged batch (5 tests): View and buffer semantics: a four element array and its offset subarray are both accepted and the subarray keeps byteOffset 8; isBigInt64Array accepts a view holding the int64 minimum, which reads back as -9223372036854775808; a BigInt64Array derived as the subarray of a subarray is true and keeps byteOffset 24; isBigInt64Array accepts a view over eight bytes all set to 255, whose sign extension yields -1; isBigInt64Array accepts a view whose most significant byte set to one yields 2^56 and byte one set to 3 makes the element 768.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a four element array and its offset subarray are both accepted and the subarray keeps byteOffset 8 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let base: BigInt64Array = new BigInt64Array(4);
        let sub: BigInt64Array = base.subarray(1, 3);
        let r1: boolean = bigInt64Probe.isBigInt64Array(base);
        let r2: boolean = bigInt64Probe.isBigInt64Array(sub);
        expect(r1).assertTrue();
        expect(r2).assertTrue();
        expect(sub.byteOffset).assertEqual(8);
        let bigInt64Probe_2: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let base_2: BigInt64Array = new BigInt64Array(ab, 8, 2);
        let sub_2: BigInt64Array = base_2.subarray(0, 1);
        expect(bigInt64Probe_2.isBigInt64Array(sub_2)).assertTrue();
        expect(sub_2.byteOffset).assertEqual(8);
        expect(sub_2.byteLength).assertEqual(8);
      }

      // --- [2] Verify isBigInt64Array accepts a view holding the int64 minimum, which reads back as -9223372036854775808 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        bigInt64View.$_set(0, BigInt('-9223372036854775808'));
        let detected: boolean = bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(detected).assertTrue();
        let seen: bigint = bigInt64View.$_get(0);
        expect(seen.toString()).assertEqual('-9223372036854775808');
      }

      // --- [3] Verify a BigInt64Array derived as the subarray of a subarray is true and keeps byteOffset 24 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let base: BigInt64Array = new BigInt64Array(8);
        let mid: BigInt64Array = base.subarray(2, 6);
        let inner: BigInt64Array = mid.subarray(1, 3);
        expect(bigInt64Probe.isBigInt64Array(inner)).assertTrue();
        expect(inner.length).assertEqual(2);
        expect(inner.byteOffset).assertEqual(24);
      }

      // --- [4] Verify isBigInt64Array accepts a view over eight bytes all set to 255, whose sign extension yields -1 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(8);
        let bytes: Uint8Array = new Uint8Array(host);
        for (let i: int = 0; i < 8; i++) {
          bytes.$_set(i, 255);
        }
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        let value: bigint = bigInt64View.$_get(0);
        expect(value.toString()).assertEqual('-1');
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array accepts a view whose most significant byte set to one yields 2^56 and byte one set to 3 makes the element 768 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(8);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(7, 1);
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        let value: bigint = bigInt64View.$_get(0);
        expect(value.toString()).assertEqual('72057594037927936');
        expect(bytes.$_get(0)).assertEqual(0);
        let judged: boolean = bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(judged).assertTrue();
        let bigInt64Probe_2: util.types = new util.types();
        let host_2: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View_2: BigInt64Array = new BigInt64Array(host_2, 8, 1);
        let bytes_2: Uint8Array = new Uint8Array(host_2, 8, 8);
        bytes_2.$_set(1, 3);
        let seen: bigint = bigInt64View_2.$_get(0);
        expect(seen.toString()).assertEqual('768');
        expect(bigInt64Probe_2.isBigInt64Array(bigInt64View_2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1700
     * @tc.name testTypesIsBigInt64Array017
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isBigInt64Array accepts a view whose first byte 128 yields the positive element 128 with higher bytes zero; view holding -256 whose low byte is zero and upper bytes 255; isBigInt64Array accepts two overlapping windows sharing the element at byteOffset 8; subarray and its parent after a write through the subarray reaches the parent; isBigInt64Array accepts the copy of an offset window, which resets byteOffset to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array accepts a view whose first byte 128 yields the positive element 128 with higher bytes zero ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(8);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(0, 128);
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        let value: bigint = bigInt64View.$_get(0);
        expect(value.toString()).assertEqual('128');
        let second: double = bytes.$_get(1);
        let last: double = bytes.$_get(7);
        expect(second).assertEqual(0);
        expect(last).assertEqual(0);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [2] Verify isBigInt64Array accepts a view holding -256 whose low byte is zero and upper bytes 255 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 1);
        bigInt64View.$_set(0, BigInt(-256));
        let bytes: Uint8Array = new Uint8Array(host);
        expect(bytes.$_get(8)).assertEqual(0);
        expect(bytes.$_get(9)).assertEqual(255);
        expect(bytes.$_get(15)).assertEqual(255);
        expect(bigInt64View.$_get(0).toString()).assertEqual('-256');
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [3] Verify isBigInt64Array accepts two overlapping windows sharing the element at byteOffset 8 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let wide: BigInt64Array = new BigInt64Array(host, 0, 2);
        let tail: BigInt64Array = new BigInt64Array(host, 8, 1);
        wide.$_set(1, BigInt(21));
        let shared: bigint = tail.$_get(0);
        expect(shared.toString()).assertEqual('21');
        expect(tail.byteOffset).assertEqual(8);
        expect(bigInt64Probe.isBigInt64Array(wide)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(tail)).assertTrue();
      }

      // --- [4] Verify isBigInt64Array accepts a subarray and its parent after a write through the subarray reaches the parent ---
      {
        let bigInt64Probe: util.types = new util.types();
        let parent: BigInt64Array = new BigInt64Array(4);
        let child: BigInt64Array = parent.subarray(1, 3);
        child.$_set(0, BigInt(9));
        let parentSeen: bigint = parent.$_get(1);
        expect(parentSeen.toString()).assertEqual('9');
        expect(child.byteOffset).assertEqual(8);
        expect(bigInt64Probe.isBigInt64Array(parent)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(child)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array accepts the copy of an offset window, which resets byteOffset to zero while the window keeps 16 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let wide: BigInt64Array = new BigInt64Array(host);
        wide.$_set(2, BigInt(9));
        let window: BigInt64Array = new BigInt64Array(host, 16, 2);
        let copy: BigInt64Array = new BigInt64Array(window);
        let carried: bigint = copy.$_get(0);
        expect(carried.toString()).assertEqual('9');
        expect(copy.byteOffset).assertEqual(0);
        expect(window.byteOffset).assertEqual(16);
        expect(bigInt64Probe.isBigInt64Array(copy)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1800
     * @tc.name testTypesIsBigInt64Array018
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts a two element window at byteOffset 8 whose element one becomes 512 after buffer byte 17 is set to 2; accepts the window at byteOffset 8 built by a static factory from a caller supplied sixteen byte buffer; isBigInt64Array accepts the window returned by a function declared optional, which reflects a later byte write; isBigInt64Array accepts the empty subarray taken from index 2 to 2, which keeps byteOffset 16; a nullable BigInt64Array field holding a fresh view is recognized and reports its element count.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for a two element window at byteOffset 8 whose element one becomes 512 after buffer byte 17 is set to 2 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 2);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(17, 2);
        let second: bigint = bigInt64View.$_get(1);
        expect(second.toString()).assertEqual('512');
        expect(bytes.$_get(16)).assertEqual(0);
        expect(bigInt64View.byteOffset).assertEqual(8);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [2] Verify isBigInt64Array returns true for the window at byteOffset 8 built by a static factory from a caller supplied sixteen byte buffer ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let built: BigInt64Array = WordFactory.build(host);
        expect(built.byteOffset).assertEqual(8);
        expect(built.byteLength).assertEqual(8);
        expect(bigInt64Probe.isBigInt64Array(built)).assertTrue();
      }

      // --- [3] Verify isBigInt64Array accepts the window returned by a function declared optional, which reflects a later byte write ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let opt: BigInt64Array | undefined = presentWindow(host);
        let present: BigInt64Array = opt as BigInt64Array;
        expect(bigInt64Probe.isBigInt64Array(present)).assertTrue();
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(8, 3);
        let observed: bigint = present.$_get(0);
        expect(observed.toString()).assertEqual('3');
      }

      // --- [4] Verify isBigInt64Array accepts the empty subarray taken from index 2 to 2, which keeps byteOffset 16 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let src: BigInt64Array = new BigInt64Array(4);
        let empty: BigInt64Array = src.subarray(2, 2);
        expect(empty.length).assertEqual(0);
        expect(empty.byteOffset).assertEqual(16);
        expect(bigInt64Probe.isBigInt64Array(empty)).assertTrue();
      }

      // --- [5] Verify a nullable BigInt64Array field holding a fresh view is recognized and reports its element count ---
      {
        let bigInt64Probe: util.types = new util.types();
        let holder: NullableView = new NullableView();
        holder.view = new BigInt64Array(2);
        expect(bigInt64Probe.isBigInt64Array(holder.view as Object)).assertTrue();
        expect((holder.view as BigInt64Array).length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_1900
     * @tc.name testTypesIsBigInt64Array019
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isBigInt64Array accepts a view assigned to a nullable holder field and reads byteOffset 8 through a cast; a variable declared optional holds a real view that survives a non optional cast and keeps its element count; length, byteLength and byteOffset of an offset BigInt64Array are unchanged after the judgement; holding -1 whose window bytes are all 255; whose element 511 is assembled from two bytes that survive the judgement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array accepts a view assigned to a nullable holder field and reads byteOffset 8 through a cast ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let holder: NullableView = new NullableView();
        holder.view = new BigInt64Array(host, 8, 1);
        expect(bigInt64Probe.isBigInt64Array(holder.view as Object)).assertTrue();
        let inner: BigInt64Array = holder.view as BigInt64Array;
        expect(inner.byteOffset).assertEqual(8);
      }

      // --- [2] Verify a variable declared optional holds a real view that survives a non optional cast and keeps its element count ---
      {
        let bigInt64Probe: util.types = new util.types();
        let opt: BigInt64Array | undefined = new BigInt64Array(3);
        let maybe: BigInt64Array = opt as BigInt64Array;
        expect(bigInt64Probe.isBigInt64Array(maybe)).assertTrue();
        expect(maybe.length).assertEqual(3);
      }

      // --- [3] Verify length, byteLength and byteOffset of an offset BigInt64Array are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab, 8, 2);
        bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(bigInt64View.length).assertEqual(2);
        expect(bigInt64View.byteLength).assertEqual(16);
        expect(bigInt64View.byteOffset).assertEqual(8);
      }

      // --- [4] Verify isBigInt64Array accepts a view holding -1 whose window bytes are all 255 while the byte outside stays zero ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 1);
        bigInt64View.$_set(0, BigInt(-1));
        let bytes: Uint8Array = new Uint8Array(host);
        expect(bytes.$_get(8)).assertEqual(255);
        expect(bytes.$_get(15)).assertEqual(255);
        expect(bytes.$_get(7)).assertEqual(0);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array accepts a view whose element 511 is assembled from two bytes that survive the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host, 8, 1);
        let pair: Uint8Array = new Uint8Array(host, 8, 2);
        pair.$_set(0, 255);
        pair.$_set(1, 1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        let assembled: bigint = bigInt64View.$_get(0);
        expect(assembled.toString()).assertEqual('511');
        expect(pair.$_get(0)).assertEqual(255);
        expect(pair.$_get(1)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2000
     * @tc.name testTypesIsBigInt64Array020
     * @tc.desc Merged batch (3 tests): View and buffer semantics: a window at byteOffset 8 and one carved by subarray agree on buffer, offset and bounds, both recognized; over one buffer BigInt64Array reads -1 and BigUint64Array the uint64 maximum, with only the signed view true; isBigInt64Array accepts a slice copy at byteOffset 0 whose write leaves the source element unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a window at byteOffset 8 and one carved by subarray agree on buffer, offset and bounds, both recognized ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let direct: BigInt64Array = new BigInt64Array(ab, 8, 2);
        let routed: BigInt64Array = new BigInt64Array(ab, 0, 4).subarray(1, 3);
        expect(routed.buffer).assertEqual(direct.buffer);
        expect(routed.byteOffset).assertEqual(direct.byteOffset);
        expect(routed.byteLength).assertEqual(direct.byteLength);
        expect(routed.length).assertEqual(direct.length);
        expect(bigInt64Probe.isBigInt64Array(direct)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(routed)).assertTrue();
      }

      // --- [2] Verify over one buffer BigInt64Array reads -1 and BigUint64Array the uint64 maximum, with only the signed view true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(8);
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        bigInt64View.$_set(0, BigInt(-1));
        let wide: BigUint64Array = new BigUint64Array(host);
        let unsigned: bigint = wide.$_get(0);
        expect(unsigned.toString()).assertEqual('18446744073709551615');
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(wide)).assertFalse();
      }

      // --- [3] Verify isBigInt64Array accepts a slice copy at byteOffset 0 whose write leaves the source element unchanged ---
      {
        let bigInt64Probe: util.types = new util.types();
        let src: BigInt64Array = new BigInt64Array(2);
        src.$_set(0, BigInt(4));
        let copy: BigInt64Array = src.slice();
        copy.$_set(0, BigInt(5));
        let sourceSeen: bigint = src.$_get(0);
        expect(sourceSeen.toString()).assertEqual('4');
        expect(copy.byteOffset).assertEqual(0);
        expect(bigInt64Probe.isBigInt64Array(copy)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2100
     * @tc.name testTypesIsBigInt64Array021
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a filter over four mixed candidates keeps only the two BigInt64Array entries in order; accepts the BigInt64Array built by from from a two member Set of bigint; the buffer byteLength of a BigInt64Array is unchanged after the judgement; the two bigint elements of a BigInt64Array and length and byteLength of a BigUint64Array are unchanged after the judgement; the byteLength of an ArrayBuffer is unchanged after the judgement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a filter over four mixed candidates keeps only the two BigInt64Array entries in order ---
      {
        let bigInt64Probe: util.types = new util.types();
        let candidates: Object[] = [new BigUint64Array(1), new BigInt64Array(3), new ArrayBuffer(8), new BigInt64Array(1)];
        let kept: Object[] = candidates.filter((candidate: Object): boolean => bigInt64Probe.isBigInt64Array(candidate));
        expect(kept.length).assertEqual(2);
        expect(bigInt64Probe.isBigInt64Array(kept[0])).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(kept[1])).assertTrue();
      }

      // --- [2] Verify isBigInt64Array returns true for the BigInt64Array built by from from a two member Set of bigint while the Set keeps both members ---
      {
        let bigInt64Probe: util.types = new util.types();
        let store: Set<bigint> = new Set<bigint>();
        store.add(BigInt(5));
        store.add(BigInt(6));
        let built: BigInt64Array = BigInt64Array.from(store);
        expect(built.length).assertEqual(2);
        expect(store.size).assertEqual(2);
        expect(bigInt64Probe.isBigInt64Array(built)).assertTrue();
      }

      // --- [3] Verify the buffer byteLength of a BigInt64Array is unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(24);
        let bigInt64View: BigInt64Array = new BigInt64Array(ab);
        bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(bigInt64View.buffer.byteLength).assertEqual(24);
      }

      // --- [4] Verify the two bigint elements of a BigInt64Array and length and byteLength of a BigUint64Array are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        bigInt64View.$_set(0, BigInt(6));
        bigInt64View.$_set(1, BigInt(8));
        bigInt64Probe.isBigInt64Array(bigInt64View);
        expect(bigInt64View.$_get(0)).assertEqual(BigInt(6));
        expect(bigInt64View.$_get(1)).assertEqual(BigInt(8));
        let bigInt64Probe_2: util.types = new util.types();
        let bu: BigUint64Array = new BigUint64Array(3);
        bigInt64Probe_2.isBigInt64Array(bu);
        expect(bu.length).assertEqual(3);
        expect(bu.byteLength).assertEqual(24);
      }

      // --- [5] Verify the byteLength of an ArrayBuffer is unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(16);
        bigInt64Probe.isBigInt64Array(ab);
        expect(ab.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2200
     * @tc.name testTypesIsBigInt64Array022
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: the size of a Map and of a Set are unchanged after the judgement; the time value of a Date and the source of a RegExp are unchanged after the judgement; the tag and size fields of a class instance are unchanged after the judgement; accepts a two element BigInt64Array whose element one stays zero after element zero is written with 7; the source element 5 is unchanged after the copy of a BigInt64Array is written with 6 and both arrays stay true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the size of a Map and of a Set are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(1);
        bigInt64Probe.isBigInt64Array(m);
        bigInt64Probe.isBigInt64Array(s);
        expect(m.size).assertEqual(1);
        expect(s.size).assertEqual(1);
      }

      // --- [2] Verify the time value of a Date and the source of a RegExp are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let d: Date = new Date(1700000000000);
        bigInt64Probe.isBigInt64Array(d);
        expect(d.getTime()).assertEqual(1700000000000);
        let bigInt64Probe_2: util.types = new util.types();
        let re: RegExp = new RegExp('big');
        bigInt64Probe_2.isBigInt64Array(re);
        expect(re.source).assertEqual('big');
      }

      // --- [3] Verify the tag and size fields of a class instance are unchanged after the judgement ---
      {
        let bigInt64Probe: util.types = new util.types();
        let slot: TaggedSlot = new TaggedSlot();
        bigInt64Probe.isBigInt64Array(slot);
        expect(slot.tag).assertEqual('slot');
        expect(slot.size).assertEqual(2);
      }

      // --- [4] Verify isBigInt64Array returns true for a two element BigInt64Array whose element one stays zero after element zero is written with 7 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        bigInt64View.$_set(0, BigInt(7));
        let neighbour: bigint = bigInt64View.$_get(1);
        expect(neighbour.toString()).assertEqual('0');
        let written: bigint = bigInt64View.$_get(0);
        expect(written.toString()).assertEqual('7');
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [5] Verify the source element 5 is unchanged after the copy of a BigInt64Array is written with 6 and both arrays stay true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let source: BigInt64Array = new BigInt64Array(1);
        source.$_set(0, BigInt(5));
        let copy: BigInt64Array = new BigInt64Array(source);
        copy.$_set(0, BigInt(6));
        let sourceSeen: bigint = source.$_get(0);
        let copySeen: bigint = copy.$_get(0);
        expect(sourceSeen.toString()).assertEqual('5');
        expect(copySeen.toString()).assertEqual('6');
        expect(bigInt64Probe.isBigInt64Array(source)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(copy)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2300
     * @tc.name testTypesIsBigInt64Array023
     * @tc.desc Merged batch (2 tests): State preservation and aliasing: toReversed keeps the element type while reversing and with keeps type and length; copyWithin copies the middle two elements over the front of the receiver, which keeps length four and stays recognized.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toReversed keeps the element type while reversing and with keeps type and length while the source stays unchanged ---
      {
        let bigInt64Probe: util.types = new util.types();
        let source: BigInt64Array = new BigInt64Array([7n, 8n, 9n]);
        let flipped: BigInt64Array = source.toReversed();
        expect(bigInt64Probe.isBigInt64Array(flipped)).assertTrue();
        expect(flipped[0]).assertEqual(9n);
        expect(source[0]).assertEqual(7n);
        let bigInt64Probe_2: util.types = new util.types();
        let source_2: BigInt64Array = new BigInt64Array([1n, 2n, 3n]);
        let patched: BigInt64Array = source_2.with(1, 20n);
        expect(bigInt64Probe_2.isBigInt64Array(patched)).assertTrue();
        expect(patched.length).assertEqual(3);
        expect(patched[0] + patched[2]).assertEqual(4n);
        expect(source_2[1]).assertEqual(2n);
      }

      // --- [2] Verify copyWithin copies the middle two elements over the front of the receiver, which keeps length four and stays recognized ---
      {
        let bigInt64Probe: util.types = new util.types();
        let lane: BigInt64Array = new BigInt64Array([10n, 20n, 30n, 40n]);
        lane.copyWithin(0, 1, 3);
        expect(lane.$_get(0).toString()).assertEqual('20');
        expect(lane.$_get(1).toString()).assertEqual('30');
        expect(lane.$_get(3).toString()).assertEqual('40');
        expect(lane.length).assertEqual(4);
        expect(bigInt64Probe.isBigInt64Array(lane)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2400
     * @tc.name testTypesIsBigInt64Array024
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts the BigInt64Array built by from from an array of the two bigint seeds 11 and 12; accepts the two element BigInt64Array field of a holder class instance whose id is 1; accepts a BigInt64Array nested inside the buffer of another BigInt64Array at a computed offset; accepts a BigInt64Array held by a class whose write method stores 314 that the read method returns; accepts a BigInt64Array stored as a Map value and retrieved by cast.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for the BigInt64Array built by from from an array of the two bigint seeds 11 and 12 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let seeds: Array<bigint> = [BigInt(11), BigInt(12)];
        let built: BigInt64Array = BigInt64Array.from(seeds);
        expect(built.length).assertEqual(2);
        let second: bigint = built.$_get(1);
        expect(second.toString()).assertEqual('12');
        expect(bigInt64Probe.isBigInt64Array(built)).assertTrue();
      }

      // --- [2] Verify isBigInt64Array returns true for the two element BigInt64Array field of a holder class instance whose id is 1 ---
      {
        let bigInt64Probe: util.types = new util.types();
        let holder: ViewHolder = new ViewHolder();
        expect(bigInt64Probe.isBigInt64Array(holder.data)).assertTrue();
        expect(holder.data.length).assertEqual(2);
        expect(holder.id).assertEqual(1);
      }

      // --- [3] Verify isBigInt64Array returns true for a BigInt64Array nested inside the buffer of another BigInt64Array at a computed offset ---
      {
        let bigInt64Probe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(32);
        let base: BigInt64Array = new BigInt64Array(ab, 8, 2);
        let nested: BigInt64Array = new BigInt64Array(base.buffer, base.byteOffset + 8, 1);
        expect(bigInt64Probe.isBigInt64Array(nested)).assertTrue();
        expect(nested.byteOffset).assertEqual(16);
      }

      // --- [4] Verify isBigInt64Array returns true for a BigInt64Array held by a class whose write method stores 314 that the read method returns ---
      {
        let bigInt64Probe: util.types = new util.types();
        let store: WordStore = new WordStore();
        store.write(BigInt(314));
        let out: bigint = store.read();
        expect(out.toString()).assertEqual('314');
        expect(bigInt64Probe.isBigInt64Array(store.slot)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array returns true for a BigInt64Array stored as a Map value and retrieved by cast ---
      {
        let bigInt64Checker: util.types = new util.types();
        let store: Map<string, BigInt64Array> = new Map<string, BigInt64Array>();
        store.set('v', new BigInt64Array(2));
        let got: BigInt64Array = store.get('v') as BigInt64Array;
        expect(bigInt64Checker.isBigInt64Array(got)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(store)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2500
     * @tc.name testTypesIsBigInt64Array025
     * @tc.desc Merged batch (1 test): Container and field storage: a judgement stored in a Record under the quoted key hit reads back true through the non-null assertion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a judgement stored in a Record under the quoted key hit reads back true through the non-null assertion ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let rec: Record<string, boolean> = { 'hit': bigInt64Probe.isBigInt64Array(bigInt64View) };
        let stored: boolean = rec['hit']!;
        expect(stored).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2600
     * @tc.name testTypesIsBigInt64Array026
     * @tc.desc Merged batch (5 tests): API call consistency: accepts a BigInt64Array holding zero and the int minimum and false for the bigint element read back; the stringified judgement results for an accepted BigInt64Array and a rejected Uint8Array are the true and false tokens; rejects a WeakRef wrapper around a BigInt64Array while the target itself is true; isBigInt64Array rejects the 7 and -7 elements of a BigInt64Array while the view itself is true; accepts the BigInt64Array field of an interface object literal and false for the literal itself.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for a BigInt64Array holding zero and the int minimum and false for the bigint element read back ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        bigInt64View.$_set(0, 0);
        bigInt64View.$_set(1, -2147483648);
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        let zero: bigint = bigInt64View.$_get(0);
        expect(bigInt64Checker.isBigInt64Array(zero)).assertFalse();
      }

      // --- [2] Verify the stringified judgement results for an accepted BigInt64Array and a rejected Uint8Array are the true and false tokens ---
      {
        let bigInt64Probe: util.types = new util.types();
        let acceptedView: BigInt64Array = new BigInt64Array(1);
        let rejectedView: Uint8Array = new Uint8Array(1);
        let values: Object[] = [acceptedView, rejectedView];
        let tokens: string[] = [];
        for (let i: int = 0; i < values.length; i++) {
          let outcome: boolean | string = bigInt64Probe.isBigInt64Array(values[i]);
          tokens.push(JSON.stringify(outcome));
        }
        expect(tokens.join(',')).assertEqual('true,false');
      }

      // --- [3] Verify isBigInt64Array returns false for a WeakRef wrapper around a BigInt64Array while the target itself is true ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let wr: WeakRef<BigInt64Array> = new WeakRef<BigInt64Array>(bigInt64View);
        expect(bigInt64Checker.isBigInt64Array(wr)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [4] Verify isBigInt64Array rejects the 7 and -7 elements of a BigInt64Array while the view itself is true ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        bigInt64View.$_set(0, 7);
        bigInt64View.$_set(1, -7);
        let up: bigint = bigInt64View.$_get(0);
        let down: bigint = bigInt64View.$_get(1);
        expect(up.toString()).assertEqual('7');
        expect(down.toString()).assertEqual('-7');
        expect(bigInt64Probe.isBigInt64Array(up)).assertFalse();
        expect(bigInt64Probe.isBigInt64Array(down)).assertFalse();
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
      }

      // --- [5] Verify isBigInt64Array returns true for the BigInt64Array field of an interface object literal and false for the literal itself ---
      {
        let bigInt64Checker: util.types = new util.types();
        let env: ViewEnvelope = { data: new BigInt64Array(1) };
        expect(bigInt64Checker.isBigInt64Array(env)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(env.data)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2700
     * @tc.name testTypesIsBigInt64Array027
     * @tc.desc Merged batch (5 tests): API call consistency: a nested Object array holding one BigInt64Array is false while its element is true; a verdict stored in an interface literal's ok field is true for a BigInt64Array and false for a Uint8Array; isBigInt64Array returns true through a helper that forwards its Object argument, and false for a Uint8Array sent the same way; two independent util.types instances return the same true boolean for one BigInt64Array; two consecutive calls on the same BigInt64Array return equal true booleans.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a nested Object array holding one BigInt64Array is false while its element is true ---
      {
        let bigInt64Checker: util.types = new util.types();
        let inner: Array<Object> = [new BigInt64Array(1)];
        let outer: Array<Object> = [inner];
        expect(bigInt64Checker.isBigInt64Array(inner[0])).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(inner)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(outer)).assertFalse();
      }

      // --- [2] Verify a verdict stored in an interface literal's ok field is true for a BigInt64Array and false for a Uint8Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let signedBag: VerdictBag = { ok: bigInt64Probe.isBigInt64Array(new BigInt64Array(1)) };
        let otherBag: VerdictBag = { ok: bigInt64Probe.isBigInt64Array(new Uint8Array(1)) };
        expect(signedBag.ok).assertTrue();
        expect(otherBag.ok).assertFalse();
      }

      // --- [3] Verify isBigInt64Array returns true through a helper that forwards its Object argument, and false for a Uint8Array sent the same way ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let hit: boolean = probeBigInt64(bigInt64Probe, bigInt64View);
        let miss: boolean = probeBigInt64(bigInt64Probe, new Uint8Array(1));
        expect(hit).assertTrue();
        expect(miss).assertFalse();
      }

      // --- [4] Verify two independent util.types instances return the same true boolean for one BigInt64Array ---
      {
        let checkers: Array<util.types> = [new util.types(), new util.types()];
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let r1: boolean = checkers[0].isBigInt64Array(bigInt64View);
        let r2: boolean = checkers[1].isBigInt64Array(bigInt64View);
        expect(r1).assertEqual(r2);
        expect(r2).assertTrue();
      }

      // --- [5] Verify two consecutive calls on the same BigInt64Array return equal true booleans ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let first: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        let second: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        expect(first).assertTrue();
        expect(second).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2800
     * @tc.name testTypesIsBigInt64Array028
     * @tc.desc Merged batch (5 tests): API call consistency: isBigInt64Array is stateless: a string and a plain object read false, a view true, and a fresh instance agrees; five consecutive calls on one BigInt64Array all stay true inside a loop; a BigInt64Array and a BigUint64Array carved out of one sliced buffer are true and false; isBigInt64Array accepts a copy from a BigUint64Array holding the uint64 maximum, reading -1; accepts a BigInt64Array while a Float64Array is still rejected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array is stateless: a string and a plain object read false, a view true, and a fresh instance agrees ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let noise: SlotKey = new SlotKey();
        let onString: boolean = bigInt64Checker.isBigInt64Array('noise');
        let onView: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        let onNoise: boolean = bigInt64Checker.isBigInt64Array(noise);
        let onViewAgain: boolean = bigInt64Checker.isBigInt64Array(bigInt64View);
        let fresh: util.types = new util.types();
        expect(onString).assertFalse();
        expect(onView).assertTrue();
        expect(onNoise).assertFalse();
        expect(onViewAgain).assertTrue();
        expect(onString).assertEqual(fresh.isBigInt64Array('noise'));
        expect(onView).assertEqual(fresh.isBigInt64Array(bigInt64View));
        expect(onNoise).assertEqual(fresh.isBigInt64Array(noise));
      }

      // --- [2] Verify five consecutive calls on one BigInt64Array all stay true inside a loop ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let all: boolean = true;
        for (let i: int = 0; i < 5; i++) {
          if (!bigInt64Probe.isBigInt64Array(bigInt64View)) {
            all = false;
          }
        }
        expect(all).assertTrue();
      }

      // --- [3] Verify a BigInt64Array and a BigUint64Array carved out of one sliced buffer are true and false ---
      {
        let bigInt64Probe: util.types = new util.types();
        let part: ArrayBuffer = new ArrayBuffer(16).slice(0, 16);
        let bigInt64View: BigInt64Array = new BigInt64Array(part, 0, 1);
        let bu: BigUint64Array = new BigUint64Array(part, 8, 1);
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(bu)).assertFalse();
        expect(part.byteLength).assertEqual(16);
      }

      // --- [4] Verify isBigInt64Array accepts a copy from a BigUint64Array holding the uint64 maximum, reading -1, while the source is false ---
      {
        let bigInt64Probe: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(1);
        source.$_set(0, BigInt('18446744073709551615'));
        let cross: BigInt64Array = new BigInt64Array(source);
        let signed: bigint = cross.$_get(0);
        expect(signed.toString()).assertEqual('-1');
        expect(bigInt64Probe.isBigInt64Array(cross)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(source)).assertFalse();
      }

      // --- [5] Verify isBigInt64Array returns true for a BigInt64Array while a Float64Array is still rejected ---
      {
        let bigInt64Probe: util.types = new util.types();
        expect(bigInt64Probe.isBigInt64Array(new BigInt64Array(1))).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(new Float64Array(1))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_2900
     * @tc.name testTypesIsBigInt64Array029
     * @tc.desc Merged batch (5 tests): API call consistency: accepts a BigInt64Array while the unsigned BigUint64Array is still rejected; the conjunction of isBigInt64Array with isArrayBufferView is true for a BigInt64Array and false for a Uint8Array; isBigInt64Array accepts a view reading a value written through an Int32Array sibling, which stays false; the disjunction of two judgements is true when only the second candidate is a BigInt64Array; an offset BigInt64Array passes isBigInt64Array, isArrayBufferView and isTypedArray.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for a BigInt64Array while the unsigned BigUint64Array is still rejected ---
      {
        let bigInt64Probe: util.types = new util.types();
        let unsigned: BigUint64Array = new BigUint64Array(1);
        let rejected: boolean = bigInt64Probe.isBigInt64Array(unsigned);
        expect(rejected).assertFalse();
        expect(bigInt64Probe.isBigInt64Array(new BigInt64Array(2))).assertTrue();
      }

      // --- [2] Verify the conjunction of isBigInt64Array with isArrayBufferView is true for a BigInt64Array and false for a Uint8Array ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        let both: boolean = bigInt64Checker.isBigInt64Array(bigInt64View) && bigInt64Checker.isArrayBufferView(bigInt64View);
        expect(both).assertTrue();
        let miss: boolean = bigInt64Checker.isBigInt64Array(uint8View) && bigInt64Checker.isArrayBufferView(uint8View);
        expect(miss).assertFalse();
      }

      // --- [3] Verify isBigInt64Array accepts a view reading a value written through an Int32Array sibling, which stays false ---
      {
        let bigInt64Probe: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64View: BigInt64Array = new BigInt64Array(host);
        let int32View: Int32Array = new Int32Array(host);
        int32View.$_set(0, 5);
        let observed: bigint = bigInt64View.$_get(0);
        expect(observed.toString()).assertEqual('5');
        expect(bigInt64Probe.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Probe.isBigInt64Array(int32View)).assertFalse();
      }

      // --- [4] Verify the disjunction of two judgements is true when only the second candidate is a BigInt64Array while their conjunction is false ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        let either: boolean = bigInt64Checker.isBigInt64Array(uint8View) || bigInt64Checker.isBigInt64Array(bigInt64View);
        expect(either).assertTrue();
        let both: boolean = bigInt64Checker.isBigInt64Array(uint8View) && bigInt64Checker.isBigInt64Array(bigInt64View);
        expect(both).assertFalse();
      }

      // --- [5] Verify an offset BigInt64Array passes isBigInt64Array, isArrayBufferView and isTypedArray but fails isBigUint64Array and both buffer checks ---
      {
        let bigInt64Checker: util.types = new util.types();
        let seed: BigInt64Array = new BigInt64Array(4);
        let bigInt64View: BigInt64Array = new BigInt64Array(seed.buffer, 8, 1);
        expect(bigInt64Checker.isBigInt64Array(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isArrayBufferView(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isTypedArray(bigInt64View)).assertTrue();
        expect(bigInt64Checker.isBigUint64Array(bigInt64View)).assertFalse();
        expect(bigInt64Checker.isArrayBuffer(bigInt64View)).assertFalse();
        expect(bigInt64Checker.isAnyArrayBuffer(bigInt64View)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_3000
     * @tc.name testTypesIsBigInt64Array030
     * @tc.desc Merged batch (4 tests): Cross-check agreement: verifies isBigInt64Array agrees with DataView, Object widening, static class fields and array element access.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a BigInt64Array sharing a buffer with a DataView or an Int8Array is true while the DataView and the Int8Array are false ---
      {
        let bigInt64Checker: util.types = new util.types();
        let bufferForDataView: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64ViewForDataView: BigInt64Array = new BigInt64Array(bufferForDataView, 0, 1);
        let dv: DataView = new DataView(bufferForDataView, 8, 8);
        expect(bigInt64Checker.isBigInt64Array(bigInt64ViewForDataView)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(dv)).assertFalse();
        let bufferForInt8: ArrayBuffer = new ArrayBuffer(16);
        let bigInt64ViewForInt8: BigInt64Array = new BigInt64Array(bufferForInt8, 0, 1);
        let int8View: Int8Array = new Int8Array(bufferForInt8, 8, 8);
        expect(bigInt64Checker.isBigInt64Array(bigInt64ViewForInt8)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(int8View)).assertFalse();
      }

      // --- [2] Verify isBigInt64Array returns true for a BigInt64Array element pulled out of an Object array and false for the array itself ---
      {
        let bigInt64Checker: util.types = new util.types();
        let pool: Array<Object> = [new BigInt64Array(1)];
        let got: BigInt64Array = pool[0] as BigInt64Array;
        expect(bigInt64Checker.isBigInt64Array(got)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(pool)).assertFalse();
      }

      // --- [3] Verify isBigInt64Array returns true for a BigInt64Array held in an Object typed variable and false for a BigUint64Array held the same way ---
      {
        let bigInt64Checker: util.types = new util.types();
        let asBig: Object = new BigInt64Array(2);
        let asUnsigned: Object = new BigUint64Array(2);
        expect(bigInt64Checker.isBigInt64Array(asBig)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(asUnsigned)).assertFalse();
      }

      // --- [4] Verify isBigInt64Array returns true for the static BigInt64Array field of a class and false for an instance of that class ---
      {
        let bigInt64Checker: util.types = new util.types();
        let box: StaticView = new StaticView();
        expect(bigInt64Checker.isBigInt64Array(StaticView.data)).assertTrue();
        expect(bigInt64Checker.isBigInt64Array(box)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_3100
     * @tc.name testTypesIsBigInt64Array031
     * @tc.desc Merged batch (5 tests): Program integration: the judgement drives a ternary that yields Y for a BigInt64Array and N for a Uint8Array; accepts a BigInt64Array returned by a helper function that builds a three element array; accepts a BigInt64Array filled with minus three by a helper before the caller reads the element back; a three entry pool scanned by a while loop yields exactly two BigInt64Array hits; a stored true judgement result gates a branch that increments a counter exactly once.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the judgement drives a ternary that yields Y for a BigInt64Array and N for a Uint8Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let uint8View: Uint8Array = new Uint8Array(1);
        let yes: string = bigInt64Probe.isBigInt64Array(bigInt64View) ? 'Y' : 'N';
        let no: string = bigInt64Probe.isBigInt64Array(uint8View) ? 'Y' : 'N';
        expect(yes).assertEqual('Y');
        expect(no).assertEqual('N');
      }

      // --- [2] Verify isBigInt64Array returns true for a BigInt64Array returned by a helper function that builds a three element array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let built: BigInt64Array = buildBigInt64Array();
        expect(bigInt64Probe.isBigInt64Array(built)).assertTrue();
        expect(built.length).assertEqual(3);
      }

      // --- [3] Verify isBigInt64Array returns true for a BigInt64Array filled with minus three by a helper before the caller reads the element back ---
      {
        let bigInt64Probe: util.types = new util.types();
        let target: BigInt64Array = new BigInt64Array(1);
        seedIntoArray(target, BigInt(-3));
        let seen: bigint = target.$_get(0);
        expect(seen.toString()).assertEqual('-3');
        expect(bigInt64Probe.isBigInt64Array(target)).assertTrue();
      }

      // --- [4] Verify a three entry pool scanned by a while loop yields exactly two BigInt64Array hits ---
      {
        let bigInt64Probe: util.types = new util.types();
        let pool: Array<Object> = [new BigInt64Array(2), new BigUint64Array(2), new BigInt64Array(1)];
        let hits: int = 0;
        let i: int = 0;
        while (i < pool.length) {
          if (bigInt64Probe.isBigInt64Array(pool[i])) {
            hits++;
          }
          i++;
        }
        expect(hits).assertEqual(2);
      }

      // --- [5] Verify a stored true judgement result gates a branch that increments a counter exactly once ---
      {
        let bigInt64Probe: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(1);
        let flag: boolean = bigInt64Probe.isBigInt64Array(bigInt64View);
        let count: int = 0;
        if (flag) {
          count = count + 1;
        }
        expect(count).assertEqual(1);
        expect(flag).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_3200
     * @tc.name testTypesIsBigInt64Array032
     * @tc.desc Merged batch (3 tests): Program integration: a three entry table judged in a loop produces the mark string with the BigInt64Array in the middle; the judgement result passed to a label helper yields signed64 for a BigInt64Array and other for a Uint8Array; a for loop that breaks on the first hit stops at index two, the position of the only BigInt64Array among three candidates.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a three entry table judged in a loop produces the mark string with the BigInt64Array in the middle ---
      {
        let bigInt64Probe: util.types = new util.types();
        let table: Array<Object> = [new Int8Array(1), new BigInt64Array(1), new Float64Array(1)];
        let marks: string = '';
        for (let i: int = 0; i < table.length; i++) {
          if (bigInt64Probe.isBigInt64Array(table[i])) {
            marks = marks + 'B';
          } else {
            marks = marks + '.';
          }
        }
        expect(marks).assertEqual('.B.');
      }

      // --- [2] Verify the judgement result passed to a label helper yields signed64 for a BigInt64Array and other for a Uint8Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let verdict: boolean = bigInt64Probe.isBigInt64Array(new BigInt64Array(1));
        expect(labelForBigInt64(verdict)).assertEqual('signed64');
        expect(labelForBigInt64(bigInt64Probe.isBigInt64Array(new Uint8Array(1)))).assertEqual('other');
      }

      // --- [3] Verify a for loop that breaks on the first hit stops at index two, the position of the only BigInt64Array among three candidates ---
      {
        let bigInt64Probe: util.types = new util.types();
        let pool: Array<Object> = [new Int8Array(1), new Float64Array(1), new BigInt64Array(1)];
        let found: int = -1;
        for (let i: int = 0; i < pool.length; i++) {
          if (bigInt64Probe.isBigInt64Array(pool[i])) {
            found = i;
            break;
          }
        }
        expect(found).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_INT64_ARRAY_3300
     * @tc.name testTypesIsBigInt64Array033
     * @tc.desc Merged batch (2 tests): Miscellaneous checks: verifies remaining edge cases, covering typed array views and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigInt64Array033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigInt64Array returns true for a BigInt64Array produced by the copy constructor from another BigInt64Array ---
      {
        let bigInt64Probe: util.types = new util.types();
        let src: BigInt64Array = new BigInt64Array(2);
        src.$_set(0, 5);
        let copy: BigInt64Array = new BigInt64Array(src);
        expect(bigInt64Probe.isBigInt64Array(copy)).assertTrue();
        expect(copy.length).assertEqual(2);
      }

      // --- [2] Verify isBigInt64Array returns false for the int values 2147483647 and -2147483648 ---
      {
        let bigInt64Checker: util.types = new util.types();
        let high: int = 2147483647;
        let low: int = -2147483648;
        expect(bigInt64Checker.isBigInt64Array(high)).assertFalse();
        expect(bigInt64Checker.isBigInt64Array(low)).assertFalse();
      }
    });

  });
}
