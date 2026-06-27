'use static'
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
import { CHAR_COPYRIGHT, CHAR_REGISTERED, CHAR_PLUS_MINUS, CHAR_CJK_ZHONG, CHAR_CJK_GUO, CHAR_CJK_HAN, CHAR_A_GRAVE, CHAR_N_TILDE, CHAR_CJK_ZI, CHAR_HANGUL_GA, CHAR_HANGUL_HIH, CHAR_BMP_MAX } from '../Util.test';


class CharBoxWrapper {
  box: CharBox = new CharBox(CHAR_CJK_HAN);
  getValue(): char {
    return this.box.get();
  }
  setValue(ch: char): void {
    this.box.set(ch);
  }
}

function setCharBoxValue(box: CharBox, ch: char): char {
  return box.set(ch);
}

function createCharBoxWithChar(ch: char): CharBox {
  let box: CharBox = new CharBox();
  box.set(ch);
  return box;
}

export default function CharBoxTest_2(): void {
  describe('CharBoxTest_2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0100
     * @tc.name testCharBoxB001
     * @tc.desc Verify parameterized constructor with copyright symbol CHAR_COPYRIGHT for CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let result: char = box.get();
      expect(result).assertEqual(CHAR_COPYRIGHT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0200
     * @tc.name testCharBoxB002
     * @tc.desc Verify parameterized constructor with CJK character CHAR_CJK_ZHONG for CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_CJK_ZHONG);
      let result: char = box.get();
      expect(result).assertEqual(CHAR_CJK_ZHONG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0300
     * @tc.name testCharBoxB003
     * @tc.desc Verify set registered symbol CHAR_REGISTERED updates CharBox value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_REGISTERED);
      expect(ret).assertEqual(CHAR_REGISTERED);
      expect(box.get()).assertEqual(CHAR_REGISTERED);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0400
     * @tc.name testCharBoxB004
     * @tc.desc Verify set CJK character CHAR_CJK_GUO updates CharBox value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_CJK_ZHONG);
      let ret: char = box.set(CHAR_CJK_GUO);
      expect(ret).assertEqual(CHAR_CJK_GUO);
      expect(box.get()).assertEqual(CHAR_CJK_GUO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0500
     * @tc.name testCharBoxB005
     * @tc.desc Verify two CharBox instances with Unicode chars remain independent after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(CHAR_COPYRIGHT);
      let box2: CharBox = new CharBox(CHAR_PLUS_MINUS);
      expect(box1.get()).assertEqual(CHAR_COPYRIGHT);
      expect(box2.get()).assertEqual(CHAR_PLUS_MINUS);
      box1.set(CHAR_REGISTERED);
      box2.set(CHAR_CJK_GUO);
      expect(box1.get()).assertEqual(CHAR_REGISTERED);
      expect(box2.get()).assertEqual(CHAR_CJK_GUO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0600
     * @tc.name testCharBoxB006
     * @tc.desc Verify static factory method with CHAR_CJK_HAN creates CharBox with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(CHAR_CJK_HAN);
      let result: char = box.get();
      expect(result).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0700
     * @tc.name testCharBoxB007
     * @tc.desc Verify CharBox as method parameter with reference semantics using CJK character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_CJK_ZHONG);
      setCharBoxValue(box, CHAR_CJK_GUO);
      expect(box.get()).assertEqual(CHAR_CJK_GUO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0800
     * @tc.name testCharBoxB008
     * @tc.desc Verify CharBox as method return value with Unicode char for correct retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = createCharBoxWithChar(CHAR_COPYRIGHT);
      expect(box.get()).assertEqual(CHAR_COPYRIGHT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_0900
     * @tc.name testCharBoxB009
     * @tc.desc Verify CharBox as class field for encapsulation using CJK char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: CharBoxWrapper = new CharBoxWrapper();
      expect(wrapper.getValue()).assertEqual(CHAR_CJK_HAN);
      wrapper.setValue(CHAR_COPYRIGHT);
      expect(wrapper.getValue()).assertEqual(CHAR_COPYRIGHT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1000
     * @tc.name testCharBoxB010
     * @tc.desc Verify CharBox returns latest value during alternating set/get with Unicode chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      expect(box.get()).assertEqual(CHAR_COPYRIGHT);
      box.set(CHAR_REGISTERED);
      expect(box.get()).assertEqual(CHAR_REGISTERED);
      box.set(CHAR_COPYRIGHT);
      expect(box.get()).assertEqual(CHAR_COPYRIGHT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1100
     * @tc.name testCharBoxB011
     * @tc.desc Verify CharBox chain set with CJK characters produces correct final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      box.set(c'包');
      box.set(c'箱');
      box.set(c'编');
      expect(box.get()).assertEqual(c'编');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1200
     * @tc.name testCharBoxB012
     * @tc.desc Verify CharBox set CJK character CHAR_CJK_ZI returns correct value and get confirms state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_CJK_ZI);
      expect(ret).assertEqual(CHAR_CJK_ZI);
      expect(box.get()).assertEqual(CHAR_CJK_ZI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1300
     * @tc.name testCharBoxB013
     * @tc.desc Verify CharBox set Hangul character CHAR_HANGUL_GA returns correct value and get confirms state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_HANGUL_GA);
      expect(ret).assertEqual(CHAR_HANGUL_GA);
      expect(box.get()).assertEqual(CHAR_HANGUL_GA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1400
     * @tc.name testCharBoxB014
     * @tc.desc Verify CharBox set Hangul end boundary CHAR_HANGUL_HIH returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_HANGUL_HIH);
      expect(ret).assertEqual(CHAR_HANGUL_HIH);
      expect(box.get()).assertEqual(CHAR_HANGUL_HIH);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1500
     * @tc.name testCharBoxB015
     * @tc.desc Verify CharBox set Latin-1 character CHAR_A_GRAVE returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_A_GRAVE);
      expect(ret).assertEqual(CHAR_A_GRAVE);
      expect(box.get()).assertEqual(CHAR_A_GRAVE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1600
     * @tc.name testCharBoxB016
     * @tc.desc Verify CharBox set Latin-1 character CHAR_N_TILDE returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_N_TILDE);
      expect(ret).assertEqual(CHAR_N_TILDE);
      expect(box.get()).assertEqual(CHAR_N_TILDE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1700
     * @tc.name testCharBoxB017
     * @tc.desc Verify CharBox set via helper function setCharBoxValue with CJK char returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = setCharBoxValue(box, c'脑');
      expect(ret).assertEqual(c'脑');
      expect(box.get()).assertEqual(c'脑');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1800
     * @tc.name testCharBoxB018
     * @tc.desc Verify CharBox created via helper createCharBoxWithChar with CJK char returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = createCharBoxWithChar(c'盘');
      let result: char = box.get();
      expect(result).assertEqual(c'盘');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_1900
     * @tc.name testCharBoxB019
     * @tc.desc Verify CharBox value preserved after try-finally execution with CJK char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        box.set(c'标');
      } finally {
      }
      expect(box.get()).assertEqual(c'标');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2000
     * @tc.name testCharBoxB020
     * @tc.desc Verify CharBox value set inside catch block after exception produces correct CJK char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'准');
      }
      expect(box.get()).assertEqual(c'准');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2100
     * @tc.name testCharBoxB021
     * @tc.desc Verify CharBox value set in finally overrides catch block value producing correct CJK char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'音');
      } finally {
        box.set(c'标');
      }
      expect(box.get()).assertEqual(c'标');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2200
     * @tc.name testCharBoxB022
     * @tc.desc Verify CharBox Wrapper class setValue with CJK char updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: CharBoxWrapper = new CharBoxWrapper();
      wrapper.setValue(c'硬');
      expect(wrapper.getValue()).assertEqual(c'硬');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2300
     * @tc.name testCharBoxB023
     * @tc.desc Verify CharBox static factory method with CJK char creates instance with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'闻');
      let result: char = box.get();
      expect(result).assertEqual(c'闻');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2400
     * @tc.name testCharBoxB024
     * @tc.desc Verify CharBox set BMP maximum character CHAR_BMP_MAX returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let ret: char = box.set(CHAR_BMP_MAX);
      expect(ret).assertEqual(CHAR_BMP_MAX);
      expect(box.get()).assertEqual(CHAR_BMP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2500
     * @tc.name testCharBoxB025
     * @tc.desc Verify CharBox chain set with Latin-1 chars c'ó' to c'ú' to c'ó' produces correct final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      box.set(c'ó');
      expect(box.get()).assertEqual(c'ó');
      box.set(c'ú');
      expect(box.get()).assertEqual(c'ú');
      box.set(c'ó');
      expect(box.get()).assertEqual(c'ó');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2600
     * @tc.name testCharBoxB026
     * @tc.desc Verify CharBox value remains correct after 100 repeated set with Latin-1 char c'ã'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let i: int = 0;
      while (i < 100) {
        box.set(c'ã');
        i++;
      }
      expect(box.get()).assertEqual(c'ã');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2700
     * @tc.name testCharBoxB027
     * @tc.desc Verify CharBox value set inside catch block after exception produces correct Latin-1 char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'õ');
      }
      expect(box.get()).assertEqual(c'õ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2800
     * @tc.name testCharBoxB028
     * @tc.desc Verify CharBox value set in finally overrides catch block value with Latin-1 char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'þ');
      } finally {
        box.set(c'ð');
      }
      expect(box.get()).assertEqual(c'ð');
    });

    // ==================== 新增核心维度测试开始 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_2900
     * @tc.name testCharBoxB029
     * @tc.desc Verify CharBox value with Unicode char used in while condition via boolean variable until reaching target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let count: int = 0;
      let notFinished: boolean = box.get() !== CHAR_CJK_HAN;
      while (notFinished) {
        count++;
        if (count == 1) {
          box.set(CHAR_REGISTERED);
        } else if (count == 2) {
          box.set(CHAR_CJK_HAN);
        }
        notFinished = box.get() !== CHAR_CJK_HAN;
      }
      expect(count).assertEqual(2);
      expect(box.get()).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3000
     * @tc.name testCharBoxB030
     * @tc.desc Verify CharBox value set via ternary expression selecting between Unicode chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let flag: boolean = true;
      let selected: char = flag ? CHAR_CJK_HAN : CHAR_COPYRIGHT;
      box.set(selected);
      expect(box.get()).assertEqual(CHAR_CJK_HAN);
      flag = false;
      selected = flag ? CHAR_CJK_HAN : CHAR_COPYRIGHT;
      box.set(selected);
      expect(box.get()).assertEqual(CHAR_COPYRIGHT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3100
     * @tc.name testCharBoxB031
     * @tc.desc Verify CharBox value used in if-conditional branch with Unicode char comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_CJK_HAN);
      let isHan: boolean = box.get() === CHAR_CJK_HAN;
      if (isHan) {
        box.set(CHAR_COPYRIGHT);
      }
      expect(box.get()).assertEqual(CHAR_COPYRIGHT);
      let isCopyright: boolean = box.get() === CHAR_COPYRIGHT;
      if (isCopyright) {
        box.set(CHAR_CJK_GUO);
      }
      expect(box.get()).assertEqual(CHAR_CJK_GUO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3200
     * @tc.name testCharBoxB032
     * @tc.desc Verify relational comparison between Unicode char values from two CharBox instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(CHAR_COPYRIGHT);
      let box2: CharBox = new CharBox(CHAR_CJK_HAN);
      let less: boolean = box1.get() < box2.get();
      expect(less).assertTrue();
      let greater: boolean = box2.get() > box1.get();
      expect(greater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3300
     * @tc.name testCharBoxB033
     * @tc.desc Verify values from two independent CharBox instances with Unicode chars can be compared for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(CHAR_COPYRIGHT);
      let box2: CharBox = new CharBox(CHAR_COPYRIGHT);
      let eq: boolean = box1.get() === box2.get();
      expect(eq).assertTrue();
      box2.set(CHAR_REGISTERED);
      let neq: boolean = box1.get() !== box2.get();
      expect(neq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3400
     * @tc.name testCharBoxB034
     * @tc.desc Verify box.set(box.get()) with Unicode char does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_CJK_HAN);
      let ret: char = box.set(box.get());
      expect(ret).assertEqual(CHAR_CJK_HAN);
      expect(box.get()).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3500
     * @tc.name testCharBoxB035
     * @tc.desc Verify nested set return value chaining with Unicode char matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      let innerRet: char = box.set(CHAR_CJK_HAN);
      let outerRet: char = box.set(innerRet);
      expect(outerRet).assertEqual(CHAR_CJK_HAN);
      expect(box.get()).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3600
     * @tc.name testCharBoxB036
     * @tc.desc Verify multiple CharBox instances created via factory method with Unicode chars remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = CharBox.box(CHAR_COPYRIGHT);
      let box2: CharBox = CharBox.box(CHAR_CJK_HAN);
      box1.set(CHAR_REGISTERED);
      expect(box1.get()).assertEqual(CHAR_REGISTERED);
      expect(box2.get()).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3700
     * @tc.name testCharBoxB037
     * @tc.desc Verify three CharBox instances with Unicode chars in array maintain independent states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: CharBox[] = [new CharBox(CHAR_COPYRIGHT), new CharBox(CHAR_CJK_HAN), new CharBox(CHAR_REGISTERED)];
      expect(boxes[0].get()).assertEqual(CHAR_COPYRIGHT);
      expect(boxes[1].get()).assertEqual(CHAR_CJK_HAN);
      expect(boxes[2].get()).assertEqual(CHAR_REGISTERED);
      boxes[0].set(CHAR_CJK_GUO);
      boxes[2].set(CHAR_CJK_HAN);
      expect(boxes[0].get()).assertEqual(CHAR_CJK_GUO);
      expect(boxes[1].get()).assertEqual(CHAR_CJK_HAN);
      expect(boxes[2].get()).assertEqual(CHAR_CJK_HAN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_2_3800
     * @tc.name testCharBoxB038
     * @tc.desc Verify CharBox value set inside nested try-catch-finally with Unicode chars produces correct final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(CHAR_COPYRIGHT);
      try {
        try {
          let n: int = 0;
          let d: int = 5 / n;
        } catch (e) {
          box.set(CHAR_REGISTERED);
        }
        box.set(CHAR_CJK_HAN);
      } catch (e) {
        box.set(CHAR_PLUS_MINUS);
      } finally {
        box.set(CHAR_BMP_MAX);
      }
      expect(box.get()).assertEqual(CHAR_BMP_MAX);
    });
  });
}
