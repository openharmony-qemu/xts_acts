/*
 *  Copyright (C) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import collections from '@arkts.collections';

export default function collectionsArrayTest() {
  describe('CollectionsArrayTest', () => {
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
     * @tc.name   testArrayConstructor0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayConstructor_0100
     * @tc.desc   Create a constructor for ArkTS Array,Empty parameter constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayConstructor0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array.length ${array.length}`);
        expect(0).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayConstructor0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayConstructor_0200
     * @tc.desc   Create a constructor for ArkTS Array,Parameters 1, 2, 3, 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayConstructor0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array.length ${array.length}`);
        expect(4).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error.message)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayConstructor0300
     * @tc.number SUB_Runtime_Language_Backend_ArrayConstructor_0300
     * @tc.desc   Create a constructor for ArkTS Array,Parameters 1, 2, 3, 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayConstructor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayConstructor0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<null> = new collections.Array<null>(null);
        console.log(`${caseName} array ${array.length}`);
        expect(1).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`)
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayConstructor0400
     * @tc.number SUB_Runtime_Language_Backend_ArrayConstructor_0400
     * @tc.desc   Create a constructor for ArkTS Array,The array object calls constructor().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayConstructor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayConstructor0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        array.constructor();
        console.log(`${caseName} array.constructor()`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect(10200012).assertEqual(error.code);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayCreate0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayCreate_0100
     * @tc.desc   Generate a fixed-length Array, where the initial value of each element is initialValue,Array.create<number>(3, 10);.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayCreate0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = collections.Array.create<number>(3, 10); // [10, 10, 10]
        console.log(`${caseName} array length ${array.length}`);
        expect(3).assertEqual(array.length);
        expect(10).assertEqual(array[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayCreate0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayCreate_0200
     * @tc.desc   Generate a fixed-length Array, where the initial value of each element is initialValue,Array.create<number>(2.5, 10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArrayCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testArrayCreate0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = collections.Array.create<number>(2.5, 10);
        console.log(`${caseName} array length ${array.length}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}`);
        expect(401).assertEqual(error.code);
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayCreate0300
     * @tc.number SUB_Runtime_Language_Backend_ArrayCreate_0300
     * @tc.desc   Generate a fixed-length Array, where the initial value of each element is initialValue,Array.create<number>(0, 10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayCreate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayCreate0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = collections.Array.create<number>(0, 10);
        console.log(`${caseName} array length ${array.length}`);
        expect(0).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayCreate0400
     * @tc.number SUB_Runtime_Language_Backend_ArrayCreate_0400
     * @tc.desc   Generate a fixed-length Array, where the initial value of each element is initialValue,Array.create<number>(0, 10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayCreate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayCreate0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = collections.Array.create<number>(-1, 10);
        console.log(`${caseName} array length ${array.length}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}`);
        expect(401).assertEqual(error.code);
        done();
      }
      console.log(`${caseName} test end `);
    });


    /**
     * @tc.name   testArrayFrom0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayFrom_0100
     * @tc.desc   Create a new ArkTS Array from an object that implements the ArrayLike interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFrom0100';
      console.log(`${caseName} test start `);
      try {
        let arrayLike: ArrayLike<number> = [1, 3, 5];
        let array: collections.Array<number> = collections.Array.from<number>(arrayLike);
        console.log(`${caseName} array length ${array.length}`);
        expect(3).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFrom0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayFrom_0200
     * @tc.desc   Create a new ArkTS Array from an object that implements the ArrayLike interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFrom0200';
      console.log(`${caseName} test start `);
      try {
        let arr: Array<number> = new Array(1, 2, 3, 4);
        let array: collections.Array<number> = collections.Array.from<number>(arr);
        console.log(`${caseName} array length ${array.length}`);
        expect(4).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFrom0300
     * @tc.number SUB_Runtime_Language_Backend_ArrayFrom_0300
     * @tc.desc   Create a new ArkTS Array from an object that implements the ArrayLike interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFrom0300';
      console.log(`${caseName} test start `);
      try {
        // let arr: Array<number> = new Array(1, 2, 3, 4);
        let array: collections.Array<number> = collections.Array.from<number>([1, 2, 3, 4]);
        console.log(`${caseName} array length ${array.length}`);
        expect(4).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayPop0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayPop_0100
     * @tc.desc   Removes and returns the last element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPop0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array pop before ${array.length}`);
        let lastElement: number | undefined = array.pop();
        console.log(`${caseName} array pop after ${array.length}  lastElement ${lastElement}`);
        expect(4).assertEqual(lastElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayPop0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayPop_0200
     * @tc.desc   Removes and returns the last element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPop0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1);
        console.log(`${caseName} array pop before ${array.length}`);
        let lastElement: number | undefined = array.pop();
        console.log(`${caseName} array pop after ${array.length}  lastElement ${lastElement}`);
        expect(1).assertEqual(lastElement);
        expect(0).assertEqual(array.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayPop0300
     * @tc.number SUB_Runtime_Language_Backend_ArrayPop_0300
     * @tc.desc   Removes and returns the last element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPop0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array pop before ${array.length}`);
        let lastElement: number | undefined = array.pop();
        console.log(`${caseName} array pop after ${array.length}  lastElement ${lastElement}`);
        expect(undefined).assertEqual(lastElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayPop0400
     * @tc.number SUB_Runtime_Language_Backend_ArrayPop_0400
     * @tc.desc   Removes and returns the last element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPop0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPop0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1);
        console.log(`${caseName} array pop before ${array.length}`);
        array.pop();
        let lastElement2: number | undefined = array.pop();
        console.log(`${caseName} array pop after ${array.length}  lastElement ${lastElement2}`);
        expect(undefined).assertEqual(lastElement2);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });


    /**
     * @tc.name   testArrayPush0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayPush_0100
     * @tc.desc   Add one or more elements to the end of the ArkTS Array and return the new Array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPush0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array push before ${array.length}`);
        let pushLength: number = array.push(5);
        console.log(`${caseName} array push after ${array.length}  pushLength ${pushLength}`);
        expect(5).assertEqual(pushLength);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayPush0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayPush_0200
     * @tc.desc   Add one or more elements to the end of the ArkTS Array and return the new Array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayPush0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayPush0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array push before ${array.length}`);
        let pushLength: number = array.push(5, 6);
        console.log(`${caseName} array push after ${array.length}  pushLength ${pushLength}`);
        expect(6).assertEqual(pushLength);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayJoin0100
     * @tc.number SUB_Runtime_Language_Backend_ArrayJoin_0100
     * @tc.desc   Concatenates all elements of ArkTS Array into a string that can be separated by a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayJoin0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayJoin0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array join before ${array.length}`);
        let joinStr: string = array.join('-');
        console.log(`${caseName} array join after  ${joinStr}`);
        expect('1-2-3-4').assertEqual(joinStr);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayJoin0200
     * @tc.number SUB_Runtime_Language_Backend_ArrayJoin_0200
