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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayJoin3Test(): void {
  describe('Float32ArrayJoin3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0100
     * @tc.name testFloat32ArrayJoinThree001
     * @tc.desc Verify toString() of a normal array returns comma-joined values without trailing separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0200
     * @tc.name testFloat32ArrayJoinThree002
     * @tc.desc Verify toString() of empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0300
     * @tc.name testFloat32ArrayJoinThree003
     * @tc.desc Verify toString() of single element array returns just that element with no separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      expect(arr.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0400
     * @tc.name testFloat32ArrayJoinThree004
     * @tc.desc Verify toString() of special values produces the canonical literal forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0);
      expect(arr.toString()).assertEqual('NaN,Infinity,-Infinity,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0500
     * @tc.name testFloat32ArrayJoinThree005
     * @tc.desc Verify join() with no separator equals toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.join()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0600
     * @tc.name testFloat32ArrayJoinThree006
     * @tc.desc Verify join() with empty string separator concatenates all values with no gaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0700
     * @tc.name testFloat32ArrayJoinThree007
     * @tc.desc Verify join() with control-character separators (CR, vertical tab, form feed, backspace, NUL)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.join('\r')).assertEqual('1\r2');
      expect(arr.join('\v')).assertEqual('1\v2');
      expect(arr.join('\f')).assertEqual('1\f2');
      expect(arr.join('\b')).assertEqual('1\b2');
      expect(arr.join('\u0000')).assertEqual('1\u00002');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0800
     * @tc.name testFloat32ArrayJoinThree008
     * @tc.desc Verify join() with unicode whitespace and replacement separators (zero-width space, replacement char)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.join('​')).assertEqual('1​2');
      expect(arr.join('�')).assertEqual('1�2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_0900
     * @tc.name testFloat32ArrayJoinThree009
     * @tc.desc Verify join() with multibyte multilingual separators (Japanese katakana, Arabic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.join('テスト')).assertEqual('1テスト2');
      expect(arr.join('الاختبار')).assertEqual('1الاختبار2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_1000
     * @tc.name testFloat32ArrayJoinThree010
     * @tc.desc Verify join() with surrogate-pair emoji separators (four bytes between values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.join('🔥⭐')).assertEqual('1🔥⭐2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_THREE_1100
     * @tc.name testFloat32ArrayJoinThree011
     * @tc.desc Verify join() treats XSS-like separator as plain text (no escaping performed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      expect(arr.join('<script>alert(1)</script>')).assertEqual('1<script>alert(1)</script>2');
    });

  });
}
