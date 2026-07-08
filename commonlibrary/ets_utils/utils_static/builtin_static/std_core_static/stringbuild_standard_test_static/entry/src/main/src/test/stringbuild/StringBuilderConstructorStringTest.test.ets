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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function StringBuilderConstructorStringTest(): void {
  describe('StringBuilderConstructorStringTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0001
     * @tc.name testStringBuilderConstructorString001
     * @tc.desc Verify constructor(s: string) with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("");
        expect(builder.stringLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0002
     * @tc.name testStringBuilderConstructorString002
     * @tc.desc Verify constructor(s: string) with ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "OpenHarmony";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("OpenHarmony");
        expect(builder.stringLength).assertEqual(11);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0003
     * @tc.name testStringBuilderConstructorString003
     * @tc.desc Verify constructor(s: string) with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "开源鸿蒙";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("开源鸿蒙");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0004
     * @tc.name testStringBuilderConstructorString004
     * @tc.desc Verify constructor(s: string) with mixed ASCII and Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "Hello世界";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("Hello世界");
        expect(builder.stringLength).assertEqual(7);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0005
     * @tc.name testStringBuilderConstructorString005
     * @tc.desc Verify constructor(s: string) with numeric characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "12345";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("12345");
        expect(builder.stringLength).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0006
     * @tc.name testStringBuilderConstructorString006
     * @tc.desc Verify constructor(s: string) with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "!@#$%^&*()";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("!@#$%^&*()");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0007
     * @tc.name testStringBuilderConstructorString007
     * @tc.desc Verify constructor(s: string) with string containing newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "line1\nline2";
        const builder = new StringBuilder(s);
        expect(builder.stringLength).assertEqual(11);
        expect(builder.toString()).assertEqual("line1\nline2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0008
     * @tc.name testStringBuilderConstructorString008
     * @tc.desc Verify constructor(s: string) with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "a";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("a");
        expect(builder.stringLength).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0009
     * @tc.name testStringBuilderConstructorString009
     * @tc.desc Verify constructor(s: string) with whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "   ";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("   ");
        expect(builder.stringLength).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0010
     * @tc.name testStringBuilderConstructorString010
     * @tc.desc Verify constructor(s: string) with unicode escape string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "\u0048\u0065\u006C\u006C\u006F";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("Hello");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0011
     * @tc.name testStringBuilderConstructorString011
     * @tc.desc Verify constructor(s: string) with long string of 1000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "a".repeat(1000);
        const builder = new StringBuilder(s);
        expect(builder.stringLength).assertEqual(1000);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0012
     * @tc.name testStringBuilderConstructorString012
     * @tc.desc Verify constructor(s: string) then append operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "Hello";
        const builder = new StringBuilder(s);
        builder.append(" World");
        expect(builder.toString()).assertEqual("Hello World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0013
     * @tc.name testStringBuilderConstructorString013
     * @tc.desc Verify constructor(s: string) stringLength consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "OpenHarmony";
        const builder = new StringBuilder(s);
        expect(builder.stringLength).assertEqual(11);
        expect(builder.toString().length).assertEqual(builder.stringLength);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0014
     * @tc.name testStringBuilderConstructorString014
     * @tc.desc Verify constructor(s: string) instanceof StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "test";
        const builder = new StringBuilder(s);
        expect(builder instanceof StringBuilder).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0015
     * @tc.name testStringBuilderConstructorString015
     * @tc.desc Verify constructor(s: string) with emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "Hello\uD83D\uDE00World";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("Hello\uD83D\uDE00World");
        expect(builder.stringLength).assertEqual(12);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0016
     * @tc.name testStringBuilderConstructorString016
     * @tc.desc Verify constructor(s: string) with very long string of
     *   10000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "a".repeat(10000);
        const builder = new StringBuilder(s);
        expect(builder.stringLength).assertEqual(10000);
        expect(builder.toString()).assertEqual(s);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0017
     * @tc.name testStringBuilderConstructorString017
     * @tc.desc Verify constructor with Arabic script string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual(s);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0018
     * @tc.name testStringBuilderConstructorString018
     * @tc.desc Verify constructor with business phone format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "13800138000";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual("13800138000");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0019
     * @tc.name testStringBuilderConstructorString019
     * @tc.desc Verify constructor with encoding garbled string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let s: string = "\u00E6\u00B5\u008B\u00E8\u00AF\u0095\uFFFD";
        const builder = new StringBuilder(s);
        expect(builder.toString()).assertEqual(s);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0020
     * @tc.name testStringBuilderConstructorString020
     * @tc.desc Verify constructor with null string throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let s: string | null = null;
          const builder = new StringBuilder(s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONSTRUCTOR_STRING_0021
     * @tc.name testStringBuilderConstructorString021
     * @tc.desc Verify constructor with undefined string throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConstructorString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let s: string | undefined = undefined;
          const builder = new StringBuilder(s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );
  });
}
