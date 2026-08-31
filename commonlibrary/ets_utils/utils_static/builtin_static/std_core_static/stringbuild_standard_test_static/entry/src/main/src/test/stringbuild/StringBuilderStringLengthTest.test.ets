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

function getBuilderLength017(builder: StringBuilder): int {
  return builder.stringLength;
}

export default function StringBuilderStringLengthTest(): void {
  describe('StringBuilderStringLengthTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0001
     * @tc.name testStringBuilderStringLength001
     * @tc.desc Verify getter property stringLength access returns current
     *   string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("hello");
        let len: int = builder.stringLength;
        expect(len).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0002
     * @tc.name testStringBuilderStringLength002
     * @tc.desc Verify stringLength correctly counts null character from string constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("\u0000");
        let len: int = builder.stringLength;
        expect(len).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0003
     * @tc.name testStringBuilderStringLength003
     * @tc.desc Verify string initialization returns correct stringLength for
     *   ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("ArkTS");
        let len: int = builder.stringLength;
        expect(len).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0004
     * @tc.name testStringBuilderStringLength004
     * @tc.desc Verify empty string initialization returns stringLength of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("");
        let len: int = builder.stringLength;
        expect(len).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0005
     * @tc.name testStringBuilderStringLength005
     * @tc.desc Verify Chinese string initialization returns correct character
     *   count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("你好世界");
        let len: int = builder.stringLength;
        expect(len).assertEqual(4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0006
     * @tc.name testStringBuilderStringLength006
     * @tc.desc Verify single character initialization returns stringLength of
     *   1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("A");
        let len: int = builder.stringLength;
        expect(len).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0007
     * @tc.name testStringBuilderStringLength007
     * @tc.desc Verify FixedArray initialization returns stringLength equal to
     *   array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let charArray = new FixedArray<char>(3, c'\u0000');
        charArray[0] = c'a';
        charArray[1] = c'b';
        charArray[2] = c'c';
        const builder = new StringBuilder(charArray);
        let len: int = builder.stringLength;
        expect(len).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0008
     * @tc.name testStringBuilderStringLength008
     * @tc.desc Verify string with spaces returns correct stringLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello World");
        let len: int = builder.stringLength;
        expect(len).assertEqual(11);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0009
     * @tc.name testStringBuilderStringLength009
     * @tc.desc Verify string with special characters returns correct
     *   stringLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("a\nb\tc");
        let len: int = builder.stringLength;
        expect(len).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0010
     * @tc.name testStringBuilderStringLength010
     * @tc.desc Verify stringLength increases after append operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello");
        builder.append(" World");
        let len: int = builder.stringLength;
        expect(len).assertEqual(11);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0011
     * @tc.name testStringBuilderStringLength011
     * @tc.desc Verify stringLength accumulates after multiple append
     *   operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("A");
        builder.append("B");
        builder.append("CD");
        builder.append("EFG");
        let len: int = builder.stringLength;
        expect(len).assertEqual(7);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0012
     * @tc.name testStringBuilderStringLength012
     * @tc.desc Verify stringLength remains unchanged after appending empty
     *   string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("test");
        let lenBefore: int = builder.stringLength;
        builder.append("");
        let lenAfter: int = builder.stringLength;
        expect(lenAfter).assertEqual(lenBefore);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0013
     * @tc.name testStringBuilderStringLength013
     * @tc.desc Verify stringLength increases incrementally after appending
     *   single characters in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 10; i++) {
          builder.append("x");
        }
        let len: int = builder.stringLength;
        expect(len).assertEqual(10);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0014
     * @tc.name testStringBuilderStringLength014
     * @tc.desc Verify stringLength changes after content modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("hello");
        let len1: int = builder.stringLength;
        builder.append("world");
        let len2: int = builder.stringLength;
        expect(len2 > len1).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0015
     * @tc.name testStringBuilderStringLength015
     * @tc.desc Verify stringLength correctly counts Unicode characters after
     *   append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("\u0041\u0042");
        let len: int = builder.stringLength;
        expect(len).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0016
     * @tc.name testStringBuilderStringLength016
     * @tc.desc Verify stringLength return value equals string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("ArkTS");
        let len: int = builder.stringLength;
        expect(len).assertEqual(5);
        expect(builder.toString().length).assertEqual(len);
      }
    );



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0017
     * @tc.name testStringBuilderStringLength017
     * @tc.desc Verify stringLength return value can be converted to string
     *   type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("test");
        let len: int = builder.stringLength;
        let str: string = len.toString();
        expect(str).assertEqual("4");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0018
     * @tc.name testStringBuilderStringLength018
     * @tc.desc Verify stringLength return value can participate in arithmetic
     *   operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("hello");
        let len: int = builder.stringLength;
        let result: int = len + 10;
        expect(result).assertEqual(15);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0019
     * @tc.name testStringBuilderStringLength019
     * @tc.desc Verify stringLength counts bracketed numeric tokens accurately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("[");
        for (let i = 0; i < 4; i++) {
          builder.append(i).append(",");
        }
        builder.append("]");
        let len: int = builder.stringLength;
        expect(builder.toString()).assertEqual("[0,1,2,3,]");
        expect(len).assertEqual(10);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0020
     * @tc.name testStringBuilderStringLength020
     * @tc.desc Verify stringLength accuracy after large number of append
     *   operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 10000; i++) {
          builder.append("ab");
        }
        let len: int = builder.stringLength;
        expect(len).assertEqual(20000);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0021
     * @tc.name testStringBuilderStringLength021
     * @tc.desc Verify stringLength matches manual string length calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let str: string = "OpenHarmony";
        const builder = new StringBuilder(str);
        let builderLen: int = builder.stringLength;
        expect(builderLen).assertEqual(str.length);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0022
     * @tc.name testStringBuilderStringLength022
     * @tc.desc Verify stringLength equals initial length plus appended length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("abc");
        let initialLen: int = builder.stringLength;
        builder.append("defg");
        let afterLen: int = builder.stringLength;
        expect(afterLen).assertEqual(initialLen + 4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0023
     * @tc.name testStringBuilderStringLength023
     * @tc.desc Verify multiple stringLength accesses on normal object do not
     *   throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let exceptionCaught: boolean = false;
        try {
          const builder = new StringBuilder("abc");
          builder.append("def");
          let len1: int = builder.stringLength;
          let len2: int = builder.stringLength;
        } catch (e) {
          exceptionCaught = true;
        }
        expect(exceptionCaught).assertFalse();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0024
     * @tc.name testStringBuilderStringLength024
     * @tc.desc Verify consecutive stringLength accesses return consistent
     *   values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("constant");
        let first: int = builder.stringLength;
        let second: int = builder.stringLength;
        let third: int = builder.stringLength;
        expect(first === second && second === third).assertTrue();
      }
    );



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0025
     * @tc.name testStringBuilderStringLength025
     * @tc.desc Verify stringLength as public getter property accessible
     *   outside class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("public access");
        let len: int = getBuilderLength017(builder);
        expect(len).assertEqual(13);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0026
     * @tc.name testStringBuilderStringLength026
     * @tc.desc Verify stringLength after appending boolean text and separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("flag:");
        builder.append(true);
        builder.append("|done");
        expect(builder.toString()).assertEqual("flag:true|done");
        expect(builder.stringLength).assertEqual(14);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0027
     * @tc.name testStringBuilderStringLength027
     * @tc.desc Verify stringLength equals toString().length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello");
        let len: int = builder.stringLength;
        let str: string = builder.toString();
        expect(len).assertEqual(str.length);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0028
     * @tc.name testStringBuilderStringLength028
     * @tc.desc Verify stringLength after mixed appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("A");
        builder.append("B");
        builder.append("C");
        expect(builder.stringLength).assertEqual(3);
        expect(builder.toString()).assertEqual("ABC");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0029
     * @tc.name testStringBuilderStringLength029
     * @tc.desc Verify stringLength after appending char and suffix text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("grade:");
        builder.append(c'A');
        builder.append("+");
        expect(builder.toString()).assertEqual("grade:A+");
        expect(builder.stringLength).assertEqual(8);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0030
     * @tc.name testStringBuilderStringLength030
     * @tc.desc Verify stringLength for FixedArray constructed with mixed multilingual chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chars: FixedArray<char> = [c'A', c'中', c'é', c'ア'];
        const builder = new StringBuilder(chars);
        expect(builder.stringLength).assertEqual(4);
        expect(builder.toString()).assertEqual('A中éア');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0031
     * @tc.name testStringBuilderStringLength031
     * @tc.desc Verify stringLength after append with various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Test");
        builder.append("String");
        let len: int = builder.stringLength;
        expect(len).assertEqual(10);
        expect(builder.toString().length).assertEqual(len);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0032
     * @tc.name testStringBuilderStringLength032
     * @tc.desc Verify stringLength with append + concatStrings result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("Hello");
        const cs: string = StringBuilder.concatStrings(" ", "World");
        builder.append(cs);
        expect(builder.stringLength).assertEqual(11);
        expect(builder.toString()).assertEqual("Hello World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0033
     * @tc.name testStringBuilderStringLength033
     * @tc.desc Verify stringLength stays correct after alternating append and toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("A");
        builder.toString();
        builder.append("B");
        builder.toString();
        builder.append("C");
        expect(builder.stringLength).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_STRING_LENGTH_0034
     * @tc.name testStringBuilderStringLength034
     * @tc.desc Verify stringLength after appending escaped newline labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderStringLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("line");
        builder.append("\\n");
        builder.append("next");
        expect(builder.toString()).assertEqual("line\\nnext");
        expect(builder.stringLength).assertEqual(10);
      }
    );
  });
}

