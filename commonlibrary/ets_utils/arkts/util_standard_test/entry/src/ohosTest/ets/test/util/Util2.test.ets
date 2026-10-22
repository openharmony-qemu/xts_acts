/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import util from '@ohos.util';

import {
  ArrayList,
  buffer,
  Deque,
  HashMap,
  HashSet,
  LightWeightMap,
  LightWeightSet,
  LinkedList,
  List,
  PlainArray,
  Queue,
  Stack,
  TreeMap,
  TreeSet,
  uri,
  url,
  Vector
} from '@kit.ArkTS';
import * as nameSpace from './util';
import { foo, generator } from './util';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}


export default function util2Test() {
  describe('util2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   testGetHash_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testGetHash_001';
      try {
        let arr1 = [0, 1, 2, 3];
        let arr2 = new Array<number>();
        let result1 = util.getHash(arr1);
        let result2 = util.getHash(arr2);
        expect(result1 === result2).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testGetHash_001';
      try {
        let a = new ArrayList<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LinkedList<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Set<number>();
        a.add(7)
        let result1 = util.getHash(a);
        a.add(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Map<number, number>();
        a.set(7, 0)
        let result1 = util.getHash(a);
        a.set(9, 2);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Map<number, number>();
        a.set(7, 0)
        let result1 = util.getHash(a);
        a.set(9, 2);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new BigInt64Array(8);
        a[0] = 1n;
        let result1 = util.getHash(a);
        a[1] = 2n;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new BigUint64Array(8);
        a[0] = 1n;
        let result1 = util.getHash(a);
        a[1] = 2n;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_0900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Float32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Float64Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int8Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int16Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Int32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testGetHash_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint8Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint16Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint32Array(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Uint8ClampedArray(8);
        a[0] = 1;
        let result1 = util.getHash(a);
        a[1] = 2;
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = buffer.from([1, 2, 3]);
        let result1 = util.getHash(a);
        a.fill(1);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = buffer.from([1, 2, 3]);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_1900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new url.URLParams("www.baidu.com");
        a.append("1", "kuku");
        let result1 = util.getHash(a);
        a.append("2", "kuku");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new url.URLParams("www.baidu.com");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new uri.URI("www.baidu.com");
        a.addQueryValue("1", "kuku");
        let result1 = util.getHash(a);
        a.addQueryValue("2", "kuku");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new uri.URI("www.baidu.com");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testGetHash_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Deque<number>();
        a.insertFront(7);
        let result1 = util.getHash(a);
        a.insertFront(9);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Deque<number>();
        b.insertFront(7);
        a.insertFront(9);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new HashMap<string, number>();
        a.set("1", 7);
        let result1 = util.getHash(a);
        a.set("3", 7);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new HashMap<string, number>();
        b.set("1", 7);
        b.set("3", 7);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new HashSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new HashSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LightWeightMap<string, number>();
        a.set("1", 1);
        let result1 = util.getHash(a);
        a.set("3", 3);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LightWeightMap<string, number>();
        b.set("1", 1);
        b.set("3", 3);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LightWeightSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LightWeightSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new LinkedList<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new LinkedList<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new PlainArray<string>();
        a.add(0, "1");
        let result1 = util.getHash(a);
        a.add(1, "3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new PlainArray<string>();
        b.add(0, "1");
        b.add(1, "3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new List<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new List<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_2900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new PlainArray<string>();
        a.add(0, "1");
        let result1 = util.getHash(a);
        a.add(3, "3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new PlainArray<string>();
        b.add(0, "1");
        b.add(3, "3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Queue<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Queue<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new Stack<string>();
        a.push("1");
        let result1 = util.getHash(a);
        a.push("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new Stack<string>();
        b.push("1");
        b.push("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new TreeSet<string>();
        a.add("1");
        let result1 = util.getHash(a);
        a.add("3");
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new TreeSet<string>();
        b.add("1");
        b.add("3");
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let a = new TreeMap<string, number>();
        a.set("1", 1);
        let result1 = util.getHash(a);
        a.set("3", 3);
        let result2 = util.getHash(a);
        expect(result1).assertEqual(result2);
        let b = new TreeMap<string, number>();
        b.set("1", 1);
        b.set("3", 3);
        expect(a === b).assertFalse();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testGetHash_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        util.getHash(null);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testGetHash_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        util.getHash(undefined);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testGetHash_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isAsyncFunction(async () => {
      });
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isAsyncFunction(() => {
      });
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isGeneratorFunction(foo);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_3900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let b = "false"
      let result = type.isGeneratorFunction(b);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isGeneratorObject(generator);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let b = "false"
      let result = type.isGeneratorObject(b);
      expect(result).assertEqual(false);
    });


    /**
     * @tc.name   testGetHash_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isModuleNamespaceObject(nameSpace);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let res = "aaa";
      let result = type.isModuleNamespaceObject(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isPromise(Promise.resolve(1));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let res = "aaa";
      let result = type.isPromise(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let type = new util.types();
      let result = type.isRegExp(new RegExp('abc'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = "aaa";
      let type = new util.types();
      let result = type.isRegExp(res);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   testGetHash_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new ArrayList<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(2);
      expect(result2).assertEqual(false);
      let result3 = res.remove(1);
      expect(result3).assertEqual(true);
      let result: Array<number> = res.convertToArray();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_4900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new HashSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LightWeightMap<number, number>();
      res.set(1, 1);
      try {
        let result1 = res.setValueAt(1, 1);
        expect(result1).assertEqual(false);
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name   testGetHash_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LightWeightSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(1);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new LinkedList<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(true);
      let result3 = res.remove(31);
      expect(result3).assertEqual(false);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new List<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
      let result2 = res.remove(1);
      expect(result2).assertEqual(true);
      let result3 = res.remove(31);
      expect(result3).assertEqual(false);
      expect(res.convertToArray().length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new Queue<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res = new TreeSet<number>();
      let result1 = res.add(1);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.name   testGetHash_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number | string, number | string>();
      let result = pro.values();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number | string, number | string>();
      pro.put(2, 10);
      pro.put(2, "anhu");
      pro.put("afaf", "grfb");
      let result = pro.values();
      expect(result.toString()).assertEqual("anhu,grfb");
    });

    /**
     * @tc.name   testGetHash_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      pro.put(2, 10);
      pro.put(3, 1);
      let result = pro.keys();
      expect(result.toString()).assertEqual("2,3");
    });

    /**
     * @tc.name   testGetHash_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_5900
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro = new util.LRUCache<number, number>();
      let result = pro.keys();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6000
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list = new List<number>();
      let res = list.convertToArray();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6100
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.length;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6200
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.keys();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6300
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pro: util.LruBuffer<number, number> = new util.LruBuffer();
      let result = pro.values();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6400
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let urlObject = new url.URL('https://developer.exampleUrl/?fod=1&bard=2');
      let params = new url.URLSearchParams(urlObject.search.slice(1));
      params.append('fod', '3');
      expect(params.getAll('fod').toString()).assertEqual("1,3");
    });

    /**
     * @tc.name   testGetHash_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6500
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let urlObject = new url.URL('https://developer.exampleUrl/');
      let params = new url.URLSearchParams(urlObject.search.slice(1));
      expect(params.getAll('fod').length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6600
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let vector: Vector<string | number | Array<number>> = new Vector();
      let result = vector.add("a");
      expect(result).assertEqual(true);
      let result2 = vector.remove("b");
      expect(result2).assertEqual(false);
      let result3 = vector.remove("a");
      expect(result3).assertEqual(true);
      let res = vector.convertToArray();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   testGetHash_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6700
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let rationalNumber = util.RationalNumber.parseRationalNumber(null, 2);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rationalNumber = util.RationalNumber.parseRationalNumber(undefined, 2);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, null);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, undefined);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rational = util.RationalNumber.createRationalFromString("");
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rational = util.RationalNumber.createRationalFromString(null);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let rational = util.RationalNumber.createRationalFromString(undefined);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      try {
        let result = rationalNumber.compare(null);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let result = rationalNumber.compare(undefined);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      try {
        let result = util.RationalNumber.getCommonFactor(null, 6);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      try {
        let result = util.RationalNumber.getCommonFactor(undefined, 6);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let result = util.RationalNumber.getCommonFactor(5, null);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
      try {
        let result = util.RationalNumber.getCommonFactor(5, undefined);
        expect().assertFail()
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });


    /**
     * @tc.name   testGetHash_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL2_6800
     * @tc.desc   Testing the getHash interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetHash_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let type = new util.types();
      let result1 = type.isAnyArrayBuffer(null);
      expect(result1).assertFalse();
      let result2 = type.isAnyArrayBuffer(undefined);
      expect(result2).assertFalse();

      let result3 = type.isArrayBufferView(null);
      expect(result3).assertFalse();
      let result4 = type.isArrayBufferView(undefined);
      expect(result4).assertFalse();

      let result5 = type.isArgumentsObject(null);
      expect(result5).assertFalse();
      let result6 = type.isArgumentsObject(undefined);
      expect(result6).assertFalse();

      let result7 = type.isArrayBuffer(null);
      expect(result7).assertFalse();
      let result8 = type.isArrayBuffer(undefined);
      expect(result8).assertFalse();

      let result9 = type.isBigInt64Array(null);
      expect(result9).assertFalse();
      let result10 = type.isBigInt64Array(undefined);
      expect(result10).assertFalse();

      let result11 = type.isBigUint64Array(null);
      expect(result11).assertFalse();
      let result12 = type.isBigUint64Array(undefined);
      expect(result12).assertFalse();

      let result13 = type.isBooleanObject(null);
      expect(result13).assertFalse();
      let result14 = type.isBooleanObject(undefined);
      expect(result14).assertFalse();

      let result15 = type.isDataView(null);
      expect(result15).assertFalse();
      let result16 = type.isDataView(undefined);
      expect(result16).assertFalse();

      let result17 = type.isFloat32Array(null);
      expect(result17).assertFalse();
      let result18 = type.isFloat32Array(undefined);
      expect(result18).assertFalse();

      let result19 = type.isFloat64Array(null);
      expect(result19).assertFalse();
      let result20 = type.isFloat64Array(undefined);
      expect(result20).assertFalse();

      let result21 = type.isGeneratorFunction(null);
      expect(result21).assertFalse();
      let result22 = type.isGeneratorFunction(undefined);
      expect(result22).assertFalse();

      let result23 = type.isGeneratorObject(null);
      expect(result23).assertFalse();
      let result24 = type.isGeneratorObject(undefined);
      expect(result24).assertFalse();

      let result25 = type.isInt8Array(null);
      expect(result25).assertFalse();
      let result26 = type.isInt8Array(undefined);
      expect(result26).assertFalse();

      let result27 = type.isUint8Array(null);
      expect(result27).assertFalse();
      let result28 = type.isUint8Array(undefined);
      expect(result28).assertFalse();

      let result29 = type.isInt16Array(null);
      expect(result29).assertFalse();
      let result30 = type.isInt16Array(undefined);
      expect(result30).assertFalse();

      let result31 = type.isUint16Array(null);
      expect(result31).assertFalse();
      let result32 = type.isUint16Array(undefined);
      expect(result32).assertFalse();

      let result33 = type.isInt32Array(null);
      expect(result33).assertFalse();
      let result34 = type.isInt32Array(undefined);
      expect(result34).assertFalse();

      let result35 = type.isUint32Array(null);
      expect(result35).assertFalse();
      let result36 = type.isUint32Array(undefined);
      expect(result36).assertFalse();

      let result37 = type.isBigInt64Array(null);
      expect(result37).assertFalse();
      let result38 = type.isBigInt64Array(undefined);
      expect(result38).assertFalse();

      let result39 = type.isBigUint64Array(null);
      expect(result39).assertFalse();
      let result40 = type.isBigUint64Array(undefined);
      expect(result40).assertFalse();

      let result41 = type.isMap(null);
      expect(result41).assertFalse();
      let result42 = type.isMap(undefined);
      expect(result42).assertFalse();

      let result43 = type.isMapIterator(null);
      expect(result43).assertFalse();
      let result44 = type.isMapIterator(undefined);
      expect(result44).assertFalse();

      let result45 = type.isNativeError(null);
      expect(result45).assertFalse();
      let result46 = type.isNativeError(undefined);
      expect(result46).assertFalse();

      let result47 = type.isProxy(null);
      expect(result47).assertFalse();
      let result48 = type.isProxy(undefined);
      expect(result48).assertFalse();

      let result49 = type.isRegExp(null);
      expect(result49).assertFalse();
      let result50 = type.isRegExp(undefined);
      expect(result50).assertFalse();

      let result51 = type.isSet(null);
      expect(result51).assertFalse();
      let result52 = type.isSet(undefined);
      expect(result52).assertFalse();

      let result53 = type.isSetIterator(null);
      expect(result53).assertFalse();
      let result54 = type.isSetIterator(undefined);
      expect(result54).assertFalse();

      let result55 = type.isSymbolObject(null);
      expect(result55).assertFalse();
      let result56 = type.isSymbolObject(undefined);
      expect(result56).assertFalse();

      let result57 = type.isTypedArray(null);
      expect(result57).assertFalse();
      let result58 = type.isTypedArray(undefined);
      expect(result58).assertFalse();

      let result59 = type.isUint8ClampedArray(null);
      expect(result59).assertFalse();
      let result60 = type.isUint8ClampedArray(undefined);
      expect(result60).assertFalse();

      let result61 = type.isWeakMap(null);
      expect(result61).assertFalse();
      let result62 = type.isWeakMap(undefined);
      expect(result62).assertFalse();

      let result63 = type.isWeakSet(null);
      expect(result63).assertFalse();
      let result64 = type.isWeakSet(undefined);
      expect(result64).assertFalse();
    });

  })
}
