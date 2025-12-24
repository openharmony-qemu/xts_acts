/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import {quitErrorMsg} from './Util.test';

type Literal = 'success' | 'failure' | 'pending';

let EAWorkerTest001: boolean = false;

function ThrowExceptionWorkerTest(): void {
  EAWorkerTest001 = true;
  throw new Error('Worker function exception');
}

function EAWorkerTestUn(): undefined {
  return undefined;
}

let EAWorkerTest003: boolean = false;

function EAWorkerTestWithNull(param: null): void {
  EAWorkerTest003 = true;
}

function EAWorkerTestWithLong(param: int): int {
  return param + 1;
}

class TestClass {
  private value: int;

  constructor(initialValue: int) {
    this.value = initialValue;
  }

  public increment(): void {
    this.value++;
  }

  public getValue(): int {
    return this.value;
  }
}

function EAWorkerTestWithClass(
  factory: (initialValue: int) => TestClass,
  initialValue: int,
  callback: (instance: TestClass) => void
): void {
  setTimeout(() => {
    const instance = factory(initialValue);
    instance.increment();
    callback(instance);
  }, 100);
}

async function EAWorkerTestWithPromise(
  inputPromise: Promise<number>
): Promise<number> {
  const value = await inputPromise;
  return new Promise<double>(resolve => {
    setTimeout(() => {
      resolve(value + 1);
    }, 500);
  });
}

class ErrorTask {
  private shouldFail: boolean;

  constructor(shouldFail: boolean) {
    this.shouldFail = shouldFail;
  }

  execute(): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        if (this.shouldFail) {
          reject(new Error("Task Fail"));
        } else {
          resolve("Task Success");
        }
      });
    });
  }
}

let EAWorkerTest010: boolean = false;

class TestUtils {
  static voidStaticTask(): void {
    EAWorkerTest010 = true;
    console.log('Static...');
  }
}

class MathUtils {
  static add(a: number, b: number): number {
    if (typeof a !== 'number' || typeof b !== 'number') {
      throw new Error('The parameters must be of numeric type');
    }
    return a + b;
  }
}

class MyClass {
  public throwError(): void {
    throw new Error('Class method exception');
  }
}

class Calculator {
  public add(a: number, b: number): number {
    if (typeof a !== 'number' || typeof b !== 'number') {
      throw new Error('The parameters must be of numeric type');
    }
    return a + b;
  }
}

function processData(input: string): string {
  if (!input) {
    throw new Error('The input cannot be empty');
  }
  if (input.length < 5) {
    throw new Error('length must be > 5');
  }
  return input.toUpperCase();
}

class SafeContainer<T> {
  private container: Map<string, T> = new Map<string, T>();

  public put(key: string, value: T): void {
    this.container.set(key, value);
  }

  public get(key: string): T | undefined {
    return this.container.get(key);
  }

  public clear(): void {
    this.container.clear();
  }
}

let EAWorkerTest015: boolean = false;

function SafeContainerOperation(): void {
  EAWorkerTest015 = true;
  const safeContainer = new SafeContainer<string>();
  safeContainer.put("key1", "value1");
  const value = safeContainer.get("key1");
  if (value !== "value1") {
    throw new Error("The operation of the safe container failed");
  }
  safeContainer.clear();
}

let EAWorkerTest016: boolean = false;

function promiseThrowException(): Promise<void> {
  return new Promise<void>((_, reject) => {
    reject(new Error('fail'));
  });
}

function processDataAsync(data: string): Promise<string> {
  return new Promise<String>((resolve) => {
    setTimeout(() => {
      resolve(`Processed: ${data}`);
    }, 100);
  });
}


enum Status {
  PENDING = 'pending',
  SUCCESS = 'success',
  FAILURE = 'failure'
}

class Person {
  age: number;
  status: Status = Status.PENDING;

  constructor(age: number) {
    this.age = age;
  }

  static getAge(age?: number): number {
    return age !== undefined ? age : 28;
  }
}

class TestWorker extends EAWorker {
  private joinCalled: boolean = false;
  private customData: string = 'Test';

  override start(): void{
    super.start();
  }
  override join(): Job<void> {
    this.joinCalled = true;
    return super.join();
  }

  override toString(): string {
    return `EAWorker[${this.customData}]`;
  }

  isJoinCalled(): boolean {
    return this.joinCalled;
  }
}


