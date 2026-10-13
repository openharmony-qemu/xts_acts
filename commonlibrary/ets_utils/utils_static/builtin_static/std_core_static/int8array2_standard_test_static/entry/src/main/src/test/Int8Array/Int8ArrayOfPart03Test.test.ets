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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayOfPart03Test(): void {
  describe('Int8ArrayOfPart03Test', (): void => {
    const INT8_MAX = 127;

    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0100
     * @tc.name int8ArrayOfPart03Test001
     * @tc.desc Verify Int8Array.of number FixedArray<number> 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0200
     * @tc.name int8ArrayOfPart03Test002
     * @tc.desc Verify of with byte arguments preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualLength: int = a1.length;
      let expectedLength: int = a2.length;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0300
     * @tc.name int8ArrayOfPart03Test003
     * @tc.desc Verify of with byte arguments preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualByteLength: int = a1.byteLength;
      let expectedByteLength: int = a2.byteLength;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0400
     * @tc.name int8ArrayOfPart03Test004
     * @tc.desc Verify of with byte arguments preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualByteOffset: int = a1.byteOffset;
      let expectedByteOffset: int = a2.byteOffset;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0500
     * @tc.name int8ArrayOfPart03Test005
     * @tc.desc Verify of with byte arguments matches toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualStr: string = a1.toString();
      let expectedStr: string = a2.toString();
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0600
     * @tc.name int8ArrayOfPart03Test006
     * @tc.desc Verify of with byte arguments matches join result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualJoined: string = a1.join(',');
      let expectedJoined: string = a2.join(',');
      expect(actualJoined).assertEqual(expectedJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0700
     * @tc.name int8ArrayOfPart03Test007
     * @tc.desc Verify Int8Array.of() with byte arguments matches number arguments at index 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualValue: number = a1.$_get(0);
      let expectedValue: number = a2.$_get(0);
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = a1.$_get(1);
      let expectedValue2: number = a2.$_get(1);
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0800
     * @tc.name int8ArrayOfPart03Test008
     * @tc.desc Verify of with byte arguments matches at(-1) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const b1: byte = 1;
      const b2: byte = 2;
      const a2 = Int8Array.of(b1, b2);
      let actualAt = a1.at(-1);
      let expectedAt = a2.at(-1);
      expect(actualAt).assertEqual(expectedAt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_0900
     * @tc.name int8ArrayOfPart03Test009
     * @tc.desc Verify Int8Array.of number 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7);
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1000
     * @tc.name int8ArrayOfPart03Test010
     * @tc.desc Verify Int8Array.of E 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b7: byte = 7;
      const arr = Int8Array.of(b7);
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1200
     * @tc.name int8ArrayOfPart03Test012
     * @tc.desc Verify of() at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1300
     * @tc.name int8ArrayOfPart03Test013
     * @tc.desc Verify of() indexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      let actualIndex: int = arr.indexOf(0);
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1400
     * @tc.name int8ArrayOfPart03Test014
     * @tc.desc Verify of() includes(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      let actualIncluded: boolean = arr.includes(0);
      expect(actualIncluded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1500
     * @tc.name int8ArrayOfPart03Test015
     * @tc.desc Verify of() find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      let called = false;
      let resultVal1: number | undefined = arr.find((v: number): boolean => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return false;
        }
        called = true;
        return false;
      });
      expect(resultVal1).assertUndefined();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1600
     * @tc.name int8ArrayOfPart03Test016
     * @tc.desc Verify of() findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      let actualFindIndex: int = arr.findIndex((v: number): boolean => v === 0);
      let expectedFindIndex: int = -1;
      expect(actualFindIndex).assertEqual(expectedFindIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1700
     * @tc.name int8ArrayOfPart03Test017
     * @tc.desc Verify of() slice() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      const copy = arr.slice();
      let actualLength: int = copy.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1800
     * @tc.name int8ArrayOfPart03Test018
     * @tc.desc Verify of() reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_1900
     * @tc.name int8ArrayOfPart03Test019
     * @tc.desc Verify set offset RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const src = Int8Array.of(3, 4, 5);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2000
     * @tc.name int8ArrayOfPart03Test020
     * @tc.desc Verify set offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const src = Int8Array.of(3, 4, 5);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2100
     * @tc.name int8ArrayOfPart03Test021
     * @tc.desc Verify sort callback throwing Error leaves length and first element of array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.sort((a: number, b: number) => {
          throw new Error('cmp');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('cmp');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2200
     * @tc.name int8ArrayOfPart03Test022
     * @tc.desc Verify reduce on empty of array without initial value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of();
      try {
        arr.reduce((acc: number, v: number) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2300
     * @tc.name int8ArrayOfPart03Test023
     * @tc.desc Verify reduce propagates callback Error and keeps elements of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.reduce((acc: number, v: number) => {
          throw new Error('rd');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('rd');
      }
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2400
     * @tc.name int8ArrayOfPart03Test024
     * @tc.desc Verify reduceRight propagates callback Error keeping length of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.reduceRight((acc: number, v: number) => {
          throw new Error('rr');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('rr');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2500
     * @tc.name int8ArrayOfPart03Test025
     * @tc.desc Verify find propagates predicate Error keeping elements of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.find((v: number): boolean => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return false;
          }
          throw new Error('fd');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('fd');
      }
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2600
     * @tc.name int8ArrayOfPart03Test026
     * @tc.desc Verify findIndex propagates predicate Error keeping length of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.findIndex((v: number): boolean => {
          throw new Error('fdi');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('fdi');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2700
     * @tc.name int8ArrayOfPart03Test027
     * @tc.desc Verify map propagates callback Error keeping elements of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.map((v: number) => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return 0;
          }
          throw new Error('mp');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('mp');
      }
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2800
     * @tc.name int8ArrayOfPart03Test028
     * @tc.desc Verify forEach propagates callback Error keeping length of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.forEach((v: number): void => {
          if (v < INT8_MIN || v > INT8_MAX) {
            return;
          }
          throw new Error('fe');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('fe');
      }
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_2900
     * @tc.name int8ArrayOfPart03Test029
     * @tc.desc Verify at out of range returns undefined keeping length of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const r = arr.at(5);
      expect(r).assertUndefined();
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3000
     * @tc.name int8ArrayOfPart03Test030
     * @tc.desc Verify with replaces element keeping source of array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const neu = arr.with(0, 5);
      let actualOriginal: number = arr.$_get(0);
      let expectedOriginal: int = 1;
      expect(actualOriginal).assertEqual(expectedOriginal);
      let actualNew: number = neu.$_get(0);
      let expectedNew: int = 5;
      expect(actualNew).assertEqual(expectedNew);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3100
     * @tc.name int8ArrayOfPart03Test031
     * @tc.desc Verify with out-of-range index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      try {
        arr.with(-3, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3200
     * @tc.name int8ArrayOfPart03Test032
     * @tc.desc Verify valueOf returns same Int8Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualValueOf: Int8Array = arr.valueOf();
      let expectedValueOf: Int8Array = arr;
      expect(actualValueOf).assertEqual(expectedValueOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3300
     * @tc.name int8ArrayOfPart03Test033
     * @tc.desc Verify valueOf on byte-constructed array returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 2;
      const arr = Int8Array.of(b1, b2);
      let actualValueOf: Int8Array = arr.valueOf();
      let expectedValueOf: Int8Array = arr;
      expect(actualValueOf).assertEqual(expectedValueOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3400
     * @tc.name int8ArrayOfPart03Test034
     * @tc.desc Verify toString of of-created array returns 1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualStr: string = arr.toString();
      let expectedStr: string = '1,2';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3500
     * @tc.name int8ArrayOfPart03Test035
     * @tc.desc Verify byteLength of number-created array equals its length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = arr.length;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3600
     * @tc.name int8ArrayOfPart03Test036
     * @tc.desc Verify byteLength of byte-created array equals its length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 2;
      const arr = Int8Array.of(b1, b2);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = arr.length;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3700
     * @tc.name int8ArrayOfPart03Test037
     * @tc.desc Verify number byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3800
     * @tc.name int8ArrayOfPart03Test038
     * @tc.desc Verify buffer byteLength of number-created array equals two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualBufferByteLength: int = arr.buffer.byteLength;
      let expectedBufferByteLength: int = 2;
      expect(actualBufferByteLength).assertEqual(expectedBufferByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_3900
     * @tc.name int8ArrayOfPart03Test039
     * @tc.desc Verify buffer byteLength of number-created array equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualBufferByteLength: int = arr.buffer.byteLength;
      let expectedBufferByteLength: int = arr.length;
      expect(actualBufferByteLength).assertEqual(expectedBufferByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4000
     * @tc.name int8ArrayOfPart03Test040
     * @tc.desc Verify buffer byteLength of byte-created array equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 2;
      const arr = Int8Array.of(b1, b2);
      let actualBufferByteLength: int = arr.buffer.byteLength;
      let expectedBufferByteLength: int = arr.length;
      expect(actualBufferByteLength).assertEqual(expectedBufferByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4100
     * @tc.name int8ArrayOfPart03Test041
     * @tc.desc Verify join with dash returns 1-2 for of-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualJoined: string = arr.join('-');
      let expectedJoined: string = '1-2';
      expect(actualJoined).assertEqual(expectedJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4200
     * @tc.name int8ArrayOfPart03Test042
     * @tc.desc Verify join with dash returns 1-2 for byte-created of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 2;
      const arr = Int8Array.of(b1, b2);
      let actualJoined: string = arr.join('-');
      let expectedJoined: string = '1-2';
      expect(actualJoined).assertEqual(expectedJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4300
     * @tc.name int8ArrayOfPart03Test043
     * @tc.desc Verify number indexOf(2) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      let actualIndex: int = arr.indexOf(2);
      let expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4400
     * @tc.name int8ArrayOfPart03Test044
     * @tc.desc Verify includes finds one for byte-created of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 2;
      const arr = Int8Array.of(b1, b2);
      let actualIncluded: boolean = arr.includes(1);
      expect(actualIncluded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4700
     * @tc.name int8ArrayOfPart03Test047
     * @tc.desc Verify of reverse of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const a2 = Int8Array.of(1, 2);
      a1.reverse();
      let actualValue: number = a2.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4800
     * @tc.name int8ArrayOfPart03Test048
     * @tc.desc Verify of fill of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const a2 = Int8Array.of(1, 2);
      a1.fill(9);
      let actualValue: number = a2.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_4900
     * @tc.name int8ArrayOfPart03Test049
     * @tc.desc Verify of sort of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(2, 1);
      const a2 = Int8Array.of(2, 1);
      a1.sort();
      let actualValue: number = a2.$_get(0);
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5000
     * @tc.name int8ArrayOfPart03Test050
     * @tc.desc Verify slice copy mutation does not affect source of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const copy = arr.slice();
      copy.$_set(0, 99);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5100
     * @tc.name int8ArrayOfPart03Test051
     * @tc.desc Verify subarray view write visible in source of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const view = arr.subarray(0, 1);
      view.$_set(0, 99);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5200
     * @tc.name int8ArrayOfPart03Test052
     * @tc.desc Verify copyWithin copies second value to first index of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      arr.copyWithin(0, 1, 2);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5300
     * @tc.name int8ArrayOfPart03Test053
     * @tc.desc Verify of arrays equal before and after set mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Int8Array.of(1, 2);
      const a2 = Int8Array.of(1, 2);
      let actualValue: number = a1.$_get(0);
      let expectedValue: number = a2.$_get(0);
      expect(actualValue).assertEqual(expectedValue);
      a1.$_set(0, 99);
      let actualAfterSet: number = a2.$_get(0);
      let expectedAfterSet: int = 1;
      expect(actualAfterSet).assertEqual(expectedAfterSet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5400
     * @tc.name int8ArrayOfPart03Test054
     * @tc.desc Verify subarray shares buffer of source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const view = arr.subarray(0, 1);
      let actualBuffer: ArrayBuffer = view.buffer;
      let expectedBuffer: ArrayBuffer = arr.buffer;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5500
     * @tc.name int8ArrayOfPart03Test055
     * @tc.desc Verify fill writes visible through subarray of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const view = arr.subarray(0, 2);
      arr.fill(9);
      let viewedValue: number = view.$_get(0);
      let expectedViewed: int = 9;
      expect(viewedValue).assertEqual(expectedViewed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5600
     * @tc.name int8ArrayOfPart03Test056
     * @tc.desc Verify set writes visible through subarray view of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const view = arr.subarray(0, 2);
      arr.set(Int8Array.of(7, 8));
      let viewedValue: number = view.$_get(1);
      let expectedViewed: int = 8;
      expect(viewedValue).assertEqual(expectedViewed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5700
     * @tc.name int8ArrayOfPart03Test057
     * @tc.desc Verify toReversed keeps source of array and reverses first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2);
      const r = arr.toReversed();
      let originalValue: number = arr.$_get(0);
      let expectedOriginal: int = 1;
      expect(originalValue).assertEqual(expectedOriginal);
      let reversedValue: number = r.$_get(0);
      let expectedReversed: int = 2;
      expect(reversedValue).assertEqual(expectedReversed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART03_TEST_5800
     * @tc.name int8ArrayOfPart03Test058
     * @tc.desc Verify toSorted keeps source of array and sorts first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1);
      const r = arr.toSorted();
      let originalValue: number = arr.$_get(0);
      let expectedOriginal: int = 2;
      expect(originalValue).assertEqual(expectedOriginal);
      let sortedValue: number = r.$_get(0);
      let expectedSorted: int = 1;
      expect(sortedValue).assertEqual(expectedSorted);
    });
  });
}
