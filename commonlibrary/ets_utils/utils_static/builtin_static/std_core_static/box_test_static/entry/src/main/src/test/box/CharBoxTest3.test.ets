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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils, { AdvancedCharBoxWrapper, CharBoxWrapper, CjkCharBoxWrapper, NestedCharBox, ValidatingWrapper } from '../Util.test';

function createCharBoxWithDefault(): CharBox {
  return new CharBox(c'X');
}

function doubleStep(ch: char): char {
  return getNextChar(getNextChar(ch));
}

function getCharBoxValue(box: CharBox): char {
  return box.get();
}

function getNextChar(ch: char): char {
  let code: int = ch.toInt() + 1;
  return String.fromCharCode(code).charAt(0);
}

function setCharBoxValue(box: CharBox, val: char): void {
  box.set(val);
}

function toUpperCaseCh(ch: char): char {
  let code: int = ch.toInt();
  if (code >= c'a'.toInt() && code <= c'z'.toInt()) {
    return String.fromCharCode(code - 32).charAt(0);
  }
  return ch;
}

export default function BoxCharBoxTest3(): void {
  describe('BoxCharBoxTest3', ():void => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0100
     * @tc.name testBoxCharBoxTestThree001
     * @tc.desc Verify CharBox(c'!') get returns exclamation mark character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'!');
      expect(box.get()).assertEqual(c'!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0200
     * @tc.name testBoxCharBoxTestThree002
     * @tc.desc Verify CharBox.box(c'A') get returns uppercase letter A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = CharBox.box(c'A');
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0300
     * @tc.name testBoxCharBoxTestThree003
     * @tc.desc Verify nested set(box.set(c'T')) returns c'T' and box holds c'T'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      let outerRet: char = box.set(box.set(c'T'));
      expect(outerRet).assertEqual(c'T');
      expect(box.get()).assertEqual(c'T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0400
     * @tc.name testBoxCharBoxTestThree004
     * @tc.desc Verify sequential set A then B then C leaves box holding c'C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox();
      box.set(c'A');
      box.set(c'B');
      box.set(c'C');
      expect(box.get()).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0500
     * @tc.name testBoxCharBoxTestThree005
     * @tc.desc Verify loop set with char array A-E, each get matches set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = [c'A', c'B', c'C', c'D', c'E'];
      let i: int = 0;
      while (i < chars.length) {
        let box: CharBox = new CharBox();
        let currentChar: char = chars[i];
        box.set(currentChar);
        expect(box.get()).assertEqual(currentChar);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0600
     * @tc.name testBoxCharBoxTestThree006
     * @tc.desc Verify Unicode accented char sequence U+00E1/U+00F3/U+00FA/U+00E3/U+00F1 leaves c'U+00F1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'á');
      box.set(c'ó');
      box.set(c'ú');
      box.set(c'ã');
      box.set(c'ñ');
      expect(box.get()).assertEqual(c'ñ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0700
     * @tc.name testBoxCharBoxTestThree007
     * @tc.desc Verify set return value reuse: set(c'Q') then set(firstResult), secondResult equals c'Q'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'P');
      let firstResult: char = box.set(c'Q');
      expect(firstResult).assertEqual(c'Q');
      expect(box.get()).assertEqual(c'Q');
      let secondResult: char = box.set(firstResult);
      expect(secondResult).assertEqual(c'Q');
      expect(box.get()).assertEqual(c'Q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0800
     * @tc.name testBoxCharBoxTestThree008
     * @tc.desc Verify loop set and get for all 26 uppercase letters A-Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox();
      let i: int = 0;
      while (i < 26) {
        let code: int = c'A'.toInt() + i;
        let ch: char = String.fromCharCode(code).charAt(0);
        box.set(ch);
        expect(box.get()).assertEqual(ch);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_0900
     * @tc.name testBoxCharBoxTestThree009
     * @tc.desc Verify CharBox(c'\x7F') constructor and get return DEL extended ASCII boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\x7F');
      expect(box.get()).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1000
     * @tc.name testBoxCharBoxTestThree010
     * @tc.desc Verify CharBox constructor and get with U+D55C Hangul character 'U+D55C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'한');
      expect(box.get()).assertEqual(c'한');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1100
     * @tc.name testBoxCharBoxTestThree011
     * @tc.desc Verify three independent CharBox instances with distinct values X, Y, Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaultBox: CharBox = new CharBox();
      let firstBox: CharBox = new CharBox();
      let secondBox: CharBox = new CharBox();
      defaultBox.set(c'X'); firstBox.set(c'Y'); secondBox.set(c'Z');
      expect(defaultBox.get()).assertEqual(c'X');
      expect(firstBox.get()).assertEqual(c'Y');
      expect(secondBox.get()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1200
     * @tc.name testBoxCharBoxTestThree012
     * @tc.desc Verify swap of values between CharBox instances preserves correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'A');
      let secondBox: CharBox = new CharBox(c'B');
      let thirdBox: CharBox = new CharBox(c'C');
      let fourthBox: CharBox = new CharBox(c'D');
      expect(firstBox.get()).assertEqual(c'A');
      expect(secondBox.get()).assertEqual(c'B');
      expect(thirdBox.get()).assertEqual(c'C');
      expect(fourthBox.get()).assertEqual(c'D');
      firstBox.set(c'D'); fourthBox.set(c'A');
      expect(firstBox.get()).assertEqual(c'D');
      expect(fourthBox.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1300
     * @tc.name testBoxCharBoxTestThree013
     * @tc.desc Verify copy-by-value semantics between CharBox with U+5305 CJK character 'U+5305'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'包');
      let secondBox: CharBox = new CharBox();
      secondBox.set(firstBox.get());
      expect(secondBox.get()).assertEqual(c'包');
      firstBox.set(c'\0');
      expect(firstBox.get()).assertEqual(c'\0');
      expect(secondBox.get()).assertEqual(c'包');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1400
     * @tc.name testBoxCharBoxTestThree014
     * @tc.desc Verify chain copy of CharBox value through three instances keeps correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'K');
      let secondBox: CharBox = new CharBox();
      let thirdBox: CharBox = new CharBox();
      secondBox.set(firstBox.get());
      thirdBox.set(secondBox.get());
      expect(thirdBox.get()).assertEqual(c'K');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1500
     * @tc.name testBoxCharBoxTestThree015
     * @tc.desc Verify CharBox array with five sequential alphabet values A through E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: CharBox[] = [
        new CharBox(c'A'), new CharBox(c'B'),
        new CharBox(c'C'), new CharBox(c'D'),
        new CharBox(c'E')
      ];
      let expectChars: char[] = [c'A', c'B', c'C', c'D', c'E'];
      let i: int = 0;
      while (i < 5) {
        expect(boxes[i].get()).assertEqual(expectChars[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1600
     * @tc.name testBoxCharBoxTestThree016
     * @tc.desc Verify setCharBoxValue helper function modifies CharBox value to 'G'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      setCharBoxValue(box, c'G');
      expect(box.get()).assertEqual(c'G');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1700
     * @tc.name testBoxCharBoxTestThree017
     * @tc.desc Verify createCharBoxWithDefault factory function returns CharBox with 'X'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = createCharBoxWithDefault();
      expect(box.get()).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1800
     * @tc.name testBoxCharBoxTestThree018
     * @tc.desc Verify getCharBoxValue helper function retrieves CharBox value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'M');
      let result: char = getCharBoxValue(box);
      expect(result).assertEqual(c'M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_1900
     * @tc.name testBoxCharBoxTestThree019
     * @tc.desc Verify toUpperCaseCh converts lowercase 'a' to uppercase 'A' via CharBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'a');
      let upper: char = toUpperCaseCh(box.get());
      box.set(upper);
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2000
     * @tc.name testBoxCharBoxTestThree020
     * @tc.desc Verify CharBoxWrapper getValue and setValue with initial H changed to I
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: CharBoxWrapper = new CharBoxWrapper();
      expect(wrapper.getValue()).assertEqual(c'H');
      wrapper.setValue(c'I');
      expect(wrapper.getValue()).assertEqual(c'I');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2100
     * @tc.name testBoxCharBoxTestThree021
     * @tc.desc Verify NestedCharBox getNested and setNested with initial S changed to T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedCharBox = new NestedCharBox();
      expect(nested.getNested()).assertEqual(c'S');
      nested.setNested(c'T');
      expect(nested.getNested()).assertEqual(c'T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2200
     * @tc.name testBoxCharBoxTestThree022
     * @tc.desc Verify CjkCharBoxWrapper getCjk and setCjk with CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: CjkCharBoxWrapper = new CjkCharBoxWrapper();
      expect(wrapper.getCjk()).assertEqual(c'包');
      wrapper.setCjk(c'箱');
      expect(wrapper.getCjk()).assertEqual(c'箱');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2300
     * @tc.name testBoxCharBoxTestThree023
     * @tc.desc Verify AdvancedCharBoxWrapper isUpperCase detects upper and lower case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let adv: AdvancedCharBoxWrapper = new AdvancedCharBoxWrapper();
      expect(adv.getChar()).assertEqual(c'A');
      expect(adv.isUpperCase()).assertTrue();
      adv.setChar(c'b');
      expect(adv.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2400
     * @tc.name testBoxCharBoxTestThree024
     * @tc.desc Verify ValidatingWrapper getAndValidate and setAndConfirm methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vw: ValidatingWrapper = new ValidatingWrapper();
      expect(vw.getAndValidate(c'X')).assertTrue();
      expect(vw.setAndConfirm(c'Y')).assertTrue();
      expect(vw.getAndValidate(c'Y')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2500
     * @tc.name testBoxCharBoxTestThree025
     * @tc.desc Verify CharBox no-arg constructor returns null char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let box: CharBox = new CharBox();
        expect(box.get()).assertEqual(c'\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2600
     * @tc.name testBoxCharBoxTestThree026
     * @tc.desc Verify CharBox constructor with character A stores A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2700
     * @tc.name testBoxCharBoxTestThree027
     * @tc.desc Verify CharBox set and get returns correct value M
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let box: CharBox = new CharBox();
        box.set(c'M');
        expect(box.get()).assertEqual(c'M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2800
     * @tc.name testBoxCharBoxTestThree028
     * @tc.desc Verify CharBox set in arithmetic error catch block preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      try {
        let x: int = 0;
        let y: int = 1 / x;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
        box.set(c'E');
      }
      expect(box.get()).assertEqual(c'E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_2900
     * @tc.name testBoxCharBoxTestThree029
     * @tc.desc Verify finally block overrides catch block CharBox set to final value 'C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      try {
        let x: int = 0;
        let y: int = 1 / x;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
        box.set(c'B');
      } finally {
        box.set(c'C');
      }
      expect(box.get()).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3000
     * @tc.name testBoxCharBoxTestThree030
     * @tc.desc Verify setCharBoxValue in RangeError catch block updates CharBox to 'F'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        setCharBoxValue(box, c'F');
      }
      expect(box.get()).assertEqual(c'F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3100
     * @tc.name testBoxCharBoxTestThree031
     * @tc.desc Verify 100 sequential set operations on CharBox execute without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let box: CharBox = new CharBox(c'\0');
        let i: int = 0;
        while (i < 100) {
          let code: int = c'A'.toInt() + (i % 26);
          box.set(String.fromCharCode(code).charAt(0));
          i++;
        }
        let left: char = box.get();
        let right: char = String.fromCharCode(c'A'.toInt() + (99 % 26)).charAt(0);
        expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3200
     * @tc.name testBoxCharBoxTestThree032
     * @tc.desc Verify CharBox get inequality returns true for different characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'X');
      expect(box.get()).assertEqual(c'X');
      expect(box.get()).not().assertEqual(c'Y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3300
     * @tc.name testBoxCharBoxTestThree033
     * @tc.desc Verify two CharBox instances with same value X assert equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'X');
      let secondBox: CharBox = new CharBox(c'X');
      expect(firstBox.get()).assertEqual(secondBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3400
     * @tc.name testBoxCharBoxTestThree034
     * @tc.desc Verify uppercase CharBox value A is less than lowercase a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let upper: CharBox = new CharBox(c'A');
      let lower: CharBox = new CharBox(c'a');
      expect(upper.get() < lower.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3500
     * @tc.name testBoxCharBoxTestThree035
     * @tc.desc Verify U+5305 CJK CharBox value is greater than ASCII max character 'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cjk: CharBox = new CharBox(c'包');
      let ascii: CharBox = new CharBox(c'z');
      let result: boolean = cjk.get() > ascii.get();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3600
     * @tc.name testBoxCharBoxTestThree036
     * @tc.desc Verify find minimum value among three CharBox instances C, A, B correctly identifies A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'C');
      let secondBox: CharBox = new CharBox(c'A');
      let thirdBox: CharBox = new CharBox(c'B');
      let min: char = firstBox.get();
      if (secondBox.get() < min) { min = secondBox.get(); }
      if (thirdBox.get() < min) { min = thirdBox.get(); }
      expect(min).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3700
     * @tc.name testBoxCharBoxTestThree037
     * @tc.desc Verify CharBox get in if-condition correctly evaluates equality to 'A'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      expect(box.get()).assertEqual(c'A');
      let result: boolean = false;
      if (box.get() === (c'A')) { result = true; }
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3800
     * @tc.name testBoxCharBoxTestThree038
     * @tc.desc Verify CharBox conditional set converts lowercase 'a' to uppercase 'A'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'a');
      expect(box.get()).assertEqual(c'a');
      if (box.get() === (c'a')) {
        box.set(c'A');
      }
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_3900
     * @tc.name testBoxCharBoxTestThree039
     * @tc.desc Verify CharBox if-else chain classifies 'M' into mid range category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox();
      let val: char = c'M';
      box.set(val);
      let range: string = '';
      expect(box.get()).assertEqual(val);
      if (box.get() < (c'G')) {
        range = 'early';
      }else if (box.get() < (c'S')) {
        range = 'mid';
      }else {
        range = 'late';
      }
      expect(range).assertEqual('mid');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4000
     * @tc.name testBoxCharBoxTestThree040
     * @tc.desc Verify CharBox toInt code range classifies G as uppercase letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'G');
      let code: int = box.get().toInt();
      let isUpper: boolean = code >= c'A'.toInt() && code <= c'Z'.toInt();
      expect(isUpper).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4100
     * @tc.name testBoxCharBoxTestThree041
     * @tc.desc Verify CharBox while loop produces at most 6 iterations from A to F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      expect(box.get()).assertEqual(c'A');
      let cnt: int = 0;
      while (box.get() <= (c'F') && cnt < 10) {
        let code: int = box.get().toInt() + 1;
        box.set(String.fromCharCode(code).charAt(0));
        cnt++;
      }
      expect(cnt).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4200
     * @tc.name testBoxCharBoxTestThree042
     * @tc.desc Verify CharBox lowercase to uppercase conversion via toInt code offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'a');
      expect(box.get()).assertEqual(c'a');
      if (box.get() >= (c'a') && box.get() <= (c'z')) {
        let code: int = box.get().toInt() - 32;
        box.set(String.fromCharCode(code).charAt(0));
      }
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4300
     * @tc.name testBoxCharBoxTestThree043
     * @tc.desc Verify default CharBox null character detected and set to N
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox();
      expect(box.get()).assertEqual(c'\0');
      box.set(c'N');
      expect(box.get()).assertEqual(c'N');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4400
     * @tc.name testBoxCharBoxTestThree044
     * @tc.desc Verify CharBox U+5305 CJK character falls within Unicode CJK range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'包');
      let code: int = box.get().toInt();
      let isCjk: boolean = code >= 0x4E00 && code <= 0x9FFF;
      expect(isCjk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4500
     * @tc.name testBoxCharBoxTestThree045
     * @tc.desc Verify CharBox set same value P twice returns consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'\0');
      box.set(c'P');
      expect(box.get()).assertEqual(c'P');
      box.set(c'P');
      expect(box.get()).assertEqual(c'P');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4600
     * @tc.name testBoxCharBoxTestThree046
     * @tc.desc Verify CharBox sequential set and get with multiple CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cjkChars: char[] = [c'包', c'箱', c'编', c'程', c'测', c'试'];
      let box: CharBox = new CharBox();
      let i: int = 0;
      while (i < cjkChars.length) {
        let currentChar: char = cjkChars[i];
        box.set(currentChar);
        expect(box.get()).assertEqual(currentChar);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4700
     * @tc.name testBoxCharBoxTestThree047
     * @tc.desc Verify CharBox with char MAX boundary via fromCharCode stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxChar: string = String.fromCharCode(65535);
      let maxCharAt = maxChar.charAt(0);
      let box: CharBox = new CharBox(maxCharAt);
      expect(box.get()).assertEqual(maxCharAt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4800
     * @tc.name testBoxCharBoxTestThree048
     * @tc.desc Verify CharBox.set returns the assigned character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let result: char = box.set(c'B');
      expect(result).assertEqual(c'B');
      expect(box.get()).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_4900
     * @tc.name testBoxCharBoxTestThree049
     * @tc.desc Verify CharBox.get can be assigned to a char variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'Q');
      let value: char = box.get();
      expect(value).assertEqual(c'Q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5000
     * @tc.name testBoxCharBoxTestThree050
     * @tc.desc Verify CharBox code conversion returns the expected code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let code: int = box.get().toInt();
      expect(code).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5100
     * @tc.name testBoxCharBoxTestThree051
     * @tc.desc Verify CharBox ternary selects the matching character label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      let result: string = box.get() === c'A' ? 'match' : 'other';
      expect(result).assertEqual('match');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5200
     * @tc.name testBoxCharBoxTestThree052
     * @tc.desc Verify CharBox carriage return survives set and get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(c'\r');
      expect(box.get()).assertEqual(c'\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5300
     * @tc.name testBoxCharBoxTestThree053
     * @tc.desc Verify doubleStep function increments CharBox from A to C
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: CharBox = new CharBox(c'A');
      box.set(doubleStep(box.get()));
      expect(box.get()).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5400
     * @tc.name testBoxCharBoxTestThree054
     * @tc.desc Verify CharBox less-or-equal comparison with equal and larger values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: char = c'F';
      let box: CharBox = new CharBox(val);
      expect(box.get()).assertEqual(val);
      let lessOrEqualToM: boolean = box.get() <= (c'M');
      let lessOrEqualToN: boolean = box.get() <= (c'N');
      expect(lessOrEqualToM).assertTrue();
      expect(lessOrEqualToN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5500
     * @tc.name testBoxCharBoxTestThree055
     * @tc.desc Verify independently set CharBox instances remain equal after same value assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: CharBox = new CharBox(c'A');
      let secondBox: CharBox = new CharBox(c'A');
      firstBox.set(c'B');
      secondBox.set(c'B');
      expect(firstBox.get()).assertEqual(secondBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_CHARBOX_THREE_5600
     * @tc.name testBoxCharBoxTestThree056
     * @tc.desc Verify c'a'.toInt() minus c'A'.toInt() equals 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxCharBoxTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxLower: CharBox = new CharBox(c'a');
      let boxUpper: CharBox = new CharBox(c'A');
      let diff: int = boxLower.get().toInt() - boxUpper.get().toInt();
      expect(diff).assertEqual(32);
    });
  });
}
