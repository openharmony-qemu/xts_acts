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

class XtsFillObject {
  private value: string = 'object-value';

  toString(): string {
    return this.value;
  }
}

export default function StringBuilderXtsFillTest(): void {
  describe('StringBuilderXtsFillTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0001
     * @tc.name testStringBuilderXtsFill001
     * @tc.desc Verify empty constructor followed by ASCII append returns expected content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('ArkTS');
        expect(builder.toString()).assertEqual('ArkTS');
        expect(builder.stringLength).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0002
     * @tc.name testStringBuilderXtsFill002
     * @tc.desc Verify string constructor followed by punctuation append preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder('base');
        builder.append('-suffix!');
        expect(builder.toString()).assertEqual('base-suffix!');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0003
     * @tc.name testStringBuilderXtsFill003
     * @tc.desc Verify concatStrings keeps XSS-like text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: string = StringBuilder.concatStrings('<script>', 'alert(1)</script>');
        expect(result).assertEqual('<script>alert(1)</script>');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0004
     * @tc.name testStringBuilderXtsFill004
     * @tc.desc Verify concatStrings keeps zero-width space in result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: string = StringBuilder.concatStrings('A\u200B', 'B');
        expect(result.length).assertEqual(3);
        expect(result).assertEqual('A\u200BB');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0005
     * @tc.name testStringBuilderXtsFill005
     * @tc.desc Verify building an IP-like dotted string from numeric parts ensures ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(192);
        builder.append(c'.');
        builder.append(168);
        builder.append(c'.');
        builder.append(1);
        builder.append(c'.');
        builder.append(1);
        expect(builder.toString()).assertEqual('192.168.1.1');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0006
     * @tc.name testStringBuilderXtsFill006
     * @tc.desc Verify append with byte and short typed variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const b: byte = -128;
        const s: short = 32767;
        builder.append(b);
        builder.append('|');
        builder.append(s);
        expect(builder.toString()).assertEqual('-128|32767');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0007
     * @tc.name testStringBuilderXtsFill007
     * @tc.desc Verify append int 0 and char c'0' produces "00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append(0);
        builder.append(c'0');
        expect(builder.toString()).assertEqual('00');
        expect(builder.stringLength).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0008
     * @tc.name testStringBuilderXtsFill008
     * @tc.desc Verify static toString converts char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: string = StringBuilder.toString(c'Z');
        expect(result).assertEqual('Z');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0009
     * @tc.name testStringBuilderXtsFill009
     * @tc.desc Verify static toString converts negative float infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: string = StringBuilder.toString(-Float.POSITIVE_INFINITY);
        expect(result).assertEqual('-Infinity');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0010
     * @tc.name testStringBuilderXtsFill010
     * @tc.desc Verify append emoji surrogate pair and toString returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const res = new StringBuilder();
        res.append('\uD83D\uDE00');
        const result: string = res.toString();
        expect(result).assertEqual('\uD83D\uDE00');
        expect(result.length).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0011
     * @tc.name testStringBuilderXtsFill011
     * @tc.desc Verify stringLength matches multilingual string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const text: string = '\u4E2D\u6587\u65E5\u672C\u8A9E';
        const builder: StringBuilder = new StringBuilder(text);
        expect(builder.toString()).assertEqual(text);
        expect(builder.stringLength).assertEqual(text.length);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0012
     * @tc.name testStringBuilderXtsFill012
     * @tc.desc Verify append keeps Arabic and Russian text in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631');
        builder.append('|');
        builder.append('\u0422\u0435\u0441\u0442');
        expect(builder.toString()).assertEqual('\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631|\u0422\u0435\u0441\u0442');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0013
     * @tc.name testStringBuilderXtsFill013
     * @tc.desc Verify append supports char array elements in deterministic order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const chars: char[] = [c'A', c'B', c'C'];
        for (let i = 0; i < chars.length; i++) {
          builder.append(chars[i]);
        }
        expect(builder.toString()).assertEqual('ABC');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0014
     * @tc.name testStringBuilderXtsFill014
     * @tc.desc Verify append Object uses object string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const obj: Object = new XtsFillObject();
        builder.append(obj);
        expect(builder.toString()).assertEqual('object-value');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0015
     * @tc.name testStringBuilderXtsFill015
     * @tc.desc Verify append Array object produces "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        const arr: Object = [1, 2] as Object;
        builder.append(arr);
        expect(builder.toString()).assertEqual('1,2');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0016
     * @tc.name testStringBuilderXtsFill016
     * @tc.desc Verify concatStrings works with StringBuilder.toString as input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const innerBuilder: StringBuilder = new StringBuilder('Hello');
        const concatResult: string = StringBuilder.concatStrings(innerBuilder.toString(), ' World');
        expect(concatResult).assertEqual('Hello World');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0017
     * @tc.name testStringBuilderXtsFill017
     * @tc.desc Verify 300 append operations keep expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        for (let i = 0; i < 300; i++) {
          if (i % 2 === 0) {
            builder.append('xx');
          } else {
            builder.append('y');
          }
        }
        expect(builder.stringLength).assertEqual(450);
        expect(builder.toString().length).assertEqual(450);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0018
     * @tc.name testStringBuilderXtsFill018
     * @tc.desc Verify phased append builds content progressively without losing intermediate state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('chapter');
        expect(builder.toString()).assertEqual('chapter');
        builder.append('-1');
        expect(builder.toString()).assertEqual('chapter-1');
        builder.append(':section-2');
        expect(builder.toString()).assertEqual('chapter-1:section-2');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0019
     * @tc.name testStringBuilderXtsFill019
     * @tc.desc Verify append builds pipe-delimited metric record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder('cpu');
        builder.append('|');
        builder.append(85);
        builder.append('|');
        builder.append('ok');
        expect(builder.toString()).assertEqual('cpu|85|ok');
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_XTS_FILL_0020
     * @tc.name testStringBuilderXtsFill020
     * @tc.desc Verify append builds a file path string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderXtsFill020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder: StringBuilder = new StringBuilder();
        builder.append('/usr');
        builder.append('/local');
        builder.append('/bin');
        expect(builder.toString()).assertEqual('/usr/local/bin');
      }
    );
  });
}
