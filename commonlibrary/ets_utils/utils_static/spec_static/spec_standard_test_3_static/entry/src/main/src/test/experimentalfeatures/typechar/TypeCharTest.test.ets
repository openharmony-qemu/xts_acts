/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


function fooCharVal(c: boolean, p: char, q: char): char {
    return c ? p : q
}

function fooCharRef(c: boolean, p: Char, q: Char): Char {
    return c ? p : q
}

// Helper to get char code from Char or char value
function getCharCode(c: Char): int {
  return (c.toString()).charCodeAt(0) as int
}

export default function TypeCharTest():void {
  describe('TypeCharTest', () => {
    describe('StaticInitializationTest', () => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })

      beforeEach(async () => {
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
        await sleep(30);
      })

      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })

      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })


    /**
     * @tc.number    SUB_TYPE_CHAR_LITERALS_0100
     * @tc.name      testCharLiterals0001
     * @tc.desc      Correct char literals - escaped characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharLiterals0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let escaped_chars: Char[] = [c'\b', c'\f', c'\n', c'\r', c'\t', c'\v', c'\\', c'\'', c'\"']
      let escaped_vals: int[] = [8, 12, 10, 13, 9, 11, 92, 39, 34]
      for (let i = 0; i < escaped_chars.length; i++) {
        expect(getCharCode(escaped_chars[i])).assertEqual(escaped_vals[i])
      }
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_LITERALS_0200
     * @tc.name      testCharLiterals0002
     * @tc.desc      Correct char literals - hex-formatted characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharLiterals0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex_chars: Char[] = [c'\x00', c'\x01', c'\x02', c'\x03', c'\x04', c'\x05', c'\x06', c'\x07',
          c'\x08', c'\x09', c'\x0a', c'\x0b', c'\x0c', c'\x0d', c'\x0e', c'\x0f',
          c'\x10', c'\x11', c'\x12', c'\x13', c'\x14', c'\x15', c'\x16', c'\x17', c'\x18',
          c'\x19', c'\x1a', c'\x1b', c'\x1c', c'\x1d', c'\x1e', c'\x1f', c'\x20', c'\x21',
          c'\x22', c'\x23', c'\x24', c'\x25', c'\x26', c'\x27', c'\x28', c'\x29', c'\x2a',
          c'\x2b', c'\x2c', c'\x2d', c'\x2e', c'\x2f', c'\x30', c'\x31', c'\x32', c'\x33',
          c'\x34', c'\x35', c'\x36', c'\x37', c'\x38', c'\x39', c'\x3a', c'\x3b', c'\x3c',
          c'\x3d', c'\x3e', c'\x3f', c'\x40', c'\x41', c'\x42', c'\x43', c'\x44', c'\x45',
          c'\x46', c'\x47', c'\x48', c'\x49', c'\x4a', c'\x4b', c'\x4c', c'\x4d', c'\x4e',
          c'\x4f', c'\x50', c'\x51', c'\x52', c'\x53', c'\x54', c'\x55', c'\x56', c'\x57',
          c'\x58', c'\x59', c'\x5a', c'\x5b', c'\x5c', c'\x5d', c'\x5e', c'\x5f', c'\x60',
          c'\x61', c'\x62', c'\x63', c'\x64', c'\x65', c'\x66', c'\x67', c'\x68', c'\x69',
          c'\x6a', c'\x6b', c'\x6c', c'\x6d', c'\x6e', c'\x6f', c'\x70', c'\x71', c'\x72',
          c'\x73', c'\x74', c'\x75', c'\x76', c'\x77', c'\x78', c'\x79', c'\x7a', c'\x7b',
          c'\x7c', c'\x7d', c'\x7e', c'\x7f']
      for (let i = 0; i < 128; i++) {
        expect(getCharCode(hex_chars[i])).assertEqual(i)
      }
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_LITERALS_0300
     * @tc.name      testCharLiterals0003
     * @tc.desc      Correct char literals - unicode-formatted characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharLiterals0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicode_chars: Char[] = [c'\u0041', c'\u0429', c'\u0811', c'\u0bf9', c'\u0fe1', c'\u13c9',
          c'\u17b1', c'\u1b99', c'\u1f81', c'\u2369', c'\u2751', c'\u2b39', c'\u2f21', c'\u3309',
          c'\u36f1', c'\u3ad9', c'\u3ec1', c'\u42a9', c'\u4691', c'\u4a79', c'\u4e61', c'\u5249',
          c'\u5631', c'\u5a19', c'\u5e01', c'\u61e9', c'\u65d1', c'\u69b9', c'\u6da1', c'\u7189',
          c'\u7571', c'\u7959', c'\u7d41', c'\u8129', c'\u8511', c'\u88f9', c'\u8ce1', c'\u90c9',
          c'\u94b1', c'\u9899', c'\u9c81', c'\ua069', c'\ua451', c'\ua839', c'\uac21', c'\ub009',
          c'\ub3f1', c'\ub7d9', c'\ubbc1', c'\ubfa9', c'\uc391', c'\uc779', c'\ucb61', c'\ucf49',
          c'\ud331', c'\ud719', c'\udb01', c'\udee9', c'\ue2d1', c'\ue6b9', c'\ueaa1', c'\uee89',
          c'\uf271', c'\uf659', c'\ufa41', c'\ufe29', c'\uffff']
      let j = 0;
      for (let i = 65; i < 65536; i += 1000) {
        expect(getCharCode(unicode_chars[j++])).assertEqual(i)
      }
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_LITERALS_0400
     * @tc.name      testCharLiterals0004
     * @tc.desc      Char literals spec examples
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharLiterals0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = c'a'
      let c2 = c'\n'
      let c3 = c'\x7F'
      let c4 = c'\u0000'
      let c5 = c'\uffff'

      let c1b = new Char(c1)
      let c2b = new Char(c2)
      let c3b = new Char(c3)
      let c4b = new Char(c4)
      let c5b = new Char(c5)

      expect(c1b.equals(c1)).assertTrue()
      expect(c2b.equals(c2)).assertTrue()
      expect(c3b.equals(c3)).assertTrue()
      expect(c4b.equals(c4)).assertTrue()
      expect(c5b.equals(c5)).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_CMP_VAL_0100
     * @tc.name      testCharCmpVal0001
     * @tc.desc      Comparison operators on char values - equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCmpVal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: char = c'\u0000'
      const v2: char = c'\u0000'
      expect(v1 == v2).assertTrue()
      expect(v1 === v2).assertTrue()
      expect(v1 != v2).assertFalse()
      expect(v1 !== v2).assertFalse()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_CMP_VAL_0200
     * @tc.name      testCharCmpVal0002
     * @tc.desc      Comparison operators on char values - not equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCmpVal0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: char = c'A'
      const v2: char = c'B'
      expect(v1 == v2).assertFalse()
      expect(v1 === v2).assertFalse()
      expect(v1 != v2).assertTrue()
      expect(v1 !== v2).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_CMP_REF_0100
     * @tc.name      testCharCmpRef0001
     * @tc.desc      Comparison operators on Char objects - equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCmpRef0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Char = new Char(c'\u0000')
      const v2: Char = new Char(c'\u0000')
      expect(v1 == v2).assertTrue()
      expect(v1 === v2).assertTrue()
      expect(v1 != v2).assertFalse()
      expect(v1 !== v2).assertFalse()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_CMP_REF_0200
     * @tc.name      testCharCmpRef0002
     * @tc.desc      Comparison operators on Char objects - not equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCmpRef0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Char = new Char(c'A')
      const v2: Char = new Char(c'B')
      expect(v1 == v2).assertFalse()
      expect(v1 === v2).assertFalse()
      expect(v1 != v2).assertTrue()
      expect(v1 !== v2).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_VAL_0100
     * @tc.name      testCharCondVal0001
     * @tc.desc      Conditional operator on char values - returns first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondVal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: char = c'\u0020'
      const v2: char = c'\u0021'
      const result: char = fooCharVal(true, v1, v2)
      expect(getCharCode(new Char(result))).assertEqual(32)
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_VAL_0200
     * @tc.name      testCharCondVal0002
     * @tc.desc      Conditional operator on char values - returns second
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondVal0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: char = c'\u0020'
      const v2: char = c'\u0021'
      const result: char = fooCharVal(false, v1, v2)
      expect(getCharCode(new Char(result))).assertEqual(33)
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_VAL_0300
     * @tc.name      testCharCondVal0003
     * @tc.desc      Conditional operator on char values with various chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondVal0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: char = c'A'
      const v2: char = c'Z'
      const result1: char = fooCharVal(true, v1, v2)
      const result2: char = fooCharVal(false, v1, v2)
      expect(getCharCode(new Char(result1))).assertEqual(65)
      expect(getCharCode(new Char(result2))).assertEqual(90)
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_REF_0100
     * @tc.name      testCharCondRef0001
     * @tc.desc      Conditional operator on Char objects - returns first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondRef0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Char = new Char(c'A')
      const v2: Char = new Char(c'B')
      expect(fooCharRef(true, v1, v2).equals(v1)).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_REF_0200
     * @tc.name      testCharCondRef0002
     * @tc.desc      Conditional operator on Char objects - returns second
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondRef0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Char = new Char(c'A')
      const v2: Char = new Char(c'B')
      expect(fooCharRef(false, v1, v2).equals(v2)).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_CHAR_COND_REF_0300
     * @tc.name      testCharCondRef0003
     * @tc.desc      Conditional operator on Char objects with various chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCharCondRef0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Char = new Char(c'A')
      const v2: Char = new Char(c'Z')
      expect(getCharCode(fooCharRef(true, v1, v2))).assertEqual(65)
      expect(getCharCode(fooCharRef(false, v1, v2))).assertEqual(90)
    });
    })
  })
}
