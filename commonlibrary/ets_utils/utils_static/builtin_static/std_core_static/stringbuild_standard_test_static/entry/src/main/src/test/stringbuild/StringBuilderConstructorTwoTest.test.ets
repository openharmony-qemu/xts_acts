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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';
export default function StringBuilderConstructorTwoTest(): void {
  describe('StringBuilderConstructorTwoTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0001
     * @tc.name testStringBuilderConstructorTwo001
     * @tc.desc Verify FixedArray<char> with single parameter constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B', c'C'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0002
     * @tc.name testStringBuilderConstructorTwo002
     * @tc.desc Verify FixedArray with maximum Unicode character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\uffff'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
        expect(builder.toString().length).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0003
     * @tc.name testStringBuilderConstructorTwo003
     * @tc.desc Verify FixedArray with 10000 elements constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let chars: FixedArray<char> = new FixedArray<char>(10000, c'\u0000');
        for (let i = 0; i < 10000; i++) {
          chars[i] = c'X';
        }
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(10000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0004
     * @tc.name testStringBuilderConstructorTwo004
     * @tc.desc Verify FixedArray with space characters constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c' ', c' ', c' '];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(3);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0005
     * @tc.name testStringBuilderConstructorTwo005
     * @tc.desc Verify FixedArray with all null characters constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\u0000', c'\u0000', c'\u0000'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(3);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0006
     * @tc.name testStringBuilderConstructorTwo006
     * @tc.desc Verify FixedArray with newline character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\n'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0007
     * @tc.name testStringBuilderConstructorTwo007
     * @tc.desc Verify FixedArray with tab character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\t'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0008
     * @tc.name testStringBuilderConstructorTwo008
     * @tc.desc Verify FixedArray with carriage return character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\r'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0009
     * @tc.name testStringBuilderConstructorTwo009
     * @tc.desc Verify FixedArray with hex escape 0x7F character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\x7F'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0010
     * @tc.name testStringBuilderConstructorTwo010
     * @tc.desc Verify FixedArray with hex escape 0x00 character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\x00'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0011
     * @tc.name testStringBuilderConstructorTwo011
     * @tc.desc Verify FixedArray with hex escape 0xFF character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\xFF'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0012
     * @tc.name testStringBuilderConstructorTwo012
     * @tc.desc Verify FixedArray with Unicode escape u4e2d constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\u4e2d'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0013
     * @tc.name testStringBuilderConstructorTwo013
     * @tc.desc Verify FixedArray with Unicode escape u0009 constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\u0009'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0014
     * @tc.name testStringBuilderConstructorTwo014
     * @tc.desc Verify FixedArray with backslash character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\\'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0015
     * @tc.name testStringBuilderConstructorTwo015
     * @tc.desc Verify FixedArray with single quote character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\''];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0016
     * @tc.name testStringBuilderConstructorTwo016
     * @tc.desc Verify FixedArray with Japanese character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'ア'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0017
     * @tc.name testStringBuilderConstructorTwo017
     * @tc.desc Verify FixedArray with Korean character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'?'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0018
     * @tc.name testStringBuilderConstructorTwo018
     * @tc.desc Verify FixedArray with Russian character constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'Д'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0019
     * @tc.name testStringBuilderConstructorTwo019
     * @tc.desc Verify FixedArray with Greek letter constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'Ω'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0020
     * @tc.name testStringBuilderConstructorTwo020
     * @tc.desc Verify FixedArray with multilingual mixed characters constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'あ', c'ア', c'1'];
        const builder = new StringBuilder(chars);
        expect(builder !== null && builder !== undefined).assertTrue();
        expect(builder.stringLength).assertEqual(4);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0021
     * @tc.name testStringBuilderConstructorTwo021
     * @tc.desc Verify FixedArray construction preserves duplicate adjacent characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'A', c'B', c'B'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("AABB");
        expect(builder.stringLength).assertEqual(4);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0022
     * @tc.name testStringBuilderConstructorTwo022
     * @tc.desc Verify toString of single character FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'X'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("X");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0023
     * @tc.name testStringBuilderConstructorTwo023
     * @tc.desc Verify toString of empty FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
        const chars: FixedArray<char> = [];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0024
     * @tc.name testStringBuilderConstructorTwo024
     * @tc.desc Verify FixedArray stringLength counts leading and trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c' ', c'A', c' '];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(3);
        expect(builder.toString()).assertEqual(" A ");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0025
     * @tc.name testStringBuilderConstructorTwo025
     * @tc.desc Verify stringLength is 1 for single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'X'];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0026
     * @tc.name testStringBuilderConstructorTwo026
     * @tc.desc Verify stringLength is 0 for empty FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0027
     * @tc.name testStringBuilderConstructorTwo027
     * @tc.desc Verify construction result is instanceof StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A'];
        const builder = new StringBuilder(chars);
        expect(builder instanceof StringBuilder).assertTrue();
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0028
     * @tc.name testStringBuilderConstructorTwo028
     * @tc.desc Verify appending own toString result back to builder doubles content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B'];
        const builder = new StringBuilder(chars);
        const str: string = builder.toString();
        builder.append(str);
        expect(builder.toString()).assertEqual("ABAB");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0029
     * @tc.name testStringBuilderConstructorTwo029
     * @tc.desc Verify two builders from same FixedArray are independent after append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B', c'C'];
        const builder1 = new StringBuilder(chars);
        const builder2 = new StringBuilder(chars);
        builder1.append("123");
        builder2.append("456");
        expect(builder1.toString()).assertEqual("ABC123");
        expect(builder2.toString()).assertEqual("ABC456");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0030
     * @tc.name testStringBuilderConstructorTwo030
     * @tc.desc Verify toString result with escape characters is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'H', c'\n', c'W'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("H\nW");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0031
     * @tc.name testStringBuilderConstructorTwo031
     * @tc.desc Verify toString result containing null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'\u0000', c'B'];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(3);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0032
     * @tc.name testStringBuilderConstructorTwo032
     * @tc.desc Verify toString result containing Unicode characters is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'\u4e2d', c'\u6587'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("中文");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0033
     * @tc.name testStringBuilderConstructorTwo033
     * @tc.desc Verify toString result containing spaces is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'H', c' ', c'W'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("H W");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0034
     * @tc.name testStringBuilderConstructorTwo034
     * @tc.desc Verify toString returns complete content for large FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let chars: FixedArray<char> = new FixedArray<char>(5000, c'\u0000');
        for (let i = 0; i < 5000; i++) {
          chars[i] = c'A';
        }
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(5000);
        expect(builder.toString().length).assertEqual(5000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0035
     * @tc.name testStringBuilderConstructorTwo035
     * @tc.desc Verify multiple constructions with different FixedArrays do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars1: FixedArray<char> = [c'A', c'B'];
        const chars2: FixedArray<char> = [c'X', c'Y', c'Z'];
        const builder1 = new StringBuilder(chars1);
        const builder2 = new StringBuilder(chars2);
        expect(builder1.toString()).assertEqual("AB");
        expect(builder2.toString()).assertEqual("XYZ");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0036
     * @tc.name testStringBuilderConstructorTwo036
     * @tc.desc Verify modifying original FixedArray does not change StringBuilder content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let chars: FixedArray<char> = [c'A', c'B'];
        const builder = new StringBuilder(chars);
        chars = [c'X'];
        expect(builder.toString()).assertEqual("AB");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0037
     * @tc.name testStringBuilderConstructorTwo037
     * @tc.desc Verify construction then append mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B'];
        const builder = new StringBuilder(chars);
        builder.append("Extra");
        expect(builder.toString()).assertEqual("ABExtra");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0038
     * @tc.name testStringBuilderConstructorTwo038
     * @tc.desc Verify toString and stringLength consistency after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'B', c'C'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("ABC");
        expect(builder.stringLength).assertEqual(3);
        expect(builder.toString().length).assertEqual(builder.stringLength);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0039
     * @tc.name testStringBuilderConstructorTwo039
     * @tc.desc Verify construction with 20000 char FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let chars: FixedArray<char> = new FixedArray<char>(20000, c'\u0000');
        for (let i = 0; i < 20000; i++) {
          chars[i] = c'X';
        }
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(20000);
        expect(builder.toString().length).assertEqual(20000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0040
     * @tc.name testStringBuilderConstructorTwo040
     * @tc.desc Verify construction then mixed pipeline operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'T', c'e', c's', c't'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("Test");
        builder.append("Pipeline");
        expect(builder.toString()).assertEqual("TestPipeline");
        expect(builder.stringLength).assertEqual(12);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0041
     * @tc.name testStringBuilderConstructorTwo041
     * @tc.desc Verify char[] with single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: char[] = [c'X'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("X");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0042
     * @tc.name testStringBuilderConstructorTwo042
     * @tc.desc Verify ValueArray<char> with Chinese character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'中'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("中");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0043
     * @tc.name testStringBuilderConstructorTwo043
     * @tc.desc Verify ValueArray<char> with mixed ASCII and Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'H', c'i', c'中'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("Hi中");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0044
     * @tc.name testStringBuilderConstructorTwo044
     * @tc.desc Verify ValueArray<char> with digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'0', c'1', c'9'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("019");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0045
     * @tc.name testStringBuilderConstructorTwo045
     * @tc.desc Verify ValueArray<char> with punctuation characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'!', c'@', c'#'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("!@#");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0046
     * @tc.name testStringBuilderConstructorTwo046
     * @tc.desc Verify ValueArray<char> with newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'\n'];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0047
     * @tc.name testStringBuilderConstructorTwo047
     * @tc.desc Verify ValueArray<char> empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("");
        expect(builder.stringLength).assertEqual(0);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0048
     * @tc.name testStringBuilderConstructorTwo048
     * @tc.desc Verify ValueArray<char> stringLength and toString consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'A', c'B', c'C'];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("ABC");
        expect(builder.stringLength).assertEqual(3);
        expect(builder.toString().length).assertEqual(builder.stringLength);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0049
     * @tc.name testStringBuilderConstructorTwo049
     * @tc.desc Verify ValueArray<char> instanceof StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: ValueArray<char> = [c'A'];
        const builder = new StringBuilder(chars);
        expect(builder instanceof StringBuilder).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0050
     * @tc.name testStringBuilderConstructorTwo050
     * @tc.desc Verify char[] with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: char[] = [];
        const builder = new StringBuilder(chars);
        expect(builder.toString()).assertEqual("");
        expect(builder.stringLength).assertEqual(0);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0051
     * @tc.name testStringBuilderConstructorTwo051
     * @tc.desc Verify char[] instanceof StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: char[] = [c'A'];
        const builder = new StringBuilder(chars);
        expect(builder instanceof StringBuilder).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0052
     * @tc.name testStringBuilderConstructorTwo052
     * @tc.desc Verify constructing with null FixedArray throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let arr: FixedArray<char> | null = null;
          const builder = new StringBuilder(arr!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0053
     * @tc.name testStringBuilderConstructorTwo053
     * @tc.desc Verify constructing with null char[] throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let arr: char[] | null = null;
          const builder = new StringBuilder(arr!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_TWO_0054
     * @tc.name testStringBuilderConstructorTwo054
     * @tc.desc Verify constructing with undefined FixedArray throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let arr: FixedArray<char> | undefined = undefined;
          const builder = new StringBuilder(arr!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );
  });
}

