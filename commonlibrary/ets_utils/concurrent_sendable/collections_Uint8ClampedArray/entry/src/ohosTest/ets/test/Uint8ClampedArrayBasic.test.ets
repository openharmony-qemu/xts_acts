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
//50
export default function Uint8ClampedArrayBasicTest() {
  describe('Uint8ClampedArrayBasicTest', () => {
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
     * @tc.name   Uint8ClampedArraytest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0001
     * @tc.desc   Uint8ClampedArray toString 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest1500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0002
     * @tc.desc   Uint8ClampedArray.toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0003
     * @tc.desc   Uint8ClampedArray toLocaleString 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest1700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0004
     * @tc.desc   Uint8ClampedArray.toLocaleString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest1800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0005
     * @tc.desc   Uint8ClampedArray copyWithin 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest1900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0006
     * @tc.desc   Uint8ClampedArray.copyWithin 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest1900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0007
     * @tc.desc   Uint8ClampedArray some 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0008
     * @tc.desc   Uint8ClampedArray.some 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0009
     * @tc.desc   Uint8ClampedArray.every 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0010
     * @tc.desc   Uint8ClampedArray every 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0011
     * @tc.desc   Uint8ClampedArray fill 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0012
     * @tc.desc   Uint8ClampedArray.filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0013
     * @tc.desc   Uint8ClampedArray filter 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0014
     * @tc.desc   Uint8ClampedArray.find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0015
     * @tc.desc   Uint8ClampedArray find 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest2900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0016
     * @tc.desc   Uint8ClampedArray.findIndex 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest2900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0017
     * @tc.desc   Uint8ClampedArray findIndex 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0018
     * @tc.desc   Uint8ClampedArray.forEach 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0019
     * @tc.desc   Uint8ClampedArray forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0020
     * @tc.desc   Uint8ClampedArray.indexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0021
     * @tc.desc   Uint8ClampedArray indexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0022
     * @tc.desc   Uint8ClampedArray.lastIndexOf 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0023
     * @tc.desc   Uint8ClampedArray lastIndexOf 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0024
     * @tc.desc   Uint8ClampedArray.join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest3900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0025
     * @tc.desc   Uint8ClampedArray join 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest3900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0026
     * @tc.desc   Uint8ClampedArray.map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0027
     * @tc.desc   Uint8ClampedArray map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0028
     * @tc.desc   Uint8ClampedArray.reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0029
     * @tc.desc   Uint8ClampedArray reduce 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0030
     * @tc.desc   Uint8ClampedArray.reduceRight 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0031
     * @tc.desc   Uint8ClampedArray reduceRight 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0032
     * @tc.desc   Uint8ClampedArray.reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4501
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0033
     * @tc.desc   Uint8ClampedArray reverse 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4501';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4601
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0034
     * @tc.desc   Uint8ClampedArray.set 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4601';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0035
     * @tc.desc   Uint8ClampedArray set 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0036
     * @tc.desc   Uint8ClampedArray.slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest4900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0037
     * @tc.desc   Uint8ClampedArray slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0038
     * @tc.desc   Uint8ClampedArray.sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0039
     * @tc.desc   Uint8ClampedArray sort 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0040
     * @tc.desc   Uint8ClampedArray.subarray 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0041
     * @tc.desc   Uint8ClampedArray subarray 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0042
     * @tc.desc   Uint8ClampedArray.at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0043
     * @tc.desc   Uint8ClampedArray at 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0044
     * @tc.desc   Uint8ClampedArray.includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0045
     * @tc.desc   Uint8ClampedArray includes 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0046
     * @tc.desc   Uint8ClampedArray.entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest5900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0047
     * @tc.desc   Uint8ClampedArray entries 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest6000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0048
     * @tc.desc   Uint8ClampedArray.keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest6100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0049
     * @tc.desc   Uint8ClampedArray keys 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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
     * @tc.name   Uint8ClampedArraytest6200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_BASIC_0050
     * @tc.desc   Uint8ClampedArray.values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArraytest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'Uint8ClampedArraytest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
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