'use static';
﻿/*
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { util, LinkedList } from '@kit.ArkTS';
import Utils from '../Util.test';


interface testObject_S {
  strings: string[]
  numbers: number[]
  boolArr: boolean[]
}

interface testObject {
  strProp: string,
  numProp: number,
  boolProp: boolean,
  objProp: testObject_S,
  fnProp: Function,
  arrayBuffer: ArrayBuffer,
  dataView: DataView,
  undefProp: undefined,
  nullProp: null,
  naN: number,
  infinity: number,
  uint8Array: Uint8Array,
  map: Map<string, string>,
  setProp: Set<number>,
  promise: Promise<string>,
  regex: RegExp
}

interface TextObj18_60 {
  a: number;
  b: string;
  c: number[];
}

interface TextObj18_61 {
  d: number;
  e: TextObj18_60;
}

interface TextObj18_62 {
  a: number;
  b: Function;
}

interface TextObj18_64 {
  buffer: ArrayBuffer;
}

interface TextObj18_65 {
  view: DataView;
}

interface TextObj18_66 {}

export default function LinkedListTest18(): void {
  describe('LinkedListTest18', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0100
     * @tc.name      testLinkedList18Chapter0001
     * @tc.desc      Test Array: TypedArray special value storage after add/replace at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<
      Float32Array | Float64Array | Int8Array | Uint8Array | Uint8ClampedArray |
      Int16Array | Uint16Array | Int32Array | Uint32Array
      >()

      const text1 = new Float32Array([Infinity, -Infinity, NaN])
      const text2 = new Float64Array([Infinity, -Infinity, NaN])
      const text3 = new Int8Array([Infinity, -Infinity, NaN])
      const text4 = new Uint8Array([Infinity, -Infinity, NaN])
      const text5 = new Uint8ClampedArray([Infinity, -Infinity, NaN])
      const text6 = new Int16Array([Infinity, -Infinity, NaN])
      const text7 = new Uint16Array([Infinity, -Infinity, NaN])
      const text8 = new Int32Array([Infinity, -Infinity, NaN])

      newLinkedList.add(new Float32Array([]))
      newLinkedList.set(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.add(new Float64Array([]))
      newLinkedList.set(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.add(new Int8Array([]))
      newLinkedList.set(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
      newLinkedList.add(new Uint8ClampedArray([]))
      newLinkedList.set(4,text5)
      expect(newLinkedList.get(4)).assertEqual(text5)
      newLinkedList.add(new Int16Array([]))
      newLinkedList.set(5,text6)
      expect(newLinkedList.get(5)).assertEqual(text6)
      newLinkedList.add(new Uint16Array([]))
      newLinkedList.set(6,text7)
      expect(newLinkedList.get(6)).assertEqual(text7)
      newLinkedList.add(new Int32Array([]))
      newLinkedList.set(7,text8)
      expect(newLinkedList.get(7)).assertEqual(text8)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0200
     * @tc.name      testLinkedList18Chapter0002
     * @tc.desc      Test: String basic char instances → array conversion & result verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0002';
      console.log(TAG + ' start');
      const newLinkedList = new LinkedList<string | undefined | null>();
      const textString: (string | undefined | null)[] = [
        undefined, null, "", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".",
        "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~", "0",
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c",
        "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "!!", "\"\"", "##", "$$", "%%", "&&", "''", "(())", "**", "++", ",,", "--",
        "..", "//", "::", ";;", "<<", "==", ">>", "??", "@@", "[[", "\\\\", "]]", "^^", "__", "``", "{{",
        "||", "}}", "~~",
      ];

      for (let i of textString){
        expect(newLinkedList.add(i)).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textString.length)
      newLinkedList.forEach((value: string | undefined | null, index: int, _linkedList: LinkedList<string | undefined | null>): void => {
        expect(newArray[index]).assertEqual(value)
        expect(newArray[index]).assertEqual(textString[index])
      })
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0300
     * @tc.name      testLinkedList18Chapter0003
     * @tc.desc      Test: String special escape char instances → array conversion & result verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textEscape = [
        "\a", "\b", "\f", "\n", "\r", "\t", "\v", "\\", "\'", "\"", "\?", "\0", "\d", "\x31"
      ]

      for (let i of textEscape){
        expect(newLinkedList.add(i)).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textEscape.length)
      newLinkedList.forEach((value: string, index: int, _linkedList: LinkedList<string>): void => {
        expect(newArray[index]).assertEqual(value)
        expect(newArray[index]).assertEqual(textEscape[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0400
     * @tc.name      testLinkedList18Chapter0004
     * @tc.desc      Test converting string-type emojis and their Unicode encoding instances to arrays and verify
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textUnicode = [
        "👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴",
        `\ud83d\udc46`, `\ud83d\udc7f`, `\ud83d\udc40`, `\ud83d\udcaf`, `\ud83c\udf85`,
        `\ud83d\ude3c`, `\ud83d\udd27`, `\ud83d\udc87`, `\ud83e\udd3c\u200d\u2642\ufe0f`,
        `\ud83d\udee2`, `\ud83c\udc04`, `\ud83c\udff4`
      ]

      for (let i of textUnicode){
        expect(newLinkedList.add(i)).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textUnicode.length)
      newLinkedList.forEach((value: string, index: int, _linkedList: LinkedList<string>): void => {
        expect(newArray[index]).assertEqual(value)
        expect(newArray[index]).assertEqual(textUnicode[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0500
     * @tc.name      testLinkedList18Chapter0005
     * @tc.desc      Test converting string-type illegal Unicode encodings and keyword instances to arrays and verify
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textIllegal = [
        `\udc04`, `\ud83d`, `\udff4`, "0", "NaN", "“", "”"
      ]

      for (let i of textIllegal){
        expect(newLinkedList.add(i)).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textIllegal.length)
      newLinkedList.forEach((value: string, index: int, _linkedList: LinkedList<string>): void => {
        expect(newArray[index]).assertEqual(value)
        expect(newArray[index]).assertEqual(textIllegal[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0600
     * @tc.name      testLinkedList18Chapter0006
     * @tc.desc      Test converting instances of all number-type elements to arrays and verify
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number | undefined>()
      const textNumber: (number | undefined)[] = [
        0, undefined, NaN, -0, Infinity, -Infinity, Math.floor(1.5), 1.7976931348623157e+308,
        5e-324, 2.220446049250313e-16, Number(9007199254740991n), -128, 64, 127, -32768, 16384,
        32767, -2147483648, 1073741824, 2147483647, Number(-9223372036854775808n), Number(4611686018427387904n),
        Number(9223372036854775807n), -1.40129846432481707e-45, 1.7014117331926443e+38, 3.40282346638528860e+38,
        1.40129846432481707e-45, -1.7014117331926443e+38, -3.40282346638528860e+38,
        -4.94065645841246544e-324, 8.9884656743115785e+307, 1.79769313486231570e+308,
        4.94065645841246544e-324, -8.9884656743115785e+307, -1.79769313486231570e+308,
        0, 32768, 65535, Number(BigInt("0xdecafafecacefade")), 123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3,
        8, 1000, 0.025, Number(9007199254740991n)
      ];

      for (let i of textNumber){
        expect(newLinkedList.add(i)).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textNumber.length)
      newLinkedList.forEach((value: number | undefined, index: int, _linkedList: LinkedList<number | undefined>): void => {
        if (value !== undefined && Number.isNaN(value)) {
          expect(newArray[index]).assertNaN()
        }else {
          expect(newArray[index]).assertEqual(value)
          expect(newArray[index]).assertEqual(textNumber[index])
        }
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0700
     * @tc.name      testLinkedList18Chapter0007
     * @tc.desc      Test converting instances of all Boolean-type elements to arrays and verify
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()
      const textBoolean: (boolean | number | string | null | undefined)[] = [
        true, false, 0, NaN, "", null, undefined, !'s', !0
      ]

      for (let i of textBoolean){
        expect(newLinkedList.add(Boolean(i))).assertTrue()
      }
      const newArray = newLinkedList.convertToArray()
      expect(Array.isArray(newArray)).assertTrue()
      expect(newArray.length).assertEqual(textBoolean.length)
      newLinkedList.forEach((value: boolean, index: int, _linkedList: LinkedList<boolean>): void => {
        expect(newArray[index]).assertEqual(value)
        expect(newArray[index]).assertEqual(Boolean(textBoolean[index]))
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0800
     * @tc.name      testLinkedList18Chapter0008
     * @tc.desc      Test converting instances of all object-type elements to arrays and verify
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList18Chapter0008';
      console.log(TAG + ' start');

      const textRegex = new RegExp("abc", "gi")
      let isResolved = false;
      const testPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          isResolved = true;
          resolve('done');
        }, 100);
      });

      const newLinkedList = new LinkedList<testObject>()
      const textObject: testObject = {
        strProp: "homo",
        numProp: 114514,
        boolProp: true,
        objProp: {
          strings: ["a", "b", "c"],
          numbers: [1, 2, 3],
          boolArr: [true, false]
        },
        fnProp: (): boolean => { return true },
        arrayBuffer: new ArrayBuffer(16),
        dataView: new DataView(new ArrayBuffer(16)),
        undefProp: undefined,
        nullProp: null,
        naN: NaN,
        infinity: Infinity,
        uint8Array: new Uint8Array([72, 101, 108, 108, 111]),
        map: new Map<string, string>([['key1', 'value1'], ['key2', 'value2']]),
        setProp: new Set<number>([1, 2, 3, 2, 1]),
        promise: testPromise,
        regex: textRegex,
      }

      expect(newLinkedList.add(textObject)).assertTrue()


      const newArray = newLinkedList.convertToArray()
      expect(newArray.length).assertEqual(1)

      const newObject: testObject = newArray[0];
      expect(newObject.strProp).assertEqual("homo")
      expect(newObject.numProp).assertEqual(114514)
      expect(newObject.boolProp).assertTrue()
      expect(newObject.objProp.strings[0]).assertEqual("a")
      expect(newObject.objProp.strings[1]).assertEqual("b")
      expect(newObject.objProp.strings[2]).assertEqual("c")
      expect(newObject.objProp.numbers[0]).assertEqual(1)
      expect(newObject.objProp.numbers[1]).assertEqual(2)
      expect(newObject.objProp.numbers[2]).assertEqual(3)
      expect(newObject.objProp.boolArr[0]).assertTrue()
      expect(newObject.objProp.boolArr[1]).assertFalse()
      expect((newObject.fnProp as () => boolean)()).assertTrue()
      expect(newObject.arrayBuffer instanceof ArrayBuffer).assertTrue()
      expect(newObject.dataView.buffer instanceof ArrayBuffer).assertTrue()
      expect(newObject.undefProp).assertUndefined()
      expect(newObject.nullProp).assertNull()
      expect(newObject.naN).assertNaN()
      expect(newObject.infinity).assertEqual(Infinity)
      expect(newObject.uint8Array[0]).assertEqual(72)
      expect(newObject.uint8Array[1]).assertEqual(101)
      expect(newObject.uint8Array[2]).assertEqual(108)
      expect(newObject.uint8Array[3]).assertEqual(108)
      expect(newObject.uint8Array[4]).assertEqual(111)
      expect(newObject.map.get("key1")).assertEqual("value1")
      expect(newObject.map.get("key2")).assertEqual("value2")
      expect(newObject.setProp.has(1)).assertTrue()
      expect(newObject.setProp.has(2)).assertTrue()
      expect(newObject.setProp.has(3)).assertTrue()
      expect(newObject.setProp.has(4)).assertFalse()
      expect(isResolved).assertFalse()
      let result = ''
      result = await newObject.promise
      expect(isResolved).assertTrue()
      expect(result).assertEqual('done')
      expect(newObject.regex.test("ABC")).assertTrue()
      expect(newObject.regex.test("abd")).assertFalse()
      expect(newObject.regex.flags).assertEqual("gi")
      expect(newObject.regex.global).assertTrue()
      expect(newObject.regex.ignoreCase).assertTrue()
      expect(newObject.regex.source).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_0900
     * @tc.name      testLinkedList18Chapter0009
     * @tc.desc      Test getting undefined of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string | undefined>()
      const test: string | undefined = undefined
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });
    
    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1000
     * @tc.name      testLinkedList18Chapter0010
     * @tc.desc      Test getting null of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string | null>()
      const test: string | null = null
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1100
     * @tc.name      testLinkedList18Chapter0011
     * @tc.desc      Test getting empty string of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1200
     * @tc.name      testLinkedList18Chapter0012
     * @tc.desc      Test full coverage of special characters of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1300
     * @tc.name      testLinkedList18Chapter0013
     * @tc.desc      Test full coverage of ASCII codes of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1400
     * @tc.name      testLinkedList18Chapter0014
     * @tc.desc      Test full coverage of special characters of String type at the beginning (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1500
     * @tc.name      testLinkedList18Chapter0015
     * @tc.desc      Test getting special escape characters of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add("\a")).assertTrue()
      expect(newLinkedList.add("\b")).assertTrue()
      expect(newLinkedList.add("\f")).assertTrue()
      expect(newLinkedList.add("\n")).assertTrue()
      expect(newLinkedList.add("\r")).assertTrue()
      expect(newLinkedList.add("\t")).assertTrue()
      expect(newLinkedList.add("\v")).assertTrue()
      expect(newLinkedList.add("\\")).assertTrue()
      expect(newLinkedList.add("\'")).assertTrue()
      expect(newLinkedList.add("\"")).assertTrue()
      expect(newLinkedList.add("\?")).assertTrue()
      expect(newLinkedList.add("\0")).assertTrue()
      expect(newLinkedList.add("\d")).assertTrue()
      expect(newLinkedList.add("\x31")).assertTrue()

      expect(newLinkedList.getFirst()).assertEqual("\a")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\b")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\f")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\n")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\r")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\t")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\v")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\\")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\'")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\"")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\?")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\0")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\d")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("\x31")
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1600
     * @tc.name      testLinkedList18Chapter0016
     * @tc.desc      Test getting emojis and their Unicode encodings of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      expect(newLinkedList.add("👆")).assertTrue()
      expect(newLinkedList.add("👿")).assertTrue()
      expect(newLinkedList.add("👀")).assertTrue()
      expect(newLinkedList.add("💯")).assertTrue()
      expect(newLinkedList.add("🎅")).assertTrue()
      expect(newLinkedList.add("😼")).assertTrue()
      expect(newLinkedList.add("🔧")).assertTrue()
      expect(newLinkedList.add("💇")).assertTrue()
      expect(newLinkedList.add("🤼‍♂️")).assertTrue()
      expect(newLinkedList.add("🛢")).assertTrue()
      expect(newLinkedList.add("🀄")).assertTrue()
      expect(newLinkedList.add("🏴")).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc46`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc7f`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc40`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udcaf`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udf85`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\ude3c`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udd27`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc87`)).assertTrue()
      expect(newLinkedList.add(`\ud83e\udd3c\u200d\u2642\ufe0f`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udee2`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udff4`)).assertTrue()

      expect(newLinkedList.getFirst()).assertEqual("👆")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("👿")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("👀")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("💯")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🎅")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("😼")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🔧")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("💇")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🤼‍♂️")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🛢")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🀄")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual("🏴")
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc46`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc7f`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc40`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udcaf`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udf85`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\ude3c`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udd27`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc87`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83e\udd3c\u200d\u2642\ufe0f`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udee2`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udc04`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1700
     * @tc.name      testLinkedList18Chapter0017
     * @tc.desc      Test getting invalid unicode encodings of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()

      expect(newLinkedList.getFirst()).assertEqual(`\udc04`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1800
     * @tc.name      testLinkedList18Chapter0018
     * @tc.desc      Test getting keywords of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()

      expect(newLinkedList.getFirst()).assertEqual(`"0" `)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`"NaN"`)
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(`“”`)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_1900
     * @tc.name      testLinkedList18Chapter0019
     * @tc.desc      Test getting treeString type of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let init: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      expect(newLinkedList.add(init(10))).assertTrue()
      expect(newLinkedList.add(init(100))).assertTrue()
      expect(newLinkedList.add(init(1000))).assertTrue()
      expect(newLinkedList.add(init(10000))).assertTrue()
      expect(newLinkedList.add(init(100000))).assertTrue()

      expect(newLinkedList.getFirst()).assertEqual(init(10))
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(init(100))
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(init(1000))
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(init(10000))
      newLinkedList.removeFirst()
      expect(newLinkedList.getFirst()).assertEqual(init(100000))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2000
     * @tc.name      testLinkedList18Chapter0020
     * @tc.desc      Test getting sliceString type of String type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i: int = 0; i < 10; i++) {
        let result = str.substring(0, str.length - 2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
        expect(newLinkedList.getFirst()).assertEqual(str)
        newLinkedList.removeFirst()
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2100
     * @tc.name      testLinkedList18Chapter0021
     * @tc.desc      Test String GC for head operations: works after adding & releasing an ultra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      expect(newLinkedList.add(largeStr)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(largeStr)

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(newLargeStr)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2200
     * @tc.name      testLinkedList18Chapter0022
     * @tc.desc      Test getting 0 of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text: int = 0

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2300
     * @tc.name      testLinkedList18Chapter0023
     * @tc.desc      Test getting undefined of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number | undefined>()
      let text: number | undefined = undefined

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2400
     * @tc.name      testLinkedList18Chapter0024
     * @tc.desc      Test getting NaN of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertNaN()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2500
     * @tc.name      testLinkedList18Chapter0025
     * @tc.desc      Test getting -0 of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text: int = -0

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2600
     * @tc.name      testLinkedList18Chapter0026
     * @tc.desc      Test getting positive infinity of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2700
     * @tc.name      testLinkedList18Chapter0027
     * @tc.desc      Test getting negative infinity of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2800
     * @tc.name      testLinkedList18Chapter0028
     * @tc.desc      Test getting double type of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_2900
     * @tc.name      testLinkedList18Chapter0029
     * @tc.desc      Test getting Number.MAX_VALUE of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3000
     * @tc.name      testLinkedList18Chapter0030
     * @tc.desc      Test getting Number.MIN_VALUE of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3100
     * @tc.name      testLinkedList18Chapter0031
     * @tc.desc      Test getting Number.EPSILON of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3200
     * @tc.name      testLinkedList18Chapter0032
     * @tc.desc      Test getting Number.EPSILON of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2 ^ 53 - 1

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3300
     * @tc.name      testLinkedList18Chapter0033
     * @tc.desc      Test getting byte of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text: int = -64
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = -128
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 127
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 128
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3400
     * @tc.name      testLinkedList18Chapter0034
     * @tc.desc      Test getting out-of-bounds byte of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 128
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3500
     * @tc.name      testLinkedList18Chapter0035
     * @tc.desc      Test getting short of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text: int = 10000
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = -32768
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 32767
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3600
     * @tc.name      testLinkedList18Chapter0036
     * @tc.desc      Test getting out-of-bounds short of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 32768
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3700
     * @tc.name      testLinkedList18Chapter0037
     * @tc.desc      Test getting int of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text: int = 1000000
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = -2147483648
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 2147483647
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3800
     * @tc.name      testLinkedList18Chapter0038
     * @tc.desc      Test getting out-of-bounds int of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_3900
     * @tc.name      testLinkedList18Chapter0039
     * @tc.desc      Test getting long of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = -9223372036854775808
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 9223372036854775807
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4000
     * @tc.name      testLinkedList18Chapter0040
     * @tc.desc      Test getting out-of-bounds long of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = Number(9223372036854775808n)
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4100
     * @tc.name      testLinkedList18Chapter0041
     * @tc.desc      Test getting float of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 1.40129846432481707e-45
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 3.4028234663852860e+38
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4200
     * @tc.name      testLinkedList18Chapter0042
     * @tc.desc      Test getting double of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 4.94065645841246544e-324
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 1.79769313486231570e+308
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4300
     * @tc.name      testLinkedList18Chapter0043
     * @tc.desc      Test getting out-of-bounds double of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = Infinity
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4400
     * @tc.name      testLinkedList18Chapter0044
     * @tc.desc      Test getting char of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text: int = 0
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = -65535
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4500
     * @tc.name      testLinkedList18Chapter0045
     * @tc.desc      Test getting char stored as character of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      expect(newLinkedList.add(text.charCodeAt(0))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text.charCodeAt(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4600
     * @tc.name      testLinkedList18Chapter0046
     * @tc.desc      Test getting out-of-bounds char value of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 65536
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4700
     * @tc.name      testLinkedList18Chapter0047
     * @tc.desc      Test getting bigint value of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt("0xdecafafecacefade")
      expect(newLinkedList.add(Number(text))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4800
     * @tc.name      testLinkedList18Chapter0048
     * @tc.desc      Test getting double value of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_4900
     * @tc.name      testLinkedList18Chapter0049
     * @tc.desc      Test getting float of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5000
     * @tc.name      testLinkedList18Chapter0050
     * @tc.desc      Test getting hexadecimal (16-bit) of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 0x0102
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5100
     * @tc.name      testLinkedList18Chapter0051
     * @tc.desc      Test getting hexadecimal (32-bit) of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 0x01020304
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5200
     * @tc.name      testLinkedList18Chapter0052
     * @tc.desc      Test getting octal of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: int = 0x3
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5300
     * @tc.name      testLinkedList18Chapter0053
     * @tc.desc      Test getting exponent operator of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text: number = 2 ** 3
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5400
     * @tc.name      testLinkedList18Chapter0054
     * @tc.desc      Test getting scientific notation of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()

      text = 2.5e-2
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5500
     * @tc.name      testLinkedList18Chapter0055
     * @tc.desc      Test getting large integer of number type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      expect(newLinkedList.add(Number(text))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5600
     * @tc.name      testLinkedList18Chapter0056
     * @tc.desc      Test getting true of boolean type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5700
     * @tc.name      testLinkedList18Chapter0057
     * @tc.desc      Test getting false of boolean type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5800
     * @tc.name      testLinkedList18Chapter0058
     * @tc.desc      Test getting values that are usually treated as false of boolean type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean | null | undefined>()

      const text01: int = 0
      expect(newLinkedList.add(Boolean(text01))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(Boolean(text01))
      newLinkedList.removeFirst()

      const text02 = NaN
      expect(newLinkedList.add(Boolean(text02))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(Boolean(text02))
      newLinkedList.removeFirst()

      const text03 = ""
      expect(newLinkedList.add(Boolean(text03))).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(Boolean(text03))
      newLinkedList.removeFirst()

      const text04: boolean | null = null
      expect(newLinkedList.add(text04)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text04)
      newLinkedList.removeFirst()

      const text05: boolean | undefined = undefined
      expect(newLinkedList.add(text05)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text05)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_5900
     * @tc.name      testLinkedList18Chapter0059
     * @tc.desc      Test getting ! + other data types of boolean type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      expect(newLinkedList.add(text01)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text01)
      newLinkedList.removeFirst()

      const text02 = !0
      expect(newLinkedList.add(text02)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text02)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6000
     * @tc.name      testLinkedList18Chapter0060
     * @tc.desc      Test getting ordinary object of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_60>()
      let text: TextObj18_60 = { a: 1, b: "test", c: [1, 2, 3] }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6100
     * @tc.name      testLinkedList18Chapter0061
     * @tc.desc      Test getting nested object of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_61>()
      let text: TextObj18_61 = { d: 10, e: { a: 1, b: "test", c: [1, 2, 3] } }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6200
     * @tc.name      testLinkedList18Chapter0062
     * @tc.desc      Test getting object with function property (no parameters) of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_62>()
      let text: TextObj18_62 = {
        a: 1, b: () => {
          return true
        }
      }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6300
     * @tc.name      testLinkedList18Chapter0063
     * @tc.desc      Test getting object with function property (with parameters) of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_62>()
      let text: TextObj18_62 = {
        a: 1, b: (n: int) => {
          return n * 100
        }
      }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6400
     * @tc.name      testLinkedList18Chapter0064
     * @tc.desc      Test getting object with ArrayBuffer property of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_64>()
      let text: TextObj18_64 = { buffer: new ArrayBuffer(16) }

      let uint8View = new Uint8Array(text.buffer)
      uint8View[0] = 10
      uint8View[1] = 20
      uint8View[2] = 30

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6500
     * @tc.name      testLinkedList18Chapter0065
     * @tc.desc      Test getting object with DataView property of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_65>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: TextObj18_65 = { view: new DataView(arrayBuffer) }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6600
     * @tc.name      testLinkedList18Chapter0066
     * @tc.desc      Test getting empty object of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObj18_66>()
      let text: TextObj18_66 = {}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.removeFirst()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT18_6700
     * @tc.name      testLinkedList18Chapter0067
     * @tc.desc      Test getting extremely large object of object type at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList18Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList18Chapter0067';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i: int = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      expect(newLinkedList.add(hugeObj)).assertTrue()
      expect(newLinkedList.getFirst()).assertEqual(hugeObj)
      const cost = Date.now() - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)
    })
  })
}