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
import { collections } from '@kit.ArkTS';

export default function ArrayCompleteTest() {
  describe('ArrayCompleteTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0001
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0002
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0003
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0004
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0005
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0006
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0007
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0008
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0009
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0010
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0011
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0012
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0013
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0014
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0015
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0016
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0017
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0018
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0019
     * @tc.desc   Concatenates all elements of ArkTS Array into a string that can be separated by a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayJoin0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayJoin0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array join before ${array.length}`);
        let joinStr: string = array.join();
        console.log(`${caseName} array join after  ${joinStr}`);
        expect('1,2,3,4').assertEqual(joinStr);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayJoin0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0020
     * @tc.desc   Concatenates all elements of ArkTS Array into a string that can be separated by a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayJoin0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayJoin0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array join before ${array.length}`);
        let joinStr: string = array.join(undefined);
        console.log(`${caseName} array join after  ${joinStr}`);
        expect('1,2,3,4').assertEqual(joinStr);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayShift0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0021
     * @tc.desc   Removes and returns the first element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayShift0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayShift0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array shift before ${array.length}`);
        let firstElement: number | undefined = array.shift();
        console.log(`${caseName} array shift after ${array.length}  firstElement  ${firstElement}`);
        expect(1).assertEqual(firstElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayShift0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0022
     * @tc.desc   Removes and returns the first element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayShift0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayShift0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array shift before ${array.length}`);
        let firstElement: number | undefined = array.shift();
        console.log(`${caseName} array shift after ${array.length}  firstElement  ${firstElement}`);
        expect(undefined).assertEqual(firstElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayShift0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0023
     * @tc.desc   Removes and returns the first element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayShift0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayShift0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1);
        console.log(`${caseName} array shift before ${array.length}`);
        let firstElement: number | undefined = array.shift();
        console.log(`${caseName} array shift after ${array.length}  firstElement  ${firstElement}`);
        expect(1).assertEqual(firstElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayShift0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0024
     * @tc.desc   Removes and returns the first element from the ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayShift0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayShift0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1);
        console.log(`${caseName} array shift before ${array.length}`);
        array.shift();
        let firstElement: number | undefined = array.shift();
        console.log(`${caseName} array shift after ${array.length}  firstElement  ${firstElement}`);
        expect(undefined).assertEqual(firstElement);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayUnshift0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0025
     * @tc.desc   Inserts one or more elements at the head of the ArkTS Array and returns the new Array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayUnshift0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayUnshift0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let pushLength: number | undefined = array.unshift(5);
        console.log(`${caseName} array Unshift after ${array.length}  pushLength ${pushLength}`);
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
     * @tc.name   testArrayUnshift0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0026
     * @tc.desc   Inserts one or more elements at the head of the ArkTS Array and returns the new Array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayUnshift0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayUnshift0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let pushLength: number = array.unshift(5, 6);
        console.log(`${caseName} array Unshift after ${array.length}  pushLength ${pushLength}`);
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
     * @tc.name   testArraySlice0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0027
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array slice before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(0, 2);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(2).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0028
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(0);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(4).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0029
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice();
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(4).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0030
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} Array<number> Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(5);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(0).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0031
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0500';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(0, 5);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(4).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0032
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0600';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(3, 2);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(0).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0033
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0700';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(-1);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(1).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0034
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0800';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(0, -1);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(3).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });


    /**
     * @tc.name   testArraySlice0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0035
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice0900';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(-1, -1);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(0).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySlice1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0036
     * @tc.desc   Returns a new Array, which is a slice of the original ArkTS Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySlice1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySlice1000';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array Unshift before ${array.length}`);
        let newArray: collections.Array<number> = array.slice(0, 0);
        console.log(`${caseName} array slice after newArray ${newArray.length}`);
        expect(0).assertEqual(newArray.length);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySort0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0037
     * @tc.desc   Sorts the ArkTS Array and returns the sorted Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySort0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(4, 3, 2, 1);
        console.log(`${caseName} array sort before ${array.length}`);
        let newArray: collections.Array<number> = array.sort((a: number, b: number) => a - b);
        console.log(`${caseName} array sort after newArray ${newArray.length}`);
        expect(1).assertEqual(newArray[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySort0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0038
     * @tc.desc   Sorts the ArkTS Array and returns the sorted Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySort0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySort0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array sort before ${array.length}`);
        let newArray: collections.Array<number> = array.sort((a: number, b: number) => b - a);
        console.log(`${caseName} array sort after newArray ${newArray.length}`);
        expect(4).assertEqual(newArray[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArraySort0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0039
     * @tc.desc   Sorts the ArkTS Array and returns the sorted Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArraySort0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArraySort0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array sort before ${array.length}`);
        let newArray: collections.Array<number> = array.sort(undefined);
        console.log(`${caseName} array sort after newArray ${newArray.length}`);
        expect(1).assertEqual(newArray[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayIndexOf0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0040
     * @tc.desc   Returns the index where the search element first appears in ArkTS Array, or-1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayIndexOf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayIndexOf0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c', 'd');
        let index: number = array.indexOf('b');
        console.log(`${caseName} index ${index}`);
        expect(1).assertEqual(index);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayIndexOf0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0041
     * @tc.desc   Returns the index where the search element first appears in ArkTS Array, or-1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayIndexOf0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayIndexOf0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<string> = new collections.Array<string>(' ', ' ', 'a', 'b');
        let index: number = array.indexOf('b');
        console.log(`${caseName} index ${index}`);
        expect(3).assertEqual(index);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayIndexOf0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0042
     * @tc.desc   Returns the index where the search element first appears in ArkTS Array, or-1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayIndexOf0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayIndexOf0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
        let index: number = array.indexOf('d');
        console.log(`${caseName} index ${index}`);
        expect(-1).assertEqual(index);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayForEach0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0043
     * @tc.desc   Executes the provided callback function on each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayForEach0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        let num: number = 0;
        array.forEach(() => {
          num++;
        });
        expect(array.length).assertEqual(num);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });


    /**
     * @tc.name   testArrayForEach0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0044
     * @tc.desc   Executes the provided callback function on each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayForEach0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        array.forEach((value: number) => {
          expect('number').assertEqual(typeof value);
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayMap0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0045
     * @tc.desc   Executes the provided callback function on each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayMap0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array ${array.length}`);
        let mapArray: collections.Array<number> = array.map((value: number) => {
          return value + 2;
        });
        console.log(`${caseName} filter ${mapArray.length}`);
        expect(3).assertEqual(mapArray[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayMap0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0046
     * @tc.desc   Executes the provided callback function on each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayMap0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayMap0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        console.log(`${caseName} array ${array.length}`);
        array.map((value: number, index: number, arr: collections.Array<number>) => {
          expect(arr[index]).assertEqual(value);
          return value + 2;
        });
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });


    /**
     * @tc.name   testArrayFilter0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0047
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFilter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFilter0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let filterArray: collections.Array<number> = array.filter((value: number) => {
          return value > 5;
        });
        console.log(`${caseName} map ${filterArray.length}`);
        expect(filterArray[0] > 5);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFilter0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0048
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFilter0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFilter0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let filterArray: collections.Array<number> = array.filter((value: number, index: number, arr: collections.Array<number>) => {
          expect(arr[index]).assertEqual(value);
          return value > 5;
        });
        console.log(`${caseName} filter ${filterArray.length}`);
        expect(true).assertEqual(filterArray[0] > 5);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayReduce0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0049
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayReduce0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayReduce0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduce((accumulator: number, value: number) => accumulator + value);
        console.log(`${caseName} reduce ${sum}`);
        expect(55).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayReduce0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0050
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayReduce0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayReduce0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduce((accumulator: number, value: number) => accumulator + value, 0);
        console.log(`${caseName} reduce ${sum}`);
        expect(55).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayReduce0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0051
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayReduce0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayReduce0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduce((accumulator: number, value: number) => accumulator + value, 10);
        console.log(`${caseName} reduce ${sum}`);
        expect(65).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayReduce0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0052
     * @tc.desc   Returns a new Array that contains all the elements tested by the specified callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayReduce0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayReduce0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let sum: number = array.reduce((accumulator: number, value: number) => accumulator + value, -1);
        console.log(`${caseName} reduce ${sum}`);
        expect(54).assertEqual(sum);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayAt0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0053
     * @tc.desc   Returns the element at the specified index position in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayAt0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayAt0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let atIndex: number | undefined = array.at(0);
        console.log(`${caseName} at ${atIndex}`);
        expect(1).assertEqual(atIndex);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayAt0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0054
     * @tc.desc   Returns the element at the specified index position in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayAt0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayAt0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let atIndex: number | undefined = array.at(-1);
        console.log(`${caseName} at ${atIndex}`);
        expect(10).assertEqual(atIndex);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayAt0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0055
     * @tc.desc   Returns the element at the specified index position in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayAt0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayAt0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let atIndex: number | undefined = array.at(11);
        console.log(`${caseName} at ${atIndex}`);
        expect(undefined).assertEqual(atIndex);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayAt0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0056
     * @tc.desc   Returns the element at the specified index position in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayAt0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayAt0400';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let atIndex: number | undefined = array.at(0.1);
        console.log(`${caseName} at ${atIndex}`);
        expect(1).assertEqual(atIndex);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayEntries0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0057
     * @tc.desc   Returns a new iterable object that contains key-value pairs for each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayEntries0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayEntries0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<Array<number>> = array.entries();
        console.log(`${caseName} entries ${JSON.stringify(iterator)}`);
        expect('{}').assertEqual(JSON.stringify(iterator));
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayEntries0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0058
     * @tc.desc   Returns a new iterable object that contains key-value pairs for each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayEntries0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayEntries0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<Array<number>> = array.entries();
        console.log(`${caseName} entries ${JSON.stringify(iterator)}`);
        let value: Array<number> = iterator.next().value;
        console.log(`${caseName} entries  value ${value}`);
        expect(0).assertEqual(value[0]);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayKeys0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0059
     * @tc.desc   Returns a new iterable object that contains the key for each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayKeys0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayKeys0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<number> = array.keys();
        console.log(`${caseName} entries ${JSON.stringify(iterator)}`);
        expect('{}').assertEqual(JSON.stringify(iterator));
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayKeys0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0060
     * @tc.desc   Returns a new iterable object that contains the key for each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayKeys0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayKeys0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<number> = array.keys();
        console.log(`${caseName} iterator ${JSON.stringify(iterator)}`);
        let value: number = iterator.next().value;
        console.log(`${caseName} keys  value${value}`);
        expect(0).assertEqual(value);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayValues0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0061
     * @tc.desc   Returns a new iterable object that contains the value of each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayValues0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayValues0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<number> = array.values();
        console.log(`${caseName} values ${JSON.stringify(iterator)}`);
        expect('{}').assertEqual(JSON.stringify(iterator));
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayValues0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0062
     * @tc.desc   Returns a new iterable object that contains the value of each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayValues0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayValues0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let iterator: Iterator<number> = array.values();
        console.log(`${caseName} iterator ${JSON.stringify(iterator)}`);
        let value: number = iterator.next().value;
        console.log(`${caseName} values  value ${value}`);
        expect(1).assertEqual(value);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFind0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0063
     * @tc.desc   Returns a new iterable object that contains the value of each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFind0100';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        console.log(`${caseName} array ${array.length}`);
        let findValue: number | undefined = array.find((value: number) => value > 5);
        console.log(`${caseName} find ${findValue}`);
        expect(6).assertEqual(findValue);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFind0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0064
     * @tc.desc   Returns a new iterable object that contains the value of each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFind0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFind0200';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>();
        console.log(`${caseName} array ${array.length}`);
        let findValue: number | undefined = array.find((value: number) => value > 5);
        console.log(`${caseName} find ${findValue}`);
        expect(undefined).assertEqual(findValue);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayFind0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0065
     * @tc.desc   Returns a new iterable object that contains the value of each element in the Array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFind0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayFind0300';
      console.log(`${caseName} test start `);
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9);
        console.log(`${caseName} array ${array.length}`);
        let findValue: number | undefined = array.find((value: number) => value === 10);
        console.log(`${caseName} find ${findValue}`);
        expect(undefined).assertEqual(findValue);
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
      console.log(`${caseName} test end `);
    });

    /**
     * @tc.name   testArrayIncludes0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_COMPLETE_0066
     * @tc.desc   Determines whether the Array contains the specified element and returns a Boolean value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayIncludes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testArrayIncludes0100';
      console.log(`${caseName} test start `);
