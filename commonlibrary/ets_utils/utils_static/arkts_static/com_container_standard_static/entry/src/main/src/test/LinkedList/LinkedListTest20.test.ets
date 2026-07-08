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

interface TextObjectFunc {
  a: number;
  b: Function;
}

interface TextObjectBuffer {
  buffer: ArrayBuffer
}

interface TextObjectView {
  view: DataView
}

interface TextObjectEmpty {}

interface TextObjectNull {
  a: null,
  b: number
}

interface TextObjectNum {
  a: number,
  b: number
}

interface TextObjectTypedArray {
  a: number,
  b: Uint8Array
}

interface TextObjectMap {
  map: Map<string, string>,
}

interface TextObjectSet {
  mySet: Set<number>,
}

interface TextObjectPromise {
  promise: Promise<string>,
}

interface TextObjectRegex {
  regex: RegExp,
  flags: string
}

export default function LinkedListTest20(): void {
  describe('LinkedListTest20', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0100
     * @tc.name      testLinkedList20Chapter0001
     * @tc.desc      Test adding object containing function property of object class: no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectFunc>()
      let text: TextObjectFunc = {a:1, b:(n: int)=>{return n*100}}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0200
     * @tc.name      testLinkedList20Chapter0002
     * @tc.desc      Test adding object containing ArrayBuffer property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectBuffer>()
      let text: TextObjectBuffer = { buffer: new ArrayBuffer(16) }

      let uint8View = new Uint8Array(text.buffer)
      uint8View[0] = 10
      uint8View[1] = 20
      uint8View[2] = 30

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0300
     * @tc.name      testLinkedList20Chapter0003
     * @tc.desc      Test adding object containing DataView property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectView>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: TextObjectView = {view: new DataView(arrayBuffer)}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0400
     * @tc.name      testLinkedList20Chapter0004
     * @tc.desc      Test adding empty object multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectEmpty>()
      let text: TextObjectEmpty = {}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0500
     * @tc.name      testLinkedList20Chapter0005
     * @tc.desc      Test adding large object with 10000 properties to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0005';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i: int = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      expect(newLinkedList.add(hugeObj)).assertTrue()
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0600
     * @tc.name      testLinkedList20Chapter0006
     * @tc.desc      Test adding object containing null property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectNull>()
      let text: TextObjectNull = {a: null, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0700
     * @tc.name      testLinkedList20Chapter0007
     * @tc.desc      Test adding object containing NaN property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectNum>()
      let text: TextObjectNum = {a: NaN, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0800
     * @tc.name      testLinkedList20Chapter0008
     * @tc.desc      Test adding object containing Infinity property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectNum>()
      let text: TextObjectNum = {a: Infinity, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0900
     * @tc.name      testLinkedList20Chapter0009
     * @tc.desc      Test adding object containing Uint8Array property with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectTypedArray>()
      let text: TextObjectTypedArray = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1000
     * @tc.name      testLinkedList20Chapter0010
     * @tc.desc      Test adding object containing Map property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectMap>()
      let text: TextObjectMap = {map: new Map<string, string>([['key1', 'value1'], ['key2', 'value2']])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1100
     * @tc.name      testLinkedList20Chapter0011
     * @tc.desc      Test adding object containing Set property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectSet>()
      let text: TextObjectSet = {mySet: new Set<number>([1,2,3,2,1])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1200
     * @tc.name      testLinkedList20Chapter0012
     * @tc.desc      Test adding object containing Promise property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList20Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectPromise>()

      let isResolved = false;
      const testPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          isResolved = true;
          resolve('done');
        }, 100);
      });

      const text: TextObjectPromise = {promise: testPromise}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1300
     * @tc.name      testLinkedList20Chapter0013
     * @tc.desc      Test adding object containing RegExp property of object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<TextObjectRegex>()

      const testRegex = new RegExp("abc", "gi")
      const text: TextObjectRegex = {
        regex: testRegex,
        flags: testRegex.flags
      }

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1400
     * @tc.name      testLinkedList20Chapter0014
     * @tc.desc      Test adding Uint8Array element directly to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1500
     * @tc.name      testLinkedList20Chapter0015
     * @tc.desc      Test adding Uint8Array with zero-padded elements and verify length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1600
     * @tc.name      testLinkedList20Chapter0016
     * @tc.desc      Test adding Uint8Array with negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1700
     * @tc.name      testLinkedList20Chapter0017
     * @tc.desc      Test adding Uint8Array and Uint16Array to separate LinkedLists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList1.add(text1)).assertTrue()
      expect(newLinkedList1.getLast()).assertEqual(text1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1800
     * @tc.name      testLinkedList20Chapter0018
     * @tc.desc      Test adding Record<string, number> object to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Record<string, number>>()
      const text: Record<string, number> = {}
      text["abc"] = 111
      text["aaa"] = 222
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1900
     * @tc.name      testLinkedList20Chapter0019
     * @tc.desc      Test adding Uint8Array with NaN and Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2000
     * @tc.name      testLinkedList20Chapter0020
     * @tc.desc      Test adding mixed type array with number, string, boolean, null, undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2100
     * @tc.name      testLinkedList20Chapter0021
     * @tc.desc      Test adding mixed type array duplicate verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2200
     * @tc.name      testLinkedList20Chapter0022
     * @tc.desc      Test adding empty string array to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2300
     * @tc.name      testLinkedList20Chapter0023
     * @tc.desc      Test adding Uint8Array with overflow values (256, 65536, 32768)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2400
     * @tc.name      testLinkedList20Chapter0024
     * @tc.desc      Test adding Int8Array, Uint8Array and Uint8ClampedArray with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2500
     * @tc.name      testLinkedList20Chapter0025
     * @tc.desc      Test adding Int16Array, Uint16Array, Int32Array and Uint32Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2600
     * @tc.name      testLinkedList20Chapter0026
     * @tc.desc      Test adding Float32Array, Float64Array, BigInt64Array and BigUint64Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Float32Array | Float64Array | BigInt64Array | BigUint64Array>()
      const text1 = new Float32Array([
        3.4028234663852886e38, 1.401298464324817e-45, -3.4028234663852886e38, 3.5e38, -3.5e38
      ])
      const text2 = new Float64Array([
        1.79769313486231e308, 5e-324, -1.79769313486231e308, 1.79769e308, -1.79769e308
      ]);
      const text3 = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775808n, -9223372036854775809n
      ]);
      const text4 = new BigUint64Array([
        18446744073709551615n, 0n, 18446744073709551616n, -1n
      ])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2700
     * @tc.name      testLinkedList20Chapter0027
     * @tc.desc      Test adding multiple typed arrays with Infinity and NaN values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0027';
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

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
      expect(newLinkedList.add(text5)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text5)
      expect(newLinkedList.add(text6)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text6)
      expect(newLinkedList.add(text7)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text7)
      expect(newLinkedList.add(text8)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text8)
    })
  })
}
