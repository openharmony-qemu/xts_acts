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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function CharConstructor2Test(): void {
  describe('CharConstructor2Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0100
     * @tc.name testCharConstructor2001
     * @tc.desc Verify that a char type parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2001' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c !== null).assertTrue();
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0400
     * @tc.name testCharConstructor2004
     * @tc.desc Verify constructor with normal letter character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0500
     * @tc.name testCharConstructor2005
     * @tc.desc Verify constructor with lowercase letter character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      expect(c.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0600
     * @tc.name testCharConstructor2006
     * @tc.desc Verify constructor with digit character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      expect(c.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0700
     * @tc.name testCharConstructor2007
     * @tc.desc Verify constructor with special character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'@');
      expect(c.toString()).assertEqual("@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0800
     * @tc.name testCharConstructor2008
     * @tc.desc Verify constructor with Chinese character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      expect(c.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_0900
     * @tc.name testCharConstructor2009
     * @tc.desc Verify constructor with null character \u0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      expect(c.toChar()).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1000
     * @tc.name testCharConstructor2010
     * @tc.desc Verify constructor with max character \uFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uFFFF');
      expect(c.toChar()).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1100
     * @tc.name testCharConstructor2011
     * @tc.desc Verify constructor with ASCII minimum printable character space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      expect(c.toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1200
     * @tc.name testCharConstructor2012
     * @tc.desc Verify constructor with ASCII maximum character tilde
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'~');
      expect(c.toString()).assertEqual("~");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1300
     * @tc.name testCharConstructor2013
     * @tc.desc Verify constructor with newline character \n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      expect(c.toChar()).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1400
     * @tc.name testCharConstructor2014
     * @tc.desc Verify constructor with tab character \t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      expect(c.toChar()).assertEqual(c'\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1500
     * @tc.name testCharConstructor2015
     * @tc.desc Verify constructor with carriage return character \r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      expect(c.toChar()).assertEqual(c'\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1600
     * @tc.name testCharConstructor2016
     * @tc.desc Verify constructor with hex escape \x7F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\x7F');
      expect(c.toChar()).assertEqual(c'\x7F');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1800
     * @tc.name testCharConstructor2018
     * @tc.desc Verify constructor with high surrogate minimum \uD800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD800');
      expect(c.toChar()).assertEqual(c'\uD800');
      expect(Char.isHighSurrogate(c.toChar())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_1900
     * @tc.name testCharConstructor2019
     * @tc.desc Verify constructor with high surrogate maximum \uDBFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uDBFF');
      expect(c.toChar()).assertEqual(c'\uDBFF');
      expect(Char.isHighSurrogate(c.toChar())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_2000
     * @tc.name testCharConstructor2020
     * @tc.desc Verify constructor with low surrogate minimum \uDC00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uDC00');
      expect(c.toChar()).assertEqual(c'\uDC00');
      expect(Char.isLowSurrogate(c.toChar())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_2100
     * @tc.name testCharConstructor2021
     * @tc.desc Verify constructor with low surrogate maximum \uDFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uDFFF');
      expect(c.toChar()).assertEqual(c'\uDFFF');
      expect(Char.isLowSurrogate(c.toChar())).assertTrue();
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_2900
     * @tc.name testCharConstructor2029
     * @tc.desc Verify that constructor returns a Char instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c instanceof Char).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3000
     * @tc.name testCharConstructor2030
     * @tc.desc Verify that Char object value matches the parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toString()).assertEqual("A");
      expect(c.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3100
     * @tc.name testCharConstructor2031
     * @tc.desc Verify that different parameters create different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.equals(c2)).assertFalse();
      expect(c1.toChar() !== c2.toChar()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3200
     * @tc.name testCharConstructor2032
     * @tc.desc Verify high surrogate character instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD800');
      expect(c.isPartOfSurrogatePair()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3300
     * @tc.name testCharConstructor2033
     * @tc.desc Verify low surrogate character instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uDC00');
      expect(c.isPartOfSurrogatePair()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3400
     * @tc.name testCharConstructor2034
     * @tc.desc Verify null character \u0000 instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      expect(c.toChar()).assertEqual(c'\u0000');
      expect(c.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3500
     * @tc.name testCharConstructor2035
     * @tc.desc Verify instance type with instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c instanceof Char).assertTrue();
      expect(c instanceof Object).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3700
     * @tc.name testCharConstructor2037
     * @tc.desc Verify same parameter creates equal but different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.equals(c2)).assertTrue();
      expect(c1.toChar()).assertEqual(c2.toChar());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3800
     * @tc.name testCharConstructor2038
     * @tc.desc Verify minimum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      expect(c.toChar()).assertEqual(Char.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_3900
     * @tc.name testCharConstructor2039
     * @tc.desc Verify maximum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      expect(c.toChar()).assertEqual(Char.MAX_VALUE);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4200
     * @tc.name testCharConstructor2042
     * @tc.desc Verify that normal parameter does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2042' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const c = new Char(c'A');
        expect(c !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4400
     * @tc.name testCharConstructor2044
     * @tc.desc Verify Char constructor works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4600
     * @tc.name testCharConstructor2046
     * @tc.desc Verify that constructor is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const c = new Char(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4700
     * @tc.name testCharConstructor2047
     * @tc.desc Verify toString method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4800
     * @tc.name testCharConstructor2048
     * @tc.desc Verify equals method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_4900
     * @tc.name testCharConstructor2049
     * @tc.desc Verify compareTo method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.compareTo(c2) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_5000
     * @tc.name testCharConstructor2050
     * @tc.desc Verify toByte method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toByte()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_5100
     * @tc.name testCharConstructor2051
     * @tc.desc Verify toInt method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toInt()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR2TEST_CONSTRUCTORTEST_5200
     * @tc.name testCharConstructor2052
     * @tc.desc Verify isInBasicMultilingualPlane method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.isInBasicMultilingualPlane()).assertTrue();
    });

    
  });
}
