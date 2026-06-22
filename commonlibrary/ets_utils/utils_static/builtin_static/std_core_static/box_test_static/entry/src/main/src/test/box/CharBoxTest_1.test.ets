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
import { CHAR_BEL, CHAR_BS, CHAR_TAB, CHAR_LF, CHAR_VT, CHAR_FF, CHAR_CR, CHAR_DEL } from '../Util.test';


class CharBoxWrapper {
  box: CharBox = new CharBox(c'Z');
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

function swapCharValues(box1: CharBox, box2: CharBox): void {
  let temp: char = box1.get();
  box1.set(box2.get());
  box2.set(temp);
}

export default function CharBoxTest_1(): void {
  describe('CharBoxTest_1', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0100
     * @tc.name testCharBoxA001
     * @tc.desc Verify no-arg constructor for CharBox with default value c'\0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox();
      let result: char = box.get();
      expect(result).assertEqual(c'\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0200
     * @tc.name testCharBoxA002
     * @tc.desc Verify parameterized constructor with uppercase letter c'A' for CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let result: char = box.get();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0300
     * @tc.name testCharBoxA003
     * @tc.desc Verify parameterized constructor with digit c'0' for CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'0');
      let result: char = box.get();
      expect(result).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0400
     * @tc.name testCharBoxA004
     * @tc.desc Verify static factory method with exclamation mark c'!' creates instance with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'!');
      let result: char = box.get();
      expect(result).assertEqual(c'!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0500
     * @tc.name testCharBoxA005
     * @tc.desc Verify set uppercase letter c'Z' and get returns c'Z' with matching return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let ret: char = box.set(c'Z');
      expect(ret).assertEqual(c'Z');
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0600
     * @tc.name testCharBoxA006
     * @tc.desc Verify set digit c'9' returns matching return value and get confirms state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'0');
      let ret: char = box.set(c'9');
      expect(ret).assertEqual(c'9');
      expect(box.get()).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0700
     * @tc.name testCharBoxA007
     * @tc.desc Verify set horizontal tab c'\t' stores correctly and get returns matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let ret: char = box.set(c'\t');
      expect(ret).assertEqual(c'\t');
      expect(box.get()).assertEqual(c'\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0800
     * @tc.name testCharBoxA008
     * @tc.desc Verify two CharBox instances with different chars c'A' and c'0' remain independent after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'A');
      let box2: CharBox = new CharBox(c'0');
      expect(box1.get()).assertEqual(c'A');
      expect(box2.get()).assertEqual(c'0');
      box1.set(c'Z');
      box2.set(c'9');
      expect(box1.get()).assertEqual(c'Z');
      expect(box2.get()).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_0900
     * @tc.name testCharBoxA009
     * @tc.desc Verify CharBox set to tilde c'~' after factory creation returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'!');
      let ret: char = box.set(c'~');
      expect(ret).assertEqual(c'~');
      expect(box.get()).assertEqual(c'~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1000
     * @tc.name testCharBoxA010
     * @tc.desc Verify CharBox as method parameter with reference semantics modifies original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      setCharBoxValue(box, c'Z');
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1100
     * @tc.name testCharBoxA011
     * @tc.desc Verify CharBox created via helper function retains correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = createCharBoxWithChar(c'0');
      expect(box.get()).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1200
     * @tc.name testCharBoxA012
     * @tc.desc Verify CharBox as class field via CharBoxWrapper for encapsulation and access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: CharBoxWrapper = new CharBoxWrapper();
      expect(wrapper.getValue()).assertEqual(c'Z');
      wrapper.setValue(c'A');
      expect(wrapper.getValue()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1300
     * @tc.name testCharBoxA013
     * @tc.desc Verify set method return value equals the input character for CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      let ret: char = box.set(c'X');
      expect(ret).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1400
     * @tc.name testCharBoxA014
     * @tc.desc Verify set method overwrites previous value from c'A' to c'Z' correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'Z');
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1500
     * @tc.name testCharBoxA015
     * @tc.desc Verify CharBox value remains correct after 100 repeated set operations with c'M'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      let i: int = 0;
      while (i < 100) {
        box.set(c'M');
        i++;
      }
      expect(box.get()).assertEqual(c'M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1600
     * @tc.name testCharBoxA016
     * @tc.desc Verify CharBox returns latest value during alternating set/get sequence with ASCII chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      expect(box.get()).assertEqual(c'\0');
      box.set(c'A');
      expect(box.get()).assertEqual(c'A');
      box.set(c'B');
      expect(box.get()).assertEqual(c'B');
      box.set(c'A');
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1700
     * @tc.name testCharBoxA017
     * @tc.desc Verify CharBox value preserved as c'X' after try-finally execution with no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      try {
        box.set(c'X');
      } finally {
      }
      expect(box.get()).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1800
     * @tc.name testCharBoxA018
     * @tc.desc Verify set BEL control character c'\x07' stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'\x07');
      expect(box.get()).assertEqual(c'\x07');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_1900
     * @tc.name testCharBoxA019
     * @tc.desc Verify set DEL control character c'\x7F' stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'\x7F');
      expect(box.get()).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2000
     * @tc.name testCharBoxA020
     * @tc.desc Verify set LF control character c'\n' stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'\n');
      expect(box.get()).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2100
     * @tc.name testCharBoxA021
     * @tc.desc Verify CharBox maintains correct state through c'A', c'M', c'Z' three-step chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'M');
      expect(box.get()).assertEqual(c'M');
      box.set(c'Z');
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2200
     * @tc.name testCharBoxA022
     * @tc.desc Verify CharBox maintains correct state through c'T' to c'U' four-step chain with intermediate checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'I');
      expect(box.get()).assertEqual(c'I');
      box.set(c'T');
      expect(box.get()).assertEqual(c'T');
      box.set(c'U');
      expect(box.get()).assertEqual(c'U');
      box.set(c'T');
      expect(box.get()).assertEqual(c'T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2300
     * @tc.name testCharBoxA023
     * @tc.desc Verify CharBox maintains correct state through c'V' to c'W' to c'V' three-step alternating chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'V');
      expect(box.get()).assertEqual(c'V');
      box.set(c'W');
      expect(box.get()).assertEqual(c'W');
      box.set(c'V');
      expect(box.get()).assertEqual(c'V');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2400
     * @tc.name testCharBoxA024
     * @tc.desc Verify CharBox maintains correct state through multiple set cycles with 5 alternating rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'C');
      let i: int = 0;
      while (i < 5) {
        box.set(c'K');
        box.set(c'L');
        i++;
      }
      expect(box.get()).assertEqual(c'L');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2500
     * @tc.name testCharBoxA025
     * @tc.desc Verify CharBox alternates between lowercase letter and digit producing correct final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'D');
      box.set(c'1');
      expect(box.get()).assertEqual(c'1');
      box.set(c'a');
      expect(box.get()).assertEqual(c'a');
      box.set(c'#');
      expect(box.get()).assertEqual(c'#');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2600
     * @tc.name testCharBoxA026
     * @tc.desc Verify CharBox set via helper function setCharBoxValue returns correct character and updates state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'I');
      let ret: char = setCharBoxValue(box, c'N');
      expect(ret).assertEqual(c'N');
      expect(box.get()).assertEqual(c'N');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2700
     * @tc.name testCharBoxA027
     * @tc.desc Verify CharBox created via helper function createCharBoxWithChar returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = createCharBoxWithChar(c'O');
      let result: char = box.get();
      expect(result).assertEqual(c'O');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2800
     * @tc.name testCharBoxA028
     * @tc.desc Verify CharBox value preserved after try-catch-finally execution with no exception thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'J');
      let caught = false;
      try {
        box.set(c'P');
      } catch (e) {
        caught = true;
      } finally {
        expect(caught).assertFalse();
        expect(box.get()).assertEqual(c'P');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_2900
     * @tc.name testCharBoxA029
     * @tc.desc Verify CharBox value set inside catch block after arithmetic exception produces correct char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'K');
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'Q');
      }
      expect(box.get()).assertEqual(c'Q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3000
     * @tc.name testCharBoxA030
     * @tc.desc Verify CharBox value set in finally overrides catch block value after exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'L');
      try {
        let n: int = 0;
        let d: int = 5 / n;
      } catch (e) {
        box.set(c'R');
      } finally {
        box.set(c'S');
      }
      expect(box.get()).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3100
     * @tc.name testCharBoxA031
     * @tc.desc Verify CharBox set backspace control character CHAR_BS stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'N');
      let ret: char = box.set(CHAR_BS);
      expect(ret).assertEqual(CHAR_BS);
      expect(box.get()).assertEqual(CHAR_BS);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3200
     * @tc.name testCharBoxA032
     * @tc.desc Verify CharBox set vertical tab control character CHAR_VT stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'O');
      let ret: char = box.set(CHAR_VT);
      expect(ret).assertEqual(CHAR_VT);
      expect(box.get()).assertEqual(CHAR_VT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3300
     * @tc.name testCharBoxA033
     * @tc.desc Verify CharBox set form feed control character CHAR_FF stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'P');
      let ret: char = box.set(CHAR_FF);
      expect(ret).assertEqual(CHAR_FF);
      expect(box.get()).assertEqual(CHAR_FF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3400
     * @tc.name testCharBoxA034
     * @tc.desc Verify CharBox set carriage return control character CHAR_CR stores and retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'Q');
      let ret: char = box.set(CHAR_CR);
      expect(ret).assertEqual(CHAR_CR);
      expect(box.get()).assertEqual(CHAR_CR);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3500
     * @tc.name testCharBoxA035
     * @tc.desc Verify CharBox swap operation between two instances exchanges values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c',');
      let box2: CharBox = new CharBox(c'-');
      expect(box1.get()).assertEqual(c',');
      expect(box2.get()).assertEqual(c'-');
      swapCharValues(box1, box2);
      expect(box1.get()).assertEqual(c'-');
      expect(box2.get()).assertEqual(c',');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3600
     * @tc.name testCharBoxA036
     * @tc.desc Verify CharBox static factory method with equals sign c'=' creates instance with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'=');
      let result: char = box.get();
      expect(result).assertEqual(c'=');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3700
     * @tc.name testCharBoxA037
     * @tc.desc Verify CharBox set left square bracket c'[' returns correct value and get confirms state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'_');
      let ret: char = box.set(c'[');
      expect(ret).assertEqual(c'[');
      expect(box.get()).assertEqual(c'[');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3800
     * @tc.name testCharBoxA038
     * @tc.desc Verify CharBox alternates between less-than c'<' and greater-than c'>' producing correct final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'"');
      box.set(c'<');
      expect(box.get()).assertEqual(c'<');
      box.set(c'>');
      expect(box.get()).assertEqual(c'>');
      box.set(c'<');
      expect(box.get()).assertEqual(c'<');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_3900
     * @tc.name testCharBoxA039
     * @tc.desc Verify CharBox static factory method with SOH control character c'\x01' creates instance with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'\x01');
      let result: char = box.get();
      expect(result).assertEqual(c'\x01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4000
     * @tc.name testCharBoxA040
     * @tc.desc Verify CharBox value preserved as c'?' after try-finally execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'<');
      try {
        box.set(c'?');
      } finally {
      }
      expect(box.get()).assertEqual(c'?');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4100
     * @tc.name testCharBoxA041
     * @tc.desc Verify CharBox maintains correct state through at-sign c'@' to backtick c'`' three-step chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'>');
      box.set(c'@');
      expect(box.get()).assertEqual(c'@');
      box.set(c'`');
      expect(box.get()).assertEqual(c'`');
      box.set(c'@');
      expect(box.get()).assertEqual(c'@');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4200
     * @tc.name testCharBoxA042
     * @tc.desc Verify CharBox value remains correct after 100 repeated set operations with STX control c'\x02'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'?');
      let i: int = 0;
      while (i < 100) {
        box.set(c'\x02');
        i++;
      }
      expect(box.get()).assertEqual(c'\x02');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4300
     * @tc.name testCharBoxA043
     * @tc.desc Verify CharBox parameterized constructor with space character c'\x20' returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\x20');
      let result: char = box.get();
      expect(result).assertEqual(c'\x20');
    });

    // ==================== 新增核心维度测试开始 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4400
     * @tc.name testCharBoxA044
     * @tc.desc Verify CharBox value used in while condition via boolean variable, advancing from 'A' to 'D' then terminates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let count: int = 0;
      let notFinished: boolean = box.get() !== c'D';
      while (notFinished) {
        count++;
        if (count == 1) {
          box.set(c'B');
        } else if (count == 2) {
          box.set(c'C');
        } else if (count == 3) {
          box.set(c'D');
        }
        notFinished = box.get() !== c'D';
      }
      expect(count).assertEqual(3);
      expect(box.get()).assertEqual(c'D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4500
     * @tc.name testCharBoxA045
     * @tc.desc Verify CharBox value set via ternary expression selecting between two chars based on boolean flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      let flag: boolean = true;
      let selected: char = flag ? c'A' : c'Z';
      box.set(selected);
      expect(box.get()).assertEqual(c'A');
      flag = false;
      selected = flag ? c'A' : c'Z';
      box.set(selected);
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4600
     * @tc.name testCharBoxA046
     * @tc.desc Verify CharBox value used in if-conditional branch executes set correctly when condition matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let isA: boolean = box.get() === c'A';
      if (isA) {
        box.set(c'Z');
      }
      expect(box.get()).assertEqual(c'Z');
      let isZ: boolean = box.get() === c'Z';
      if (isZ) {
        box.set(c'M');
      }
      expect(box.get()).assertEqual(c'M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4700
     * @tc.name testCharBoxA047
     * @tc.desc Verify relational comparison between values of two independent CharBox instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'A');
      let box2: CharBox = new CharBox(c'Z');
      let less: boolean = box1.get() < box2.get();
      expect(less).assertTrue();
      let greater: boolean = box2.get() > box1.get();
      expect(greater).assertTrue();
      box1.set(c'M');
      box2.set(c'B');
      let afterSet: boolean = box1.get() > box2.get();
      expect(afterSet).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4800
     * @tc.name testCharBoxA048
     * @tc.desc Verify values from two independent CharBox instances can be compared for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'X');
      let box2: CharBox = new CharBox(c'X');
      let eq: boolean = box1.get() === box2.get();
      expect(eq).assertTrue();
      box2.set(c'Y');
      let neq: boolean = box1.get() !== box2.get();
      expect(neq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_4900
     * @tc.name testCharBoxA049
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'M');
      let ret: char = box.set(box.get());
      expect(ret).assertEqual(c'M');
      expect(box.get()).assertEqual(c'M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5000
     * @tc.name testCharBoxA050
     * @tc.desc Verify nested set return value chaining matches expected char from outer set call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let innerRet: char = box.set(c'Z');
      let outerRet: char = box.set(innerRet);
      expect(outerRet).assertEqual(c'Z');
      expect(box.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5100
     * @tc.name testCharBoxA051
     * @tc.desc Verify multiple CharBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = CharBox.box(c'A');
      let box2: CharBox = CharBox.box(c'Z');
      box1.set(c'B');
      expect(box1.get()).assertEqual(c'B');
      expect(box2.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5200
     * @tc.name testCharBoxA052
     * @tc.desc Verify CharBox with NUL character c'\0' via set operations preserves value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'\0');
      expect(box.get()).assertEqual(c'\0');
      let ret: char = box.set(c'\0');
      expect(ret).assertEqual(c'\0');
      expect(box.get()).assertEqual(c'\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5300
     * @tc.name testCharBoxA053
     * @tc.desc Verify set return value from one CharBox used as input to another CharBox set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'A');
      let box2: CharBox = new CharBox(c'0');
      let ret: char = box1.set(c'Z');
      box2.set(ret);
      expect(box2.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5400
     * @tc.name testCharBoxA054
     * @tc.desc Verify four independent CharBox instances maintain correct values without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'A');
      let box2: CharBox = new CharBox(c'B');
      let box3: CharBox = new CharBox(c'C');
      let box4: CharBox = new CharBox(c'D');
      box1.set(c'Z');
      box3.set(c'X');
      expect(box1.get()).assertEqual(c'Z');
      expect(box2.get()).assertEqual(c'B');
      expect(box3.get()).assertEqual(c'X');
      expect(box4.get()).assertEqual(c'D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5500
     * @tc.name testCharBoxA055
     * @tc.desc Verify CharBox instances in array maintain independent states through multiple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: CharBox[] = [new CharBox(c'A'), new CharBox(c'B'), new CharBox(c'C')];
      expect(boxes[0].get()).assertEqual(c'A');
      expect(boxes[1].get()).assertEqual(c'B');
      expect(boxes[2].get()).assertEqual(c'C');
      boxes[0].set(c'X');
      boxes[2].set(c'Z');
      expect(boxes[0].get()).assertEqual(c'X');
      expect(boxes[1].get()).assertEqual(c'B');
      expect(boxes[2].get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5600
     * @tc.name testCharBoxA056
     * @tc.desc Verify CharBox value propagates through nested try-finally to outer catch then outer finally executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      try {
        try {
          let n: int = 0;
          let d: int = 5 / n;
        } finally {
          box.set(c'B');
        }
      } catch (e) {
        box.set(c'C');
      } finally {
        box.set(c'D');
      }
      expect(box.get()).assertEqual(c'D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5700
     * @tc.name testCharBoxA057
     * @tc.desc Verify CharBox value remains correct after 32 alternating set operations between two chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'M');
      let i: int = 0;
      while (i < 32) {
        if (i < 16) {
          box.set(c'N');
        } else {
          box.set(c'O');
        }
        i++;
      }
      expect(box.get()).assertEqual(c'O');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_BOX_1_5800
     * @tc.name testCharBoxA058
     * @tc.desc Verify chained value assignment across three CharBox instances propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharBoxA058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: CharBox = new CharBox(c'A');
      let box2: CharBox = new CharBox(c'B');
      let box3: CharBox = new CharBox(c'C');
      box1.set(c'X');
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box1.get()).assertEqual(c'X');
      expect(box2.get()).assertEqual(c'X');
      expect(box3.get()).assertEqual(c'X');
    });
  });
}
