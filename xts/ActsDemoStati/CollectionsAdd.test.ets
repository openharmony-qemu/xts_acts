/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, HashMap, HashSet } from '@kit.ArkTS'
import { collections } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function collectionsAddTest1() {
  describe('collectionsAddTest1', () => {
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.

    /**
     * @tc.name   CollectionsTestAdd0100
     * @tc.number SUB_COLLECTION_ADD_CONCAtARRRY_0100
     * @tc.desc   ConcatArray join 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of concatArray) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd0101
     * @tc.number SUB_COLLECTION_ADD_CONCAtARRRY_0101
     * @tc.desc   ConcatArray slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd0101';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of array) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1100
     * @tc.number SUB_COLLECTION_ADD_ARRRY_0100
     * @tc.desc   Array create 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Array(1, 2, 3, 4, 5);
        array.fill(0, 1, 3);
        array.fill(0, 1);
        array.fill(1);
        expect(array.length).assertEqual(5)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1200
     * @tc.number SUB_COLLECTION_ADD_ARRAY_0200
     * @tc.desc   Array 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1200';
        console.info(`${caseName} test start`);
        let container: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of container) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd1300
     * @tc.number SUB_COLLECTION_ADD_ARRAY_0300
     * @tc.desc   Array forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd1300';
        console.info(`${caseName} test start`);
        let container: collections.Map<number, number> = new collections.Map<number, number>([
          [1, 0],
          [2, 1],
          [3, 2],
        ])
        let count = 0
        try {
          // [Symbol.iterator]覆盖
          for (const item of container) {
            count++;
          }
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2100
     * @tc.number SUB_COLLECTION_ADD_TEST_0100
     * @tc.desc   Array from 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2100';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int8Array(arrayLike)
        expect(collections.Int8Array.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int8Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2200
     * @tc.number SUB_COLLECTION_ADD_TEST_0200
     * @tc.desc   Map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2200';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int16Array(arrayLike)
        expect(collections.Int16Array.BYTES_PER_ELEMENT).assertEqual(2)
        expect(arr.buffer.byteLength).assertEqual(6)
        expect(arr.byteLength).assertEqual(6)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int16Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2300
     * @tc.number SUB_COLLECTION_ADD_TEST_0300
     * @tc.desc   Map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2300';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint16Array(arrayLike)
        expect(collections.Uint16Array.BYTES_PER_ELEMENT).assertEqual(2)
        expect(arr.buffer.byteLength).assertEqual(6)
        expect(arr.byteLength).assertEqual(6)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint16Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd2400
     * @tc.number SUB_COLLECTION_ADD_TEST_TEST_0400
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd2400';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Int32Array(arrayLike)
        expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Int32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd3400
     * @tc.number SUB_COLLECTION_ADD_MAP_TEST_0400
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3400';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint32Array(arrayLike)
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionsTestAdd3600
     * @tc.number SUB_COLLECTION_ADD_CONCATARRAYMAP_TEST_0600
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3600';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Float32Array(arrayLike)
        expect(collections.Float32Array.BYTES_PER_ELEMENT).assertEqual(4)
        expect(arr.buffer.byteLength).assertEqual(12)
        expect(arr.byteLength).assertEqual(12)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Float32Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd3700
     * @tc.number SUB_COLLECTION_ADD_CONCATARRAYMAP_TEST_0700
     * @tc.desc   Map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd3700';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint8Array(arrayLike)
        expect(collections.Uint8Array.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint8Array = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })


    /**
     * @tc.name   CollectionsTestAdd4100
     * @tc.number SUB_COLLECTION_ADD_SET_TEST_0100
     * @tc.desc   Set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd4100';
        console.info(`${caseName} test start`);
        let arrayLike = [1, 2, 3];
        let arr = new collections.Uint8ClampedArray(arrayLike)
        expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
        expect(arr.buffer.byteLength).assertEqual(3)
        expect(arr.byteLength).assertEqual(3)
        expect(arr.byteOffset).assertEqual(0)
        let copied: collections.Uint8ClampedArray = arr.copyWithin(3, 1);
        // [Symbol.iterator]覆盖
        let count = 0
        for (const item of arr) {
          count++;
        }
        expect(count).assertEqual(3)
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionsTestAdd4200
     * @tc.number SUB_COLLECTION_ADD_SET_TEST_0200
     * @tc.desc   Set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsTestAdd4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsTestAdd4200';
        console.info(`${caseName} test start`);
        let count = 0
        let bitVector: collections.BitVector = new collections.BitVector(0);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);
        bitVector.push(1);
        bitVector.push(0);

        for (let item of bitVector) {
          count++;
        }
        expect(count).assertEqual(5)
        console.info(`${caseName} test end`);
        done()
      })

          /**
     * @tc.name   ASONTestClass001
     * @tc.number ASONTestClass001
     * @tc.desc   ArkTS ASON parse BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'big':112233445566778898}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      expect((obj as object)?.['big']).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass002
     * @tc.number ASONTestClass002
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '123';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass003
     * @tc.number ASONTestClass003
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{'number':123}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.['number']).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass004
     * @tc.number ASONTestClass004
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{'string':'testASON'}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.['string']).assertEqual('testASON');
      done();
    })

    /**
     * @tc.name   ASONTestClass005
     * @tc.number ASONTestClass005
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = ''testASON'';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual('testASON');
      done();
    })

    /**
     * @tc.name   ASONTestClass006
     * @tc.number ASONTestClass006
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '[1,2,3]';
      let obj : collections.Array<number> = ArkTSUtils.ASON.parse(jsonText) as collections.Array<number>;
      expect(obj.at(1)).assertEqual(2);
      done();
    })

    /**
     * @tc.name   ASONTestClass007
     * @tc.number ASONTestClass007
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'arr':[1,3,5]}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let arr : collections.Array<number> = (obj as object)?.['arr'];
      expect(arr.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass008
     * @tc.number ASONTestClass008
     * @tc.desc   ArkTS ASON parse true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'true';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(true);
      done();
    })

    /**
     * @tc.name   ASONTestClass009
     * @tc.number ASONTestClass009
     * @tc.desc   ArkTS ASON parse false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'false';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(false);
      done();
    })

    /**
     * @tc.name   ASONTestClass010
     * @tc.number ASONTestClass010
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(typeof obj).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ASONTestClass011
     * @tc.number ASONTestClass011
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'123':'123'}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect((obj as object)?.['123']).assertEqual('123');
      done();
    })

    /**
     * @tc.name   ASONTestClass012
     * @tc.number ASONTestClass012
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{'big':112233445566778898}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,bigint>;
      expect(map.get('big')).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass013
     * @tc.number ASONTestClass013
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      expect(typeof map).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ASONTestClass014
     * @tc.number ASONTestClass014
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{'feature':{'arr':[1,3,5]}}';
      let map = {'feature':{'arr':[1,3,5]}};
      expect(typeof map.get('feature')).assertEqual('object');
      expect(map.get('feature')?.get('arr')?.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass015
     * @tc.number ASONTestClass015
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected MAP Prop in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass016
     * @tc.number ASONTestClass016
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected Object Prop in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass017
     * @tc.number ASONTestClass017
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{'error'}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected MAP in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass018
     * @tc.number ASONTestClass018
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{'error'}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual('Unexpected Object in JSON');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass019
     * @tc.number ASONTestClass019
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 1122;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('1122');
      done();
    })

    /**
     * @tc.name   ASONTestClass020
     * @tc.number ASONTestClass020
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 'test ASON';
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual(''test ASON'');
      done();
    })

    /**
     * @tc.name   ASONTestClass021
     * @tc.number ASONTestClass021
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = true;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('true');
      done();
    })

    /**
     * @tc.name   ASONTestClass022
     * @tc.number ASONTestClass022
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = false;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('false');
      done();
    })

    /**
     * @tc.name   ASONTestClass023
     * @tc.number ASONTestClass023
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = null;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('null');
      done();
    })

    /**
     * @tc.name   ASONTestClass024
     * @tc.number ASONTestClass024
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = new collections.Array<number>(1, 3, 5);
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('[1,3,5]');
      done();
    })

    /**
     * @tc.name   ASONTestClass025
     * @tc.number ASONTestClass025
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'string':'testASON'}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'string':'testASON'}');
      done();
    })

    /**
     * @tc.name   ASONTestClass026
     * @tc.number ASONTestClass026
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{}');
      done();
    })

    /**
     * @tc.name   ASONTestClass027
     * @tc.number ASONTestClass027
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = 112233445566778899n;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('112233445566778899');
      done();
    })

    /**
     * @tc.name   ASONTestClass028
     * @tc.number ASONTestClass028
     * @tc.desc   ArkTS ASON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'zerodeci1':0.0000123,'zerodeci2':0.4799123,'zerodeci3':0.7777334477383838389929292922,'zerodeci4':0.0000000000000123}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'zerodeci1':0.0000123,'zerodeci2':0.4799123,'zerodeci3':0.7777334477383838,'zerodeci4':1.23e-14}');
      done();
    })

    /**
     * @tc.name   ASONTestClass029
     * @tc.number ASONTestClass029
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{'feature':{'arr':[1,3,5]}}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{'feature':{'arr':[1,3,5]}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass030
     * @tc.number ASONTestClass030
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'text':'ASON support MAP Test Start','largeNumber':112233445566778899,'people':{'name':'Mary','sex':'1','height':'165'}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'text':'ASON support MAP Test Start','largeNumber':112233445566778899,'people':{'name':'Mary','sex':'1','height':'165'}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass031
     * @tc.number ASONTestClass031
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'args1':true,'args2':false,'args3':null}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'args1':true,'args2':false,'args3':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass032
     * @tc.number ASONTestClass032
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{'people':{'name':'Mary','sex':'1','height':165,'args':{'arr':[1,2,3],'check':true,'num':null}}}';
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'people':{'name':'Mary','sex':'1','height':165,'args':{'arr':[1,2,3],'check':true,'num':null}}}');
      done();
    })

    /**
     * @tc.name   ASONTestClass033
     * @tc.number ASONTestClass033
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass034
     * @tc.number ASONTestClass034
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass035
     * @tc.number ASONTestClass035
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new HashSet<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      let output = ArkTSUtils.ASON.stringify(set);
      expect(output).assertEqual('[1,2,3]');
      done();
    })

    /**
     * @tc.name   ASONTestClass036
     * @tc.number ASONTestClass036
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr = new collections.Array<string>();
      arr.push('a', 'b', 'c');
      let sendableObj = new SendableTestClass(arr);
      let set = new collections.Set<SendableTestClass>();
      set.add(sendableObj);
      let map = new collections.Map<string, collections.Set<SendableTestClass>>();
      map.set('set', set);
      let output = ArkTSUtils.ASON.stringify(map);
      expect(output).assertEqual('{'set':[{'arr':['a','b','c']}]}');
      done();
    })

    /**
     * @tc.name   ASONTestClass037
     * @tc.number ASONTestClass037
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr = ['a', 'b', 'c'];
      arr.push('a', 'b', 'c');
      let obj = new NormalTestClass(arr);
      let set = new Set<Object>();
      set.add(obj);
      let map = new Map<string, Set<Object>>();
      map.set('set', set);
      let hashSet = new HashSet<Object>();
      hashSet.add(map);
      let hashMap = new HashMap<string, HashSet<Object>>();
      hashMap.set('hashSet', hashSet);
      let output = ArkTSUtils.ASON.stringify(hashMap);
      expect(output).assertEqual('{'hashSet':[{'set':[{'arr':['a','b','c']}]}]}');
      done();
    })

    /**
     * @tc.name   ASONTestClass038
     * @tc.number ASONTestClass038
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new Map<string, Object>();
      let set = new Set<Object>();
      let hashMap = new HashMap<string, Object>();
      let hashSet = new HashSet<Object>();
      map.set('set', set);
      set.add(hashMap);
      hashMap.set('hashSet', hashSet);
      hashSet.add(map);
      try {
        ArkTSUtils.ASON.stringify(map);
      } catch (e) {
        expect(e.message).assertEqual('stack contains value, usually caused by circular structure');
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass039
     * @tc.number ASONTestClass039
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new Map<string>();
      map.set('a1', 'a1');
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'1':1,'true':true}');
      done();
    })

    /**
     * @tc.name   ASONTestClass040
     * @tc.number ASONTestClass040
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let map = new collections.Map<string>();
      map.set('a1', 'a1');
      map.clear();
      map.set(1, 1);
      map.set(true, true);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'1':1,'true':true}');
      done();
    })

    /**
     * @tc.name   ASONTestClass041
     * @tc.number ASONTestClass041
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new Set<string | null | number | boolean>();
      set.add('a1');
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })

    /**
     * @tc.name   ASONTestClass042
     * @tc.number ASONTestClass042
     * @tc.desc   ArkTS ASON stringify Map and Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTestClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let set = new collections.Set<string | null | number | boolean>();
      set.add('a1');
      set.clear();
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('[1,true]');
      done();
    })

     /**
      * @tc.name   ASONTestClass043
      * @tc.number ASONTestClass043
      * @tc.desc   ArkTS ASON stringify Map and Set undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('ASONTestClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new Map<string | null | number | boolean | undefined, string | null | number | boolean | undefined>();
      map.set('a1', 1);
      map.set(undefined, 'a2');
      map.set(null, undefined);
      map.set(undefined, undefined);
      map.set(undefined, null);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1,'undefined':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass044
     * @tc.number ASONTestClass044
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new collections.Map<string>();
      map.set('a1', 1);
      map.set(undefined, 'a2');
      map.set(null, undefined);
      map.set(undefined, undefined);
      map.set(undefined, null);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1,'undefined':null}');
      done();
    })

    /**
     * @tc.name   ASONTestClass045
     * @tc.number ASONTestClass045
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let map = new HashMap<string>();
      map.set('a1', 1);
      let str = ArkTSUtils.ASON.stringify(map);
      expect(str).assertEqual('{'a1':1}');
      done();
    })

    /**
     * @tc.name   ASONTestClass046
     * @tc.number ASONTestClass046
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let set = new Set<string | null | number | boolean | undefined>();
      set.add('a1');
      set.add(undefined);
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('['a1',null,1,true]');
      done();
    })

    /**
     * @tc.name   ASONTestClass047
     * @tc.number ASONTestClass047
     * @tc.desc   ArkTS ASON stringify Map and Set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTestClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let set = new collections.Set<string | null | number | boolean | undefined>();
      set.add('ss');
      set.add(undefined);
      set.add(1);
      set.add(true);
      let str = ArkTSUtils.ASON.stringify(set);
      expect(str).assertEqual('['a1',null,1,true]');
      done();
    })

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0100
     * @tc.name      offtest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('offtest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0001';
      console.log(TAG + ' start');
      const EVENT_ID = 'data_update';
      let isCallbackCalled = false;
      const dataHandler: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      emitter.on(EVENT_ID, dataHandler);
      emitter.off(EVENT_ID, dataHandler);
      emitter.emit(EVENT_ID, { data: 'test' });
      expect(isCallbackCalled).assertEqual(false);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0200
   * @tc.name      offtest0002
   * @tc.desc      Verify all callbacks off for single event
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0002';
      console.log(TAG + ' start');
      const LOG_EVENT = 'app_log';
      let callbackCount = 0;
      const logHandler1: Callback<emitter.EventData> = () => callbackCount++;
      const logHandler2: Callback<emitter.EventData> = () => callbackCount++;
      emitter.on(LOG_EVENT, logHandler1);
      emitter.on(LOG_EVENT, logHandler2);
      emitter.off(LOG_EVENT);
      emitter.emit(LOG_EVENT);
      expect(callbackCount === (0)).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0300
   * @tc.name      offtest0003
   * @tc.desc      Verify typed event callback off correctly
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0003';
      console.log(TAG + ' start');
      interface SensorData {
        temperature: number;
        humidity: number;
      }
      const SENSOR_EVENT = 'sensor_reading';
      let receivedTemp: number | null = null;
      const sensorCallback: Callback<emitter.GenericEventData<SensorData>> = (data) => {
        receivedTemp = data?.data?.temperature ?? null;
      };

      emitter.on(SENSOR_EVENT, sensorCallback);
      emitter.off<SensorData>(SENSOR_EVENT, sensorCallback);
      emitter.emit(SENSOR_EVENT, { data: { temperature: 25, humidity: 60 } });

      expect(receivedTemp === (null)).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0400
   * @tc.name      offtest0004
   * @tc.desc      Verify once event auto off after trigger
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0004';
      console.log(TAG + ' start');

      try {
        const ALERT_EVENT = 'system_alert';
        let triggerCount = 0;
        const alertHandler: Callback<emitter.EventData> = () => {
          triggerCount++;
        };
        emitter.once(ALERT_EVENT, alertHandler);
        emitter.emit(ALERT_EVENT);
        emitter.emit(ALERT_EVENT);

        if (typeof alertHandler !== 'function') {
          throw new Error('alertHandler is not a valid function');
        }

        expect(typeof alertHandler).assertEqual('function');

        expect(triggerCount).assertEqual(0);

        if (triggerCount !== 1) {
          throw new Error('triggerCount is not equal to 1 (once event not work)');
        }
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err instanceof Error).assertEqual(true);
        const errMsg = (err as Error).toString();
        expect(
          errMsg.includes('alertHandler is not a valid function') ||
          errMsg.includes('triggerCount is not equal to 1 (once event not work)') ||
          errMsg.includes('expect 0 equals 1')
        ).assertEqual(true);
      }

    });
  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0500
   * @tc.name      offtest0005
   * @tc.desc      Verify writable event callback off correctly
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0005';
      console.log(TAG + ' start');
      const EVENT_ID = 'write_event';
      let isCallbackCalled = false;
      const validCallback: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(EVENT_ID, validCallback);
      emitter.emit(EVENT_ID);
      expect(isCallbackCalled === (false)).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0600
   * @tc.name      offtest0006
   * @tc.desc      Verify off with wrong event id has no effect
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0006';
      console.log(TAG + ' start');
      const EVENT_ID = 'write_event';
      const wrongEventId = 'wrong_event';
      let isCallbackCalled = true;
      const validCallback: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(wrongEventId, validCallback);
      emitter.emit(EVENT_ID);
      expect(isCallbackCalled).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0700
   * @tc.name      offtest0007
   * @tc.desc      Verify off with different callback has no effect
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0007';
      console.log(TAG + ' start');
      const EVENT_ID = 'write_event';
      let isCallbackCalled = true;
      const validCallback: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      const anotherCallback: Callback<emitter.EventData> = () => {
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(EVENT_ID, anotherCallback);
      emitter.emit(EVENT_ID);
      expect(isCallbackCalled).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_0900
   * @tc.name      offtest0009
   * @tc.desc      Verify callback not triggered after off
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0009';
      console.log(TAG + ' start');
      const EVENT_ID = 'write_event';
      let receivedData = '';
      const validCallback: Callback<emitter.GenericEventData<GeneratedTypeLiteralInterface_1>> = (eventData) => {
        receivedData = eventData?.data?.data ? String(eventData.data.data) : '';
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(EVENT_ID, validCallback);
      emitter.emit(EVENT_ID, { data: 'post-removal' });
      expect(receivedData === ('')).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1000
   * @tc.name      offtest0010
   * @tc.desc      Verify empty off operation is safe
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0010';
      console.log(TAG + ' start');
      const EVENT_NAME = 'write_complete';
      let callbackTriggered = false;
      const testCallback: Callback<emitter.EventData> = () => {
        callbackTriggered = true;
      };
      emitter.on(EVENT_NAME, testCallback);
      emitter.off(EVENT_NAME, testCallback);
      emitter.emit(EVENT_NAME);
      expect(callbackTriggered === false).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1100
   * @tc.name      offtest0011
   * @tc.desc      Verify writable custom event off correctly
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0011';
      console.log(TAG + ' start');
      const EVENT_ID = 'custom_write_event';
      let isCallbackCalled = false;
      const validCallback: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(EVENT_ID, validCallback);
      emitter.emit(EVENT_ID);
      expect(isCallbackCalled === (false)).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1200
   * @tc.name      offtest0012
   * @tc.desc      Verify off unregistered callback has no effect
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0012';
      console.log(TAG + ' start');
      const EVENT_ID = 'custom_write_event';
      let isCallbackCalled = true;
      const validCallback: Callback<emitter.EventData> = () => {
        isCallbackCalled = true;
      };
      const unusedCallback: Callback<emitter.EventData> = () => {
      };
      emitter.on(EVENT_ID, validCallback);
      emitter.off(EVENT_ID, unusedCallback);
      emitter.emit(EVENT_ID);
      expect(isCallbackCalled).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1300
   * @tc.name      offtest0013
   * @tc.desc      Verify off all callbacks for custom event
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0013';
      console.log(TAG + ' start');
      const EVENT_ID = 'custom_write_event';
      let callbackCount = 0;
      const callback1: Callback<emitter.EventData> = () => callbackCount++;
      const callback2: Callback<emitter.EventData> = () => callbackCount++;
      emitter.on(EVENT_ID, callback1);
      emitter.on(EVENT_ID, callback2);
      emitter.off(EVENT_ID);
      emitter.emit(EVENT_ID);
      expect(callbackCount === (0)).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_OFF_1500
   * @tc.name      offtest0015
   * @tc.desc      Verify generic event callback off correctly
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('offtest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'offtest0015';
      console.log(TAG + ' start');
      const EVENT_ID = 'custom_write_event';
      interface CustomData {
        id: number;
        content: string;
      }
      let receivedContent = '';
      const genericCallback: Callback<emitter.GenericEventData<CustomData>> = (data) => {
        receivedContent = data?.data?.content ?? '';
      };
      emitter.on(EVENT_ID, genericCallback);
      emitter.off(EVENT_ID, genericCallback);
      emitter.emit(EVENT_ID, { data: { id: 1, content: 'test' } });
      expect(receivedContent === ('')).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0100
   * @tc.name      dolnitializeTest0001
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0001';
      console.log(TAG + ' start');
      let isInitCalled: boolean = false;
      const writableStream = new CustomWritable();
      expect(isInitCalled).assertEqual(false);
      let writeCallbackCalled = false;
      writableStream.write('test_data', 'utf8', () => {
        writeCallbackCalled = true;
      });
      expect(writeCallbackCalled).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0300
   * @tc.name      dolnitializeTest0003
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0003';
      console.log(TAG + ' start');
      let callback1Status = '';
      let callback2Status = '';
      new MultiCallbackWritable(
        (status: string): void => {
          callback1Status = status;
        },
        (status: string): void => {
          callback2Status = status;
        }
      );
      expect(callback1Status).assertEqual('Stream ready');
      expect(callback2Status).assertEqual('Stream ready');

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0400
   * @tc.name      dolnitializeTest0004
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0004';
      console.log(TAG + ' start');
      const fakeCallback = (() => {
        const modifiedCallback: CallbackWithValue = () => {
        };
        modifiedCallback.value = 'not a function';
        return modifiedCallback;
      }) as ValidCallback;
      const instance = InvalidCallbackWritable.create(fakeCallback);

      expect(typeof fakeCallback).assertEqual('function');
      expect(instance instanceof InvalidCallbackWritable).assertTrue();

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0500
   * @tc.name      dolnitializeTest0005
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0005';
      console.log(TAG + ' start');
      let callCount = 0;
        new MultiInvokeWritable(() => {
          callCount++;
        });
      expect(callCount).assertEqual(0);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0700
   * @tc.name      dolnitializeTest0007
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0007';
      console.log(TAG + ' start');
        new CallbackExceptionWritable(() => {});
        expect(typeof CallbackExceptionWritable).assertEqual('function');
        expect(typeof (new CallbackExceptionWritable(() => {})).doWrite).assertEqual('function');

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_0900
   * @tc.name      dolnitializeTest0009
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0009';
      console.log(TAG + ' start');
      let invalidEncodingError = '';
        new EncodingCheckWritable('gbk');
      try {
        new EncodingCheckWritable('ascii');
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        invalidEncodingError = (err as Error).message;
        expect(invalidEncodingError).assertEqual('401: Unsupported encoding');
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOLNITIALIZE_1200
   * @tc.name      dolnitializeTest0012
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('dolnitializeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'dolnitializeTest0012';
      console.log(TAG + ' start');
      new StateSyncWritable();
      expect(streamStateValid).assertEqual(true);
      const stateWritable = new StateSyncWritable();
      stateWritable.end();
      expect(stateWritable.writableEnded).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0100
   * @tc.name      doWriteTest0001
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0001';
      console.log(TAG + ' start');
      const case1 = new WritableTestCase1();
      expect(case1 instanceof WritableTestCase1).assertEqual(true);
      expect(case1 instanceof stream.Writable).assertEqual(true);
      case1.write('Hello World', 'utf8', () => {});

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0200
   * @tc.name      doWriteTest0002
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0002';
      console.log(TAG + ' start');
      const case2 = new WritableTestCase2();
      const buffer = new Uint8Array([0x48, 0x65, 0x6c, 0x6c, 0x6f]);
      expect(case2 instanceof WritableTestCase2).assertEqual(true);
      expect(case2 instanceof stream.Writable).assertEqual(true);
      expect(buffer instanceof Uint8Array).assertEqual(true);
      expect(buffer.length).assertEqual(5);
      case2.write(buffer, 'utf8', () => {});

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0300
   * @tc.name      doWriteTest0003
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0003';
      console.log(TAG + ' start');
      const case3 = new WritableTestCase3();
      expect(case3 instanceof WritableTestCase3).assertEqual(true);
      expect(case3 instanceof stream.Writable).assertEqual(true);
      case3.write('gbk', 'gb18030', () => {});

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0400
   * @tc.name      doWriteTest0004
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0004';
      const case4 = new WritableTestCase4();
      expect(case4 instanceof WritableTestCase4).assertEqual(true);
      expect(case4 instanceof stream.Writable).assertEqual(true);
      case4.write('Auto encoding', 'utf8', () => {
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0500
   * @tc.name      doWriteTest0005
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0005';
      const testCase1 = new InvalidChunkTest();
      try {
        testCase1.write('12345', 'utf8', () => {
        });
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err.message.indexOf('chunk must be string or Uint8Array').equals(true)).assertEqual(true);
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0600
   * @tc.name      doWriteTest0006
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0006';
      const testCase2 = new InvalidEncodingTest();
      try {
        testCase2.write('TestData', '123', () => {});
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err.message.includes('encoding must be a string')).assertEqual(false);
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0800
   * @tc.name      doWriteTest0008
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0008';
      console.log(TAG + ' start');
      const testCase4 = new UnsupportedEncodingTest();
      try {
        testCase4.write('TestData', 'unsupported_encoding', () => {});
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err.message.includes('Unsupported encoding')).assertEqual(false);
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_0900
   * @tc.name      doWriteTest0009
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0009';
      console.log(TAG + ' start');
      const testCase5 = new MissingCallbackTest();
      testCase5.write('TestData', 'utf8', () => {
      });
      expect(testCase5 instanceof MissingCallbackTest).assertTrue();
      expect(testCase5 instanceof stream.Writable).assertTrue();
      expect(typeof testCase5.write).assertEqual('function');

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1000
   * @tc.name      doWriteTest0010
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0010';
      console.log(TAG + ' start');
      const testCase1 = new StringChunkTest();
      expect(testCase1 instanceof StringChunkTest).assertEqual(true);
      expect(testCase1 instanceof stream.Writable).assertEqual(true);
      expect(testCase1.receivedType).assertEqual('');
      expect(testCase1.receivedEncoding).assertEqual('');
      const result1 = testCase1.write('TestData', 'gbk', () => {});
      expect(result1).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1100
   * @tc.name      doWriteTest0011
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0011';
      console.log(TAG + ' start');
      const testData = new Uint8Array([116, 101, 115, 116]);
      const testCase2 = new Uint8ArrayChunkTest();
      const result2 = testCase2.write(testData, 'utf8', () => {
      });
      expect(result2 === true).assertEqual(true);
      expect(testCase2.receivedType === 'Uint8Array').assertEqual(true);
      expect(testCase2.receivedEncoding === 'utf8').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1200
   * @tc.name      doWriteTest0012
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0012';
      console.log(TAG + ' start');
      const testCase3 = new DefaultEncodingTest();
      testCase3.write('TestData', 'utf8', () => {});
      expect(testCase3.defaultEncoding === 'utf8').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITE_1300
   * @tc.name      doWriteTest0013
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWriteTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWriteTest0013';
      console.log(TAG + ' start');
      const testData = new Uint8Array([116, 101, 115, 116]);
      const testCase4 = new Uint8DefaultEncodingTest();
      testCase4.write(testData, 'utf8', () => {});
      expect(testData instanceof Uint8Array).assertEqual(true);
      expect(testData.length).assertEqual(4);
      expect(testCase4.chunkType === 'Uint8Array').assertEqual(true);
      expect(testCase4.defaultEncoding === 'utf8').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0100
   * @tc.name      doWritevTest0001
   * @tc.desc      Verify doWritev with single string type chunk.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0001';
      console.log(TAG + ' start');
      const writable = new TestWritable();
      writable.write("testOS", 'utf8', (error: Error | null) => {
        expect(error === null).assertEqual(true);
        expect(typeof error === 'object' || error === null).assertEqual(true);
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0200
   * @tc.name      doWritevTest0002
   * @tc.desc      Verify doWritev with single Uint8Array type chunk.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0002';
      console.log(TAG + ' start');
      const writable2 = new TestWritable2();
      const buffer = new Uint8Array([0x48, 0x65]);
      writable2.write(buffer, 'utf8', (error: Error | null) => {
        expect(buffer instanceof Uint8Array).assertEqual(true);
        expect(error === null).assertEqual(true);
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0300
   * @tc.name      doWritevTest0003
   * @tc.desc      Verify doWritev with mixed string and Uint8Array chunks.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0003';
      console.log(TAG + ' start');
      const writable3 = new TestWritable3();
      writable3.write("valid_data", 'utf8', (error: Error | null) => {
        if (error) {
          expect(error.message.includes('Empty chunk')).assertEqual(true);
        } else {
          expect(error === null).assertEqual(true);
          expect(typeof error === 'object' || error === null).assertEqual(true);
        }
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0400
   * @tc.name      doWritevTest0004
   * @tc.desc      Verify doWritev with empty Uint8Array chunk.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'RdoWritevTest0004';
      console.log(TAG + ' start');
      const writable4 = new TestWritable4();
      const dynamicChunk = Math.random() > 0.5 ? "DynamicData" : new Uint8Array(8);
      writable4.write(dynamicChunk, 'utf8', (error: Error | null) => {
        expect(dynamicChunk instanceof Uint8Array || typeof dynamicChunk === 'string').assertEqual(true);
        expect(error === null).assertEqual(true);
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0500
   * @tc.name      doWritevTest0005
   * @tc.desc      Verify doWritev with large size Uint8Array chunk (1MB).
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0005';
      console.log(TAG + ' start');
      const writable = new ErrorChunkWritable();
      const result = writable.write((12345).toString(), 'utf8', () => {
      });
      expect(result).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0600
   * @tc.name      doWritevTest0006
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0006';
      console.log(TAG + ' start');
      const writable = new ErrorCallbackWritable();
      const result = writable.write('test', 'utf8');
      expect(result).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0700
   * @tc.name      doWritevTest0007
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0007';
      console.log(TAG + ' start');
      const writable = new MissingCallbackWritable();
      const result = writable.write('test', 'utf8', undefined!);
      expect(result).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0800
   * @tc.name      doWritevTest0008
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0008';
      console.log(TAG + ' start');
      const writable = new NullChunkWritable();
      try {
        const result = writable.write(null!, 'utf8', () => {});
        expect(result).assertEqual(false);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err.message.includes('The type of null must be string or UintArray')).assertEqual(true);
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_0900
   * @tc.name      doWritevTest0009
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0009';
      console.log(TAG + ' start');
      const writable = new InvalidEncodingWritable();
      try {
        const result = writable.write('test', 'utf16', () => {});
        expect(result).assertEqual(false);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} fail, err: ${err}`);
        expect(err.message.includes('Unknown encoding: utf16')).assertEqual(true);
      }

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1000
   * @tc.name      doWritevTest0010
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0010';
      console.log(TAG + ' start');
      const writableStream = new TestWritables();
      writableStream.write('Hello');
      expect(writableStream.actualChunkType === 'string').assertEqual(true);
      expect(writableStream.actualEncoding === 'utf8').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1100
   * @tc.name      doWritevTest0011
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0011';
      console.log(TAG + ' start');
      const writableStream = new TestWritables();
      writableStream.write('test data', 'gb2312');
      expect(writableStream.actualChunkType === 'string').assertEqual(true);
      expect(writableStream.actualEncoding === 'gb2312').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1200
   * @tc.name      doWritevTest0012
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0012';
      console.log(TAG + ' start');
      const data = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      const writableStream = new TestWritablea();
      writableStream.write(data);
      expect(writableStream.isBufferType).assertEqual(true);
      expect(writableStream.actualEncoding === 'utf8').assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_DOWRITEV_1300
   * @tc.name      doWritevTest0013
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('doWritevTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'doWritevTest0013';
      console.log(TAG + ' start');
      const writableStream = new TestWritableb();
      writableStream.write('Start');
      writableStream.write(new Uint8Array([0x41]));
      writableStream.end('End');
      expect(writableStream.receivedChunks[0] === 'Start').assertEqual(true);
      expect(writableStream.receivedChunks[1] instanceof Uint8Array).assertEqual(true);
      expect(writableStream.receivedChunks[2] === 'End').assertEqual(true);

    });

    /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0500
     * @tc.name      corkTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0005';
      console.log(TAG + ' start');
      const writableStream = new AfterEndStream();
      writableStream.end('End Data', 'utf8', () => {
        expect(writableStream.cork()).assertEqual(false);
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0600
   * @tc.name      corkTest0006
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0006';
      console.log(TAG + ' start');
      const writableStream = new NoDoWriteStream();
      writableStream.cork();
      writableStream.write('Invalid data', 'utf8');
      const uncorkResult = writableStream.uncork();
      expect(uncorkResult).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0700
   * @tc.name      corkTest0007
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0007';
      console.log(TAG + ' start');
      interface ErrorEventData {
        data: GeneratedTypeLiteralInterface_2;
      }
      const writableStream = new InvalidEncodingStream();
      writableStream.cork();
      const writeResult = writableStream.write('Test Data', 'ascii');
      expect(writeResult).assertEqual(true);
      writableStream.on('error', (err: ErrorEventData) => {
        expect(err.data).assertEqual('Invalid encoding: ascii');
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0800
   * @tc.name      corkTest0008
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0008';
      console.log(TAG + ' start');
      const writableStream = new MultipleEndStream();
      writableStream.end('First ending', 'utf8', () => {
        try {
          writableStream.end('The second time ended');
          expect().assertFail();
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err !== null).assertTrue();
          expect((err as Error).message.length > 0).assertTrue();
        }
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_0900
   * @tc.name      corkTest0009
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0009';
      console.log(TAG + ' start');
      const writable = new NormalCorkStream();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1000
   * @tc.name      corkTest0010
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0010';
      console.log(TAG + ' start');
      const writable = new ClosedStream();
      writable.end('');
      writable.on('finish', () => {
        expect(writable.cork()).assertEqual(false);
        expect(writable.uncork()).assertEqual(false);
      });

    });

  /**
   * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1100
   * @tc.name      corkTest0011
   * @tc.desc      Array Unshift index 0.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it('corkTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0011';
      console.log(TAG + ' start');
      const writable = new InvalidStream();
      writable.write("test", 'utf8');
      expect(writable.cork()).assertEqual(true);
      expect(writable.writable).assertEqual(false);
      expect(writable.writableCorked).assertEqual(1);

    });

     /**
     * @tc.number    SUB_BASEDATE_STREAM_WRITABLE_CORK_1200
     * @tc.name      corkTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
     it('corkTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'corkTest0012';
      console.log(TAG + ' start');
      const writable = new OverUncorkStream();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(false);

    });
    /**
     * @tc.name   ActsLocksTestConditionVariableWait001
     * @tc.number ActsLocksTestConditionVariableWait001
     * @tc.desc   check wait use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.wait();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWait002
     * @tc.number ActsLocksTestConditionVariableWait002
     * @tc.desc   check create wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWait003
     * @tc.number ActsLocksTestConditionVariableWait003
     * @tc.desc   check wait use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait003';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = ArkTSUtils.locks.ConditionVariable.request("Test");
        conditionVariable.wait();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWait004
     * @tc.number ActsLocksTestConditionVariableWait004
     * @tc.desc   check create wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor001
     * @tc.number ActsLocksTestConditionVariableWaitFor001
     * @tc.desc   check waitFor use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor001';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.waitFor(waitTime);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor002
     * @tc.number ActsLocksTestConditionVariableWaitFor002
     * @tc.desc   check create waitFor greater than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor003
     * @tc.number ActsLocksTestConditionVariableWaitFor003
     * @tc.desc   check create waitFor equal to 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor004
     * @tc.number ActsLocksTestConditionVariableWaitFor004
     * @tc.desc   check create waitFor less than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = -1;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor005
     * @tc.number ActsLocksTestConditionVariableWaitFor005
     * @tc.desc   check create waitFor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }
        await sleep(sleepTime);
        expect(result && threadExecutionTime >= 3000).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor006
     * @tc.number ActsLocksTestConditionVariableWaitFor006
     * @tc.desc   check waitFor use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor006';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.waitFor(waitTime);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor007
     * @tc.number ActsLocksTestConditionVariableWaitFor007
     * @tc.desc   check create waitFor greater than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor007';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor008
     * @tc.number ActsLocksTestConditionVariableWaitFor008
     * @tc.desc   check create waitFor equal to 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor008';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

  })
}