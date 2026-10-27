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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

class NormalClass {
  public value: number;
  constructor(value: number) {
    this.value = value;
  }
}

export default function Int16ArrayBasicTest() {
  describe('Int16ArrayBasicTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   collectionsFifthtest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0001
     * @tc.desc   Int16Array toString 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.toString;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest1500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0002
     * @tc.desc   Int16Array.toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).toString()
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0003
     * @tc.desc   Int16Array toLocaleString 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.toLocaleString;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest1700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0004
     * @tc.desc   Int16Array.toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).toLocaleString()
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest1800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0005
     * @tc.desc   Int16Array copyWithin 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.copyWithin;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest1900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0006
     * @tc.desc   Int16Array.copyWithin 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).copyWithin(3, 1, 3)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0007
     * @tc.desc   Int16Array some 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.some;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0008
     * @tc.desc   Int16Array.some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).some((element: number) => element < 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0009
     * @tc.desc   Int16Array.every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).every((element: number) => element < 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0010
     * @tc.desc   Int16Array every 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.every;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0011
     * @tc.desc   Int16Array fill 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.fill;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0012
     * @tc.desc   Int16Array.filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).filter((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0013
     * @tc.desc   Int16Array filter 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.filter;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0014
     * @tc.desc   Int16Array.find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).find((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0015
     * @tc.desc   Int16Array find 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.find;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest2900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0016
     * @tc.desc   Int16Array.findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).findIndex((element: number) => element % 2 == 0)
            console.info(`m[${key}] = ${value}`);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0017
     * @tc.desc   Int16Array findIndex 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.findIndex;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0018
     * @tc.desc   Int16Array.forEach 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).findIndex((element: number) => element % 2 == 0)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0019
     * @tc.desc   Int16Array forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.forEach;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0020
     * @tc.desc   Int16Array.indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).indexOf(9, 2)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0021
     * @tc.desc   Int16Array indexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.indexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0022
     * @tc.desc   Int16Array.lastIndexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).lastIndexOf(9, 2)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0023
     * @tc.desc   Int16Array lastIndexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0024
     * @tc.desc   Int16Array.join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).join('9, 2')
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest3900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0025
     * @tc.desc   Int16Array join 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.lastIndexOf;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0026
     * @tc.desc   Int16Array.map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).map(Math.sqrt)
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0027
     * @tc.desc   Int16Array map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.map;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0028
     * @tc.desc   Int16Array.reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reduce((accumulator: number, value: number) => accumulator + value);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0029
     * @tc.desc   Int16Array reduce 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduce;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0030
     * @tc.desc   Int16Array.reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reduceRight((accumulator: number, value: number) => accumulator + value);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0031
     * @tc.desc   Int16Array reduceRight 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reduceRight;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0032
     * @tc.desc   Int16Array.reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).reverse();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4501
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0033
     * @tc.desc   Int16Array reverse 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4501';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.reverse;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4601
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0034
     * @tc.desc   Int16Array.set 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4601';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).set([1, 2, 3], 3);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0035
     * @tc.desc   Int16Array set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.set;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0036
     * @tc.desc   Int16Array.slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).slice(1, 3);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest4900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0037
     * @tc.desc   Int16Array slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.slice;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0038
     * @tc.desc   Int16Array.sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).sort((a: number, b: number) => a - b);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0039
     * @tc.desc   Int16Array sort 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.sort;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0040
     * @tc.desc   Int16Array.subarray 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).subarray();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0041
     * @tc.desc   Int16Array subarray 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.subarray;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0042
     * @tc.desc   Int16Array.at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).at(2);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0043
     * @tc.desc   Int16Array at 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.at;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0044
     * @tc.desc   Int16Array.includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).includes(2);
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0045
     * @tc.desc   Int16Array includes 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.includes;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0046
     * @tc.desc   Int16Array.entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).entries();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest5900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0047
     * @tc.desc   Int16Array entries 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.entries;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest6000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0048
     * @tc.desc   Int16Array.keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).keys();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest6100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0049
     * @tc.desc   Int16Array keys 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Int16Array([1, 2, 3, 4, 5]);
        const normal = new NormalClass(10);
        const unbound = array.keys;
        const bound: () => void = unbound.bind(normal);
        try {
          bound()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   collectionsFifthtest6200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_BASIC_0050
     * @tc.desc   Int16Array.values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('collectionsFifthtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'collectionsFifthtest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Int16Array([1, 2, 3, 4, 5]);
          array.forEach((value, key, array) => {
            array.fill(1,4).forEach((value, key, array) => {
              array.fill(1,4).values();
              console.info(`m[${key}] = ${value}`);
            });
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })
    
  })
}