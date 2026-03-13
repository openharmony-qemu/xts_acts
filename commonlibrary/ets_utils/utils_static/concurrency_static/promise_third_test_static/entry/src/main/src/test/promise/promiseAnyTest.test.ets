/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { sleep } from "../Util.test"
class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomError';
  }
}
class TestClass {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Service {
  private name: string;
  private initTime: int

  constructor(name: string, initTime: int) {
    this.name = name
    this.initTime = initTime
  }

  async initialize(): Promise<string> {
    await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, this.initTime)});
    return `Service ${this.name} ready`;
  }
}

async function resolveDependency (id: int, deps: int[]): Promise<int> {
  if (deps.length > 0) {
    // Resolve dependencies first
    await Promise.all(deps.map(dep =>
    resolveDependency(dep, [] as int[])
    ));
  }
  // Simulate resolution time
  await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, id * 20)});
  return id;
};


export default function promiseAnyTest() {
  describe('promiseAnyTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0010
     * @tc.name PromiseAnyTest001
     * @tc.desc All promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: Promise<int> = Promise.resolve(2);
      const p3: Promise<int> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0020
     * @tc.name PromiseAnyTest002
     * @tc.desc Some promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new Error('Error 1'));
      const p2: Promise<int> = Promise.resolve(2);
      const p3: Promise<int> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0030
     * @tc.name PromiseAnyTest003
     * @tc.desc All promises reject, return AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Error 1'));
      const p2: Promise<number> = Promise.reject(new Error('Error 2'));
      const p3: Promise<number> = Promise.reject(new Error('Error 3'));

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0040
     * @tc.name PromiseAnyTest004
     * @tc.desc First promise resolves later, faster one returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(1), 100)});
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(2), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0050
     * @tc.name PromiseAnyTest005
     * @tc.desc Handle array with non-promise values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await Promise.any([1, 2, 3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0060
     * @tc.name PromiseAnyTest006
     * @tc.desc Pass empty array, return rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        await Promise.any([] as number[]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).message.includes('')).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0070
     * @tc.name PromiseAnyTest007
     * @tc.desc Contains pending promise and resolved promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = new Promise<int>(() => {
      }); // Forever pending
      const p2: Promise<int> = Promise.resolve(2);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0080
     * @tc.name PromiseAnyTest008
     * @tc.desc Test promise state changes: reject first then resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let resolveFn: (value: number) => void = ()=>{};
      const p1: Promise<number> = new Promise<number>((resolve, reject) => {
        setTimeout(() => reject(new Error('Error')), 50);
      });
      const p2: Promise<number> = new Promise<number>((resolve) => {
        resolveFn = resolve;
      });
      setTimeout(() => resolveFn(2), 100);
      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0090
     * @tc.name PromiseAnyTest009
     * @tc.desc Verify AggregateError contains all error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Error 1'));
      const p2: Promise<number> = Promise.reject(new Error('Error 2'));

      try {
        await Promise.any([p1, p2]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(2);
        expect(((error as AggregateError).errors[0] as Error).message).assertEqual('Error 1');
        expect(((error as AggregateError).errors[1] as Error).message).assertEqual('Error 2');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0100
     * @tc.name PromiseAnyTest010
     * @tc.desc Test mixed types in promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.reject(new Error('Error'));
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(42), 50)});
      const p3: Promise<boolean> = Promise.resolve(true);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0110
     * @tc.name PromiseAnyTest011
     * @tc.desc First resolved promise with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.resolve("first");
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve("second"), 100)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0140
     * @tc.name PromiseAnyTest014
     * @tc.desc Single promise that resolves
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<boolean> = new Promise<boolean>((resolve) => resolve(true));

      const result = await Promise.any([p1]);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0150
     * @tc.name PromiseAnyTest015
     * @tc.desc Single promise that rejects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve, reject) => reject(new Error('Single error')));

      try {
        await Promise.any([p1]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0170
     * @tc.name PromiseAnyTest017
     * @tc.desc Non-promise and promise mix in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(100), 50)});
      const mixedArray = [42, p1, "string"];

      const result = await Promise.any(mixedArray);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0200
     * @tc.name PromiseAnyTest020
     * @tc.desc Resolve with undefined value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<undefined> = new Promise<undefined>((resolve) => resolve(undefined));
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(1), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0210
     * @tc.name PromiseAnyTest021
     * @tc.desc Resolve with null value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => resolve(null));
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve("not null"), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0220
     * @tc.name PromiseAnyTest022
     * @tc.desc Resolve with bigint type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<bigint> = new Promise<bigint>((resolve) => resolve(BigInt(9007199254740991)));
      const p2: Promise<bigint> = new Promise<bigint>((resolve) => {setTimeout(() => resolve(BigInt(123)), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(BigInt(9007199254740991));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0230
     * @tc.name PromiseAnyTest023
     * @tc.desc Multiple layers of promise resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      resolve(new Promise<number>((res) => res(10)))
      );
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(20), 30)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0240
     * @tc.name PromiseAnyTest024
     * @tc.desc Nested promises in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const nestedPromise: Promise<Promise<int>> = new Promise<Promise<int>>((resolve) =>{
      setTimeout(() => resolve(Promise.resolve(5)), 10)}
      );
      const p1: Promise<int> = new Promise<int>((resolve) => {setTimeout(() => resolve(1), 50)});

      const result = await Promise.any([nestedPromise, p1]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0250
     * @tc.name PromiseAnyTest025
     * @tc.desc Very fast resolving promise
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => {
        resolve("immediate");
      });
      const p2: Promise<string> = Promise.resolve("resolved");

      const result = await Promise.any([p1, p2]);
      // Either could resolve first depending on implementation, but we check for either valid result
      expect(result === "immediate" || result === "resolved").assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0300
     * @tc.name PromiseAnyTest030
     * @tc.desc Resolve with function type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const func1 = () => "first";
      const func2 = () => "second";

      const p1: Promise<() => string> = new Promise<() => string>((resolve) => resolve(func1));
      const p2: Promise<() => string> = new Promise<() => string>((resolve) => {setTimeout(() => resolve(func2), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result()).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0310
     * @tc.name PromiseAnyTest031
     * @tc.desc Resolve with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => resolve([1, 2, 3]));
      const p2: Promise<number[]> = new Promise<number[]>((resolve) => {setTimeout(() => resolve([4, 5, 6]), 50)});

      const result = await Promise.any([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0320
     * @tc.name PromiseAnyTest032
     * @tc.desc Test with date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);

      const p1: Promise<Date> = new Promise<Date>((resolve) => {setTimeout(() => resolve(date1), 50)});
      const p2: Promise<Date> = new Promise<Date>((resolve) => resolve(date2));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(date2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0330
     * @tc.name PromiseAnyTest033
     * @tc.desc Resolve after multiple pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p2: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p3: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(3), 100)});

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0340
     * @tc.name PromiseAnyTest034
     * @tc.desc Different rejection types including Error subclasses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new CustomError('Custom error'));
      const p2: Promise<number> = Promise.reject(new SyntaxError('Syntax error'));
      const p3: Promise<number> = Promise.reject(new ReferenceError('Reference error'));

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(3);
        expect((error as AggregateError).errors[0] instanceof CustomError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0350
     * @tc.name PromiseAnyTest035
     * @tc.desc Resolve with regexp value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const regex1 = new RegExp('test1');
      const regex2 = new RegExp('test2');

      const p1: Promise<RegExp> = new Promise<RegExp>((resolve) => resolve(regex1));
      const p2: Promise<RegExp> = new Promise<RegExp>((resolve) => {setTimeout(() => resolve(regex2), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(regex1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0360
     * @tc.name PromiseAnyTest036
     * @tc.desc Test with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);

      const p1: Promise<Map<string, number>> =
        new Promise<Map<string, number>>((resolve) => {setTimeout(() => resolve(map1), 50)});
      const p2: Promise<Map<string, number>> = new Promise<Map<string, number>>((resolve) => resolve(map2));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(map2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0370
     * @tc.name PromiseAnyTest037
     * @tc.desc Test with Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<number>([4, 5, 6]);

      const p1: Promise<Set<number>> = new Promise<Set<number>>((resolve) => resolve(set1));
      const p2: Promise<Set<number>> = new Promise<Set<number>>((resolve) => {setTimeout(() => resolve(set2), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(set1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0390
     * @tc.name PromiseAnyTest039
     * @tc.desc Resolve with class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance1 = new TestClass("first");
      const instance2 = new TestClass("second");

      const p1: Promise<TestClass> = new Promise<TestClass>((resolve) => resolve(instance1));
      const p2: Promise<TestClass> = new Promise<TestClass>((resolve) => {setTimeout(() => resolve(instance2), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result.value).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0410
     * @tc.name PromiseAnyTest041
     * @tc.desc Cascading promise resolutions with varying delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(1), 100)}
      );
      const p2: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(new Promise<number>((res) =>{
      setTimeout(() => res(2), 50)}
      )), 30)}
      );

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0420
     * @tc.name PromiseAnyTest042
     * @tc.desc Async function returning promises in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFn1 = async (): Promise<int> => {
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 80)});
        return 1;
      };

      const asyncFn2 = async (): Promise<int> => {
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 40)});
        return 2;
      };

      const result = await Promise.any([asyncFn1(), asyncFn2()]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0430
     * @tc.name PromiseAnyTest043
     * @tc.desc Deeply nested promises with different resolve times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const nestedPromise: Promise<Promise<Promise<string>>> = new Promise<Promise<Promise<string>>>((resolve) =>{
      setTimeout(() => resolve(new Promise<Promise<string>>((res) =>{
      setTimeout(() => res(Promise.resolve("deep")), 20)}
      )), 10)}
      );

      const directPromise: Promise<string> = new Promise<string>((resolve) =>{
      setTimeout(() => resolve("direct"), 50)}
      );

      const result = await Promise.any([nestedPromise, directPromise]);
      expect(result).assertEqual("deep");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0440
     * @tc.name PromiseAnyTest044
     * @tc.desc Race between immediate reject and delayed resolve
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Immediate reject'));
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(2), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0450
     * @tc.name PromiseAnyTest045
     * @tc.desc Sequential promise creation affecting resolution order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<int>[] = [];

      // Create promises in sequence with increasing delays
      for (let i = 0; i < 5; i++) {
        promises.push(new Promise<int>((resolve) =>{
        setTimeout(() => resolve(i), (5 - i) * 20)}
        ));
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 10)});
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0470
     * @tc.name PromiseAnyTest047
     * @tc.desc Timing test with microtasks vs macrotasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result1 = 0;
      let result2 = 0;

      // Microtask (Promise.then)
      const p1: Promise<int> = Promise.resolve(1).then(num => {
        result1 = num;
        return num;
      });

      // Macrotask (setTimeout)
      const p2: Promise<int> = new Promise<int>((resolve) =>{
      setTimeout(() => {
        result2 = 2;
        resolve(2);
      }, 0)}
      );

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(1);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0500
     * @tc.name PromiseAnyTest050
     * @tc.desc Multiple levels of promise chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain1: Promise<number> = Promise.resolve(1)
        .then(num => new Promise<number>((res) => {setTimeout(() => res(num + 1), 50)}))
        .then(num => new Promise<number>((res) => {setTimeout(() => res(num + 1), 50)}));

      const chain2: Promise<number> = Promise.resolve(10)
        .then(num => new Promise<number>((res) => {setTimeout(() => res(num + 1), 20)}))
        .then(num => new Promise<number>((res) => {setTimeout(() => res(num + 1), 20)}));

      const result = await Promise.any([chain1, chain2]);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0520
     * @tc.name PromiseAnyTest052
     * @tc.desc Promise.any with promises created in async loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<int>[] = [];

      for (let i = 1; i <= 5; i++) {
        // Create promises with increasing delays
        const p: Promise<int> = new Promise<int>((resolve) =>{
        setTimeout(() => resolve(i), i * 20)}
        );
        promises.push(p);
        // Add small delay between promise creation
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 5)});
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0530
     * @tc.name PromiseAnyTest053
     * @tc.desc Nested Promise.any calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerAny1: Promise<number> = Promise.any([
        new Promise<number>((resolve) => {setTimeout(() => resolve(1), 100)}),
        new Promise<number>((resolve) => {setTimeout(() => resolve(2), 50)})
      ]);

      const innerAny2: Promise<number> = Promise.any([
        new Promise<number>((resolve) => {setTimeout(() => resolve(3), 30)}),
        new Promise<number>((resolve) => {setTimeout(() => resolve(4), 40)})
      ]);

      const result = await Promise.any([innerAny1, innerAny2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0550
     * @tc.name PromiseAnyTest055
     * @tc.desc Reject cascade with final resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createTimedPromise = (value: number, delay: int, shouldReject: boolean): Promise<number> => {
        return new Promise<number>((resolve, reject) =>{
        setTimeout(() => {
          if (shouldReject) {
            reject(new Error(`Rejected ${value}`));
          } else {
            resolve(value);
          }
        }, delay)}
        );
      };

      const promises = [
        createTimedPromise(1, 10, true),
        createTimedPromise(2, 20, true),
        createTimedPromise(3, 30, true),
        createTimedPromise(4, 40, true),
        createTimedPromise(5, 50, false)
      ];

      const result = await Promise.any(promises);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0570
     * @tc.name PromiseAnyTest057
     * @tc.desc Timing test with overlapping async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      let p1ResolveTime: number = 0
      let p2ResolveTime: number = 0
      let finish = false
      const p1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => {
        p1ResolveTime = Date.now() - start;
        resolve(1);
        finish = true
      }, 50)}
      );

      const p2: Promise<number> = new Promise<number>((resolve) => {
        // Start a shorter timer after a delay
        setTimeout(() => {
          setTimeout(() => {
            p2ResolveTime = Date.now() - start;
            resolve(2);
          }, 30);
        }, 10);
      });
      const result = await Promise.any([p1, p2]);
      while (!finish) {
        await sleep(10)
      }
      expect(result).assertEqual(2);
      expect(p2ResolveTime).assertLess(p1ResolveTime);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0580
     * @tc.name PromiseAnyTest058
     * @tc.desc Promise.any with promises that resolve after multiple steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const step1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(10), 20)}
      );

      const step2: Promise<number> = step1.then(num =>
      new Promise<number>((resolve) => {setTimeout(() => resolve(num + 5), 20)})
      );

      const step3: Promise<number> = step2.then(num =>
      new Promise<number>((resolve) => {setTimeout(() => resolve(num + 3), 20)})
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(15), 50)}
      );

      const result = await Promise.any([step3, alternative]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0590
     * @tc.name PromiseAnyTest059
     * @tc.desc Race between multiple async initialization processes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const serviceA = new Service('A', 100);
      const serviceB = new Service('B', 60);
      const serviceC = new Service('C', 80);

      const result = await Promise.any([
        serviceA.initialize(),
        serviceB.initialize(),
        serviceC.initialize()
      ]);

      expect(result).assertEqual('Service B ready');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0600
     * @tc.name PromiseAnyTest060
     * @tc.desc Async validation chain with early success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validate = (value: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve, reject) =>{
        setTimeout(() => {
          if (value % 2 === 0) {
            resolve(value);
          } else {
            reject(new Error(`Invalid: ${value}`));
          }
        }, delay)}
        );
      };

      const result = await Promise.any([
        validate(1, 10), // Rejects
        validate(3, 20), // Rejects
        validate(5, 30), // Rejects
        validate(4, 40), // Resolves
        validate(6, 50)// Resolves later
      ]);

      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0620
     * @tc.name PromiseAnyTest062
     * @tc.desc Promise.any with dynamic promise creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createPromisesDynamically = async (count: number): Promise<Promise<number>[]> => {
        const promises: Promise<number>[] = [];
        for (let i = 0; i < count; i++) {
          // Create promises with random delays
          const delay = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<number>((resolve) => {
          setTimeout(() => resolve(i), delay.toInt())}
          ));
          await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 5)});
        }
        return promises;
      };

      const promises = await createPromisesDynamically(5);
      const result = await Promise.any(promises);

      // Find the smallest delay promise
      const minIndex = promises.findIndex((val, idx) => idx === result);
      expect(minIndex).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0640
     * @tc.name PromiseAnyTest064
     * @tc.desc Async dependency resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.any([
        resolveDependency(1, [2, 3]), // Depends on 2 and 3
        resolveDependency(2, []), // No dependencies
        resolveDependency(3, [4]), // Depends on 4
        resolveDependency(4, [])// No dependencies
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0650
     * @tc.name PromiseAnyTest065
     * @tc.desc Promise.any with promises that resolve in reverse creation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<int>[] = [];

      // Create promises that resolve in reverse order of creation
      for (let i = 1; i <= 5; i++) {
        promises.push(new Promise<int>((resolve) => {
        setTimeout(() => resolve(i), (6 - i) * 30)}
        ));
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0660
     * @tc.name PromiseAnyTest066
     * @tc.desc Complex error handling in nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const riskyOperation = (success: boolean, delay: int, value: number): Promise<number> => {
        return new Promise<number>((resolve, reject) =>{
        setTimeout(() => {
          if (success) {
            resolve(value);
          } else {
            reject(new Error(`Operation failed: ${value}`));
          }
        }, delay)}
        );
      };

      const result = await Promise.any([
        riskyOperation(false, 10, 1),
        riskyOperation(false, 20, 2),
        riskyOperation(true, 30, 3),
        riskyOperation(true, 40, 4)
      ]);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0670
     * @tc.name PromiseAnyTest067
     * @tc.desc Async data processing pipeline race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processData = async (data: string, delay: int): Promise<string> => {
        // Step 1: Validate
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, (delay * 0.2).toInt())});
        // Step 2: Transform
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, (delay * 0.3).toInt())});
        // Step 3: Finalize
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, (delay * 0.5).toInt())});
        return `Processed: ${data}`;
      };

      const result = await Promise.any([
        processData("A", 100),
        processData("B", 60),
        processData("C", 80)
      ]);

      expect(result).assertEqual("Processed: B");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0680
     * @tc.name PromiseAnyTest068
     * @tc.desc Promise.any with promises that change state after delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resolveP1: (value: number) => void = ()=>{};
      let resolveP2: (value: number) => void = ()=>{};

      const p1: Promise<number> = new Promise<number>((resolve) => {
        resolveP1 = resolve;
      });

      const p2: Promise<number> = new Promise<number>((resolve) => {
        resolveP2 = resolve;
      });

      // Schedule resolutions in reverse order
      setTimeout(() => resolveP2(2), 50);
      setTimeout(() => resolveP1(1), 30);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0690
     * @tc.name PromiseAnyTest069
     * @tc.desc Concurrent async tasks with different resource acquisition times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const acquireResource = async (name: string, delay: int): Promise<string> => {
        // Simulate resource acquisition delay
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, delay)});
        return `Resource ${name} acquired`;
      };

      const result = await Promise.any([
        acquireResource("DB", 100),
        acquireResource("Cache", 40),
        acquireResource("API", 70)
      ]);

      expect(result).assertEqual("Resource Cache acquired");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0700
     * @tc.name PromiseAnyTest070
     * @tc.desc Promise.any with mixed immediate and delayed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Immediate reject
      const p1: Promise<int> = Promise.reject(new Error('Immediate reject'));

      // Immediate resolve
      const p2: Promise<int> = Promise.resolve(2);

      // Short delay resolve
      const p3: Promise<int> = new Promise<int>((resolve) => {setTimeout(() => resolve(3), 10)});

      // Medium delay resolve
      const p4: Promise<int> = new Promise<int>((resolve) => {setTimeout(() => resolve(4), 50)});

      // Long delay reject
      const p5: Promise<int> = new Promise<int>((resolve, reject) => {setTimeout(() => reject(new Error('Late reject')), 100)});

      const result = await Promise.any([p1, p2, p3, p4, p5]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0710
     * @tc.name PromiseAnyTest071
     * @tc.desc Three-level nested promises timing race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Three-level nesting, total delay 10+20+30=60ms
      const nested3: Promise<number> = new Promise<number>((resolve) =>
      {setTimeout(() => resolve(
        new Promise<number>((res) => {setTimeout(() => res(
          new Promise<number>((r) => {setTimeout(() => r(3), 30)})
        ), 20)})
      ), 10)}
      );

      // Two-level nesting, total delay 40+15=55ms
      const nested2: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(
        new Promise<number>((res) => {setTimeout(() => res(2), 15)})
      ), 40)}
      );

      const result = await Promise.any([nested3, nested2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0720
     * @tc.name PromiseAnyTest072
     * @tc.desc Timing control in async function cascade calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncStep = async (value: number, delay: int): Promise<number> => {
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, delay)});
        return value;
      };

      const cascade1: Promise<number> = asyncStep(1, 20)
        .then(num => asyncStep(num * 2, 30))
        .then(num => asyncStep(num + 5, 20));

      const cascade2: Promise<number> = asyncStep(2, 15)
        .then(num => asyncStep(num * 3, 25))
        .then(num => asyncStep(num - 4, 10));

      const result = await Promise.any([cascade1, cascade2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0730
     * @tc.name PromiseAnyTest073
     * @tc.desc Multi-stage async operations with varying completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stage1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(10), 15)}
      );

      const pipelineA: Promise<number> = stage1
        .then(num => new Promise<number>((resolve) =>{
        setTimeout(() => resolve(num + 5), 25)}
        ))
        .then(num => new Promise<number>((resolve) =>{
        setTimeout(() => resolve(num * 2), 20)}
        ));

      const stage2: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(8), 10)}
      );

      const pipelineB: Promise<number> = stage2
        .then(num => new Promise<number>((resolve) =>{
        setTimeout(() => resolve(num * 3), 15)}
        ))
        .then(num => new Promise<number>((resolve) =>{
        setTimeout(() => resolve(num + 7), 10)}
        ));

      const result = await Promise.any([pipelineA, pipelineB]);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0740
     * @tc.name PromiseAnyTest074
     * @tc.desc Race between sequentially created promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createChain = (id: number, baseDelay: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(new Promise<number>((res) => {
              setTimeout(() => {
                res(new Promise<number>((r) => {
                  setTimeout(() => r(id), baseDelay / 5 );
                }));
              }, (baseDelay * 0.3).toInt());
            }));
          }, (baseDelay * 0.5).toInt());
        });
      };

      const chains: Promise<number>[] = [];
      // Create chains with increasing base delays
      for (let i = 1; i <= 4; i++) {
        chains.push(createChain(i, i * 20));
        // Small delay between chain creation
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 5)});
      }

      const result = await Promise.any(chains);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0750
     * @tc.name PromiseAnyTest075
     * @tc.desc Async validation cascades with early success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validateLevel1 = (value: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            if (value.length > 3) {
              resolve(value);
            } else {
              reject(new Error(`Level 1 failed: ${value}`));
            }
          }, 10);
        });
      };

      const validateLevel2 = (value: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            if (value.includes('valid')) {
              resolve(value);
            } else {
              reject(new Error(`Level 2 failed: ${value}`));
            }
          }, 15);
        });
      };

      const validatePipeline = (value: string, initialDelay: int): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve(validateLevel1(value)
              .then(validated => validateLevel2(validated)));
          }, initialDelay);
        });
      };

      const result = await Promise.any([
        validatePipeline("test", 30), // Will fail level 2
        validatePipeline("valid1", 40), // Will succeed
        validatePipeline("short", 20), // Will fail level 1
        validatePipeline("valid2", 50)// Will succeed later
      ]);

      expect(result).assertEqual("valid1");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0760
     * @tc.name PromiseAnyTest076
     * @tc.desc Multi-layered promise resolution with cumulative delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const layer1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(1), 10)}
      );

      const layer2: Promise<number> = layer1.then(num =>
      new Promise<number>((resolve) => {setTimeout(() => resolve(num * 2), 15)})
      );

      const layer3: Promise<number> = layer2.then(num =>
      new Promise<number>((resolve) => {setTimeout(() => resolve(num + 3), 20)})
      );

      const alternative1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(5), 30)}
      );

      const alternative2: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(6), 40)}
      );

      const result = await Promise.any([layer3, alternative1, alternative2]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0780
     * @tc.name PromiseAnyTest078
     * @tc.desc Cascading promises with alternating resolve/reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stepA: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(10), 10)}
      );

      const stepB: Promise<number> = stepA.then(num =>
      new Promise<number>((resolve, reject) =>{
      setTimeout(() => reject(new Error('Failed at B')), 15)}
      )
      ).catch(() => new Promise<number>((resolve) =>{
      setTimeout(() => resolve(20), 10)}
      ));

      const stepC: Promise<number> = stepB.then(num =>
      new Promise<number>((resolve) =>{
      setTimeout(() => resolve(num + 5), 20)}
      )
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(22), 40)}
      );

      const result = await Promise.any([stepC, alternative]);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0790
     * @tc.name PromiseAnyTest079
     * @tc.desc Async dependency chains with varying resolution paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dependencyX: Promise<string> = new Promise<string>((resolve) =>{
      setTimeout(() => resolve("X"), 25)}
      );

      const dependencyY: Promise<string> = new Promise<string>((resolve) =>{
      setTimeout(() => resolve("Y"), 15)}
      );

      const serviceA: Promise<string> = dependencyX.then(x =>
      new Promise<string>((resolve) =>{
      setTimeout(() => resolve(`ServiceA:${x}`), 20)}
      )
      );

      const serviceB: Promise<string> = dependencyY.then(y =>
      new Promise<string>((resolve) =>{
      setTimeout(() => resolve(`ServiceB:${y}`), 30)}
      )
      );

      const serviceC: Promise<string> = Promise.all([dependencyX, dependencyY])
        .then((res: string[]) => new Promise<string>((resolve) =>{
        setTimeout(() => resolve(`ServiceC:${res[0]}${res[1]}`), 10)}
        ));

      const result = await Promise.any([serviceA, serviceB, serviceC]);
      expect(result).assertEqual("ServiceC:XY");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0800
     * @tc.name PromiseAnyTest080
     * @tc.desc Time-sensitive cascading operations with fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const primaryOperation: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(
        new Promise<number>((res) => {setTimeout(() => res(
          new Promise<number>((r) => {setTimeout(() => r(1), 50)})
        ), 30)})
      ), 20)}
      );

      const fallback1: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(2), 80)}
      );

      const fallback2: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(3), 60)}
      );

      const result = await Promise.any([primaryOperation, fallback1, fallback2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0810
     * @tc.name PromiseAnyTest081
     * @tc.desc Multi-stage data processing with parallel branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchData = (source: string, delay: int): Promise<string> => {
        return new Promise<string>((resolve) =>{
        setTimeout(() => resolve(`Data from ${source}`), delay)}
        );
      };

      const processData = (data: string, delay: int): Promise<string> => {
        return new Promise<string>((resolve) =>{
        setTimeout(() => resolve(`Processed: ${data}`), delay)}
        );
      };

      const pipeline1: Promise<string> = fetchData("API", 30)
        .then(data => processData(data, 25));

      const pipeline2: Promise<string> = fetchData("Cache", 15)
        .then(data => processData(data, 20));

      const pipeline3: Promise<string> = fetchData("Database", 20)
        .then(data => processData(data, 10));

      const result = await Promise.any([pipeline1, pipeline2, pipeline3]);
      expect(result).assertEqual("Processed: Data from Database");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0820
     * @tc.name PromiseAnyTest082
     * @tc.desc Nested Promise.any within cascading operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerAny1: Promise<number> = Promise.any([
        new Promise<number>((resolve) => {setTimeout(() => resolve(1), 40)}),
        new Promise<number>((resolve) => {setTimeout(() => resolve(2), 20)})
      ]);

      const innerAny2: Promise<number> = Promise.any([
        new Promise<number>((resolve) => {setTimeout(() => resolve(3), 15)}),
        new Promise<number>((resolve) => {setTimeout(() => resolve(4), 30)})
      ]);

      const outerPipeline: Promise<number> = innerAny1.then(num =>
      new Promise<number>((resolve) => {setTimeout(() => resolve(num * 2), 10)})
      );

      const result = await Promise.any([outerPipeline, innerAny2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0860
     * @tc.name PromiseAnyTest086
     * @tc.desc Timed cascading with progressive delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createProgressiveCascade = (id: number, baseDelay: int): Promise<number> => {
        let current = Promise.resolve(id);

        // Create 3 stages with increasing delays
        for (let i = 1; i <= 3; i++) {
          current = current.then(val =>
          new Promise<number>((resolve) =>{
          setTimeout(() => resolve(val), baseDelay * i)}
          )
          );
        }

        return current;
      };

      const result = await Promise.any([
        createProgressiveCascade(1, 10), // Total: 10+20+30=60ms
        createProgressiveCascade(2, 8), // Total: 8+16+24=48ms
        createProgressiveCascade(3, 12)// Total: 12+24+36=72ms
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0870
     * @tc.name PromiseAnyTest087
     * @tc.desc Async retry mechanism race conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const withRetry = async (id: number, initialDelay: int, retries: number): Promise<number> => {
        let delay = initialDelay;

        for (let i = 0; i <= retries; i++) {
          try {
            await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, delay)});
            // Succeed on last retry
            if (i === retries) {
              return id;
            }
            throw new Error(`Attempt ${i} failed`);
          } catch (e) {
            delay *= 2; // Exponential backoff
          }
        }

        throw new Error("All retries failed");
      };

      const result = await Promise.any([
        withRetry(1, 10, 2), // 10ms (fail) → 20ms (fail) → 40ms (success) → Total: 70ms
        withRetry(2, 5, 1), // 5ms (fail) → 10ms (success) → Total: 15ms
        withRetry(3, 15, 0)// 15ms (success) → Total: 15ms
      ]);

      // Either 2 or 3 could win - check for either valid result
      expect(result === 2 || result === 3).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0890
     * @tc.name PromiseAnyTest089
     * @tc.desc Cascading promises with conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(10), 10)}
      );

      const branchA: Promise<number> = start.then(num =>
      new Promise<number>((resolve) => {
        if (num > 5) {
          setTimeout(() => resolve(num * 2), 30);
        } else {
          setTimeout(() => resolve(num + 5), 20);
        }
      })
      );

      const branchB: Promise<number> = start.then(num =>
      new Promise<number>((resolve) => {
        if (num % 2 === 0) {
          setTimeout(() => resolve(num / 2), 15);
        } else {
          setTimeout(() => resolve(num - 3), 25);
        }
      })
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>{
      setTimeout(() => resolve(7), 40)}
      );

      const result = await Promise.any([branchA, branchB, alternative]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_091
     * @tc.name PromiseAnyTest091
     * @tc.desc Combine Promise.any with Promise.resolve and Promise.reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<int> = Promise.resolve(10);
      const p2: Promise<int> = Promise.reject(new Error('Failed'));
      const p3: Promise<int> = new Promise<int>(resolve =>{
      setTimeout(() => resolve(20), 50)}
      );

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_092
     * @tc.name PromiseAnyTest092
     * @tc.desc Combine Promise.any with Promise.all in nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1 = Promise.all([
        Promise.resolve(1),
        new Promise<int>(resolve => {setTimeout(() => resolve(2), 30)})
      ]).then(values => values.reduce((a, b) => a + b, 0));

      const p2: Promise<int> = Promise.all([
        new Promise<int>(resolve => {setTimeout(() => resolve(3), 10)}),
        Promise.resolve(4)
      ]).then(values => values.reduce((a, b) => a + b, 0));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_093
     * @tc.name PromiseAnyTest093
     * @tc.desc Combine Promise.any with Promise.race in cascading calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const race1: Promise<string> = Promise.race([
        new Promise<string>(resolve => {setTimeout(() => resolve("race1-1"), 50)}),
        new Promise<string>(resolve => {setTimeout(() => resolve("race1-2"), 30)})
      ]);

      const race2: Promise<string> = Promise.race([
        new Promise<string>(resolve => {setTimeout(() => resolve("race2-1"), 20)}),
        new Promise<string>(resolve => {setTimeout(() => resolve("race2-2"), 40)})
      ]);

      const result = await Promise.any([race1, race2]);
      expect(result).assertEqual("race2-1");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_095
     * @tc.name PromiseAnyTest095
     * @tc.desc Nested Promise.any with mixed promise combinators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerAny: Promise<int> = Promise.any([
        Promise.resolve(1),
        new Promise<int>(resolve => {setTimeout(() => resolve(2), 20)})
      ]);

      const innerAll: Promise<int> = Promise.all([
        new Promise<int>(resolve => {setTimeout(() => resolve(3), 10)}),
        new Promise<int>(resolve => {setTimeout(() => resolve(4), 15)})
      ]).then((values : int[]) => values[0] + values[1]);

      const result = await Promise.any([
        innerAny.then(num => num * 10),
        innerAll.then(sum => sum + 5)
      ]);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_096
     * @tc.name PromiseAnyTest096
     * @tc.desc Combine Promise.any with async/await chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncChain1 = async (): Promise<string> => {
        const step1: number = await new Promise<number>(resolve =>{
        setTimeout(() => resolve(10), 10)}
        );
        const step2: number = await new Promise<number>(resolve =>{
        setTimeout(() => resolve(step1 * 2), 20)}
        );
        return `Result: ${step2}`;
      };

      const asyncChain2 = async (): Promise<string> => {
        const step1: number = await new Promise<number>(resolve =>{
        setTimeout(() => resolve(15), 5)}
        );
        const step2: number = await new Promise<number>(resolve =>{
        setTimeout(() => resolve(step1 + 5), 15)}
        );
        return `Result: ${step2}`;
      };

      const result = await Promise.any([asyncChain1(), asyncChain2()]);
      expect(result).assertEqual("Result: 20");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_097
     * @tc.name PromiseAnyTest097
     * @tc.desc Combine Promise.any with conditional promise creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createConditionalPromise = (shouldResolveFast: boolean): Promise<number> => {
        if (shouldResolveFast) {
          return new Promise<number>(resolve =>{
          setTimeout(() => resolve(1), 10)}
          );
        } else {
          return Promise.all([
            new Promise<number>(resolve => {setTimeout(() => resolve(2), 20)}),
            new Promise<number>(resolve => {setTimeout(() => resolve(3), 30)})
          ]).then((res: number[]) => res[0] + res[1]);
        }
      };

      const result = await Promise.any([
        createConditionalPromise(false),
        createConditionalPromise(true),
        Promise.reject(new Error('Not used'))
      ]);

      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_099
     * @tc.name PromiseAnyTest099
     * @tc.desc Complex combination with Promise.any, all and race
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAnyTest099', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL4, async () => {
      // Layer 1: Create individual promises
      const p1: Promise<number> = new Promise<number>(resolve => {setTimeout(() => resolve(1), 10)});
      const p2: Promise<number> = new Promise<number>(resolve => {setTimeout(() => resolve(2), 20)});
      const p3: Promise<number> = new Promise<number>((resolve, reject) => {setTimeout(() => reject(new Error()), 15)});

      // Layer 2: Combine with Promise.all
      const all1: Promise<number> = Promise.all([p1, p2]).then((v : number[]) => v[0] + v[1]);

      // Layer 2: Combine with Promise.race
      const race1: Promise<number> = Promise.race([p2, p3]);

      // Layer 3: Combine with Promise.any
      const any1: Promise<number> = Promise.any([all1, race1]);

      // Alternative path
      const alt1: Promise<number> = new Promise<number>(resolve => {setTimeout(() => resolve(5), 30)});

      // Final combination
      const result = await Promise.any([any1, alt1]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_100
     * @tc.name PromiseAnyTest100
     * @tc.desc Promise.any with mixed combinators and error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const combine1: Promise<string> = Promise.all([
        Promise.resolve("a"),
        new Promise<string>(resolve => {setTimeout(() => resolve("b"), 20)})
      ]).then((res: string[]) => res[0] + res[1])
        .catch(() => "fallback1");

      const combine2: Promise<string> = Promise.race([
        new Promise<string>((resolve, reject) => {setTimeout(() => reject(new Error()), 10)}),
        new Promise<string>(resolve => {setTimeout(() => resolve("c"), 15)})
      ]).catch(() => "fallback2");

      const result = await Promise.any([combine1, combine2]);
      expect(result).assertEqual("fallback2");
    });

  })
}
