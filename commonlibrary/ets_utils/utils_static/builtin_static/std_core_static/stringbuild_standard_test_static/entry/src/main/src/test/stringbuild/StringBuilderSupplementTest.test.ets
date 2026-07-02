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

export default function StringBuilderSupplementTest(): void {
  describe('StringBuilderSupplementTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0001
     * @tc.name testStringBuilderSupplement001
     * @tc.desc Verify appending literal null text is handled as normal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('null');
        expect(builder.toString()).assertEqual('null');
        expect(builder.stringLength).assertEqual(4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0002
     * @tc.name testStringBuilderSupplement002
     * @tc.desc Verify appending a 10 MB string keeps expected length and data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const longStr: string = 'a'.repeat(10 * 1024 * 1024);
        const expectedChar: string = 'a';
        builder.append(longStr);
        const result: string = builder.toString();
        expect(result.length).assertEqual(longStr.length);
        expect(result.charAt(0)).assertEqual(expectedChar.charAt(0));
        expect(result.charAt(result.length - 1)).assertEqual(expectedChar.charAt(0));
        expect(builder.stringLength).assertEqual(longStr.length);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0003
     * @tc.name testStringBuilderSupplement003
     * @tc.desc Verify appending Double.POSITIVE_INFINITY standalone returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(Double.POSITIVE_INFINITY);
        const result: string = builder.toString();
        expect(result).assertEqual('Infinity');
        expect(typeof result).assertEqual('string');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0004
     * @tc.name testStringBuilderSupplement004
     * @tc.desc Verify appending negative Float.POSITIVE_INFINITY returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(-Float.POSITIVE_INFINITY);
        expect(builder.toString()).assertEqual('-Infinity');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0005
     * @tc.name testStringBuilderSupplement005
     * @tc.desc Verify append with negative zero float produces 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(-0.0f);
        expect(builder.toString()).assertEqual('0');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0006
     * @tc.name testStringBuilderSupplement006
     * @tc.desc Verify static toString converts negative double with decimal correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: string = StringBuilder.toString(-273.15);
        expect(result).assertEqual('-273.15');
        expect(typeof result).assertEqual('string');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0007
     * @tc.name testStringBuilderSupplement007
     * @tc.desc Verify appending negative infinity after existing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder('value=');
        builder.append(-Float.POSITIVE_INFINITY);
        expect(builder.toString()).assertEqual('value=-Infinity');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0008
     * @tc.name testStringBuilderSupplement008
     * @tc.desc Verify cross-function composition: concatStrings + static toString + constructor + append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const concatStr: string = StringBuilder.concatStrings("Max=", StringBuilder.toString(Double.MAX_VALUE));
        const builder: StringBuilder = new StringBuilder(concatStr);
        builder.append(" [end]");
        expect(builder.toString()).assertEqual('Max=1.7976931348623157e+308 [end]');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0009
     * @tc.name testStringBuilderSupplement009
     * @tc.desc Verify appending sequential static toString results of double boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(StringBuilder.toString(Double.MIN_VALUE));
        builder.append("|");
        builder.append(StringBuilder.toString(Double.MAX_VALUE));
        expect(builder.toString()).assertEqual('5e-324|1.7976931348623157e+308');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0010
     * @tc.name testStringBuilderSupplement010
     * @tc.desc Verify char array content can be appended in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const chars: char[] = [c'A', c'r', c'k'];
        for (let i = 0; i < chars.length; i++) {
          builder.append(chars[i]);
        }
        expect(builder.toString()).assertEqual('Ark');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0011
     * @tc.name testStringBuilderSupplement011
     * @tc.desc Verify appending array object follows object string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const arr: Object = [1, 2] as Object;
        builder.append(arr);
        expect(builder.toString()).assertEqual('1,2');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0012
     * @tc.name testStringBuilderSupplement012
     * @tc.desc Verify mixed Chinese Japanese Korean append keeps content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const text: string = '\u4E2D\u6587\u65E5\u672C\u8A9E\uD55C\uAD6D\uC5B4';
        builder.append(text);
        expect(builder.toString()).assertEqual(text);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0013
     * @tc.name testStringBuilderSupplement013
     * @tc.desc Verify supplementary Unicode character length matches string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const text: string = '\uD801\uDC37';
        const builder: StringBuilder = new StringBuilder(text);
        expect(builder.stringLength).assertEqual(text.length);
        expect(builder.toString()).assertEqual(text);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0014
     * @tc.name testStringBuilderSupplement014
     * @tc.desc Verify builder can be cleared by recreating empty content path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('reuse');
        expect(builder.toString()).assertEqual('reuse');
        const reused: StringBuilder = new StringBuilder();
        reused.append('next');
        expect(reused.toString()).assertEqual('next');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0015
     * @tc.name testStringBuilderSupplement015
     * @tc.desc Verify frequent append with 300 chunks keeps final length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderSupplement015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const chunk: string = 'x'.repeat(334);
        for (let i = 0; i < 300; i++) {
          builder.append(chunk);
        }
        const result: string = builder.toString();
        expect(builder.stringLength).assertEqual(100200);
        expect(result.length).assertEqual(100200);
      }
    );
  });
}
