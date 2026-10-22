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
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

class ThermoProbe {
  degree: int = 0;

  constructor(degree: int) {
    this.degree = degree;
  }
}

class ViewShapeMimic {
  buffer: ArrayBuffer = new ArrayBuffer(16);
  byteOffset: int = 0;
  byteLength: int = 16;
  length: int = 2;
}

class AnchorKey {
  tag: string = 'k';
}

function probeThroughReceiver(types: util.types, value: Object): boolean {
  return types.isBigUint64Array(value);
}

function buildBigUint64Array(): BigUint64Array {
  return new BigUint64Array(2);
}

class VerdictHolder {
  flag: boolean = false;

  record(verdict: boolean): void {
    this.flag = verdict;
  }
}

class ReceiverKeeper {
  types: util.types = new util.types();

  check(value: Object): boolean {
    return this.types.isBigUint64Array(value);
  }
}

class ViewBox {
  held: BigUint64Array = new BigUint64Array(2);

  open(): BigUint64Array {
    return this.held;
  }
}

class UnsignedTypeProbe extends util.types {
}

function describeVerdict(accepted: boolean): string {
  if (accepted) {
    return 'accepted';
  }
  return 'rejected';
}

export default function typesIsBigUint64ArrayTest(): void {
  describe('TypesIsBigUint64ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0100
     * @tc.name testTypesIsBigUint64Array001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a four element BigUint64Array reports byteLength 32 and one built over a sixteen byte buffer; accepts the pair one and two rendered by join as the text 1-2; isBigUint64Array returns true when the array is reached through an Object typed reference; accepts the copy produced by slice from index 1 of a four element array; accepts a length construct of 2 and a 16 byte buffer construct, which share byteLength 16.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a four element BigUint64Array reports byteLength 32 and one built over a sixteen byte buffer is accepted ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(4);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.byteLength).assertEqual(32);
        let type_2: util.types = new util.types();
        let target_2: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(type_2.isBigUint64Array(target_2)).assertTrue();
        expect(target_2.length).assertEqual(2);
      }

      // --- [2] Verify isBigUint64Array returns true for the pair one and two rendered by join as the text 1-2 ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.of(BigInt(1), BigInt(2));
        let text: string = target.join('-');
        expect(text).assertEqual('1-2');
        expect(text.length).assertEqual(3);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array returns true when the array is reached through an Object typed reference, so the verdict is made at runtime ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let asObject: Object = target;
        expect(type.isBigUint64Array(asObject)).assertTrue();
      }

      // --- [4] Verify isBigUint64Array returns true for the copy produced by slice from index 1 of a four element array ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(4).slice(1);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.length).assertEqual(3);
      }

      // --- [5] Verify isBigUint64Array returns true for a length construct of 2 and a 16 byte buffer construct, which share byteLength 16 ---
      {
        let type: util.types = new util.types();
        let byLength: BigUint64Array = new BigUint64Array(2);
        let byBuffer: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(type.isBigUint64Array(byLength)).assertTrue();
        expect(type.isBigUint64Array(byBuffer)).assertTrue();
        expect(byLength.byteLength).assertEqual(byBuffer.byteLength);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0200
     * @tc.name testTypesIsBigUint64Array002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: isBigUint64Array returns true after element zero is assigned the bigint 7, which sets exactly one of its eight bytes; accepts arrays of zero and one and one holding the asUintN wrap of minus two, bytes 254 and 255; isBigUint64Array accepts the from built pair 1 and 256, which set byte zero and byte nine; three isBigUint64Array calls on one array collected into a boolean array all read true; accepts the array built by from a one member set of bigint, leaving the set size at one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true after element zero is assigned the bigint 7, which sets exactly one of its eight bytes ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        target.$_set(0, BigInt(7));
        let bytes: Uint8Array = new Uint8Array(host);
        let setBytes: int = 0;
        for (let index: int = 0; index < 8; index++) {
          if (bytes.$_get(index) > 0) {
            setBytes = setBytes + 1;
          }
        }
        expect(setBytes).assertEqual(1);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [2] Verify arrays of zero and one and one holding the asUintN wrap of minus two, bytes 254 and 255, are both accepted ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.of(BigInt(0), BigInt(1));
        let bytes: Uint8Array = new Uint8Array(target.buffer);
        expect(bytes.$_get(0)).assertEqual(0);
        expect(bytes.$_get(8)).assertEqual(1);
        expect(bytes.$_get(9)).assertEqual(0);
        expect(target.length).assertEqual(2);
        expect(type.isBigUint64Array(target)).assertTrue();
        let type_2: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target_2: BigUint64Array = new BigUint64Array(host);
        target_2.$_set(0, BigInt.asUintN(64, BigInt(-2)));
        let bytes_2: Uint8Array = new Uint8Array(host);
        expect(bytes_2.$_get(0)).assertEqual(254);
        expect(bytes_2.$_get(7)).assertEqual(255);
        expect(target_2.$_get(0)).assertEqual(BigInt('18446744073709551614'));
        expect(type_2.isBigUint64Array(target_2)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array accepts the from built pair 1 and 256, which set byte zero and byte nine ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.from([BigInt(1), BigInt(256)]);
        let bytes: Uint8Array = new Uint8Array(target.buffer);
        expect(bytes.$_get(0)).assertEqual(1);
        expect(bytes.$_get(1)).assertEqual(0);
        expect(bytes.$_get(8)).assertEqual(0);
        expect(bytes.$_get(9)).assertEqual(1);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify three isBigUint64Array calls on one array collected into a boolean array all read true ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let seen: boolean[] = [];
        for (let round: int = 0; round < 3; round++) {
          seen.push(type.isBigUint64Array(target));
        }
        expect(seen.length).assertEqual(3);
        expect(seen[0]).assertTrue();
        expect(seen[1]).assertTrue();
        expect(seen[2]).assertTrue();
      }

      // --- [5] Verify isBigUint64Array returns true for the array built by from a one member set of bigint, leaving the set size at one ---
      {
        let type: util.types = new util.types();
        let pool: Set<bigint> = new Set<bigint>();
        pool.add(BigInt(5));
        let target: BigUint64Array = BigUint64Array.from(pool);
        expect(target.length).assertEqual(1);
        expect(target.$_get(0)).assertEqual(BigInt(5));
        expect(pool.size).assertEqual(1);
        expect(type.isBigUint64Array(target)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0300
     * @tc.name testTypesIsBigUint64Array003
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: two isBigUint64Array calls on the same array return the same boolean value; accepts a three element array filled with the maximum uint64 value, setting all twenty four bytes to 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two isBigUint64Array calls on the same array return the same boolean value ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(5);
        let first: boolean = type.isBigUint64Array(target);
        let second: boolean = type.isBigUint64Array(target);
        expect(first).assertEqual(second);
        expect(first).assertTrue();
      }

      // --- [2] Verify isBigUint64Array returns true for a three element array filled with the maximum uint64 value, setting all twenty four bytes to 255 ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let target: BigUint64Array = new BigUint64Array(host);
        target.fill(BigInt('18446744073709551615'));
        let bytes: Uint8Array = new Uint8Array(host);
        let filled: int = 0;
        for (let at: int = 0; at < 24; at++) {
          if (bytes.$_get(at) === 255) {
            filled = filled + 1;
          }
        }
        expect(filled).assertEqual(24);
        expect(target.length).assertEqual(3);
        expect(type.isBigUint64Array(target)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0400
     * @tc.name testTypesIsBigUint64Array004
     * @tc.desc Merged batch (3 tests): Type conversion and subclassing: verifies widening and subclass handling, covering typed array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a util.types subclass instance inherits the isBigUint64Array and isTypedArray verdicts for BigInt arrays ---
      {
        let receiver: UnsignedTypeProbe = new UnsignedTypeProbe();
        expect(receiver.isBigUint64Array(new BigUint64Array(2))).assertTrue();
        expect(receiver.isBigUint64Array(new BigInt64Array(2))).assertFalse();
        expect(receiver.isTypedArray(new BigUint64Array(1))).assertTrue();
      }

      // --- [2] Verify isBigUint64Array accepts a copy constructor result that keeps its value after the source changes ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(2);
        source.$_set(0, BigInt(11));
        let copy: BigUint64Array = new BigUint64Array(source);
        source.$_set(0, BigInt(12));
        let shared: boolean = copy.buffer === source.buffer;
        expect(copy.$_get(0)).assertEqual(BigInt(11));
        expect(shared).assertFalse();
        expect(copy.length).assertEqual(2);
        expect(type.isBigUint64Array(copy)).assertTrue();
      }

      // --- [3] Verify a BigUint64Array widened to Object and cast back keeps the same storage, seen through a write on the alias ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let widened: Object = target;
        let narrowed: BigUint64Array = widened as BigUint64Array;
        narrowed.$_set(1, BigInt(9));
        expect(target.$_get(1)).assertEqual(BigInt(9));
        expect(type.isBigUint64Array(narrowed)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0500
     * @tc.name testTypesIsBigUint64Array005
     * @tc.desc Merged batch (5 tests): Boundary values: accepts a one element view whose byteOffset 24 sits exactly at the tail of a 32 byte buffer; zero length array at the empty capacity boundary and a one element array at the smallest non empty capacity; sorted array whose first element becomes the smallest value one and last becomes three; accepts the empty array produced by of with no arguments; large array whose last element is addressable and round trips through its computed index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for a one element view whose byteOffset 24 sits exactly at the tail of a 32 byte buffer ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let target: BigUint64Array = new BigUint64Array(host, 24, 1);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.length).assertEqual(1);
        expect(target.byteOffset).assertEqual(24);
      }

      // --- [2] Verify a zero length array at the empty capacity boundary and a one element array at the smallest non empty capacity are accepted ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(0);
        expect(probeThroughReceiver(type, target)).assertTrue();
        expect(target.length).assertEqual(0);
        let type_2: util.types = new util.types();
        let target_2: BigUint64Array = new BigUint64Array(1);
        let holder: VerdictHolder = new VerdictHolder();
        holder.record(type_2.isBigUint64Array(target_2));
        expect(holder.flag).assertTrue();
        expect(target_2.length).assertEqual(1);
      }

      // --- [3] Verify isBigUint64Array returns true for a sorted array whose first element becomes the smallest value one and last becomes three ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(3);
        target.$_set(0, BigInt(3));
        target.$_set(1, BigInt(1));
        target.$_set(2, BigInt(2));
        target.sort((left: bigint, right: bigint): int => {
          if (left < right) {
            return -1;
          }
          if (left > right) {
            return 1;
          }
          return 0;
        });
        expect(target.$_get(0)).assertEqual(BigInt(1));
        expect(target.$_get(2)).assertEqual(BigInt(3));
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify isBigUint64Array returns true for the empty array produced by of with no arguments ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.of();
        expect(target.length).assertEqual(0);
        expect(target.byteLength).assertEqual(0);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [5] Verify isBigUint64Array returns true for a large array whose last element is addressable and round trips through its computed index ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(1048576);
        let last: int = target.length - 1;
        target.$_set(last, BigInt(9));
        expect(target.$_get(last).toString()).assertEqual('9');
        expect(type.isBigUint64Array(target)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0600
     * @tc.name testTypesIsBigUint64Array006
     * @tc.desc Merged batch (3 tests): Boundary values: accepts an array set to minus one wrapping to the uint64 maximum and a pair holding that maximum and zero; rejects a two dimensional int array built from two single element rows; rejects an array whose single element is a BigUint64Array, the container is not the type itself.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an array set to minus one wrapping to the uint64 maximum and a pair holding that maximum and zero are accepted ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        target.$_set(0, BigInt(-1));
        let bytes: Uint8Array = new Uint8Array(host);
        let filled: int = 0;
        for (let at: int = 0; at < 8; at++) {
          if (bytes.$_get(at) === 255) {
            filled = filled + 1;
          }
        }
        expect(filled).assertEqual(8);
        expect(target.$_get(0)).assertEqual(BigInt('18446744073709551615'));
        expect(type.isBigUint64Array(target)).assertTrue();
        let type_2: util.types = new util.types();
        let target_2: BigUint64Array = BigUint64Array.of(BigInt('18446744073709551615'), BigInt(0));
        let bytes_2: Uint8Array = new Uint8Array(target_2.buffer);
        expect(target_2.indexOf(BigInt(0))).assertEqual(1);
        expect(bytes_2.$_get(7)).assertEqual(255);
        expect(bytes_2.$_get(8)).assertEqual(0);
        expect(type_2.isBigUint64Array(target_2)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array returns false for a two dimensional int array built from two single element rows ---
      {
        let type: util.types = new util.types();
        let rows: int[][] = [[1], [2]];
        expect(type.isBigUint64Array(rows)).assertFalse();
        expect(rows.length).assertEqual(2);
      }

      // --- [3] Verify isBigUint64Array returns false for an array whose single element is a BigUint64Array, the container is not the type itself ---
      {
        let type: util.types = new util.types();
        let box: Array<BigUint64Array> = [new BigUint64Array(2)];
        expect(type.isBigUint64Array(box)).assertFalse();
        expect(type.isBigUint64Array(box[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0700
     * @tc.name testTypesIsBigUint64Array007
     * @tc.desc Merged batch (4 tests): Boundary acceptance and rejection: verifies isBigUint64Array for the uint64 maximum and false for strings, empty views and a zero byte buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array accepts the from built array whose single element is the uint64 maximum ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.from([BigInt.asUintN(64, BigInt(-1))]);
        expect(target.length).assertEqual(1);
        expect(target.$_get(0)).assertEqual(BigInt('18446744073709551615'));
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array returns false for the empty string, the single digit string zero and the three character text str ---
      {
        let type: util.types = new util.types();
        let text1: string = '';
        let text2: string = '0';
        let text3: string = 'str';

        let onEmpty: boolean = type.isBigUint64Array(text1);
        let onZeroString: boolean = type.isBigUint64Array(text2);
        let onTypeName: boolean = type.isBigUint64Array(text3);
        expect(onEmpty).assertFalse();
        expect(onZeroString).assertFalse();
        expect(onTypeName).assertFalse();
      }

      // --- [3] Verify isBigUint64Array returns false for zero length Uint8Array and BigInt64Array views ---
      {
        let type: util.types = new util.types();
        let otherUint8: Uint8Array = new Uint8Array(0);
        expect(type.isBigUint64Array(otherUint8)).assertFalse();
        expect(otherUint8.length).assertEqual(0);
        let otherBigInt64: BigInt64Array = new BigInt64Array(0);
        expect(type.isBigUint64Array(otherBigInt64)).assertFalse();
        expect(otherBigInt64.length).assertEqual(0);
      }

      // --- [4] Verify isBigUint64Array returns false for a zero byte ArrayBuffer, the empty buffer boundary ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(0);
        expect(type.isBigUint64Array(host)).assertFalse();
        expect(host.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0800
     * @tc.name testTypesIsBigUint64Array008
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int one, the smallest positive int value and minus one, the greatest negative int value; int zero; rejects 2147483647, the maximum int value; doubles 3.14, the signed zeros, NaN and positive Infinity in a single pass; negative double value -3.1415 in double array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for the int one, the smallest positive int value and minus one, the greatest negative int value ---
      {
        let type: util.types = new util.types();
        let seeds: int[] = [1];
        expect(type.isBigUint64Array(seeds[0])).assertFalse();
        let type_2: util.types = new util.types();
        let value: int = -1;
        expect(type_2.isBigUint64Array(value)).assertFalse();
      }

      // --- [2] Verify isBigUint64Array returns false for the int zero ---
      {
        let type: util.types = new util.types();
        let value: int = 0;
        expect(describeVerdict(type.isBigUint64Array(value))).assertEqual('rejected');
      }

      // --- [3] Verify isBigUint64Array returns false for 2147483647, the maximum int value ---
      {
        let value: int = 2147483647;
        let keeper: ReceiverKeeper = new ReceiverKeeper();
        expect(keeper.check(value)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false for the doubles 3.14, the signed zeros, NaN and positive Infinity in a single pass ---
      {
        let probe: UnsignedTypeProbe = new UnsignedTypeProbe();
        let values: double[] = [3.14, -0.0, 0.0, Double.NaN, Double.POSITIVE_INFINITY];
        let hits: int = 0;
        for (const value of values) {
          if (probe.isBigUint64Array(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify isBigUint64Array returns false for the negative double value -3.1415 in double array ---
      {
        let type: util.types = new util.types();
        let values: double[] = [-3.1415, 1.0];
        let rejected: boolean = type.isBigUint64Array(values[0]);
        expect(rejected).assertFalse();
        expect(values[0] < 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_0900
     * @tc.name testTypesIsBigUint64Array009
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects Double.NEGATIVE_INFINITY, the most negative double value; rejects both boolean primitives, true and false; bigint scalars zero, one and minus one are rejected even though they are of the element type; rejects the bigint 18446744073709551615 built from its decimal text, the maximum uint64 scalar; the boolean verdict of an inner isBigUint64Array call is itself rejected when fed back as the argument of a second call.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for Double.NEGATIVE_INFINITY, the most negative double value ---
      {
        let type: util.types = new util.types();
        let extremes: double[] = [Double.NEGATIVE_INFINITY];
        let flags: boolean[] = [type.isBigUint64Array(extremes[0])];
        expect(flags.indexOf(true)).assertEqual(-1);
      }

      // --- [2] Verify isBigUint64Array returns false for both boolean primitives, true and false ---
      {
        let type: util.types = new util.types();
        let flagTrue: boolean = true;
        let flagFalse: boolean = false;
        expect(type.isBigUint64Array(flagTrue)).assertFalse();
        expect(type.isBigUint64Array(flagFalse)).assertFalse();
      }

      // --- [3] Verify bigint scalars zero, one and minus one are rejected even though they are of the element type ---
      {
        let type: util.types = new util.types();
        let scalars: bigint[] = [BigInt(0)];
        let judged: boolean = type.isBigUint64Array(scalars[0]);
        expect(judged).assertFalse();
        let type_2: util.types = new util.types();
        let oneBig: bigint = BigInt(1);
        expect(type_2.isBigUint64Array(oneBig)).assertFalse();

        let minusBig: bigint = BigInt(-1);
        expect(type_2.isBigUint64Array(minusBig)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false for the bigint 18446744073709551615 built from its decimal text, the maximum uint64 scalar ---
      {
        let type: util.types = new util.types();
        let decimalText: string = '18446744073709551615';
        let maxBig: bigint = BigInt(decimalText);
        expect(type.isBigUint64Array(maxBig)).assertFalse();
      }

      // --- [5] Verify the boolean verdict of an inner isBigUint64Array call is itself rejected when fed back as the argument of a second call ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let inner: boolean = type.isBigUint64Array(target);
        expect(inner).assertTrue();
        expect(type.isBigUint64Array(inner)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1000
     * @tc.name testTypesIsBigUint64Array010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: join renders the elements as one dash separated string that the typed array predicate rejects; rejects an empty int array and int array of three elements, an ordinary array is not a typed array; rejects a string array of two elements and boolean array holding both truth values; rejects RegExp, BigInt64Array, Float32Array, Date, Error, Int8Array and Uint8Array values; rejects a WeakMap with one class key bound to an int value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify join renders the elements as one dash separated string that the typed array predicate rejects ---
      {
        let type: util.types = new util.types();
        let rendered: string = new BigUint64Array([2n, 5n]).join('-');
        expect(rendered).assertEqual('2-5');
        expect(type.isBigUint64Array(rendered)).assertFalse();
      }

      // --- [2] Verify isBigUint64Array returns false for an empty int array and int array of three elements, an ordinary array is not a typed array ---
      {
        let type: util.types = new util.types();
        let values: int[] = [];
        expect(type.isBigUint64Array(values)).assertFalse();
        expect(values.length).assertEqual(0);
        let type_2: util.types = new util.types();
        let values_2: int[] = [1, 2, 3];
        expect(type_2.isBigUint64Array(values_2)).assertFalse();
        expect(values_2.length).assertEqual(3);
      }

      // --- [3] Verify isBigUint64Array returns false for a string array of two elements and boolean array holding both truth values ---
      {
        let type: util.types = new util.types();
        let values: string[] = ['a', 'b'];
        expect(type.isBigUint64Array(values)).assertFalse();
        let type_2: util.types = new util.types();
        let values_2: boolean[] = [true, false];
        expect(type_2.isBigUint64Array(values_2)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false for RegExp, BigInt64Array, Float32Array, Date, Error, Int8Array and Uint8Array values ---
      {
        let type: util.types = new util.types();
        let pattern: RegExp = new RegExp('abc');
        let sibling: BigInt64Array = new BigInt64Array(2);
        let float32View: Float32Array = new Float32Array(2);
        let moment: Date = new Date(0);
        let failure: Error = new Error('err');
        let int8View: Int8Array = new Int8Array(2);
        let uint8View: Uint8Array = new Uint8Array(2);
        expect(type.isBigUint64Array(pattern)).assertFalse();
        expect(type.isBigUint64Array(sibling)).assertFalse();
        expect(type.isBigUint64Array(float32View)).assertFalse();
        expect(type.isBigUint64Array(moment)).assertFalse();
        expect(type.isBigUint64Array(failure)).assertFalse();
        expect(type.isBigUint64Array(int8View)).assertFalse();
        expect(type.isBigUint64Array(uint8View)).assertFalse();
      }

      // --- [5] Verify isBigUint64Array returns false for a WeakMap with one class key bound to an int value ---
      {
        let type: util.types = new util.types();
        let key: AnchorKey = new AnchorKey();
        let weak: WeakMap<AnchorKey, int> = new WeakMap<AnchorKey, int>();
        weak.set(key, 1);
        expect(type.isBigUint64Array(weak)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1100
     * @tc.name testTypesIsBigUint64Array011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a resolved Promise of int one; isBigUint64Array separates three views over one buffer: true for BigUint64Array, false for BigInt64Array and Uint8Array; rejects an Object widened BigInt64Array and a Float64Array; isBigUint64Array returns false when an int array is reached through an Object typed reference; one Uint8Array reads false for the unsigned bigint check and true for the view and typed array checks in a pipeline.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for a resolved Promise of int one ---
      {
        let type: util.types = new util.types();
        let pending: Promise<int> = Promise.resolve<int>(1);
        expect(type.isBigUint64Array(pending)).assertFalse();
      }

      // --- [2] Verify isBigUint64Array separates three views over one buffer: true for BigUint64Array, false for BigInt64Array and Uint8Array ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let unsigned: BigUint64Array = new BigUint64Array(host);
        let signed: BigInt64Array = new BigInt64Array(host);
        let bytes: Uint8Array = new Uint8Array(host);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
        expect(type.isBigUint64Array(signed)).assertFalse();
        expect(type.isBigUint64Array(bytes)).assertFalse();
      }

      // --- [3] Verify isBigUint64Array returns false for an Object widened BigInt64Array and a Float64Array ---
      {
        let type: util.types = new util.types();
        let target: Object = new BigInt64Array(2);
        expect(type.isBigUint64Array(target)).assertFalse();
        let other: Float64Array = new Float64Array(2);
        expect(type.isBigUint64Array(other)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false when an int array is reached through an Object typed reference ---
      {
        let type: util.types = new util.types();
        let target: Object = [1, 2, 3];
        expect(type.isBigUint64Array(target)).assertFalse();
      }

      // --- [5] Verify one Uint8Array reads false for the unsigned bigint check and true for the view and typed array checks in a pipeline ---
      {
        let type: util.types = new util.types();
        let other: Uint8Array = new Uint8Array(2);
        let pipeline: boolean[] = [];
        pipeline.push(type.isBigUint64Array(other));
        pipeline.push(type.isArrayBufferView(other));
        pipeline.push(type.isTypedArray(other));
        expect(pipeline[0]).assertFalse();
        expect(pipeline[1]).assertTrue();
        expect(pipeline[2]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1200
     * @tc.name testTypesIsBigUint64Array012
     * @tc.desc Merged batch (2 tests): Primitive value rejection: rejects a BigInt64Array view sharing byteOffset 8 and length 2 with a BigUint64Array over one buffer; isBigUint64Array rejects the BigInt64Array and Float64Array sharing a 24 byte buffer, each true for itself.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for a BigInt64Array view sharing byteOffset 8 and length 2 with a BigUint64Array over one buffer ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let unsigned: BigUint64Array = new BigUint64Array(host, 8, 2);
        let signed: BigInt64Array = new BigInt64Array(host, 8, 2);
        expect(type.isBigUint64Array(signed)).assertFalse();
        expect(signed.byteOffset).assertEqual(8);
        expect(signed.length).assertEqual(2);
        expect(unsigned.byteOffset).assertEqual(8);
        expect(unsigned.length).assertEqual(2);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array rejects the BigInt64Array and Float64Array sharing a 24 byte buffer, each true for itself ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let unsigned: BigUint64Array = new BigUint64Array(host);
        let signed: BigInt64Array = new BigInt64Array(host);
        let decimal: Float64Array = new Float64Array(host);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
        expect(type.isBigUint64Array(signed)).assertFalse();
        expect(type.isBigUint64Array(decimal)).assertFalse();
        expect(type.isBigInt64Array(signed)).assertTrue();
        expect(type.isFloat64Array(decimal)).assertTrue();
        expect(unsigned.buffer.byteLength).assertEqual(24);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1300
     * @tc.name testTypesIsBigUint64Array013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects Int16Array, Int32Array, Uint8ClampedArray, Uint16Array and Uint32Array views; rejects the ArrayBuffer read out of the buffer property of a BigUint64Array; rejects a sixteen byte ArrayBuffer although it addresses two elements; rejects a DataView spanning the whole buffer, since a DataView is not a typed array; rejects an Object array holding a Date and an Error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for Int16Array, Int32Array, Uint8ClampedArray, Uint16Array and Uint32Array views ---
      {
        let type: util.types = new util.types();
        let otherInt16: Int16Array = new Int16Array(2);
        expect(type.isBigUint64Array(otherInt16)).assertFalse();
        let otherInt32: Int32Array = new Int32Array(2);
        expect(type.isBigUint64Array(otherInt32)).assertFalse();
        let otherUint8Clamped: Uint8ClampedArray = new Uint8ClampedArray(2);
        expect(type.isBigUint64Array(otherUint8Clamped)).assertFalse();
        let otherUint16: Uint16Array = new Uint16Array(2);
        expect(type.isBigUint64Array(otherUint16)).assertFalse();
        let otherUint32: Uint32Array = new Uint32Array(2);
        expect(type.isBigUint64Array(otherUint32)).assertFalse();
      }

      // --- [2] Verify isBigUint64Array returns false for the ArrayBuffer read out of the buffer property of a BigUint64Array ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        expect(type.isBigUint64Array(target.buffer)).assertFalse();
      }

      // --- [3] Verify isBigUint64Array returns false for a sixteen byte ArrayBuffer although it addresses two elements ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let elementCount: int = new BigUint64Array(host).length;
        expect(type.isBigUint64Array(host)).assertFalse();
        expect(elementCount).assertEqual(2);
      }

      // --- [4] Verify isBigUint64Array returns false for a DataView spanning the whole buffer, since a DataView is not a typed array ---
      {
        let type: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(16));
        expect(type.isBigUint64Array(view)).assertFalse();
      }

      // --- [5] Verify isBigUint64Array returns false for an Object array holding a Date and an Error ---
      {
        let type: util.types = new util.types();
        let values: Object[] = [new Date(0), new Error('probe')];
        expect(type.isBigUint64Array(values)).assertFalse();
        expect(values.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1400
     * @tc.name testTypesIsBigUint64Array014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a rejects an instance of a plain class carrying a degree field; Map holding one entry; Set holding one member; WeakSet holding one class instance; rejects the iterator produced by the keys method of a Map and values method of a Map and leaves it unconsumed.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for an instance of a plain class carrying a degree field ---
      {
        let type: util.types = new util.types();
        let probe: ThermoProbe = new ThermoProbe(25);
        expect(type.isBigUint64Array(probe)).assertFalse();
        expect(probe.degree).assertEqual(25);
      }

      // --- [2] Verify isBigUint64Array returns false for a Map holding one entry ---
      {
        let type: util.types = new util.types();
        let table: Map<string, int> = new Map<string, int>();
        table.set('a', 1);
        expect(type.isBigUint64Array(table)).assertFalse();
        expect(table.size).assertEqual(1);
      }

      // --- [3] Verify isBigUint64Array returns false for a Set holding one member ---
      {
        let type: util.types = new util.types();
        let pool: Set<int> = new Set<int>();
        pool.add(1);
        expect(type.isBigUint64Array(pool)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false for a WeakSet holding one class instance ---
      {
        let type: util.types = new util.types();
        let key: AnchorKey = new AnchorKey();
        let weak: WeakSet<AnchorKey> = new WeakSet<AnchorKey>();
        weak.add(key);
        expect(type.isBigUint64Array(weak)).assertFalse();
      }

      // --- [5] Verify isBigUint64Array returns false for the iterator produced by the keys method of a Map and values method of a Map and leaves it unconsumed ---
      {
        let type: util.types = new util.types();
        let table: Map<string, int> = new Map<string, int>();
        table.set('a', 1);
        let keys: IterableIterator<string> = table.keys();
        expect(type.isBigUint64Array(keys)).assertFalse();
        let type_2: util.types = new util.types();
        let table_2: Map<string, int> = new Map<string, int>();
        table_2.set('a', 7);
        let values: IterableIterator<int> = table_2.values();
        expect(type_2.isBigUint64Array(values)).assertFalse();
        expect(values.next().value).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1500
     * @tc.name testTypesIsBigUint64Array015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a synchronous arrow function and leaves it callable; rejects an async arrow function reference, which is a function and not a typed array; rejects a four element Int32Array held as Object even though its sixteen bytes span two uint64 elements; isBigUint64Array returns false when a plain class instance is reached through an Object typed reference; isBigUint64Array returns false when a Date is reached through an Object typed reference.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for a synchronous arrow function and leaves it callable ---
      {
        let type: util.types = new util.types();
        let plain: () => int = () => 1;
        expect(type.isBigUint64Array(plain)).assertFalse();
        expect(plain()).assertEqual(1);
      }

      // --- [2] Verify isBigUint64Array returns false for an async arrow function reference, which is a function and not a typed array ---
      {
        let type: util.types = new util.types();
        let task: () => Promise<int> = async (): Promise<int> => {
          return 1;
        };
        expect(type.isBigUint64Array(task)).assertFalse();
      }

      // --- [3] Verify isBigUint64Array returns false for a four element Int32Array held as Object even though its sixteen bytes span two uint64 elements ---
      {
        let type: util.types = new util.types();
        let words: Int32Array = new Int32Array(4);
        let held: Object = words;
        expect(words.byteLength).assertEqual(16);
        expect(type.isBigUint64Array(held)).assertFalse();
      }

      // --- [4] Verify isBigUint64Array returns false when a plain class instance is reached through an Object typed reference ---
      {
        let type: util.types = new util.types();
        let target: Object = new ThermoProbe(25);
        let flags: boolean[] = [type.isBigUint64Array(target)];
        expect(flags[0]).assertFalse();
      }

      // --- [5] Verify isBigUint64Array returns false when a Date is reached through an Object typed reference ---
      {
        let type: util.types = new util.types();
        let target: Object = new Date(0);
        expect((target as Date).getTime()).assertEqual(0);
        expect(type.isBigUint64Array(target)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1600
     * @tc.name testTypesIsBigUint64Array016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a DataView with byteOffset 8 and length 8, an offset window is still not a typed array; isBigUint64Array reads true for a BigUint64Array view; the verdict taken inside a holder method reads true for the tail view and false for its bare buffer; isBigUint64Array reads true beside the view and typed array predicates; a byte offset that is not a multiple of the eight byte element size is rejected with a RangeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns false for a DataView with byteOffset 8 and length 8, an offset window is still not a typed array ---
      {
        let type: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(16), 8, 8);
        expect(type.isBigUint64Array(view)).assertFalse();
        expect(view.byteOffset).assertEqual(8);
        expect(view.byteLength).assertEqual(8);
      }

      // --- [2] Verify isBigUint64Array reads true for a BigUint64Array view but false for a BigInt64Array view and a DataView, recording all three results in order ---
      {
        let type: util.types = new util.types();
        let seen: boolean[] = [];
        seen.push(type.isBigUint64Array(new BigUint64Array(1)));
        seen.push(type.isBigUint64Array(new BigInt64Array(1)));
        seen.push(type.isBigUint64Array(new DataView(new ArrayBuffer(8))));
        expect(seen[0]).assertTrue();
        expect(seen[1]).assertFalse();
        expect(seen[2]).assertFalse();
      }

      // --- [3] Verify the verdict taken inside a holder method reads true for the tail view and false for its bare buffer ---
      {
        let keeper: ReceiverKeeper = new ReceiverKeeper();
        let target: BigUint64Array = new BigUint64Array(new ArrayBuffer(32), 16, 2);
        expect(keeper.check(target)).assertTrue();
        expect(keeper.check(target.buffer)).assertFalse();
        expect(keeper.types.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify isBigUint64Array reads true beside the view and typed array predicates while the buffer predicates stay false on the view itself ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(new ArrayBuffer(16), 8, 1);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(type.isArrayBufferView(target)).assertTrue();
        expect(type.isTypedArray(target)).assertTrue();
        expect(type.isAnyArrayBuffer(target)).assertFalse();
        expect(type.isArrayBuffer(target)).assertFalse();
        expect(type.isArrayBuffer(target.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(target.buffer)).assertTrue();
      }

      // --- [5] Verify a byte offset that is not a multiple of the eight byte element size is rejected with a RangeError ---
      {
        let type: util.types = new util.types();
        let backing: ArrayBuffer = new ArrayBuffer(16);
        let valid: BigUint64Array = new BigUint64Array(backing);
        expect(valid.length).assertEqual(2);
        expect(type.isBigUint64Array(valid)).assertTrue();
        try {
          new BigUint64Array(backing, 4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(valid.length).assertEqual(2);
        expect(type.isBigUint64Array(valid)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1700
     * @tc.name testTypesIsBigUint64Array017
     * @tc.desc Merged batch (4 tests): Non-target object rejection: checks rejection of unrelated objects, covering post-mutation state.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the conjunction of isBigUint64Array and isArrayBufferView reads true for the array and false for its bare buffer ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let accepted: boolean = type.isBigUint64Array(target) && type.isArrayBufferView(target);
        let rejected: boolean = type.isBigUint64Array(target.buffer) && type.isArrayBufferView(target.buffer);
        expect(accepted).assertTrue();
        expect(rejected).assertFalse();
      }

      // --- [2] Verify the negated isBigUint64Array result is false for a BigUint64Array and true for a DataView ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let view: DataView = new DataView(new ArrayBuffer(8));
        expect(!type.isBigUint64Array(target)).assertFalse();
        expect(!type.isBigUint64Array(view)).assertTrue();
      }

      // --- [3] Verify the verdict recorded into a holder field flips from true for the unsigned array to false for the signed sibling ---
      {
        let type: util.types = new util.types();
        let holder: VerdictHolder = new VerdictHolder();
        holder.record(type.isBigUint64Array(new BigUint64Array(3)));
        expect(holder.flag).assertTrue();
        holder.record(type.isBigUint64Array(new BigInt64Array(3)));
        expect(holder.flag).assertFalse();
      }

      // --- [4] Verify a union typed variable reads true while it holds the unsigned array and false after reassignment to the signed sibling ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array | BigInt64Array = new BigUint64Array(2);
        expect(type.isBigUint64Array(target)).assertTrue();
        target = new BigInt64Array(2);
        expect(type.isBigUint64Array(target)).assertFalse();
        expect(type.isBigInt64Array(target)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1800
     * @tc.name testTypesIsBigUint64Array018
     * @tc.desc Merged batch (5 tests): View and buffer semantics: views at byteOffset 8 with an implicit tail and with length 2 are accepted, the latter reporting byteLength 16; accepts a 32 byte view inside a 64 byte host buffer and for a full 24 byte buffer view; accepts the subarray view of indices 2 to 5 taken from an eight element array; accepts a second view built over the backing buffer of another BigUint64Array; accepts an eight byte and a sixteen byte view over one buffer, so view width is irrelevant.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify views at byteOffset 8 with an implicit tail and with length 2 are accepted, the latter reporting byteLength 16 ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let target: BigUint64Array = new BigUint64Array(host, 8);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.byteOffset).assertEqual(8);
        expect(target.length).assertEqual(3);
        let type_2: util.types = new util.types();
        let host_2: ArrayBuffer = new ArrayBuffer(32);
        let target_2: BigUint64Array = new BigUint64Array(host_2, 8, 2);
        expect(target_2.byteOffset).assertEqual(8);
        expect(type_2.isBigUint64Array(target_2)).assertTrue();
        expect(target_2.byteLength).assertEqual(16);
      }

      // --- [2] Verify isBigUint64Array returns true for a 32 byte view inside a 64 byte host buffer and for a full 24 byte buffer view ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(64);
        let partial: BigUint64Array = new BigUint64Array(host, 0, 4);
        let full: BigUint64Array = new BigUint64Array(new ArrayBuffer(24));
        expect(type.isBigUint64Array(partial)).assertTrue();
        expect(partial.byteLength).assertEqual(32);
        expect(type.isBigUint64Array(full)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array returns true for the subarray view of indices 2 to 5 taken from an eight element array ---
      {
        let type: util.types = new util.types();
        let base: BigUint64Array = new BigUint64Array(8);
        let target: BigUint64Array = base.subarray(2, 5);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.length).assertEqual(3);
      }

      // --- [4] Verify isBigUint64Array returns true for a second view built over the backing buffer of another BigUint64Array ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(2);
        let sibling: BigUint64Array = new BigUint64Array(source.buffer);
        expect(type.isBigUint64Array(sibling)).assertTrue();
        expect(sibling.buffer.byteLength).assertEqual(16);
      }

      // --- [5] Verify isBigUint64Array returns true for an eight byte and a sixteen byte view over one buffer, so view width is irrelevant ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let narrow: BigUint64Array = new BigUint64Array(host, 0, 1);
        let wide: BigUint64Array = new BigUint64Array(host, 0, 2);
        expect(type.isBigUint64Array(narrow)).assertTrue();
        expect(type.isBigUint64Array(wide)).assertTrue();
        expect(narrow.byteLength).assertEqual(8);
        expect(wide.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_1900
     * @tc.name testTypesIsBigUint64Array019
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts the full width view over a 32 byte buffer; a full width subarray and a trailing subarray are accepted and a write through the trailing one reaches the parent index; empty subarray produced by subarray of indices 0 to 0; a subarray can still be derived from a checked array and is itself reported true; two element slice copy whose backing buffer is a fresh sixteen byte buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for the full width view over a 32 byte buffer ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let target: BigUint64Array = new BigUint64Array(host);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.byteLength).assertEqual(32);
      }

      // --- [2] Verify a full width subarray and a trailing subarray are accepted and a write through the trailing one reaches the parent index ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(4).subarray(0);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.byteOffset).assertEqual(0);
        expect(target.length).assertEqual(4);
        let type_2: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(5);
        let tail: BigUint64Array = source.subarray(3);
        tail.$_set(1, BigInt(9));
        expect(source.$_get(4).toString()).assertEqual('9');
        expect(type_2.isBigUint64Array(tail)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array returns true for the empty subarray produced by subarray of indices 0 to 0 ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(5).subarray(0, 0);
        expect(target.length).assertEqual(0);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify a subarray can still be derived from a checked array and is itself reported true ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(6);
        type.isBigUint64Array(target);
        let sub: BigUint64Array = target.subarray(2, 4);
        expect(sub.length).assertEqual(2);
        expect(type.isBigUint64Array(sub)).assertTrue();
      }

      // --- [5] Verify isBigUint64Array returns true for the two element slice copy whose backing buffer is a fresh sixteen byte buffer ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(4);
        let copy: BigUint64Array = source.slice(0, 2);
        expect(type.isBigUint64Array(copy)).assertTrue();
        expect(copy.buffer.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2000
     * @tc.name testTypesIsBigUint64Array020
     * @tc.desc Merged batch (5 tests): View and buffer semantics: isBigUint64Array stays true after a shared buffer is written through Uint8Array or Int32Array; accepts a BigUint64Array after a byte is written into the shared buffer by a DataView; accepts the tail view whose byteOffset 16 plus byteLength 16 exactly reaches the 32 byte host; accepts a view holding 2^63 with top byte 128 and two overlapping views whose writes reach each other; accepts a subarray that shares the buffer object of its parent while its byteOffset reads 16.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array stays true after a shared buffer is written through Uint8Array or Int32Array ---
      {
        let type: util.types = new util.types();
        let bufferForUint8: ArrayBuffer = new ArrayBuffer(16);
        let targetUint8: BigUint64Array = new BigUint64Array(bufferForUint8);
        let bytes: Uint8Array = new Uint8Array(bufferForUint8);
        bytes.$_set(0, 255);
        expect(type.isBigUint64Array(targetUint8)).assertTrue();
        expect(bytes.$_get(0)).assertEqual(255);
        let bufferForInt32: ArrayBuffer = new ArrayBuffer(16);
        let targetInt32: BigUint64Array = new BigUint64Array(bufferForInt32);
        let words: Int32Array = new Int32Array(bufferForInt32);
        words.$_set(0, 1);
        expect(type.isBigUint64Array(targetInt32)).assertTrue();
        expect(words.$_get(0)).assertEqual(1);
      }

      // --- [2] Verify isBigUint64Array returns true for a BigUint64Array after a byte is written into the shared buffer by a DataView ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        let view: DataView = new DataView(host);
        view.setUint8(0, 1);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(view.getUint8(0)).assertEqual(1);
      }

      // --- [3] Verify isBigUint64Array returns true for the tail view whose byteOffset 16 plus byteLength 16 exactly reaches the 32 byte host ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let target: BigUint64Array = new BigUint64Array(host, 16, 2);
        expect(target.byteOffset + target.byteLength).assertEqual(32);
        expect(target.byteLength).assertEqual(2 * 8);
        expect(target.length).assertEqual(2);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify a view holding 2^63 with top byte 128 and two overlapping views whose writes reach each other are accepted ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host, 8, 1);
        target.$_set(0, BigInt('9223372036854775808'));
        let bytes: Uint8Array = new Uint8Array(host);
        expect(bytes.$_get(8)).assertEqual(0);
        expect(bytes.$_get(15)).assertEqual(128);
        expect(target.byteOffset).assertEqual(8);
        expect(type.isBigUint64Array(target)).assertTrue();
        let type_2: util.types = new util.types();
        let host_2: ArrayBuffer = new ArrayBuffer(32);
        let first: BigUint64Array = new BigUint64Array(host_2, 0, 2);
        let second: BigUint64Array = new BigUint64Array(host_2, 8, 2);
        second.$_set(0, BigInt(77));
        expect(first.$_get(1)).assertEqual(BigInt(77));
        expect(second.byteOffset).assertEqual(8);
        expect(type_2.isBigUint64Array(first)).assertTrue();
        expect(type_2.isBigUint64Array(second)).assertTrue();
      }

      // --- [5] Verify isBigUint64Array returns true for a subarray that shares the buffer object of its parent while its byteOffset reads 16 ---
      {
        let type: util.types = new util.types();
        let parent: BigUint64Array = new BigUint64Array(6);
        let middle: BigUint64Array = parent.subarray(2, 5);
        let shared: boolean = middle.buffer === parent.buffer;
        expect(shared).assertTrue();
        expect(parent.byteOffset).assertEqual(0);
        expect(middle.byteOffset).assertEqual(16);
        expect(type.isBigUint64Array(middle)).assertTrue();
        expect(type.isDataView(middle)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2100
     * @tc.name testTypesIsBigUint64Array021
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts the array built by of from the maximum uint64 value, whose eight little endian bytes all read 255; a second view built over the host after the verdict still reads the value six and itself returns true; a write through a middle subarray reaches the parent while an earlier slice copy stays separate; isBigUint64Array separates an eight byte element view from a two byte element view over the same buffer; isBigUint64Array accepts two separately built views that a Set keeps as distinct members.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for the array built by of from the maximum uint64 value, whose eight little endian bytes all read 255 ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = BigUint64Array.of(BigInt('18446744073709551615'));
        let bytes: Uint8Array = new Uint8Array(target.buffer);
        let filled: int = 0;
        for (let at: int = 0; at < 8; at++) {
          if (bytes.$_get(at) === 255) {
            filled = filled + 1;
          }
        }
        expect(filled).assertEqual(8);
        expect(bytes.$_get(0)).assertEqual(255);
        expect(bytes.$_get(7)).assertEqual(255);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [2] Verify a second view built over the host after the verdict still reads the value six and itself returns true ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let first: BigUint64Array = new BigUint64Array(host);
        first.$_set(0, BigInt(6));
        expect(type.isBigUint64Array(first)).assertTrue();
        let second: BigUint64Array = new BigUint64Array(host);
        expect(second.$_get(0)).assertEqual(BigInt(6));
        expect(type.isBigUint64Array(second)).assertTrue();
      }

      // --- [3] Verify a write through a middle subarray reaches the parent while an earlier slice copy stays separate ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let parent: BigUint64Array = new BigUint64Array(host);
        let middle: BigUint64Array = parent.subarray(1, 4);
        let copy: BigUint64Array = middle.slice(0);
        middle.$_set(0, BigInt(9));
        expect(parent.$_get(1)).assertEqual(BigInt(9));
        expect(copy.$_get(0)).assertEqual(BigInt(0));
        expect(middle.byteOffset).assertEqual(8);
        expect(copy.byteOffset).assertEqual(0);
        expect(type.isBigUint64Array(parent)).assertTrue();
        expect(type.isBigUint64Array(middle)).assertTrue();
        expect(type.isBigUint64Array(copy)).assertTrue();
      }

      // --- [4] Verify isBigUint64Array separates an eight byte element view from a two byte element view over the same buffer ---
      {
        let type: util.types = new util.types();
        let backing: ArrayBuffer = new ArrayBuffer(8);
        let wide: BigUint64Array = new BigUint64Array(backing);
        let halves: Uint16Array = new Uint16Array(backing);
        expect(type.isBigUint64Array(wide)).assertTrue();
        expect(type.isBigUint64Array(halves)).assertFalse();
        expect(type.isUint16Array(halves)).assertTrue();
        expect(type.isUint16Array(wide)).assertFalse();
        expect(halves.byteLength).assertEqual(wide.byteLength);
        expect(halves.length).assertEqual(wide.length * 4);
      }

      // --- [5] Verify isBigUint64Array accepts two separately built views that a Set keeps as distinct members ---
      {
        let type: util.types = new util.types();
        let pool: Set<BigUint64Array> = new Set<BigUint64Array>();
        let first: BigUint64Array = new BigUint64Array(2);
        let twin: BigUint64Array = new BigUint64Array(2);
        pool.add(first);
        pool.add(twin);
        expect(pool.has(twin)).assertTrue();
        expect(type.isBigUint64Array(first)).assertTrue();
        expect(type.isBigUint64Array(twin)).assertTrue();
        expect(pool.size).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2200
     * @tc.name testTypesIsBigUint64Array022
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts a subarray after the parent buffer is written through a Uint8Array; accepts a subarray of a subarray whose byteOffsets reach 16 and 24; isBigUint64Array leaves the byteOffset of an offset view at 8 and the host buffer byteLength at 32; isBigUint64Array still returns true after the shared buffer is written again with byte 9; reverse reorders the elements within the view without the predicate losing its verdict.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array still returns true for a subarray after the parent buffer is written through a Uint8Array ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(4);
        let sub: BigUint64Array = source.subarray(0, 2);
        let bytes: Uint8Array = new Uint8Array(source.buffer);
        bytes.$_set(0, 42);
        expect(type.isBigUint64Array(sub)).assertTrue();
        expect(bytes.$_get(0)).assertEqual(42);
      }

      // --- [2] Verify isBigUint64Array returns true for a subarray of a subarray whose byteOffsets reach 16 and 24 while the tail value stays readable ---
      {
        let type: util.types = new util.types();
        let parent: BigUint64Array = new BigUint64Array(6);
        parent.$_set(5, BigInt(21));
        let middle: BigUint64Array = parent.subarray(2);
        let deepest: BigUint64Array = middle.subarray(1);
        expect(middle.byteOffset).assertEqual(16);
        expect(deepest.byteOffset).assertEqual(24);
        expect(deepest.$_get(2)).assertEqual(BigInt(21));
        expect(type.isBigUint64Array(deepest)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array leaves the byteOffset of an offset view at 8 and the host buffer byteLength at 32 ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(32);
        let target: BigUint64Array = new BigUint64Array(host, 8, 2);
        type.isBigUint64Array(target);
        expect(target.byteOffset).assertEqual(8);
        expect(target.byteLength).assertEqual(16);
        expect(host.byteLength).assertEqual(32);
      }

      // --- [4] Verify isBigUint64Array still returns true after the shared buffer is written again with byte 9 ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(0, 7);
        expect(type.isBigUint64Array(target)).assertTrue();
        bytes.$_set(0, 9);
        expect(bytes.$_get(0)).assertEqual(9);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [5] Verify reverse reorders the elements within the view without the predicate losing its verdict ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array([1n, 2n, 3n]);
        source.reverse();
        expect(type.isBigUint64Array(source)).assertTrue();
        expect(source[0]).assertEqual(3n);
        expect(source[2]).assertEqual(1n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2300
     * @tc.name testTypesIsBigUint64Array023
     * @tc.desc Merged batch (5 tests): View and buffer semantics: accepts three sibling subarray views taken from one eight element array; isBigUint64Array accepts the view whose uint64 maximum reads back as -1 through the BigInt64Array sibling; isBigUint64Array still returns true after a two byte word is written into the shared buffer by a Uint16Array; isBigUint64Array accepts the view of the 2^63 bit pattern; interleaving the signed sibling verdicts between two unsigned verdicts leaves byte five of the shared buffer at seven.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for three sibling subarray views taken from one eight element array ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(8);
        let head: BigUint64Array = source.subarray(0, 2);
        let middle: BigUint64Array = source.subarray(2, 6);
        let tail: BigUint64Array = source.subarray(6);
        expect(type.isBigUint64Array(head)).assertTrue();
        expect(type.isBigUint64Array(middle)).assertTrue();
        expect(type.isBigUint64Array(tail)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array accepts the view whose uint64 maximum reads back as -1 through the BigInt64Array sibling ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let unsigned: BigUint64Array = new BigUint64Array(host);
        unsigned.$_set(0, BigInt('18446744073709551615'));
        let signed: BigInt64Array = new BigInt64Array(host);
        expect(signed.$_get(0)).assertEqual(BigInt(-1));
        expect(type.isBigUint64Array(unsigned)).assertTrue();
        expect(type.isBigInt64Array(signed)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array still returns true after a two byte word is written into the shared buffer by a Uint16Array ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        let halves: Uint16Array = new Uint16Array(host);
        halves.$_set(1, 513);
        expect(halves.$_get(1)).assertEqual(513);
        expect(halves.$_get(0)).assertEqual(0);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify isBigUint64Array accepts the view of the 2^63 bit pattern while the signed sibling reads the int64 minimum ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let unsigned: BigUint64Array = new BigUint64Array(host);
        unsigned.$_set(0, BigInt('9223372036854775808'));
        let signed: BigInt64Array = new BigInt64Array(host);
        let bytes: Uint8Array = new Uint8Array(host);
        expect(signed.$_get(0)).assertEqual(BigInt('-9223372036854775808'));
        expect(bytes.$_get(0)).assertEqual(0);
        expect(bytes.$_get(7)).assertEqual(128);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
      }

      // --- [5] Verify interleaving the signed sibling verdicts between two unsigned verdicts leaves byte five of the shared buffer at seven ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let unsigned: BigUint64Array = new BigUint64Array(host);
        let signed: BigInt64Array = new BigInt64Array(host);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(5, 7);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
        expect(type.isBigInt64Array(signed)).assertTrue();
        expect(type.isBigUint64Array(signed)).assertFalse();
        expect(bytes.$_get(5)).assertEqual(7);
        expect(type.isBigUint64Array(unsigned)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2400
     * @tc.name testTypesIsBigUint64Array024
     * @tc.desc Merged batch (2 tests): View and buffer semantics: the isBigUint64Array verdict routes an unsigned array, a signed sibling and a plain int to three different branch labels; the ternary on the isBigUint64Array verdict labels a subarray unsigned and a Float64Array other.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the isBigUint64Array verdict routes an unsigned array, a signed sibling and a plain int to three different branch labels ---
      {
        let type: util.types = new util.types();
        let unsigned: BigUint64Array = new BigUint64Array(2);
        let signed: BigInt64Array = new BigInt64Array(2);
        let plain: int = 1;
        let label: string = '';
        if (type.isBigUint64Array(unsigned)) {
          label = 'unsigned';
        } else if (type.isArrayBufferView(unsigned)) {
          label = 'other-view';
        } else {
          label = 'plain';
        }
        expect(label).assertEqual('unsigned');
        if (type.isBigUint64Array(signed)) {
          label = 'unsigned';
        } else if (type.isArrayBufferView(signed)) {
          label = 'other-view';
        } else {
          label = 'plain';
        }
        expect(label).assertEqual('other-view');
        if (type.isBigUint64Array(plain)) {
          label = 'unsigned';
        } else {
          label = 'plain';
        }
        expect(label).assertEqual('plain');
      }

      // --- [2] Verify the ternary on the isBigUint64Array verdict labels a subarray unsigned and a Float64Array other ---
      {
        let type: util.types = new util.types();
        let sub: BigUint64Array = new BigUint64Array(4).subarray(1, 3);
        let decimal: Float64Array = new Float64Array(2);
        let first: string = type.isBigUint64Array(sub) ? 'unsigned' : 'other';
        let second: string = type.isBigUint64Array(decimal) ? 'unsigned' : 'other';
        expect(first).assertEqual('unsigned');
        expect(second).assertEqual('other');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2500
     * @tc.name testTypesIsBigUint64Array025
     * @tc.desc Merged batch (4 tests): State preservation and aliasing: checks that later reads still see the original state, covering element counts.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for the from built array, which stays at two elements after the source list grows to three ---
      {
        let type: util.types = new util.types();
        let seed: bigint[] = [BigInt(5), BigInt(6)];
        let target: BigUint64Array = BigUint64Array.from(seed);
        seed.push(BigInt(7));
        expect(target.length).assertEqual(2);
        expect(seed.length).assertEqual(3);
        expect(target.$_get(1)).assertEqual(BigInt(6));
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array leaves a map entry pointing at the very same array instance it was handed ---
      {
        let type: util.types = new util.types();
        let registry: Map<string, BigUint64Array> = new Map<string, BigUint64Array>();
        let target: BigUint64Array = new BigUint64Array(3);
        registry.set('a', target);
        expect(type.isBigUint64Array(target)).assertTrue();
        let same: boolean = registry.get('a')! === target;
        expect(same).assertTrue();
        expect(registry.size).assertEqual(1);
      }

      // --- [3] Verify isBigUint64Array returns true for the target that received a copy through set at offset two while the source keeps its values ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(2);
        source.$_set(0, BigInt(4));
        source.$_set(1, BigInt(5));
        let target: BigUint64Array = new BigUint64Array(4);
        target.set(source, 2);
        expect(target.$_get(2)).assertEqual(BigInt(4));
        expect(target.$_get(3)).assertEqual(BigInt(5));
        expect(source.$_get(0)).assertEqual(BigInt(4));
        expect(target.length).assertEqual(4);
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [4] Verify the checked array keeps length 3 and byteLength 24 and leaves a written byte at 200 and an untouched byte at 0 ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(3);
        type.isBigUint64Array(target);
        expect(target.length).assertEqual(3);
        expect(target.byteLength).assertEqual(24);
        let type_2: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(24);
        let target_2: BigUint64Array = new BigUint64Array(host);
        let bytes: Uint8Array = new Uint8Array(host);
        bytes.$_set(0, 200);
        type_2.isBigUint64Array(target_2);
        expect(bytes.$_get(0)).assertEqual(200);
        expect(bytes.$_get(23)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2600
     * @tc.name testTypesIsBigUint64Array026
     * @tc.desc Merged batch (4 tests): State preservation and aliasing: verifies that later reads still see the original state, covering loop and iterator traversal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify isBigUint64Array leaves the element values one, two and three readable at their original indices ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(3);
        target.$_set(0, BigInt(1));
        target.$_set(1, BigInt(2));
        target.$_set(2, BigInt(3));
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.$_get(0)).assertEqual(BigInt(1));
        expect(target.$_get(1)).assertEqual(BigInt(2));
        expect(target.$_get(2)).assertEqual(BigInt(3));
      }

      // --- [2] Verify the verdict taken before an await still reads true after the await while the stored value eight survives ---
      {
        let type: util.types = new util.types();
        let host: ArrayBuffer = new ArrayBuffer(16);
        let target: BigUint64Array = new BigUint64Array(host);
        target.$_set(0, BigInt(8));
        let before: boolean = type.isBigUint64Array(target);
        await Utils.msSleep(10);
        expect(before).assertTrue();
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(target.$_get(0)).assertEqual(BigInt(8));
      }

      // --- [3] Verify isBigUint64Array returns true for the slice copy that keeps the value eleven in a separate buffer after its source is rewritten ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array(5);
        source.$_set(0, BigInt(11));
        let copy: BigUint64Array = source.slice(0, 3);
        let shared: boolean = copy.buffer === source.buffer;
        source.$_set(0, BigInt(12));
        expect(shared).assertFalse();
        expect(copy.$_get(0)).assertEqual(BigInt(11));
        expect(copy.byteLength).assertEqual(24);
        expect(type.isBigUint64Array(copy)).assertTrue();
      }

      // --- [4] Verify toSorted keeps the element type and source order and the verdict keeps a do while loop running for two rounds ---
      {
        let type: util.types = new util.types();
        let source: BigUint64Array = new BigUint64Array([9n, 4n, 7n]);
        let ranked: BigUint64Array = source.toSorted();
        expect(type.isBigUint64Array(ranked)).assertTrue();
        expect(ranked[0]).assertEqual(4n);
        expect(source[0]).assertEqual(9n);
        let type_2: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(3);
        let rounds: int = 0;
        do {
          rounds = rounds + 1;
        } while (type_2.isBigUint64Array(target) && rounds < 2);
        expect(rounds).assertEqual(2);
        expect(target.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2700
     * @tc.name testTypesIsBigUint64Array027
     * @tc.desc Merged batch (5 tests): API call consistency: the Object parameter helper channel reports true and agrees with a direct call on the same array; isBigUint64Array accepts a real view and one rebuilt from its fields; the verdict handed to a helper function reads accepted for the offset view and rejected for its buffer; two independent util.types receivers agree on the same BigUint64Array argument; isBigUint64Array and isBigInt64Array do not cross talk on one array, in both call orders and on two receivers.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the Object parameter helper channel reports true and agrees with a direct call on the same array ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        expect(probeThroughReceiver(type, target)).assertTrue();
        expect(type.isBigUint64Array(target)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array accepts a real view and one rebuilt from its fields but rejects a shape mimic, since it reads the internal type ---
      {
        let type: util.types = new util.types();
        let real: BigUint64Array = new BigUint64Array(new ArrayBuffer(32), 8, 2);
        let mimic: ViewShapeMimic = new ViewShapeMimic();
        mimic.buffer = real.buffer;
        mimic.byteOffset = real.byteOffset;
        mimic.length = real.length;
        let rebuilt: BigUint64Array = new BigUint64Array(mimic.buffer, mimic.byteOffset, mimic.length);
        expect(type.isBigUint64Array(real)).assertTrue();
        expect(type.isBigUint64Array(rebuilt)).assertTrue();
        expect(type.isBigUint64Array(mimic)).assertFalse();
      }

      // --- [3] Verify the verdict handed to a helper function reads accepted for the offset view and rejected for its buffer ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(new ArrayBuffer(16), 8, 1);
        expect(describeVerdict(type.isBigUint64Array(target))).assertEqual('accepted');
        expect(describeVerdict(type.isBigUint64Array(target.buffer))).assertEqual('rejected');
      }

      // --- [4] Verify two independent util.types receivers agree on the same BigUint64Array argument ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(1);
        expect(first.isBigUint64Array(target)).assertEqual(second.isBigUint64Array(target));
      }

      // --- [5] Verify isBigUint64Array and isBigInt64Array do not cross talk on one array, in both call orders and on two receivers ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        expect(type.isBigUint64Array(target)).assertTrue();
        expect(type.isBigInt64Array(target)).assertFalse();
        let other: util.types = new util.types();
        expect(other.isBigInt64Array(target)).assertFalse();
        expect(other.isBigUint64Array(target)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2800
     * @tc.name testTypesIsBigUint64Array028
     * @tc.desc Merged batch (1 test): API call consistency: accepts a BigUint64Array while a Float64Array is still rejected.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for a BigUint64Array while a Float64Array is still rejected ---
      {
        let type: util.types = new util.types();
        expect(type.isBigUint64Array(new BigUint64Array(2))).assertTrue();
        expect(type.isBigUint64Array(new Float64Array(1))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_2900
     * @tc.name testTypesIsBigUint64Array029
     * @tc.desc Merged batch (3 tests): Program integration: verifies use through program paths, covering typed array views and related program paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for an array produced by a helper function call ---
      {
        let type: util.types = new util.types();
        let made: BigUint64Array = buildBigUint64Array();
        expect(type.isBigUint64Array(made)).assertTrue();
        expect(made.length).assertEqual(2);
      }

      // --- [2] Verify the isBigUint64Array result selects the matching branch of an if else statement for a BigUint64Array ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(2);
        let branch: string = 'none';
        if (type.isBigUint64Array(target)) {
          branch = 'hit';
        } else {
          branch = 'miss';
        }
        expect(branch).assertEqual('hit');
      }

      // --- [3] Verify the isBigUint64Array verdict drives a while loop that counts exactly two matches among four candidates ---
      {
        let type: util.types = new util.types();
        let candidates: Object[] = [new BigUint64Array(1), new Uint8Array(1), new BigUint64Array(2), new BigInt64Array(1)];
        let matches: int = 0;
        let at: int = 0;
        while (at < candidates.length) {
          if (type.isBigUint64Array(candidates[at])) {
            matches = matches + 1;
          }
          at = at + 1;
        }
        expect(matches).assertEqual(2);
        expect(at).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_BIG_UINT64_ARRAY_3000
     * @tc.name testTypesIsBigUint64Array030
     * @tc.desc Merged batch (3 tests): Miscellaneous checks: verifies remaining edge cases, covering typed array views and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsBigUint64Array030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isBigUint64Array returns true for a BigUint64Array read back out of a quoted Record slot, keeping the element stored there ---
      {
        let type: util.types = new util.types();
        let target: BigUint64Array = new BigUint64Array(1);
        target.$_set(0, BigInt(7));
        let slots: Record<string, BigUint64Array> = { 'primary': target };
        let picked: BigUint64Array = slots['primary']!;
        expect(picked.$_get(0)).assertEqual(BigInt(7));
        expect(type.isBigUint64Array(picked)).assertTrue();
      }

      // --- [2] Verify isBigUint64Array returns true for an array held in a class field and for the same instance returned by its accessor ---
      {
        let type: util.types = new util.types();
        let box: ViewBox = new ViewBox();
        box.held.$_set(0, BigInt(3));
        let opened: BigUint64Array = box.open();
        expect(opened.$_get(0)).assertEqual(BigInt(3));
        expect(type.isBigUint64Array(opened)).assertTrue();
        expect(type.isBigUint64Array(box.held)).assertTrue();
      }

      // --- [3] Verify isBigUint64Array returns false for -2147483648, the minimum int value ---
      {
        let type: util.types = new util.types();
        let value: int = -2147483648;
        let judged: boolean = type.isBigUint64Array(value);
        expect(judged).assertFalse();
      }
    });

  });
}
