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

export default function ArrayExtendedTest() {
  describe('ArrayExtendedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200);
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
     * @tc.name   CollectionsSecondtest4400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0001
     * @tc.desc   Array join 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).join('4');
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
     * @tc.name   CollectionsSecondtest4500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0002
     * @tc.desc   Array 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.join;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest4600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0003
     * @tc.desc   Array shift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).shift();
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
     * @tc.name   CollectionsSecondtest4700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0004
     * @tc.desc   Array shift 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.shift;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest4701
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0005
     * @tc.desc   Array reverse 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4701';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).reverse();
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
     * @tc.name   CollectionsSecondtest4800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0006
     * @tc.desc   Array 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reverse;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest4900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0007
     * @tc.desc   Array unshift 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest4900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).unshift(0);
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
     * @tc.name   CollectionsSecondtest5000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0008
     * @tc.desc   Array 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.unshift;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest5100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0009
     * @tc.desc   Array toString 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).toString();
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
     * @tc.name   CollectionsSecondtest5200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0010
     * @tc.desc   Array toString 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.toString;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest5300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0011
     * @tc.desc   Array slice 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -53]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).slice(1,2);
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
     * @tc.name   CollectionsSecondtest5400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0012
     * @tc.desc   Array slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.slice;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest5500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0013
     * @tc.desc   Array sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).sort(((a: number, b: number) => a - b));
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
     * @tc.name   CollectionsSecondtest5600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0014
     * @tc.desc   Array sort 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.sort;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest5700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0015
     * @tc.desc   Array sort 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.copyWithin(3, 1, 3).forEach((value1, value2, array) => {
              let a = array.copyWithin(3, 1, 3).indexOf(1);
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
     * @tc.name   CollectionsSecondtest5800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0016
     * @tc.desc   Array sort 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.indexOf;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest5900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0017
     * @tc.desc   Array forEach 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest5900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.forEach((value1, value2, Array) => {
              let b = Array.sort((a: number, b: number) => b - a).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.name   CollectionsSecondtest6000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0018
     * @tc.desc   Array forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.forEach;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest6100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0019
     * @tc.desc   Array map 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
              let b = Array.map((a: number, b: number) => b - a).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.name   CollectionsSecondtest6200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0020
     * @tc.desc   Array map 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.forEach;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest6300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0021
     * @tc.desc   Array filter 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, Array) => {
              let b = Array.filter((value : number) => value % 2 === 0).forEach((value1, value2, array) => {
                console.info('array:',array)
              });
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
     * @tc.name   CollectionsSecondtest6400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0022
     * @tc.desc   Array filter 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.filter;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest6500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0023
     * @tc.desc   Array reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce((accumulator, value) => accumulator + value);
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
     * @tc.name   CollectionsSecondtest6600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0024
     * @tc.desc   Array reduce 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduce;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest6700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0025
     * @tc.desc   Array reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce((accumulator, value) => accumulator + value);
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
     * @tc.name   CollectionsSecondtest6800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0026
     * @tc.desc   Array reduce 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.reduce;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest6900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0027
     * @tc.desc   Array reduce 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest6900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.reduce<number>((accumulator: number, value: number) => accumulator + value, 0);
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
     * @tc.name   CollectionsSecondtest7000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0028
     * @tc.desc   Array at 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.at;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest7100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0029
     * @tc.desc   Array at 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.at(2);
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
     * @tc.name   CollectionsSecondtest7200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0030
     * @tc.desc   Array entries 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.entries;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest7300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0031
     * @tc.desc   Array entries 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7300';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.entries();
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
     * @tc.name   CollectionsSecondtest7400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0032
     * @tc.desc   Array keys 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7400';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.keys;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest7500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0033
     * @tc.desc   Array keys 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7500';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.keys();
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
     * @tc.name   CollectionsSecondtest7600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0034
     * @tc.desc   Array values 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7600';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.values;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest7700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0035
     * @tc.desc   Array values 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7700';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.values();
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
     * @tc.name   CollectionsSecondtest7800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0036
     * @tc.desc   Array find 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7800';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.find;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest7900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0037
     * @tc.desc   Array find 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest7900';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([-10, 20, -30, 40, -50]).forEach((value1, value2, Array) => {
            let a = Array.sort((a: number, b: number) => a - b).forEach((value1, value2, array) => {
              array.find((value: number) => value % 2 === 0);
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
     * @tc.name   CollectionsSecondtest8000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0038
     * @tc.desc   Array includes 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8000';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          let array = new collections.Array<number>(1, 2, 3, 4, 5);
          const normal = new NormalClass(10);
          const unbound = array.includes;
          const bound: () => void = unbound.bind(normal);
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
     * @tc.name   CollectionsSecondtest8100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_EXTENDED_0039
     * @tc.desc   Array includes 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionsSecondtest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionsSecondtest8100';