export default function EAWorkerTest() {
  describe('EAWorkerTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0100
     * @tc.name EAWorkerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest001';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(ThrowExceptionWorkerTest).Await();
          expect(EAWorkerTest001).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Worker function exception');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0200
     * @tc.name EAWorkerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest002';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          let worker1 = worker.run<undefined>(EAWorkerTestUn).Await();
          expect(worker1).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0300
     * @tc.name EAWorkerTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest003';
        console.info(`${TAG} test start`);
        let worker = new EAWorker()
        worker.start()
        try {
          worker.run<void>(EAWorkerTestWithNull, null).Await();
          expect(EAWorkerTest003).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0400
     * @tc.name EAWorkerTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest004';
        console.info(`${TAG} test start`);
        const INITIAL_VALUE: int = 100;
        const EXPECTED_VALUE: int = 101;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<int>(EAWorkerTestWithLong, INITIAL_VALUE).Await();
          expect(result).assertEqual(EXPECTED_VALUE);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0500
     * @tc.name EAWorkerTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest005';
        console.info(`${TAG} test start`);
        const INITIAL_VALUE: int = 42;
        const EXPECTED_VALUE: int = 43;
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(
            EAWorkerTestWithClass,
            (initialValue: int) => new TestClass(initialValue),
            INITIAL_VALUE, (instance: TestClass) => {
            expect(instance.getValue()).assertEqual(EXPECTED_VALUE);
          }
          ).Await();

        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0600
     * @tc.name EAWorkerTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest006';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          const failingTask = (): Promise<never> => {
            return Promise.reject(new Error("Intentional error"));
          };
          let job = worker.run<Promise<never>>(failingTask);
          await job.Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual("Intentional error");
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0700
     * @tc.name EAWorkerTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          const taskFunc = (): string => {
            return '222';
          };
          const task: taskpool.Task = new taskpool.Task('taskName', taskFunc, taskpool.Priority.HIGH);
          const result = await worker.run<Promise<string>>(
            async (taskInstance: taskpool.Task): Promise<string> => {
              let taskStr: string = '';
              await taskpool.execute(taskInstance).then((res) => {
                taskStr = res;
              });
              return taskStr;
            },
            task
          ).Await();

          expect(result).assertEqual('222');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0800
     * @tc.name EAWorkerTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest008';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          expect(worker != null).assertTrue();
          expect(worker instanceof EAWorker).assertTrue();
          const result = worker.run<number>(() => 42.0).Await();
          expect(result).assertEqual(42.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0900
     * @tc.name EAWorkerTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          expect(worker != null).assertTrue();
          expect(worker instanceof EAWorker).assertTrue();
          const testInput = 21.0;
          const result = worker.run<number>(
            (param: number) => param * 2,
            testInput
          ).Await();
          expect(result).assertEqual(42.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1000
     * @tc.name EAWorkerTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest010';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(TestUtils.voidStaticTask).Await();
          expect(EAWorkerTest010).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1100
     * @tc.name EAWorkerTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest011';
        console.info(`${TAG} test start`);
        const TEST_PARAM_A = 10;
        const TEST_PARAM_B = 20;
        const EXPECTED_RESULT = 30;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<number>(() => {
            return MathUtils.add(TEST_PARAM_A, TEST_PARAM_B);
          }).Await();
          expect(result).assertEqual(EXPECTED_RESULT);
          expect(typeof result).assertEqual('number');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1200
     * @tc.name EAWorkerTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest012';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(() => {
            const instance = new MyClass();
            instance.throwError();
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Class method exception');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1300
     * @tc.name EAWorkerTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest013';
        console.info(`${TAG} test start`);
        const TEST_PARAM_A = 10;
        const TEST_PARAM_B = 20;
        const EXPECTED_RESULT = 30;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<number>(() => {
            const calculator = new Calculator();
            return calculator.add(TEST_PARAM_A, TEST_PARAM_B);
          }).Await();
          expect(result).assertEqual(EXPECTED_RESULT);
          expect(typeof result).assertEqual('number');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1400
     * @tc.name EAWorkerTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest014';
        console.info(`${TAG} test start`);
        const INVALID_INPUT = 'abc';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<string>(() => {
            return processData(INVALID_INPUT);
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('length must be > 5');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1500
     * @tc.name EAWorkerTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest015';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(SafeContainerOperation).Await();
          expect(EAWorkerTest015).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1600
     * @tc.name EAWorkerTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest016';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(promiseThrowException).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('fail');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1700
     * @tc.name EAWorkerTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest017';
        console.info(`${TAG} test start`);
        const TEST_INPUT = 'test-data';
        const EXPECTED_RESULT = 'Processed: test-data';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(() => {
            return new Promise<void>((resolve, reject) => {
              processDataAsync(TEST_INPUT)
                .then((result: string) => {
                  expect(result).assertEqual(EXPECTED_RESULT);
                  expect(typeof result).assertEqual('string');
                  resolve(undefined);
                })
                .catch((err: Error) => {
                  expect(false).assertFail();
                  reject(err);
                });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });
