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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

class XtsFillObject {
  private value: string = 'object-value';

  toString(): string {
    return this.value;
  }
}

export default function StringBuilderSupplementTest1(): void {
  describe('StringBuilderSupplementTest1', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0100
     * @tc.name testSupplBasic001
     * @tc.desc Verify supplementary StringBuilder behaviors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('null');
          expect(builder.toString()).assertEqual('null');
          expect(builder.stringLength).assertEqual(4);

      }
      {
          const builder: StringBuilder = new StringBuilder();
          const chars: char[] = [c'A', c'r', c'k'];
          for (let i = 0; i < chars.length; i++) {
            builder.append(chars[i]);
          }
          expect(builder.toString()).assertEqual('Ark');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('reuse');
          expect(builder.toString()).assertEqual('reuse');
          const reused: StringBuilder = new StringBuilder();
          reused.append('next');
          expect(reused.toString()).assertEqual('next');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('ArkTS');
          expect(builder.toString()).assertEqual('ArkTS');
          expect(builder.stringLength).assertEqual(5);

      }
      {
          const builder: StringBuilder = new StringBuilder('base');
          builder.append('-suffix!');
          expect(builder.toString()).assertEqual('base-suffix!');

      }
      {
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
      {
          const builder: StringBuilder = new StringBuilder();
          const b: byte = -128;
          const s: short = 32767;
          builder.append(b);
          builder.append('|');
          builder.append(s);
          expect(builder.toString()).assertEqual('-128|32767');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append(0);
          builder.append(c'0');
          expect(builder.toString()).assertEqual('00');
          expect(builder.stringLength).assertEqual(2);

      }
      {
          const builder: StringBuilder = new StringBuilder();
          const chars: char[] = [c'A', c'B', c'C'];
          for (let i = 0; i < chars.length; i++) {
            builder.append(chars[i]);
          }
          expect(builder.toString()).assertEqual('ABC');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('chapter');
          expect(builder.toString()).assertEqual('chapter');
          builder.append('-1');
          expect(builder.toString()).assertEqual('chapter-1');
          builder.append(':section-2');
          expect(builder.toString()).assertEqual('chapter-1:section-2');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0200
     * @tc.name testSupplBasic002
     * @tc.desc Verify supplementary StringBuilder behaviors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder: StringBuilder = new StringBuilder('cpu');
          builder.append('|');
          builder.append(85);
          builder.append('|');
          builder.append('ok');
          expect(builder.toString()).assertEqual('cpu|85|ok');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('/usr');
          builder.append('/local');
          builder.append('/bin');
          expect(builder.toString()).assertEqual('/usr/local/bin');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0300
     * @tc.name testSupplText001
     * @tc.desc Verify supplementary multilingual and special text handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder: StringBuilder = new StringBuilder();
          const text: string = '\u4E2D\u6587\u65E5\u672C\u8A9E\uD55C\uAD6D\uC5B4';
          builder.append(text);
          expect(builder.toString()).assertEqual(text);

      }
      {
          const text: string = '\uD801\uDC37';
          const builder: StringBuilder = new StringBuilder(text);
          expect(builder.stringLength).assertEqual(text.length);
          expect(builder.toString()).assertEqual(text);

      }
      {
          const result: string = StringBuilder.concatStrings('<script>', 'alert(1)</script>');
          expect(result).assertEqual('<script>alert(1)</script>');

      }
      {
          const res = new StringBuilder();
          res.append('\uD83D\uDE00');
          const result: string = res.toString();
          expect(result).assertEqual('\uD83D\uDE00');
          expect(result.length).assertEqual(2);

      }
      {
          const text: string = '\u4E2D\u6587\u65E5\u672C\u8A9E';
          const builder: StringBuilder = new StringBuilder(text);
          expect(builder.toString()).assertEqual(text);
          expect(builder.stringLength).assertEqual(text.length);

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append('\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631');
          builder.append('|');
          builder.append('\u0422\u0435\u0441\u0442');
          expect(builder.toString()).assertEqual('\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631|\u0422\u0435\u0441\u0442');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0400
     * @tc.name testSupplTypeConv001
     * @tc.desc Verify supplementary type conversion edge values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplTypeConv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append(Double.POSITIVE_INFINITY);
          const result: string = builder.toString();
          expect(result).assertEqual('Infinity');
          expect(typeof result).assertEqual('string');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append(-Float.POSITIVE_INFINITY);
          expect(builder.toString()).assertEqual('-Infinity');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append(-0.0f);
          expect(builder.toString()).assertEqual('0');

      }
      {
          const result: string = StringBuilder.toString(-273.15);
          expect(result).assertEqual('-273.15');
          expect(typeof result).assertEqual('string');

      }
      {
          const builder: StringBuilder = new StringBuilder('value=');
          builder.append(-Float.POSITIVE_INFINITY);
          expect(builder.toString()).assertEqual('value=-Infinity');

      }
      {
          const concatStr: string = StringBuilder.concatStrings("Max=", StringBuilder.toString(Double.MAX_VALUE));
          const builder: StringBuilder = new StringBuilder(concatStr);
          builder.append(" [end]");
          expect(builder.toString()).assertEqual('Max=1.7976931348623157e+308 [end]');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          builder.append(StringBuilder.toString(Double.MIN_VALUE));
          builder.append("|");
          builder.append(StringBuilder.toString(Double.MAX_VALUE));
          expect(builder.toString()).assertEqual('5e-324|1.7976931348623157e+308');

      }
      {
          const result: string = StringBuilder.concatStrings('A\u200B', 'B');
          expect(result.length).assertEqual(3);
          expect(result).assertEqual('A\u200BB');

      }
      {
          const result: string = StringBuilder.toString(c'Z');
          expect(result).assertEqual('Z');

      }
      {
          const result: string = StringBuilder.toString(-Float.POSITIVE_INFINITY);
          expect(result).assertEqual('-Infinity');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0500
     * @tc.name testSupplObject001
     * @tc.desc Verify supplementary object string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder: StringBuilder = new StringBuilder();
          const arr: Object = [1, 2] as Object;
          builder.append(arr);
          expect(builder.toString()).assertEqual('1,2');

      }
      {
          const builder: StringBuilder = new StringBuilder();
          const obj: Object = new XtsFillObject();
          builder.append(obj);
          expect(builder.toString()).assertEqual('object-value');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0600
     * @tc.name testSupplInterop001
     * @tc.desc Verify supplementary cross-API composition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplInterop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const innerBuilder: StringBuilder = new StringBuilder('Hello');
          const concatResult: string = StringBuilder.concatStrings(innerBuilder.toString(), ' World');
          expect(concatResult).assertEqual('Hello World');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_SUPPLEMENT_0700
     * @tc.name testSupplExtreme001
     * @tc.desc Verify supplementary extreme size and stress scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSupplExtreme001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
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
      {
          const builder: StringBuilder = new StringBuilder();
          const chunk: string = 'x'.repeat(334);
          for (let i = 0; i < 300; i++) {
            builder.append(chunk);
          }
          const result: string = builder.toString();
          expect(builder.stringLength).assertEqual(100200);
          expect(result.length).assertEqual(100200);

      }
      {
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
    });

  });
}
