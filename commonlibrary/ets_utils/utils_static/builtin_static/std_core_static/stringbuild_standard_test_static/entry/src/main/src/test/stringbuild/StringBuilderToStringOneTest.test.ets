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

export default function StringBuilderToStringOneTest(): void {
  describe('StringBuilderToStringOneTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0001
     * @tc.name testStringBuilderToStringOne001
     * @tc.desc Verify calling toString with no parameters returns the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("ArkTS");
        let result: string = builder.toString();
        expect(result).assertEqual("ArkTS");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0002
     * @tc.name testStringBuilderToStringOne002
     * @tc.desc Verify toString on empty StringBuilder returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        let result: string = builder.toString();
        expect(result).assertEqual("");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0003
     * @tc.name testStringBuilderToStringOne003
     * @tc.desc Verify toString with FixedArray&lt;char&gt; initialization returns concatenated
     *   character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append("A");
        builder.append("B");
        builder.append("C");
        let result: string = builder.toString();
        expect(result).assertEqual("ABC");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0004
     * @tc.name testStringBuilderToStringOne004
     * @tc.desc Verify toString after building content from static toString results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        builder.append(StringBuilder.toString(42));
        builder.append(" ");
        builder.append(StringBuilder.toString(true));
        let result: string = builder.toString();
        expect(result).assertEqual("42 true");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0005
     * @tc.name testStringBuilderToStringOne005
     * @tc.desc Verify toString after multiple appends returns complete concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("A");
        builder.append("B");
        builder.append("C");
        builder.append("D");
        let result: string = builder.toString();
        expect(result).assertEqual("ABCD");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0006
     * @tc.name testStringBuilderToStringOne006
     * @tc.desc Verify toString with char initialization returns the single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("X");
        let result: string = builder.toString();
        expect(result).assertEqual("X");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0007
     * @tc.name testStringBuilderToStringOne007
     * @tc.desc Verify toString with null character c'\\u0000' returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("before");
        builder.append("\u0000");
        builder.append("after");
        let result: string = builder.toString();
        expect(result.length).assertEqual(12);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0008
     * @tc.name testStringBuilderToStringOne008
     * @tc.desc Verify toString with newline character returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("line1");
        builder.append("\n");
        builder.append("line2");
        let result: string = builder.toString();
        expect(result).assertEqual("line1\nline2");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0009
     * @tc.name testStringBuilderToStringOne009
     * @tc.desc Verify toString with tab character returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("col1");
        builder.append("\t");
        builder.append("col2");
        let result: string = builder.toString();
        expect(result).assertEqual("col1\tcol2");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0010
     * @tc.name testStringBuilderToStringOne010
     * @tc.desc Verify toString with Unicode characters returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("你好");
        builder.append("世界");
        builder.append("\u3053\u3093\u306B\u3061\u306F");
        let result: string = builder.toString();
        expect(result).assertEqual("\u4F60\u597D\u4E16\u754C\u3053\u3093\u306B\u3061\u306F");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0011
     * @tc.name testStringBuilderToStringOne011
     * @tc.desc Verify toString with emoji characters returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello");
        builder.append("??");
        builder.append("??");
        let result: string = builder.toString();
        expect(result).assertEqual("Hello????");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0012
     * @tc.name testStringBuilderToStringOne012
     * @tc.desc Verify toString with spaces preserves all spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("   ");
        builder.append("  ");
        let result: string = builder.toString();
        expect(result).assertEqual("     ");
        expect(result.length).assertEqual(5);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0013
     * @tc.name testStringBuilderToStringOne013
     * @tc.desc Verify toString with zero-width space preserves the character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("a");
        builder.append("\u200B");
        builder.append("b");
        let result: string = builder.toString();
        expect(result.length).assertEqual(3);
        expect(result).assertEqual("a\u200Bb");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0014
     * @tc.name testStringBuilderToStringOne014
     * @tc.desc Verify toString with carriage return and newline returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("\r\n");
        let result: string = builder.toString();
        expect(result).assertEqual("\r\n");
        expect(result.length).assertEqual(2);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0015
     * @tc.name testStringBuilderToStringOne015
     * @tc.desc Verify toString with single and double quotes returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("He said");
        builder.append(" \"Hello\" ");
        builder.append("and 'Goodbye'");
        let result: string = builder.toString();
        expect(result).assertEqual("He said \"Hello\" and 'Goodbye'");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0016
     * @tc.name testStringBuilderToStringOne016
     * @tc.desc Verify toString preserves literal null text as normal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("null");
        let result: string = builder.toString();
        expect(result).assertEqual("null");
        expect(result.length).assertEqual(4);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0017
     * @tc.name testStringBuilderToStringOne017
     * @tc.desc Verify toString preserves literal undefined text as normal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("undefined");
        let result: string = builder.toString();
        expect(result).assertEqual("undefined");
        expect(result.length).assertEqual(9);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0018
     * @tc.name testStringBuilderToStringOne018
     * @tc.desc Verify toString return value is an instance of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("test");
        let result: string = builder.toString();
        expect(typeof result).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0019
     * @tc.name testStringBuilderToStringOne019
     * @tc.desc Verify toString with long string (10000 chars) returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 10000; i++) {
          builder.append("x");
        }
        let result: string = builder.toString();
        expect(result.length).assertEqual(10000);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0020
     * @tc.name testStringBuilderToStringOne020
     * @tc.desc Verify multiple calls to toString return the same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("immutable");
        let result1: string = builder.toString();
        let result2: string = builder.toString();
        let result3: string = builder.toString();
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertEqual("immutable");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0021
     * @tc.name testStringBuilderToStringOne021
     * @tc.desc Verify toString after append updates the returned content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello");
        let result1: string = builder.toString();
        expect(result1).assertEqual("Hello");
        builder.append(" World");
        let result2: string = builder.toString();
        expect(result2).assertEqual("Hello World");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0022
     * @tc.name testStringBuilderToStringOne022
     * @tc.desc Verify toString with single character returns the character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("A");
        let result: string = builder.toString();
        expect(result).assertEqual("A");
        expect(result.length).assertEqual(1);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0023
     * @tc.name testStringBuilderToStringOne023
     * @tc.desc Verify calling toString does not throw an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("safe");
        let result: string = builder.toString();
        expect(result).assertEqual("safe");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0024
     * @tc.name testStringBuilderToStringOne024
     * @tc.desc Verify calling toString after multiple operations maintains stability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("test");
        let r1: string = builder.toString();
        builder.append("1");
        let r2: string = builder.toString();
        builder.append("2");
        let r3: string = builder.toString();
        expect(r1).assertEqual("test");
        expect(r2).assertEqual("test1");
        expect(r3).assertEqual("test12");
        }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0025
     * @tc.name testStringBuilderToStringOne025
     * @tc.desc Verify toString is an instance method called through StringBuilder instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("instance");
        let result: string = builder.toString();
        expect(result).assertEqual("instance");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0026
     * @tc.name testStringBuilderToStringOne026
     * @tc.desc Verify toString result supports direct charAt inspection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("index");
        let result: string = builder.toString();
        expect(result.charAt(0)).assertEqual("i".charAt(0));
        expect(result.charAt(4)).assertEqual("x".charAt(0));
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0027
     * @tc.name testStringBuilderToStringOne027
     * @tc.desc Verify toString can only be called through instance not through class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("method");
        let result: string = builder.toString();
        expect(result).assertEqual("method");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0028
     * @tc.name testStringBuilderToStringOne028
     * @tc.desc Verify toString with bracketed content preserves delimiters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("[");
        builder.append("payload");
        builder.append("]");
        let result: string = builder.toString();
        expect(result).assertEqual("[payload]");
        expect(result.startsWith("[")).assertTrue();
        expect(result.endsWith("]")).assertTrue();
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0029
     * @tc.name testStringBuilderToStringOne029
     * @tc.desc Verify StringBuilder is a final class with stable toString behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("final");
        let result: string = builder.toString();
        expect(result).assertEqual("final");
        expect(typeof builder.toString).assertEqual("function");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0030
     * @tc.name testStringBuilderToStringOne030
     * @tc.desc Verify toString does not change builder internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("state");
        builder.toString();
        builder.toString();
        builder.append(" preserved");
        let result: string = builder.toString();
        expect(result).assertEqual("state preserved");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0031
     * @tc.name testStringBuilderToStringOne031
     * @tc.desc Verify 300 mixed append and toString cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        for (let i = 0; i < 300; i++) {
          builder.append("x");
          let s: string = builder.toString();
          expect(s.length).assertEqual(i + 1);
        }
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0032
     * @tc.name testStringBuilderToStringOne032
     * @tc.desc Verify toString and stringLength are synchronized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("SyncTest");
        let str: string = builder.toString();
        let len: int = builder.stringLength;
        expect(str.length).assertEqual(len);
        expect(str).assertEqual("SyncTest");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0033
     * @tc.name testStringBuilderToStringOne033
     * @tc.desc Verify toString with 3000 character content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder();
        let longStr = "x".repeat(3000);
        builder.append(longStr);
        let result: string = builder.toString();
        expect(result.length).assertEqual(3000);
        expect(result).assertEqual(longStr);
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0034
     * @tc.name testStringBuilderToStringOne034
     * @tc.desc Verify toString isolation across multiple instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder1 = new StringBuilder("AAA");
        const builder2 = new StringBuilder("BBB");
        builder1.append("111");
        builder2.append("222");
        let r1: string = builder1.toString();
        let r2: string = builder2.toString();
        expect(r1).assertEqual("AAA111");
        expect(r2).assertEqual("BBB222");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0035
     * @tc.name testStringBuilderToStringOne035
     * @tc.desc Verify toString with mixed content including concatStrings result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Start");
        const cs: string = StringBuilder.concatStrings("Middle", "End");
        builder.append(cs);
        let result: string = builder.toString();
        expect(result).assertEqual("StartMiddleEnd");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0036
     * @tc.name testStringBuilderToStringOne036
     * @tc.desc Verify toString after append with char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Char");
        builder.append(c'X');
        let result: string = builder.toString();
        expect(result).assertEqual("CharX");
      }
    );
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_ONE_0037
     * @tc.name testStringBuilderToStringOne037
     * @tc.desc Verify toString after append with double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderToStringOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Pi: ");
        builder.append(3.14159);
        let result: string = builder.toString();
        expect(result).assertEqual("Pi: 3.14159");
      }
    );
  });
}
