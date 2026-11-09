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

class PlainObjectX {
  toString(): string {
    return 'objX';
  }
}

class PlainObject {
  toString(): string {
    return 'obj';
  }
}

export default function StringBuilderToStringTest(): void {
  describe('StringBuilderToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0100
     * @tc.name testToStringInstanceBasic001
     * @tc.desc Verify instance toString returns basic content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("ArkTS");
          let result: string = builder.toString();
          expect(result).assertEqual("ArkTS");

      }
      {
          const builder = new StringBuilder();
          let result: string = builder.toString();
          expect(result).assertEqual("");

      }
      {
          const builder = new StringBuilder();
          builder.append("A");
          builder.append("B");
          builder.append("C");
          let result: string = builder.toString();
          expect(result).assertEqual("ABC");

      }
      {
          const builder = new StringBuilder();
          builder.append(StringBuilder.toString(42));
          builder.append(" ");
          builder.append(StringBuilder.toString(true));
          let result: string = builder.toString();
          expect(result).assertEqual("42 true");

      }
      {
          const builder = new StringBuilder("X");
          let result: string = builder.toString();
          expect(result).assertEqual("X");

      }
      {
          const builder = new StringBuilder("null");
          let result: string = builder.toString();
          expect(result).assertEqual("null");
          expect(result.length).assertEqual(4);

      }
      {
          const builder = new StringBuilder("undefined");
          let result: string = builder.toString();
          expect(result).assertEqual("undefined");
          expect(result.length).assertEqual(9);

      }
      {
          const builder = new StringBuilder("test");
          let result: string = builder.toString();
          expect(typeof result).assertEqual("string");

      }
      {
          const builder = new StringBuilder("A");
          let result: string = builder.toString();
          expect(result).assertEqual("A");
          expect(result.length).assertEqual(1);

      }
      {
        const chars: char[] = [c'H', c'o', c'n'];
        const builder = new StringBuilder(chars);
        let result: string = builder.toString();
        expect(result).assertEqual('Hon');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0200
     * @tc.name testToStringInstanceBasic002
     * @tc.desc Verify instance toString returns basic content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const chars: FixedArray<char> = [c'T'];
        const builder = new StringBuilder(chars);
        let result: string = builder.toString();
        expect(result).assertEqual('T');

      }
      {
        const chars: FixedArray<char> = [c'0', c'1', c'2', c'3', c'4'];
        const builder = new StringBuilder(chars);
        let result: string = builder.toString();
        expect(result).assertEqual('01234');

      }
      {
        const builder = new StringBuilder();
        builder.append('12');
        builder.append('34');
        builder.append('56');
        let result: string = builder.toString();
        expect(result).assertEqual('123456');

      }
      {
        const builder = new StringBuilder('Hello');
        let result: string = builder.toString();
        expect(result.length).assertEqual(builder.stringLength);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0300
     * @tc.name testToStringInstanceControl001
     * @tc.desc Verify instance toString preserves control characters and spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("before");
          builder.append("\u0000");
          builder.append("after");
          let result: string = builder.toString();
          expect(result.length).assertEqual(12);

      }
      {
          const builder = new StringBuilder("line1");
          builder.append("\n");
          builder.append("line2");
          let result: string = builder.toString();
          expect(result).assertEqual("line1\nline2");

      }
      {
          const builder = new StringBuilder("col1");
          builder.append("\t");
          builder.append("col2");
          let result: string = builder.toString();
          expect(result).assertEqual("col1\tcol2");

      }
      {
          const builder = new StringBuilder("   ");
          builder.append("  ");
          let result: string = builder.toString();
          expect(result).assertEqual("     ");
          expect(result.length).assertEqual(5);

      }
      {
          const builder = new StringBuilder("\r\n");
          let result: string = builder.toString();
          expect(result).assertEqual("\r\n");
          expect(result.length).assertEqual(2);

      }
      {
          const builder = new StringBuilder("[");
          builder.append("payload");
          builder.append("]");
          let result: string = builder.toString();
          expect(result).assertEqual("[payload]");
          expect(result.startsWith("[")).assertTrue();
          expect(result.endsWith("]")).assertTrue();

      }
      {
        const builder = new StringBuilder('before');
        builder.append(' ');
        builder.append('after');
        let result: string = builder.toString();
        expect(result).assertEqual('before after');
        expect(result.length).assertEqual(12);

      }
      {
        const builder = new StringBuilder('name');
        builder.append('\t');
        builder.append('age');
        let result: string = builder.toString();
        expect(result).assertEqual('name\tage');

      }
      {
        const builder = new StringBuilder('  mid  ');
        let result: string = builder.toString();
        expect(result).assertEqual('  mid  ');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0400
     * @tc.name testToStringInstanceUnicode001
     * @tc.desc Verify instance toString preserves Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("你好");
          builder.append("世界");
          builder.append("\u3053\u3093\u306B\u3061\u306F");
          let result: string = builder.toString();
          expect(result).assertEqual("\u4F60\u597D\u4E16\u754C\u3053\u3093\u306B\u3061\u306F");

      }
      {
          const builder = new StringBuilder("Hello");
          builder.append("??");
          builder.append("??");
          let result: string = builder.toString();
          expect(result).assertEqual("Hello????");

      }
      {
        const builder = new StringBuilder('Hello');
        builder.append('😀');
        builder.append('😁');
        let result: string = builder.toString();
        expect(result).assertEqual('Hello😀😁');

      }
      {
        const builder = new StringBuilder('你好-世界');
        let result: string = builder.toString();
        expect(result).assertEqual('你好-世界');

      }
      {
        const builder = new StringBuilder('👨‍👩‍👧');
        let result: string = builder.toString();
        expect(result).assertEqual('👨‍👩‍👧');

      }
      {
        const builder = new StringBuilder('שלום');
        let result: string = builder.toString();
        expect(result).assertEqual('שלום');
        expect(result.length).assertEqual(4);

      }
      {
        const builder = new StringBuilder('नमस्ते');
        let result: string = builder.toString();
        expect(result).assertEqual('नमस्ते');
        expect(result.length).assertEqual(6);

      }
      {
        const builder = new StringBuilder('அஆஇ');
        let result: string = builder.toString();
        expect(result).assertEqual('அஆஇ');
        expect(result.length).assertEqual(3);

      }
      {
        const builder = new StringBuilder('สวัสดี');
        let result: string = builder.toString();
        expect(result).assertEqual('สวัสดี');
        expect(result.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0500
     * @tc.name testToStringInstanceInvisible001
     * @tc.desc Verify instance toString preserves invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("a");
          builder.append("\u200B");
          builder.append("b");
          let result: string = builder.toString();
          expect(result.length).assertEqual(3);
          expect(result).assertEqual("a\u200Bb");

      }
      {
        const builder = new StringBuilder('￾');
        let result: string = builder.toString();
        expect(result.length).assertEqual(1);
        expect(result).assertEqual('￾');

      }
      {
        const builder = new StringBuilder('﷐');
        let result: string = builder.toString();
        expect(result.length).assertEqual(1);
        expect(result).assertEqual('﷐');

      }
      {
        const bomAtHead: string = '﻿ab';
        const builder = new StringBuilder(bomAtHead);
        let result: string = builder.toString();
        expect(result.length).assertEqual(3);
        expect(result).assertEqual(bomAtHead);

      }
      {
        const bomInMiddle: string = 'a﻿b';
        const builder = new StringBuilder(bomInMiddle);
        let result: string = builder.toString();
        expect(result.length).assertEqual(3);
        expect(result).assertEqual(bomInMiddle);

      }
      {
        const bomAtTail: string = 'ab﻿';
        const builder = new StringBuilder(bomAtTail);
        let result: string = builder.toString();
        expect(result.length).assertEqual(3);
        expect(result).assertEqual(bomAtTail);

      }
      {
        const vs16Seq: string = '☀️';
        const builder = new StringBuilder(vs16Seq);
        let result: string = builder.toString();
        expect(result.length).assertEqual(2);
        expect(result).assertEqual(vs16Seq);

      }
      {
        const builder = new StringBuilder('�');
        let result: string = builder.toString();
        expect(result.length).assertEqual(1);
        expect(result).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0600
     * @tc.name testToStringInstanceSpecial001
     * @tc.desc Verify instance toString preserves special format text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("He said");
          builder.append(" \"Hello\" ");
          builder.append("and 'Goodbye'");
          let result: string = builder.toString();
          expect(result).assertEqual("He said \"Hello\" and 'Goodbye'");

      }
      {
        const builder = new StringBuilder('a');
        builder.append(';');
        builder.append('b');
        let result: string = builder.toString();
        expect(result).assertEqual('a;b');

      }
      {
        const builder = new StringBuilder('x');
        builder.append('|');
        builder.append('y');
        let result: string = builder.toString();
        expect(result).assertEqual('x|y');

      }
      {
        const builder = new StringBuilder('dir');
        builder.append('/');
        builder.append('file.txt');
        let result: string = builder.toString();
        expect(result).assertEqual('dir/file.txt');

      }
      {
        const builder = new StringBuilder('api');
        builder.append('?');
        builder.append('q=1');
        let result: string = builder.toString();
        expect(result).assertEqual('api?q=1');

      }
      {
        const builder = new StringBuilder();
        builder.append('\'');
        builder.append('value');
        builder.append('\'');
        let result: string = builder.toString();
        expect(result).assertEqual('\'value\'');

      }
      {
        const builder = new StringBuilder('1');
        builder.append('.');
        builder.append('2');
        builder.append('.');
        builder.append('3');
        let result: string = builder.toString();
        expect(result).assertEqual('1.2.3');

      }
      {
        const builder = new StringBuilder('时间：');
        builder.append('10点');
        let result: string = builder.toString();
        expect(result).assertEqual('时间：10点');

      }
      {
        const builder = new StringBuilder('~');
        builder.append('mid');
        builder.append('~');
        let result: string = builder.toString();
        expect(result).assertEqual('~mid~');

      }
      {
        const builder = new StringBuilder('2');
        builder.append('+');
        builder.append('3');
        let result: string = builder.toString();
        expect(result).assertEqual('2+3');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0700
     * @tc.name testToStringInstanceSpecial002
     * @tc.desc Verify instance toString preserves special format text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceSpecial002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const builder = new StringBuilder('9');
        builder.append('-');
        builder.append('4');
        let result: string = builder.toString();
        expect(result).assertEqual('9-4');

      }
      {
        const builder = new StringBuilder('6');
        builder.append('*');
        builder.append('7');
        let result: string = builder.toString();
        expect(result).assertEqual('6*7');

      }
      {
        const builder = new StringBuilder('C:');
        builder.append('\\');
        builder.append('temp');
        let result: string = builder.toString();
        expect(result).assertEqual('C:\\temp');

      }
      {
        const builder = new StringBuilder('<b>');
        builder.append('bold');
        builder.append('</b>');
        let result: string = builder.toString();
        expect(result).assertEqual('<b>bold</b>');

      }
      {
        const builder = new StringBuilder('Hello ');
        builder.append('@alice');
        let result: string = builder.toString();
        expect(result).assertEqual('Hello @alice');

      }
      {
        const builder = new StringBuilder('Topic ');
        builder.append('#arkts');
        let result: string = builder.toString();
        expect(result).assertEqual('Topic #arkts');

      }
      {
        const builder = new StringBuilder('cost=');
        builder.append('$');
        builder.append('99');
        let result: string = builder.toString();
        expect(result).assertEqual('cost=$99');

      }
      {
        const builder = new StringBuilder('discount=');
        builder.append('20%');
        let result: string = builder.toString();
        expect(result).assertEqual('discount=20%');

      }
      {
        const builder = new StringBuilder('a');
        builder.append('&');
        builder.append('b');
        let result: string = builder.toString();
        expect(result).assertEqual('a&b');

      }
      {
        const builder = new StringBuilder('(');
        builder.append('in');
        builder.append(')');
        let result: string = builder.toString();
        expect(result).assertEqual('(in)');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0800
     * @tc.name testToStringInstanceSpecial003
     * @tc.desc Verify instance toString preserves special format text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceSpecial003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const builder = new StringBuilder('[');
        builder.append('idx');
        builder.append(']');
        let result: string = builder.toString();
        expect(result).assertEqual('[idx]');

      }
      {
        const builder = new StringBuilder('{');
        builder.append('k:v');
        builder.append('}');
        let result: string = builder.toString();
        expect(result).assertEqual('{k:v}');

      }
      {
        const builder = new StringBuilder('a');
        builder.append(';b');
        builder.append(';c');
        let result: string = builder.toString();
        expect(result).assertEqual('a;b;c');

      }
      {
        const builder = new StringBuilder('1');
        builder.append(',2');
        builder.append(',3');
        let result: string = builder.toString();
        expect(result).assertEqual('1,2,3');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_0900
     * @tc.name testToStringInstanceLong001
     * @tc.desc Verify instance toString with long content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder();
          for (let i = 0; i < 10000; i++) {
            builder.append("x");
          }
          let result: string = builder.toString();
          expect(result.length).assertEqual(10000);

      }
      {
          const builder = new StringBuilder();
          let longStr = "x".repeat(3000);
          builder.append(longStr);
          let result: string = builder.toString();
          expect(result.length).assertEqual(3000);
          expect(result).assertEqual(longStr);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1000
     * @tc.name testToStringInstanceState001
     * @tc.desc Verify instance toString state stability and consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("A");
          builder.append("B");
          builder.append("C");
          builder.append("D");
          let result: string = builder.toString();
          expect(result).assertEqual("ABCD");

      }
      {
          const builder = new StringBuilder("immutable");
          let result1: string = builder.toString();
          let result2: string = builder.toString();
          let result3: string = builder.toString();
          expect(result1).assertEqual(result2);
          expect(result2).assertEqual(result3);
          expect(result1).assertEqual("immutable");

      }
      {
          const builder = new StringBuilder("Hello");
          let result1: string = builder.toString();
          expect(result1).assertEqual("Hello");
          builder.append(" World");
          let result2: string = builder.toString();
          expect(result2).assertEqual("Hello World");

      }
      {
          const builder = new StringBuilder("safe");
          let result: string = builder.toString();
          expect(result).assertEqual("safe");

      }
      {
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
      {
          const builder = new StringBuilder("final");
          let result: string = builder.toString();
          expect(result).assertEqual("final");
          expect(typeof builder.toString).assertEqual("function");

      }
      {
          const builder = new StringBuilder("state");
          builder.toString();
          builder.toString();
          builder.append(" preserved");
          let result: string = builder.toString();
          expect(result).assertEqual("state preserved");

      }
      {
          const builder = new StringBuilder();
          for (let i = 0; i < 300; i++) {
            builder.append("x");
            let s: string = builder.toString();
            expect(s.length).assertEqual(i + 1);
          }

      }
      {
          const builder = new StringBuilder("SyncTest");
          let str: string = builder.toString();
          let len: int = builder.stringLength;
          expect(str.length).assertEqual(len);
          expect(str).assertEqual("SyncTest");

      }
      {
          const builder1 = new StringBuilder("AAA");
          const builder2 = new StringBuilder("BBB");
          builder1.append("111");
          builder2.append("222");
          let r1: string = builder1.toString();
          let r2: string = builder2.toString();
          expect(r1).assertEqual("AAA111");
          expect(r2).assertEqual("BBB222");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1100
     * @tc.name testToStringInstanceState002
     * @tc.desc Verify instance toString state stability and consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("Char");
          builder.append(c'X');
          let result: string = builder.toString();
          expect(result).assertEqual("CharX");

      }
      {
          const builder = new StringBuilder("Pi: ");
          builder.append(3.14159);
          let result: string = builder.toString();
          expect(result).assertEqual("Pi: 3.14159");

      }
      {
        const builder = new StringBuilder();
        builder.append('A');
        builder.append(c'B');
        builder.append(3);
        let result: string = builder.toString();
        expect(result).assertEqual('AB3');

      }
      {
        const builder = new StringBuilder();
        builder.append(true);
        builder.append(' end');
        let result: string = builder.toString();
        expect(result).assertEqual('true end');

      }
      {
        const builder = new StringBuilder();
        builder.append(false);
        builder.append(' now');
        let result: string = builder.toString();
        expect(result).assertEqual('false now');

      }
      {
        const builder = new StringBuilder('a');
        builder.append(c'\u0000');
        builder.append('b');
        let result: string = builder.toString();
        expect(result.length).assertEqual(3);

      }
      {
        const builder = new StringBuilder();
        builder.append('ha');
        builder.append('ha');
        builder.append('ha');
        builder.append('ha');
        let result: string = builder.toString();
        expect(result).assertEqual('hahahaha');

      }
      {
        const builder = new StringBuilder('a');
        builder.append('  ');
        builder.append('b');
        let result: string = builder.toString();
        expect(result).assertEqual('a  b');

      }
      {
        const builder = new StringBuilder('item');
        builder.append('_');
        builder.append('42');
        let result: string = builder.toString();
        expect(result).assertEqual('item_42');

      }
      {
        const chars: FixedArray<char> = [c'Q'];
        const builder = new StringBuilder(chars);
        builder.append('Z');
        let result: string = builder.toString();
        expect(result).assertEqual('QZ');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1200
     * @tc.name testToStringInstanceState003
     * @tc.desc Verify instance toString state stability and consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const chars: char[] = [c'J', c'K'];
        const builder = new StringBuilder(chars);
        builder.append('L');
        let result: string = builder.toString();
        expect(result).assertEqual('JKL');

      }
      {
        const chars: char[] = [];
        const builder = new StringBuilder(chars);
        builder.append('Go');
        let result: string = builder.toString();
        expect(result).assertEqual('Go');

      }
      {
        const builder = new StringBuilder('stable');
        const first: string = builder.toString();
        const second: string = builder.toString();
        const third: string = builder.toString();
        expect(first).assertEqual(second);
        expect(second).assertEqual(third);

      }
      {
        const builder = new StringBuilder('‪');
        builder.append('ab');
        builder.append('‬');
        let result: string = builder.toString();
        expect(result.length).assertEqual(4);
        expect(result).assertEqual('‪ab‬');

      }
      {
        const baseLetter: string = 'e';
        const combiningAcute: string = '́';
        const builder = new StringBuilder(baseLetter);
        builder.append(combiningAcute);
        let result: string = builder.toString();
        expect(result.length).assertEqual(2);
        expect(result).assertEqual(baseLetter + combiningAcute);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1300
     * @tc.name testToStringInstanceInterop001
     * @tc.desc Verify instance toString interaction with other APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringInstanceInterop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const builder = new StringBuilder("instance");
          let result: string = builder.toString();
          expect(result).assertEqual("instance");

      }
      {
          const builder = new StringBuilder("index");
          let result: string = builder.toString();
          expect(result.charAt(0)).assertEqual("i".charAt(0));
          expect(result.charAt(4)).assertEqual("x".charAt(0));

      }
      {
          const builder = new StringBuilder("method");
          let result: string = builder.toString();
          expect(result).assertEqual("method");

      }
      {
          const builder = new StringBuilder("Start");
          const cs: string = StringBuilder.concatStrings("Middle", "End");
          builder.append(cs);
          let result: string = builder.toString();
          expect(result).assertEqual("StartMiddleEnd");

      }
      {
        const builder = new StringBuilder();
        const obj: PlainObjectX = new PlainObjectX();
        builder.append(obj);
        let result: string = builder.toString();
        expect(result).assertEqual('objX');

      }
      {
        const builder = new StringBuilder();
        builder.append('3.14');
        let result: string = builder.toString();
        expect(result).assertEqual('3.14');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1400
     * @tc.name testToStringStaticBasic001
     * @tc.desc Verify static toString with basic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(42);
          expect(typeof result).assertEqual('string');
          expect(result).assertEqual('42');

      }
      {
          let r1: string = StringBuilder.toString(12345);
          expect(r1.length).assertEqual(5);
          let r2: string = StringBuilder.toString(0);
          expect(r2.length).assertEqual(1);
          let r3: string = StringBuilder.toString(-1);
          expect(r3.length).assertEqual(2);

      }
      {
          for (let i = 0; i < 200; i++) {
            let result: string = StringBuilder.toString(i);
            expect(result).assertEqual(i.toString());
          }

      }
      {
        const backslashResult = StringBuilder.toString(c'\\');
        const quoteResult = StringBuilder.toString(c'\'');
        expect(backslashResult.length).assertEqual(1);
        expect(quoteResult.length).assertEqual(1);

      }
      {
        const hiSurrogate = StringBuilder.toString(c'\uD800');
        expect(hiSurrogate.length).assertEqual(1);
        expect(hiSurrogate).assertEqual('\uD800');

      }
      {
        const result = StringBuilder.toString(c' ');
        expect(result.length).assertEqual(1);

      }
      {
        const result = StringBuilder.toString(c'​');
        expect(result.length).assertEqual(1);

      }
      {
        const result = StringBuilder.toString(c'€');
        expect(result.length).assertEqual(1);

      }
      {
        const sb = new StringBuilder();
        sb.append(StringBuilder.toString(true));
        sb.append(StringBuilder.toString(c'X'));
        sb.append(StringBuilder.toString(42 as int));
        sb.append(StringBuilder.toString(1.5 as float));
        expect(sb.stringLength).assertEqual(10);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1500
     * @tc.name testToStringStaticBool001
     * @tc.desc Verify static toString(boolean) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(false);
          expect(result).assertEqual('false');
          expect(result.length).assertEqual(5);

      }
      {
          let result: string = StringBuilder.toString(true);
          expect(result.length).assertEqual(4);
          expect(typeof result).assertEqual('string');

      }
      {
        const s1 = StringBuilder.toString(true);
        const s2 = StringBuilder.toString(false);
        expect(s1).not().assertEqual(s2);
        expect(s1).assertEqual('true');
        expect(s2).assertEqual('false');

      }
      {
        const predStr = 'flag is ' + StringBuilder.toString(true);
        expect(predStr).assertEqual('flag is true');

      }
      {
        const predStr = 'result: ' + StringBuilder.toString(false) + '.';
        expect(predStr).assertEqual('result: false.');

      }
      {
        const flag: boolean = true;
        const flagResult = StringBuilder.toString(flag);
        const trueResult = StringBuilder.toString(true);
        expect(flagResult).assertEqual(trueResult);

      }
      {
        const resultBool = StringBuilder.toString(true);
        const resultInt = StringBuilder.toString(42 as int);
        const resultChar = StringBuilder.toString(c'A');
        expect(resultBool).assertEqual('true');
        expect(resultInt).assertEqual('42');
        expect(resultChar).assertEqual('A');

      }
      {
        const rBool = StringBuilder.toString(true);
        const rChar = StringBuilder.toString(c'A');
        const rInt = StringBuilder.toString(1 as int);
        const rFloat = StringBuilder.toString(1.0 as float);
        expect(rBool).assertEqual('true');
        expect(rChar).assertEqual('A');
        expect(rInt).assertEqual('1');
        expect(rFloat).assertEqual('1');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1600
     * @tc.name testToStringStaticChar001
     * @tc.desc Verify static toString(char) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(c'A');
          expect(result).assertEqual('A');
          expect(result.length).assertEqual(1);

      }
      {
          let result: string = StringBuilder.toString(c'中');
          expect(result).assertEqual('中');

      }
      {
          let result: string = StringBuilder.toString(c'\u0000');
          expect(result.length).assertEqual(1);

      }
      {
          let result: string = StringBuilder.toString(c'\uffff');
          expect(result.length).assertEqual(1);

      }
      {
          let result: string = StringBuilder.toString(c'\n');
          expect(result.length).assertEqual(1);
          expect(result.charCodeAt(0)).assertEqual(10);

      }
      {
          let result: string = StringBuilder.toString(c'\t');
          expect(result.length).assertEqual(1);
          expect(result.charCodeAt(0)).assertEqual(9);

      }
      {
          let result: string = StringBuilder.toString(c'\x7F');
          expect(result.length).assertEqual(1);

      }
      {
        const result: String = StringBuilder.toString(c'\ud83d');
        expect(result.length).assertEqual(1);

      }
      {
        const result: String = StringBuilder.toString(c'\t');
        expect(result.length).assertEqual(1);
        expect(result).assertEqual('\t');

      }
      {
        const result: String = StringBuilder.toString(c' ');
        expect(result).assertEqual(' ');
        expect(result.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1700
     * @tc.name testToStringStaticChar002
     * @tc.desc Verify static toString(char) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticChar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const charAResult = StringBuilder.toString(c'A');
        const charZhResult = StringBuilder.toString(c'中');
        const charSevenResult = StringBuilder.toString(c'7');
        expect(charAResult).assertEqual('A');
        expect(charZhResult).assertEqual('中');
        expect(charSevenResult).assertEqual('7');

      }
      {
        const charAFirst = StringBuilder.toString(c'a');
        const charASecond = StringBuilder.toString(c'a');
        expect(charAFirst).assertEqual(charASecond);

      }
      {
        const result: String = StringBuilder.toString((-2147483648) as int);
        expect(result).assertEqual('-2147483648');

      }
      {
        const result: String = StringBuilder.toString((-1) as int);
        expect(result).assertEqual('-1');
        expect(result.length).assertEqual(2);

      }
      {
        const chStr = StringBuilder.toString(c'文');
        expect(chStr[0]).assertEqual('文');

      }
      {
        let v: long = -9223372036854775808;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-9223372036854775808');

      }
      {
        const result: String = StringBuilder.toString(c'(');
        expect(result).assertEqual('(');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1800
     * @tc.name testToStringStaticByte001
     * @tc.desc Verify static toString(byte) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticByte001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(0 as byte);
          expect(result).assertEqual('0');

      }
      {
          let result: string = StringBuilder.toString(99 as byte);
          expect(result).assertEqual('99');

      }
      {
          let result: string = StringBuilder.toString(0x0A as byte);
          expect(result).assertEqual('10');

      }
      {
          let result: string = StringBuilder.toString(-128 as byte);
          expect(result).assertEqual('-128');

      }
      {
          let result: string = StringBuilder.toString(127 as byte);
          expect(result).assertEqual('127');

      }
      {
        let v: byte = 88;
        const byteResultFirst: String = StringBuilder.toString(v);
        const byteResultSecond: String = StringBuilder.toString(v);
        expect(byteResultFirst).assertEqual(byteResultSecond);

      }
      {
        let v: byte = 2;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('2');

      }
      {
        let bv: byte = 127;
        let sv: short = 32767;
        const br: String = StringBuilder.toString(bv);
        const sr: String = StringBuilder.toString(sv);
        expect(br).assertEqual('127');
        expect(sr).assertEqual('32767');

      }
      {
        let buf: string = '';
        for (let i: byte = 0; i <= 126; i++) {
          buf += StringBuilder.toString(i);
        }
        expect(buf.length).assertEqual(271);

      }
      {
        let a: byte = 42;
        let b: byte = 42;
        const ra: String = StringBuilder.toString(a);
        const rb: String = StringBuilder.toString(b);
        expect(ra).assertEqual(rb);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_1900
     * @tc.name testToStringStaticShort001
     * @tc.desc Verify static toString(short) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticShort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(100 as short);
          expect(result).assertEqual('100');

      }
      {
          let result: string = StringBuilder.toString(-32768 as short);
          expect(result).assertEqual('-32768');

      }
      {
          let result: string = StringBuilder.toString(32767 as short);
          expect(result).assertEqual('32767');

      }
      {
          let result: string = StringBuilder.toString(0x7FF as short);
          expect(result).assertEqual('2047');

      }
      {
        let v: short = 0;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('0');

      }
      {
        let v: short = -100;
        const shortResultFirst: String = StringBuilder.toString(v);
        const shortResultSecond: String = StringBuilder.toString(v);
        expect(shortResultFirst).assertEqual(shortResultSecond);

      }
      {
        let m: short = Short.MIN_VALUE;
        const minR: String = StringBuilder.toString(m);
        let mp: short = Short.MAX_VALUE;
        const mpR: String = StringBuilder.toString(mp);
        expect(minR).assertEqual('-32768');
        expect(mpR).assertEqual('32767');
        expect(minR.compareTo(mpR) < 0).assertTrue();

      }
      {
        let x: short = 200;
        let y: short = 200;
        const rx: String = StringBuilder.toString(x);
        const ry: String = StringBuilder.toString(y);
        expect(rx).assertEqual(ry);

      }
      {
        let v: short = 1000;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('1000');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2000
     * @tc.name testToStringStaticInt001
     * @tc.desc Verify static toString(int) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(1);
          expect(result).assertEqual('1');

      }
      {
          let result: string = StringBuilder.toString(10000);
          expect(result).assertEqual('10000');

      }
      {
          let result: string = StringBuilder.toString(0x1234);
          expect(result).assertEqual('4660');

      }
      {
          let result: string = StringBuilder.toString(0b1010);
          expect(result).assertEqual('10');

      }
      {
          let result: string = StringBuilder.toString(0);
          expect(result).assertEqual('0');

      }
      {
          let result: string = StringBuilder.toString(-1);
          expect(result).assertEqual('-1');

      }
      {
          let result: string = StringBuilder.toString(100);
          expect(result).assertEqual('100');

      }
      {
        const result: String = StringBuilder.toString((-42) as int);
        expect(result).assertEqual('-42');

      }
      {
        const sb = new StringBuilder();
        sb.append(StringBuilder.toString(2147483647 as int))
          .append(StringBuilder.toString((-2147483648) as int));
        expect(sb.toString()).assertEqual('2147483647-2147483648');

      }
      {
        const base: String = StringBuilder.toString(7 as int);
        for (let i = 0; i < 100; i++) {
          expect(StringBuilder.toString(7 as int)).assertEqual(base);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2100
     * @tc.name testToStringStaticInt002
     * @tc.desc Verify static toString(int) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const sb = new StringBuilder();
        sb.append(2147483647 as int);
        const direct = StringBuilder.toString(2147483647 as int);
        expect(sb.toString()).assertEqual(direct);

      }
      {
        let v: int = -100;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-100');

      }
      {
        let v: int = 10;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('10');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2200
     * @tc.name testToStringStaticLong001
     * @tc.desc Verify static toString(long) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(-2147483648);
          expect(result).assertEqual('-2147483648');

      }
      {
          let result: string = StringBuilder.toString(2147483647);
          expect(result).assertEqual('2147483647');

      }
      {
          let l:long=-9223372036854775808
          let result: string = StringBuilder.toString(l);
          expect(result).assertEqual('-9223372036854775808');

      }
      {
          let result: string = StringBuilder.toString(9223372036854775807);
          expect(result).assertEqual('9223372036854775807');

      }
      {
        let v: long = 9223372036854775807;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('9223372036854775807');

      }
      {
        let v: long = 0;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('0');

      }
      {
        let v: long = 10;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('10');

      }
      {
        let v: long = 9007199254740991;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('9007199254740991');

      }
      {
        let v: long = 5000;
        const longResultFirst: String = StringBuilder.toString(v);
        const longResultSecond: String = StringBuilder.toString(v);
        expect(longResultFirst).assertEqual(longResultSecond);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2300
     * @tc.name testToStringStaticFloat001
     * @tc.desc Verify static toString(float) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(3.14f);
          expect(result).assertEqual('3.14');

      }
      {
          let result: string = StringBuilder.toString(Float.MIN_VALUE);
          expect(typeof result).assertEqual("string");

      }
      {
          let result: string = StringBuilder.toString(Float.MAX_VALUE);
          expect(result).assertEqual('3.4028235e+38');

      }
      {
          let result: string = StringBuilder.toString(Float.NaN);
          expect(result).assertEqual('NaN');

      }
      {
          let result: string = StringBuilder.toString(Float.POSITIVE_INFINITY);
          expect(result).assertEqual('Infinity');

      }
      {
          let result: string = StringBuilder.toString(-0.0f);
          expect(result).assertEqual("0");

      }
      {
          let result: string = StringBuilder.toString(-99.99f);
          expect(result).assertEqual('-99.99');

      }
      {
        const result: String = StringBuilder.toString(Number.NaN.toFloat());
        expect(result).assertEqual('NaN');

      }
      {
        const result: String = StringBuilder.toString(Float.POSITIVE_INFINITY);
        expect(result).assertEqual('Infinity');

      }
      {
        const result: String = StringBuilder.toString(Float.NEGATIVE_INFINITY);
        expect(result).assertEqual('-Infinity');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2400
     * @tc.name testToStringStaticFloat002
     * @tc.desc Verify static toString(float) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let floatMin: float = Float.MIN_VALUE;
        const result: String = StringBuilder.toString(floatMin);
        expect(result).assertEqual('1e-45');

      }
      {
        const nanFirstResult = StringBuilder.toString(Number.NaN.toFloat());
        const nanSecondResult = StringBuilder.toString(Number.NaN.toFloat());
        expect(nanFirstResult).assertEqual(nanSecondResult);

      }
      {
        let negFloat: float = -3.14f;
        const result: String = StringBuilder.toString(negFloat);
        expect(result[0]).assertEqual('-');

      }
      {
        let sciFloat: float = 1e-10f;
        const result: String = StringBuilder.toString(sciFloat);
        expect(result).assertEqual('1e-10');

      }
      {
        let v: float = 0.1f;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('0.1');

      }
      {
        let v: float = -0.1f;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-0.1');

      }
      {
        let v: float = 3.4028235e38f;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('3.4028235e+38');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2500
     * @tc.name testToStringStaticDouble001
     * @tc.desc Verify static toString(double) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(123.456);
          expect(result).assertEqual('123.456');

      }
      {
          let result: string = StringBuilder.toString(-888.88);
          expect(result).assertEqual('-888.88');

      }
      {
          let result: string = StringBuilder.toString(Double.MIN_VALUE);
          expect(result).assertEqual('5e-324');

      }
      {
          let result: string = StringBuilder.toString(Double.MAX_VALUE);
          expect(result).assertEqual('1.7976931348623157e+308');

      }
      {
          let result: string = StringBuilder.toString(Double.NaN);
          expect(result).assertEqual('NaN');

      }
      {
          let result: string = StringBuilder.toString(1.0e6);
          expect(result).assertEqual('1000000');

      }
      {
        let v: double = Double.NEGATIVE_INFINITY;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-Infinity');

      }
      {
        let v: double = -123.456789;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-123.456789');

      }
      {
        let v: double = Number.MAX_VALUE;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('1.7976931348623157e+308');

      }
      {
        let v: double = Number.MIN_VALUE;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('5e-324');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2600
     * @tc.name testToStringStaticDouble002
     * @tc.desc Verify static toString(double) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v: double = Number.EPSILON;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('2.220446049250313e-16');

      }
      {
        let v: double = Number.MIN_VALUE;
        const result: String = StringBuilder.toString(v);
        expect(result.length).assertEqual(6);

      }
      {
        let v: double = 0.5;
        const result: String = StringBuilder.toString(v);
        expect(result.length).assertEqual(3);

      }
      {
        let ov: double = Number.MAX_VALUE * 2;
        const result: String = StringBuilder.toString(ov);
        expect(result).assertEqual('Infinity');

      }
      {
        let v: double = Double.NaN;
        const nanDoubleFirst: String = StringBuilder.toString(v);
        const nanDoubleSecond: String = StringBuilder.toString(v);
        expect(nanDoubleFirst).assertEqual('NaN');
        expect(nanDoubleSecond).assertEqual('NaN');

      }
      {
        let v: double = -Number.MAX_VALUE * 2;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-Infinity');

      }
      {
        let v: double = -3.14159;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('-3.14159');

      }
      {
        let v: double = 0.30000000000000004;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('0.30000000000000004');

      }
      {
        let v: double = 9007199254740991.0;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('9007199254740991');

      }
      {
        let v: double = 9007199254740992.0;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('9007199254740992');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2700
     * @tc.name testToStringStaticDouble003
     * @tc.desc Verify static toString(double) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticDouble003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v: double = 1e-21;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('1e-21');

      }
      {
        let v: double = 1e21;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('1e+21');

      }
      {
        let v: double = Number.MAX_VALUE / 10;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('1.7976931348623158e+307');

      }
      {
        let v: double = -Number.MAX_VALUE / 10;
        const result: String = StringBuilder.toString(v);
        expect(result[0]).assertEqual('-');

      }
      {
        let v: double = 123456789.123;
        const result: String = StringBuilder.toString(v);
        expect(result).assertEqual('123456789.123');

      }
      {
        let ep: double = Number.EPSILON;
        let ze: double = 0.0;
        const er: String = StringBuilder.toString(ep);
        const zr: String = StringBuilder.toString(ze);
        expect(er).not().assertEqual(zr);

      }
      {
        let v: double = Double.POSITIVE_INFINITY;
        const infDoubleFirst: String = StringBuilder.toString(v);
        const infDoubleSecond: String = StringBuilder.toString(v);
        expect(infDoubleFirst).assertEqual('Infinity');
        expect(infDoubleSecond).assertEqual('Infinity');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2800
     * @tc.name testToStringStaticNumericMix001
     * @tc.desc Verify static toString numeric conversions across types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticNumericMix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const posInf = StringBuilder.toString(Float.POSITIVE_INFINITY);
        const negInf = StringBuilder.toString(Float.NEGATIVE_INFINITY);
        expect(posInf).not().assertEqual(negInf);
        expect(posInf.length).assertEqual(8);
        expect(negInf.length).assertEqual(9);

      }
      {
        const nanS = StringBuilder.toString(Number.NaN.toFloat());
        const infS = StringBuilder.toString(Float.POSITIVE_INFINITY);
        const ninfS = StringBuilder.toString(Float.NEGATIVE_INFINITY);
        expect(nanS).not().assertEqual(infS);
        expect(infS).not().assertEqual(ninfS);
        expect(nanS).not().assertEqual(ninfS);

      }
      {
        let pos: double = +0.0;
        let neg: double = -0.0;
        const pResult: String = StringBuilder.toString(pos);
        const nResult: String = StringBuilder.toString(neg);
        expect(pResult).assertEqual(nResult);

      }
      {
        let b: byte = 1;
        let sh: short = 1;
        let l: long = 1;
        expect(StringBuilder.toString(b)).assertEqual(StringBuilder.toString(sh));
        expect(StringBuilder.toString(sh)).assertEqual(StringBuilder.toString(l));

      }
      {
        let i: int = 0;
        let l: long = 0;
        expect(StringBuilder.toString(i)).assertEqual(StringBuilder.toString(l));

      }
      {
        let bv: byte = 127;
        let sv: short = 127;
        const br: String = StringBuilder.toString(bv);
        const sr: String = StringBuilder.toString(sv);
        expect(br).assertEqual(sr);

      }
      {
        let sv: short = -1;
        let lv: long = -1;
        const sr: String = StringBuilder.toString(sv);
        const lr: String = StringBuilder.toString(lv);
        expect(sr).assertEqual(lr);

      }
      {
        let p: double = Double.POSITIVE_INFINITY;
        let n: double = Double.NEGATIVE_INFINITY;
        const pr: String = StringBuilder.toString(p);
        const nr: String = StringBuilder.toString(n);
        expect(pr).assertEqual('Infinity');
        expect(nr).assertEqual('-Infinity');

      }
      {
        let i: int = 42;
        let d: double = 42.0;
        expect(StringBuilder.toString(i)).assertEqual(StringBuilder.toString(d));

      }
      {
        const cs: String = StringBuilder.toString(c'1');
        const is: String = StringBuilder.toString(1);
        expect(cs).assertEqual(is);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_2900
     * @tc.name testToStringStaticNumericMix002
     * @tc.desc Verify static toString numeric conversions across types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticNumericMix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sh: short = -1;
        let i: int = -1;
        expect(StringBuilder.toString(sh)).assertEqual(StringBuilder.toString(i));

      }
      {
        let bv: byte = 0;
        let lv: long = 0;
        const br: String = StringBuilder.toString(bv);
        const lr: String = StringBuilder.toString(lv);
        expect(br).assertEqual(lr);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_3000
     * @tc.name testToStringStaticType001
     * @tc.desc Verify static toString return type and integration behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let result: string = StringBuilder.toString(3.14);
          expect(typeof result).assertEqual('string');

      }
      {
          let result: string = StringBuilder.toString(20);
          expect(result).assertEqual('20');

      }
      {
          let result: string = StringBuilder.toString(0.001);
          expect(result).assertEqual('0.001');
          expect(typeof result).assertEqual('string');

      }
      {
          let r1: string = StringBuilder.toString(true);
          let r2: string = StringBuilder.toString(12 as byte);
          let r3: string = StringBuilder.toString(c'A');
          let r4: string = StringBuilder.toString(100 as short);
          let r5: string = StringBuilder.toString(10000);
          let r6: string = StringBuilder.toString(100);
          let r7: string = StringBuilder.toString(3.14f);
          let r8: string = StringBuilder.toString(123.456);
          expect(r1).assertEqual('true');
          expect(r2).assertEqual('12');
          expect(r3).assertEqual('A');
          expect(r4).assertEqual('100');
          expect(r5).assertEqual('10000');
          expect(r6).assertEqual('100');
          expect(r7).assertEqual('3.14');
          expect(r8).assertEqual('123.456');

      }
      {
          let r1: string = StringBuilder.toString(42);
          let r2: string = StringBuilder.toString(true);
          let r3: string = StringBuilder.toString(3.14);
          const builder = new StringBuilder(r1 + r2 + r3);
          expect(builder.toString()).assertEqual("42true3.14");

      }
      {
          let strVal: string = StringBuilder.toString(42);
          const builder = new StringBuilder("Value: ");
          builder.append(strVal);
          expect(builder.toString()).assertEqual("Value: 42");

      }
      {
          let r1: string = StringBuilder.toString(true);
          let r2: string = StringBuilder.toString(3.14);
          let combined: string = r1 + r2;
          expect(combined).assertEqual("true3.14");

      }
      {
        const sb = new StringBuilder();
        sb.append(StringBuilder.toString(Number.NaN.toFloat()));
        expect(sb.toString()).assertEqual('NaN');

      }
      {
        const sb = new StringBuilder();
        sb.append(StringBuilder.toString(Float.POSITIVE_INFINITY));
        expect(sb.toString()).assertEqual('Infinity');

      }
      {
        const sb = new StringBuilder();
        sb.append(StringBuilder.toString(Float.NEGATIVE_INFINITY));
        expect(sb.toString()).assertEqual('-Infinity');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_3100
     * @tc.name testToStringStaticType002
     * @tc.desc Verify static toString return type and integration behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const result = StringBuilder.toString(c'B');
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        const result = StringBuilder.toString(43 as int);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        const result = StringBuilder.toString(1.0 as float);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        let v: short = 42;
        const result: String = StringBuilder.toString(v);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        let v: double = 9.99;
        const result: String = StringBuilder.toString(v);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        const result: String = StringBuilder.toString(true);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
      {
        let v: long = 999;
        const result: String = StringBuilder.toString(v);
        expect(Class.of(result).getName()).assertEqual('std.core.String');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_TO_STRING_3200
     * @tc.name testToStringStaticThrows001
     * @tc.desc Verify static toString throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToStringStaticThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          const obj: PlainObject = new PlainObject();
          StringBuilder.toString(obj as object as float);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: boolean | undefined = undefined;
          StringBuilder.toString(undef as boolean);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: byte | undefined = undefined;
          StringBuilder.toString(undef as byte);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: char | undefined = undefined;
          StringBuilder.toString(undef as char);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: short | undefined = undefined;
          StringBuilder.toString(undef as short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: long | undefined = undefined;
          StringBuilder.toString(undef as long);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let undef: double | undefined = undefined;
          StringBuilder.toString(undef as double);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
      {
        try {
          let nul: null = null;
          StringBuilder.toString(nul!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }

      }
      {
        try {
          let undef: undefined = undefined;
          StringBuilder.toString(undef as int);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }

      }
    });

  });
}
