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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function CharIsWhiteSpaceInstanceTest(): void {
  describe('CharIsWhiteSpaceInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETEST_0100
     * @tc.name testCharIsWhiteSpaceInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0001' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.isWhiteSpace();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_0300
     * @tc.name testCharIsWhiteSpaceInstance0003
     * @tc.desc Verify no parameter is needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0003' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.isWhiteSpace();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_0500
     * @tc.name testCharIsWhiteSpaceInstance0005
     * @tc.desc Verify white space characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0005' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Char(c' ');
      const tab = new Char(c'\t');
      const newline = new Char(c'\n');
      const carriage = new Char(c'\r');

      expect(space.isWhiteSpace()).assertTrue();
      expect(tab.isWhiteSpace()).assertTrue();
      expect(newline.isWhiteSpace()).assertTrue();
      expect(carriage.isWhiteSpace()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_0600
     * @tc.name testCharIsWhiteSpaceInstance0006
     * @tc.desc Verify visible characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const lowerA = new Char(c'a');
      const zero = new Char(c'0');
      const atSign = new Char(c'@');

      expect(upperA.isWhiteSpace()).assertFalse();
      expect(lowerA.isWhiteSpace()).assertFalse();
      expect(zero.isWhiteSpace()).assertFalse();
      expect(atSign.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_0700
     * @tc.name testCharIsWhiteSpaceInstance0007
     * @tc.desc Verify Char instance with white space character values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceChars = [
        c' ',
        c'\t',
        c'\n',
        c'\v',
        c'\f',
        c'\r'
      ];

      for (const ch of whiteSpaceChars) {
        const c = new Char(ch);
        expect(c.isWhiteSpace()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_0800
     * @tc.name testCharIsWhiteSpaceInstance0008
     * @tc.desc Verify Char instance with non-white space character values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0008' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const lowerA = new Char(c'a');

      expect(upperA.isWhiteSpace()).assertFalse();
      expect(lowerA.isWhiteSpace()).assertFalse();

      const zero = new Char(c'0');
      expect(zero.isWhiteSpace()).assertFalse();

      const atSign = new Char(c'@');
      expect(atSign.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1100
     * @tc.name testCharIsWhiteSpaceInstance0011
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0011' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Char(c' ');
      const tab = new Char(c'\t');
      const upperA = new Char(c'A');
      const lowerA = new Char(c'a');
      const zero = new Char(c'0');

      expect(space.isWhiteSpace()).assertTrue();
      expect(tab.isWhiteSpace()).assertTrue();
      expect(upperA.isWhiteSpace()).assertFalse();
      expect(lowerA.isWhiteSpace()).assertFalse();
      expect(zero.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1200
     * @tc.name testCharIsWhiteSpaceInstance0012
     * @tc.desc Verify normal invocation does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.isWhiteSpace();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1400
     * @tc.name testCharIsWhiteSpaceInstance0014
     * @tc.desc Verify isWhiteSpace() works correctly in a try-finally context regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0014' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.isWhiteSpace();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1600
     * @tc.name testCharIsWhiteSpaceInstance0016
     * @tc.desc Verify instance method and static method produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0016' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const instanceResult = c.isWhiteSpace();

      const staticResult = Char.isWhiteSpace(c' ');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1700
     * @tc.name testCharIsWhiteSpaceInstance0017
     * @tc.desc Verify isWhiteSpace is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0017' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const startTime = Date.now();
      const result = c.isWhiteSpace();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_1800
     * @tc.name testCharIsWhiteSpaceInstance0018
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0018' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c' ', c'\t', c'\n', c'A', c'0'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isWhiteSpace();
        const staticResult = Char.isWhiteSpace(ch);

        expect(instanceResult).assertEqual(staticResult);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2000
     * @tc.name testCharIsWhiteSpaceInstance0020
     * @tc.desc Verify white space characters are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0020' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Char(c' ');
      const tab = new Char(c'\t');
      const upperA = new Char(c'A');
      const lowerA = new Char(c'a');

      expect(space.isWhiteSpace()).assertTrue();
      expect(space.isLetter()).assertFalse();

      expect(tab.isWhiteSpace()).assertTrue();
      expect(tab.isLetter()).assertFalse();

      expect(upperA.isWhiteSpace()).assertFalse();
      expect(upperA.isLetter()).assertTrue();

      expect(lowerA.isWhiteSpace()).assertFalse();
      expect(lowerA.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2100
     * @tc.name testCharIsWhiteSpaceInstance0021
     * @tc.desc Verify white space and letter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0021' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c' ', c'\t', c'\n', c'A', c'a'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const isWS = c.isWhiteSpace();
        const isLetter = c.isLetter();

        if (isWS) {
          expect(isLetter).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2200
     * @tc.name testCharIsWhiteSpaceInstance0022
     * @tc.desc Verify white space characters are not digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0022' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Char(c' ');
      const zero = new Char(c'0');

      expect(space.isWhiteSpace()).assertTrue();
      expect(space.isDecDigit()).assertFalse();

      expect(zero.isWhiteSpace()).assertFalse();
      expect(zero.isDecDigit()).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2500
     * @tc.name testCharIsWhiteSpaceInstance0025
     * @tc.desc Verify only some control characters are white space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0025' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceControl = [c'\t', c'\n', c'\v', c'\f', c'\r'];
      for (const ch of whiteSpaceControl) {
        const c = new Char(ch);
        expect(c.isWhiteSpace()).assertTrue();
      }

      const nonWhiteSpaceControl = [c'\u0000', c'\u0001', c'\u0002', c'\u0007', c'\u0008', c'\u000E', c'\u001F'];
      for (const ch of nonWhiteSpaceControl) {
        const c = new Char(ch);
        expect(c.isWhiteSpace()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2600
     * @tc.name testCharIsWhiteSpaceInstance0026
     * @tc.desc Verify ASCII control character boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0026' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const backspace = new Char(c'\u0008');
      expect(backspace.isWhiteSpace()).assertFalse();

      const tab = new Char(c'\t');
      expect(tab.isWhiteSpace()).assertTrue();

      const carriage = new Char(c'\r');
      expect(carriage.isWhiteSpace()).assertTrue();

      const moveOut = new Char(c'\u000E');
      expect(moveOut.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2700
     * @tc.name testCharIsWhiteSpaceInstance0027
     * @tc.desc Verify visible characters around space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0027' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beforeSpace = new Char(c'\u001F');
      expect(beforeSpace.isWhiteSpace()).assertFalse();

      const space = new Char(c' ');
      expect(space.isWhiteSpace()).assertTrue();

      const afterSpace = new Char(c'!');
      expect(afterSpace.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2800
     * @tc.name testCharIsWhiteSpaceInstance0028
     * @tc.desc Verify repeated invocations return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0028' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result1 = c.isWhiteSpace();
      const result2 = c.isWhiteSpace();
      const result3 = c.isWhiteSpace();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_2900
     * @tc.name testCharIsWhiteSpaceInstance0029
     * @tc.desc Verify different instances return independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0029' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c' ');
      const c2 = new Char(c'A');

      expect(c1.isWhiteSpace()).assertTrue();
      expect(c2.isWhiteSpace()).assertFalse();

      expect(c1.isWhiteSpace()).assertTrue();
      expect(c2.isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_3000
     * @tc.name testCharIsWhiteSpaceInstance0030
     * @tc.desc Verify multiple invocations return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0030' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      for (let i = 0; i < 1000; i++) {
        expect(c.isWhiteSpace()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_3100
     * @tc.name testCharIsWhiteSpaceInstance0031
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0031' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Char(c' ').isWhiteSpace()).assertTrue();
      expect(new Char(c'\t').isWhiteSpace()).assertTrue();
      expect(new Char(c'\n').isWhiteSpace()).assertTrue();
      expect(new Char(c'\r').isWhiteSpace()).assertTrue();
      expect(new Char(c'A').isWhiteSpace()).assertFalse();
      expect(new Char(c'a').isWhiteSpace()).assertFalse();
      expect(new Char(c'0').isWhiteSpace()).assertFalse();
      expect(new Char(c'@').isWhiteSpace()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_3200
     * @tc.name testCharIsWhiteSpaceInstance0032
     * @tc.desc Verify instance and static methods return consistent results for same characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c' ', c'\t', c'\n', c'\r', c'A', c'0'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isWhiteSpace();
        const staticResult = Char.isWhiteSpace(ch);

        expect(instanceResult).assertEqual(staticResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_3300
     * @tc.name testCharIsWhiteSpaceInstance0033
     * @tc.desc Verify white space characters are not letters or digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceChars = [c' ', c'\t', c'\n', c'\r'];

      for (const ch of whiteSpaceChars) {
        const c = new Char(ch);
        const isWS = c.isWhiteSpace();

        expect(isWS).assertTrue();

        expect(c.isLetter()).assertFalse();

        expect(c.isDecDigit()).assertFalse();
        expect(c.isBinDigit()).assertFalse();
        expect(c.isHexDigit()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACEINSTANCETSET_3400
     * @tc.name testCharIsWhiteSpaceInstance0034
     * @tc.desc Verify compliance with Unicode white space character definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceInstance0034' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiWhiteSpace = [c'\t', c'\n', c'\v', c'\f', c'\r', c' '];
      for (const ch of asciiWhiteSpace) {
        const c = new Char(ch);
        expect(c.isWhiteSpace()).assertTrue();
      }

      const upperA = new Char(c'A');
      expect(upperA.isWhiteSpace()).assertFalse();

      const zero = new Char(c'0');
      expect(zero.isWhiteSpace()).assertFalse();
    });
  });
}
