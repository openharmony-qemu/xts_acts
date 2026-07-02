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

export default function CharConstructor1Test(): void {
  describe('CharConstructor1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_0100
     * @tc.name testCharConstructor1001
     * @tc.desc Verify no argument constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      expect(c !== null).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_0300
     * @tc.name testCharConstructor1003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      expect(c instanceof Char).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_0500
     * @tc.name testCharConstructor1005
     * @tc.desc Verify default value is null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      const str = c.toString();
      expect(str === "" || str === "\u0000").assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_0800
     * @tc.name testCharConstructor1008
     * @tc.desc Verify default value is u0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      expect(c.toChar() === c'\u0000').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_0900
     * @tc.name testCharConstructor1009
     * @tc.desc Verify type using instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      expect(c instanceof Char).assertTrue();
      expect(c instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_1000
     * @tc.name testCharConstructor1010
     * @tc.desc Verify each call creates independent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char();
      expect(c1.equals(c2)).assertTrue();
    });

    
    

    



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCONSTRUCTOR1TEST_CONSTRUCTORTEST_1800
     * @tc.name testCharConstructor1018
     * @tc.desc Verify toString can be called after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char();
      const str = c.toString();
      expect(typeof str === "string").assertTrue();
    });


  });
}
