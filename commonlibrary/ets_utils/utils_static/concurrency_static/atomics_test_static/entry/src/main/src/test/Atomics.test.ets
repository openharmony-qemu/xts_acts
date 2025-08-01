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
import hilog from '@ohos.hilog'
import Utils from './Util.test';

async function noParamNoReturnTask(): Promise<string> {
  await new Promise<string>((resolve) => {
    resolve('success')
  })
}

export default function AtomicsTest() {
  describe('AtomicsTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(200);
    })
    /**
     * @tc.number SUB_Atomics_Test_0100
     * @tc.name AtomicsTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'BuiltinsAtomicsTestMixedOperations';
        console.info(`${TAG} test start`);
        const array: BigInt64Array = new BigInt64Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = BigInt(i * 2);
        }
        const worker = new EAWorker();
        try {
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(() => {
              try {
                for (let i = 0; i < 100; i++) {
                  if (i % 2 === 0) {
                    Atomics.add(array, i, 3n);
                  } else if (i % 3 === 0) {
                    Atomics.exchange(array, i, BigInt(i));
                  } else {
                    Atomics.compareExchange(array, i, BigInt(i * 2), BigInt(i * 3));
                  }
                }
                resolve('mixed operations success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            });
          });

          const result = await workerPromise;
          for (let i = 0; i < array.length; i++) {
            let expectedValue: bigint;
            if (i % 2 === 0) {
              expectedValue = BigInt(i * 2 + 3);
            } else if (i % 3 === 0) {
              expectedValue = BigInt(i);
            } else {
              expectedValue = BigInt(i * 3);
            }
            expect(Atomics.load(array, i)).assertEqual(expectedValue);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_0200
     * @tc.name AtomicsTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest002';
        console.info(`${TAG} test start`);
        const ARRAY_SIZE: number = 100;
        const OPERATION_COUNT: number = 100;

        const buffer = new ArrayBuffer(1024);
        const array = new BigInt64Array(buffer);

        for (let i = 0; i < ARRAY_SIZE; i++) {
          array[i] = BigInt(i * 2);
        }

        const worker1 = new EAWorker();
        const worker2 = new EAWorker();

        try {
          const worker1Promise = new Promise<string>((resolve, reject) => {
            worker1.run(() => {
              try {
                const localArray: BigInt64Array = new BigInt64Array(buffer);
                for (let i = 0; i < OPERATION_COUNT; i++) {
                  const index = i % ARRAY_SIZE;
                  Atomics.xor(localArray, index as int, 15n);
                }
                resolve('Worker1 (XOR) completed');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(new Error(`Worker1 failed: ${err.message}`));
              }
            });
          });

          const worker2Promise = new Promise<string>((resolve, reject) => {
            worker2.run(() => {
              try {
                const localArray = new BigInt64Array(buffer);
                for (let i = 0; i < OPERATION_COUNT; i++) {
                  const index = i % ARRAY_SIZE;
                  Atomics.store(localArray, index as int, BigInt(index * 3));
                }
                resolve('Worker2 (STORE) completed');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(new Error(`Worker2 failed: ${err.message}`));
              }
            });
          });

          const task1 = taskpool.execute(() => {
            try {
              const localArray = new BigInt64Array(buffer);
              for (let i = 0; i < OPERATION_COUNT; i++) {
                const index = i % ARRAY_SIZE;
                Atomics.and(localArray, index as int, 255n);
              }
              return 'Task1 (AND) completed';
            } catch (err: Error) {
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
              throw new Error(`Task1 failed: ${err.message}`);
            }
          });

          const task2 = taskpool.execute(() => {
            try {
              const localArray = new BigInt64Array(buffer);
              for (let i = 0; i < OPERATION_COUNT; i++) {
                const index = i % ARRAY_SIZE;
                Atomics.exchange(localArray, index as int, BigInt(index + 100));
              }
              return 'Task2 (EXCHANGE) completed';
            } catch (err: Error) {
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
              throw new Error(`Task2 failed: ${err.message}`);
            }
          });

          const task3 = taskpool.execute(() => {
            try {
              const localArray = new BigInt64Array(buffer);
              for (let i = 0; i < OPERATION_COUNT; i++) {
                const index = i % ARRAY_SIZE;
                Atomics.or(localArray, index as int, 1n);
              }
              return 'Task3 (OR) completed';
            } catch (err: Error) {
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
              throw new Error(`Task3 failed: ${err.message}`);
            }
          });

          const task4 = taskpool.execute(() => {
            try {
              const localArray = new BigInt64Array(buffer);
              for (let i = 0; i < OPERATION_COUNT; i++) {
                const index = i % ARRAY_SIZE;
                Atomics.sub(localArray, index as int, 10n);
              }
              return 'Task4 (SUB) completed';
            } catch (err: Error) {
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
              throw new Error(`Task4 failed: ${err.message}`);
            }
          });
          const results = await Promise.all([
            worker1Promise,
            worker2Promise,
            task1,
            task2,
            task3,
            task4
          ]);
          for (let i = 0; i < ARRAY_SIZE; i++) {
            const finalValue = array[i];
            expect(Number(finalValue) >= -1000).assertTrue();
            expect(Number(finalValue) <= 1000).assertTrue();
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker1.join();
          worker2.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_0300
     * @tc.name AtomicsTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: () => void): Promise<void> => {
      const TAG: string = 'AtomicsTest003';
      console.info(`${TAG} test start`);
      const ARRAY_COUNT = 10;
      const ARRAY_SIZE = 100;
      const OPERATIONS_PER_THREAD = 100;

      const sharedArrays: Int32Array[] = [];
      for (let arrayIndex = 0; arrayIndex < ARRAY_COUNT; arrayIndex++) {
        const buffer = new ArrayBuffer(ARRAY_SIZE * Int32Array.BYTES_PER_ELEMENT);
        const array = new Int32Array(buffer);
        for (let i = 0; i < ARRAY_SIZE; i++) {
          Atomics.store(array, i, i * 2);
        }
        sharedArrays.push(array);
      }

      const promises: Promise<void>[] = [];

      try {
        for (let threadIndex = 0; threadIndex < ARRAY_COUNT; threadIndex++) {
          const arrayToOperate = sharedArrays[threadIndex];
          promises.push(new Promise<void>((resolve, reject) => {
            taskpool.execute(() => {
              for (let opCount = 0; opCount < OPERATIONS_PER_THREAD; opCount++) {
                const index = opCount % ARRAY_SIZE;

                switch ((threadIndex%6) as int ) {
                  case 0:
                    Atomics.xor(arrayToOperate, index as int, 0xFFFF);
                    break;
                  case 1:
                    Atomics.store(arrayToOperate, index as int, index*3);
                    break;
                  case 2:
                    Atomics.and(arrayToOperate, index as int, 0xAAAAAAAA);
                    break;
                  case 3:
                    Atomics.exchange(arrayToOperate, index as int,100 + index);
                    break;
                  case 4:
                    Atomics.or(arrayToOperate, index as int, 0x55555555);
                    break;
                  case 5:
                    Atomics.sub(arrayToOperate, index as int, 10);
                    break;
                }
              }
              resolve(undefined);
            });
          }));
        }

        await Promise.all(promises);
        for (let arrayIndex = 0; arrayIndex < ARRAY_COUNT; arrayIndex++) {
          const array = sharedArrays[arrayIndex];
          const operationType = arrayIndex % 6;

          for (let i = 0; i < ARRAY_SIZE; i++) {
            const finalValue = Atomics.load(array, i);
            const initialValue = i * 2;
            switch (operationType) {
              case 0:
                expect(finalValue ).assertEqual(initialValue ^ 0xFFFF);
                break;
              case 1:
                expect(finalValue).assertEqual(i*3);
                break;
              case 2:
                expect(finalValue ).assertEqual(initialValue & 0xAAAAAAAA)
                break;
              case 3:
                expect(finalValue).assertEqual(i+100);
                break;
              case 4:
                expect(finalValue).assertEqual(initialValue | 0x55555555)
                break;
              case 5:
                expect(finalValue).assertEqual(initialValue - 10)
                break;
            }
          }
        }

      } catch (err: Error) {
        console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        expect(false).assertFail();
      } finally {
        console.info(`${TAG} test end`);
        Done();
      }
    });

    /**
     * @tc.number SUB_Atomics_Test_0400
     * @tc.name AtomicsTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest004';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(sharedBuffer);
        array[0] = 0;
        const modifyTask = (array: Int32Array): void => {
          setTimeout(() => {
            const newValue: number = 42;
            Atomics.store(array, 0, newValue);
            const numAwoken: number = Atomics.notify(array, 0);
            console.log(`${TAG} TaskPool thread: notified ${numAwoken} waiting threads`);
          }, 100);
        };
        try {
          const task: Promise<Any> = taskpool.execute(modifyTask, array);
          const result: string = Atomics.wait(array, 0, 0);
          expect(result).assertEqual('ok');
          expect(array[0]).assertEqual(42);
          await task;
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        Done();
      });


    /**
     * @tc.number SUB_Atomics_Test_0500
     * @tc.name AtomicsTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest005';
        console.info(`${TAG} test start`);
        const sharedBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(sharedBuffer);

        Atomics.store(array, 0, 1);
        let worker: EAWorker = new EAWorker();

        try {
          const workerPromise = new Promise<Int32Array>((resolve, reject) => {
            worker.run(async (inputArray: Int32Array) => {
              try {
                Atomics.store(inputArray, 0, 2);
                resolve(inputArray);
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            }, array);
          });
          const waitPromise = new Promise<void>((resolve, reject) => {
            setTimeout(() => {
              const waitResult = Atomics.wait(array, 0, 1);
              if (waitResult === 'ok') {
                resolve(undefined);
              } else if (waitResult === 'not-equal') {
                resolve(undefined);
              } else if (waitResult === 'timed-out') {
                reject(new Error('Atomics wait timeout '));
              } else {
                reject(new Error('Atomics wait error'));
              }
            }, 50);
          });
          await Promise.all([workerPromise, waitPromise]);
          expect(Atomics.load(array, 0)).assertEqual(2);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_0600
     * @tc.name AtomicsTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest006';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: BigInt64Array = new BigInt64Array(sharedBuffer);
        let worker: EAWorker = new EAWorker();
        try {
          Atomics.store(array, 0, 0n);
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(async (inputArray: BigInt64Array) => {
              try {
                Atomics.exchange(inputArray, 0, 1n);
                Atomics.notify(inputArray, 0);
                resolve('exchange success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            }, array);
          });
          const waitPromise = new Promise<string>((resolve, reject) => {
            const startTime = Date.now();
            const result = Atomics.wait(array, 0, 0n, 1000);
            if (result === 'not-equal') {
              resolve('wait success');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics    wait error'));
            }
          });
          await workerPromise;
          await waitPromise;
          expect(Atomics.load(array, 0)).assertEqual(1n)
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_0700
     * @tc.name AtomicsTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest007';
        console.info(`${TAG} test start`);
        const array: Int8Array = new Int8Array(100);
        const addTask = (array: Int8Array): void => {
          for (let i = 0; i < array.length; i++) {
            Atomics.add(array, i, i)
          }
        };
        try {
          await taskpool.execute(addTask, array);
          for (let i = 0; i < array.length; i++) {
            expect(array[i]).assertEqual(i);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        Done();
      })


    /**
     * @tc.number SUB_Atomics_Test_0800
     * @tc.name AtomicsTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest008';
        console.info(`${TAG} test start`);
        const array: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const worker = new EAWorker();
        try {
          const workerPromise = new Promise<void>((resolve, reject) => {
            worker.run(() => {
              try {
                for (let i = 0; i < 100; i++) {
                  Atomics.and(array, i, i);
                }
                resolve(undefined);
              } catch (err: Error) {
                reject(err);
              }
            });
          });
          await workerPromise;
          for (let i = 0; i < array.length; i++) {
            expect(array[i]).assertEqual(i);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_0900
     * @tc.name AtomicsTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest009';
        console.info(`${TAG} test start`);
        const array: Int16Array = new Int16Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const compareExchangeTask = (array: Int16Array): void => {
          for (let i = 0; i < 100; i++) {
            Atomics.compareExchange(array, i, 0, 1);
          }
        };
        try {
          await taskpool.execute(compareExchangeTask, array);
          expect(array[0]).assertEqual(1);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        Done();
      })

    /**
     * @tc.number SUB_Atomics_Test_1000
     * @tc.name AtomicsTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest010';
        console.info(`${TAG} test start`);
        const array: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const worker = new EAWorker();
        try {
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(() => {
              try {
                for (let i = 0; i < 100; i++) {
                  Atomics.exchange(array, i, 1);
                }
                resolve('task success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            });
          });
          const result = await workerPromise;
          for (let i = 0; i < array.length; i++) {
            expect(Atomics.load(array, i)).assertEqual(1);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_1100
     * @tc.name AtomicsTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest011';
        console.info(`${TAG} test start`);
        const array: Int32Array = new Int32Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const orTask = (array: Int32Array): void => {
          for (let i = 0; i < 100; i++) {
            Atomics.or(array, i, i)
          }
        };
        try {
          await taskpool.execute(orTask, array);
          for (let i = 0; i < array.length; i++) {
            expect(Atomics.load(array, i)).assertEqual(i);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        Done();
      })

    /**
     * @tc.number SUB_Atomics_Test_1200
     * @tc.name AtomicsTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest012';
        console.info(`${TAG} test start`);
        const array: Uint32Array = new Uint32Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const worker = new EAWorker();
        try {
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(() => {
              try {
                for (let i = 0; i < 100; i++) {
                  Atomics.store(array, i, 1);
                }
                resolve('task success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            });
          });
          const result = await workerPromise;
          console.log(TAG + ' task completed with result: ' + result);
          for (let i = 0; i < array.length; i++) {
            expect(Atomics.load(array, i)).assertEqual(1);
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_1300
     * @tc.name AtomicsTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest013';
        console.info(`${TAG} test start`);
        const array: BigInt64Array = new BigInt64Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = BigInt(i);
        }
        const xorTask = (array: BigInt64Array): void => {
          for (let i = 0; i < 100; i++) {
            Atomics.xor(array, i, BigInt(i))
          }
        };
        try {
          await taskpool.execute(xorTask, array);
          for (let i = 0; i < array.length; i++) {
            expect(Atomics.load(array, i)).assertEqual(BigInt(0));
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Atomics_Test_1400
     * @tc.name AtomicsTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest014';
        console.info(`${TAG} test start`);
        const array: BigInt64Array = new BigInt64Array(100);
        for (let i = 0; i < array.length; i++) {
          array[i] = i;
        }
        const worker = new EAWorker();
        try {
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(() => {
              try {
                for (let i = 0; i < 100; i++) {
                  Atomics.sub(array, i, 1n);
                }
                resolve('task success');
              } catch (err: Error) {
                reject(err);
              }
            });
          });
          const result = await workerPromise;
          for (let i = 0; i < array.length; i++) {
            expect(Atomics.load(array, i)).assertEqual(BigInt(i - 1));
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);

          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_1500
     * @tc.name AtomicsTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest015';
        console.info(`${TAG} test start`);
        const buffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(buffer);

        try {
          Atomics.store(array, 0, 0);

          await taskpool.execute(async (inputArray: Int32Array) => {
            const previous = Atomics.exchange(inputArray, 0, 1);
            Atomics.notify(inputArray, 0);
          }, array);
          const waitResult = await new Promise<string>((resolve, reject) => {
            const result = Atomics.wait(array, 0, 0);
            if (result === 'not-equal') {
              resolve('wait success');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics.wait error'));
            }
          });
          expect(Atomics.load(array, 0)).assertEqual(1)
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_1600
     * @tc.name AtomicsTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest016';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(sharedBuffer);
        let worker: EAWorker = new EAWorker();
        try {
          Atomics.store(array, 0, 0);
          const workerPromise = new Promise<string>((resolve, reject) => {
            worker.run(async (inputArray: Int32Array) => {
              try {
                Atomics.exchange(inputArray, 0, 1);
                Atomics.notify(inputArray, 0);
                resolve('exchange success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            }, array);
          });
          const waitPromise = new Promise<string>((resolve, reject) => {
            const startTime = Date.now();
            const result = Atomics.wait(array, 0, 0);
            if (result === 'not-equal') {
              resolve('wait success');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics wait error'));
            }
          });
          await workerPromise;
          await waitPromise;
          expect(Atomics.load(array, 0)).assertEqual(1)
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_1700
     * @tc.name AtomicsTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest017';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(sharedBuffer);

        try {
          Atomics.store(array, 0, 0);
          await taskpool.execute(async (inputArray: Int32Array) => {
            setTimeout(() => {
              console.info('delay 3s');
            }, 3000);
            Atomics.exchange(inputArray, 0, 1);
          }, array);

          const waitResult = await new Promise<string>((resolve, reject) => {
            const result = Atomics.wait(array, 0, 0, 1000);
            if (result === 'not-equal') {
              resolve('wait 1s');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics wait error'));
            }
          });

          expect(Atomics.load(array, 0)).assertEqual(1)
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          Done();
        }
      })


    /**
     * @tc.number SUB_Atomics_Test_1800
     * @tc.name AtomicsTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest018';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(sharedBuffer);

        try {
          Atomics.store(array, 0, 0);
          await taskpool.execute(async (inputArray: Int32Array) => {
            Atomics.notify(inputArray, 0);
            setTimeout(() => {
              console.info('delay 3s');
            }, 3000);
            Atomics.exchange(inputArray, 0, 1);
          }, array);

          const waitResult = await new Promise<string>((resolve, reject) => {
            const result = Atomics.wait(array, 0, 0, 100);
            if (result === 'not-equal') {
              resolve('wait success');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics wait error'));
            }
          });
          expect(Atomics.load(array, 0)).assertEqual(1)

        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Atomics_Test_1900
     * @tc.name AtomicsTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest019';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const array: BigInt64Array = new BigInt64Array(sharedBuffer);
        let worker: EAWorker = new EAWorker();

        try {
          Atomics.store(array, 0, 0n);
          const workerPromise = await new Promise<string>((resolve, reject) => {
            worker.run(async (inputArray: BigInt64Array) => {
              try {
                Atomics.notify(inputArray, 0);
                setTimeout(() => {
                  console.info('delay 3s');
                }, 3000);
                Atomics.exchange(inputArray, 0, 1n);
                resolve('exchange success');
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            }, array);
          });

          const waitResult = await new Promise<string>((resolve, reject) => {
            const result = Atomics.wait(array, 0, 0n);
            if (result === 'not-equal') {
              resolve('wait success');
            } else if (result === 'timed-out') {
              reject(new Error('Atomics wait timeout'));
            } else {
              reject(new Error('Atomics wait error'));
            }
          });
          expect(Atomics.load(array, 0)).assertEqual(1n)
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2000
     * @tc.name AtomicsTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest020';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);

        const array: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 1);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 8, 1);
        const waitingCounter: Int32Array = new Int32Array(sharedBuffer, 12, 1);

        Atomics.store(array, 0, 0n);
        Atomics.store(readyCounter, 0, 0);
        Atomics.store(waitingCounter, 0, 0);

        try {
          const taskPool: Promise<void>[] = [];
          const taskCount = 10;

          for (let i = 0; i < taskCount; i++) {
            taskPool.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                const prevCount = Atomics.add(readyCounter, 0, 1);
                if (prevCount + 1 === taskCount) {
                  Atomics.notify(readyCounter, 0);
                }

                Atomics.add(waitingCounter, 0, 1);
                const waitResult = Atomics.wait(array, 0, 0n);
                resolve(undefined);
              });
            }));
          }

          while (Atomics.load(readyCounter, 0) < taskCount) {
            const current = Atomics.load(readyCounter, 0);
            Atomics.wait(readyCounter, 0, current);
          }

          while (Atomics.load(waitingCounter, 0) < taskCount) {
            const current = Atomics.load(waitingCounter, 0);
            Atomics.wait(waitingCounter, 0, current);
          }

          Atomics.store(array, 0, 1n);
          const notifiedCount = Atomics.notify(array, 0, taskCount);

          expect(notifiedCount).assertEqual(10);
          await Promise.all(taskPool);

        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2100
     * @tc.name AtomicsTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest021';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);

        const array: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 1);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 8, 1);

        Atomics.store(array, 0, 0n);
        Atomics.store(readyCounter, 0, 0);

        try {
          const taskPool: Promise<void>[] = [];
          const taskCount = 10;

          for (let i = 0; i < taskCount; i++) {
            taskPool.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                const prevCount = Atomics.add(readyCounter, 0, 1);
                if (prevCount + 1 === taskCount) {
                  Atomics.notify(readyCounter, 0);
                }

                const waitResult = Atomics.wait(array, 0, 0n, 1000);

                if (waitResult === 'ok') {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest021: ${i}success`);
                } else if (waitResult === 'timed-out') {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest021: task${i}wait`);
                } else {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest021: task${i}wait: ${waitResult}`);
                }
                resolve(undefined);
              });
            }));
          }
          while (Atomics.load(readyCounter, 0) < taskCount) {
            const current = Atomics.load(readyCounter, 0);
            Atomics.wait(readyCounter, 0, current);
          }
          Atomics.store(array, 0, 1n);
          const notifiedCount = Atomics.notify(array, 0, taskCount);
          expect(notifiedCount).assertEqual(10);
          await Promise.all(taskPool);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2200
     * @tc.name AtomicsTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest022';
        console.info(`${TAG} test start`)
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const sharedArray: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 1);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 8, 1);
        Atomics.store(sharedArray, 0, 0n);
        Atomics.store(readyCounter, 0, 0);

        try {
          const waitTasks: Promise<void>[] = [];
          const notifyTasks: Promise<void>[] = [];
          const taskCount = 10;

          for (let i = 0; i < taskCount; i++) {
            waitTasks.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                const waitResult = Atomics.wait(sharedArray, 0, 0n);
                if (waitResult === 'ok') {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest022: wait${i}success`);
                } else if (waitResult === 'not-equal') {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest022: wait${i}`);
                } else {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest022: wait${i}: ${waitResult}`);
                }
                resolve(undefined);
              });
            }));
          }
          for (let i = 0; i < taskCount; i++) {
            notifyTasks.push(new Promise<void>((resolve, reject) => {
              await taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                setTimeout(() => {
                  Atomics.store(sharedArray, 0, 1n);
                  const notifiedCount = Atomics.notify(sharedArray, 0);
                  Atomics.store(sharedArray, 0, 0n);
                  resolve(undefined);
                }, 500);
              });
            }));
          }
          while (Atomics.load(readyCounter, 0) < taskCount * 2) {
            const current = Atomics.load(readyCounter, 0);
            setTimeout(() => {
              console.info('delay 50ms');
            }, 50);
          }
          await Promise.all([...waitTasks, ...notifyTasks]);
          expect(Atomics.load(sharedArray, 0)).assertEqual(0n);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2300
     * @tc.name AtomicsTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest023';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const sharedArray: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 1);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 8, 1);
        Atomics.store(sharedArray, 0, 0n);
        Atomics.store(readyCounter, 0, 0);
        try {
          const waitTasks: Promise<void>[] = [];
          const notifyTasks: Promise<void>[] = [];
          const taskCount = 10;

          for (let i = 0; i < taskCount; i++) {
            const waitValue = BigInt(i + 1);
            waitTasks.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                const waitResult = Atomics.wait(sharedArray, 0, waitValue);
                if (waitResult === 'ok') {
                } else if (waitResult === 'not-equal') {
                } else {
                  hilog.info(1, TAG, '%{public}s', `AtomicsTest023: wait ${i}: ${waitResult}，wait: ${waitValue}`);
                }
                resolve(undefined);
              });
            }));
          }
          for (let i = 0; i < taskCount; i++) {
            notifyTasks.push(new Promise<void>((resolve, reject) => {
              await taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                setTimeout(() => {
                  const newValue = BigInt(i + 1);
                  Atomics.store(sharedArray, 0, newValue);
                  const notifiedCount = Atomics.notify(sharedArray, 0);
                  Atomics.store(sharedArray, 0, 1n);
                  resolve(undefined);
                }, 500);
              });
            }));
          }
          while (Atomics.load(readyCounter, 0) < taskCount * 2) {
            const current = Atomics.load(readyCounter, 0);
            setTimeout(() => {
              console.info('delay 50ms');
            }, 50);
          }
          await Promise.all([...waitTasks, ...notifyTasks]);
          expect(Atomics.load(sharedArray, 0)).assertEqual(1n);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2400
     * @tc.name AtomicsTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest024';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const sharedArray: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 10);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 80, 1);

        for (let i = 0; i < 10; i++) {
          Atomics.store(sharedArray, i, 0n);
        }
        Atomics.store(readyCounter, 0, 0);

        try {
          const waitTasks: Promise<void>[] = [];
          const notifyTasks: Promise<void>[] = [];
          const taskCount = 10;

          for (let i = 0; i < taskCount; i++) {
            const waitPosition = i;
            const waitValue = 0n;

            waitTasks.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                Atomics.wait(sharedArray, waitPosition, waitValue);
                resolve(undefined);
              });
            }));
          }
          for (let i = 0; i < taskCount; i++) {
            notifyTasks.push(new Promise<void>((resolve, reject) => {
              await taskpool.execute(() => {
                Atomics.add(readyCounter, 0, 1);
                const newValue = BigInt(i + 1);
                Atomics.store(sharedArray, i, newValue);
                const notifiedCount = Atomics.notify(sharedArray, i);
                resolve(undefined);
              });
            }));
          }
          await Promise.all([...waitTasks, ...notifyTasks]);
          for (let i = 1; i < taskCount; i++) {
            const finalValue = Atomics.load(sharedArray, i);
            expect(finalValue).assertEqual(BigInt(i + 1));
          }
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_Atomics_Test_2500
     * @tc.name AtomicsTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest025';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);
        const dataArray: Int32Array = new Int32Array(sharedBuffer);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer);
        const NOTIFY_INDEX = 0;
        const READY_INDEX = 1;

        Atomics.store(dataArray, NOTIFY_INDEX, 0);
        Atomics.store(readyCounter, READY_INDEX, 0);

        const waitPromises: Promise<void>[] = [];
        for (let i = 0; i < 2; i++) {
          waitPromises.push(new Promise<void>((resolve, reject) => {
            const worker = new EAWorker();
            worker.run(() => {
              try {
                const prevCount = Atomics.add(readyCounter, READY_INDEX, 1);
                Atomics.notify(readyCounter, READY_INDEX);

                const waitResult = Atomics.wait(dataArray, NOTIFY_INDEX, 0, 5000);
                if (waitResult === 'timed-out') {
                  throw new Error(`Worker${i} timed out`);
                }

                if (waitResult !== 'not-equal') {
                  throw new Error(`Worker${i} woke abnormally:${waitResult}`);
                }
                resolve(undefined);
              } finally {
                worker.join();
              }
            });
          }));
        }

        const notifyPromise: Promise<void> = new Promise<void>((resolve, reject) => {
          const worker = new EAWorker();
          worker.run(() => {
            try {
              let current = Atomics.load(readyCounter, READY_INDEX);
              while (current < 2) {
                const waitResult = Atomics.wait(readyCounter, READY_INDEX, current, 2000);
                if (waitResult === 'timed-out') {
                  current = Atomics.load(readyCounter, READY_INDEX);
                  if (current < 2) {
                    throw new Error(`wait timeout count: ${current}/2`);
                  }
                } else {
                  current = Atomics.load(readyCounter, READY_INDEX);
                }
              }

              setTimeout(() => {
                try {
                  Atomics.store(dataArray, NOTIFY_INDEX, 1);
                  const count = Atomics.notify(dataArray, NOTIFY_INDEX, 2);
                  if (count < 2) {
                    throw new Error(`Only woke ${count} workers, expected 2`);
                  }
                  resolve(undefined);
                } catch (err: Error) {
                  reject(new Error(`notify error: ${err.message}`));
                }
              }, 100);
            } catch (err: Error) {
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            } finally {
              worker.join();
            }
          });
        });

        try {
          await Promise.all([...waitPromises, notifyPromise]);
          expect(Atomics.load(dataArray, NOTIFY_INDEX)).assertEqual(1);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_Atomics_Test_2600
     * @tc.name AtomicsTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AtomicsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'AtomicsTest026';
        console.info(`${TAG} test start`);
        const sharedBuffer: ArrayBuffer = new ArrayBuffer(1024);

        const dataArray: BigInt64Array = new BigInt64Array(sharedBuffer, 0, 1);
        const readyCounter: Int32Array = new Int32Array(sharedBuffer, 8, 1);
        const waitingCounter: Int32Array = new Int32Array(sharedBuffer, 12, 1);
        const worker = new EAWorker();
        Atomics.store(dataArray, 0, 0n);
        Atomics.store(readyCounter, 0, 0);
        Atomics.store(waitingCounter, 0, 0);

        try {
          const taskArray: Promise<void>[] = [];
          const taskCount = 10;
          for (let i = 0; i < taskCount; i++) {
            const taskIndex = i;
            taskArray.push(new Promise<void>((resolve, reject) => {
              taskpool.execute(async () => {
                const prevCount = Atomics.add(readyCounter, 0, 1);

                if (prevCount + 1 === taskCount) {
                  Atomics.notify(readyCounter, 0);
                }

                const prevWaiting = Atomics.add(waitingCounter, 0, 1);

                if (prevWaiting + 1 === taskCount) {
                  Atomics.notify(waitingCounter, 0);
                }

                const waitResult = Atomics.wait(dataArray, 0, 0n,1000);

                if (waitResult === 'timed-out') {
                  throw new Error(`task${taskIndex}wait timeout`);
                }
                resolve(undefined);
              });
            }));
          }

          const notifyWorker: Promise<void> = new Promise<void>((resolve, reject) => {
            worker.run(async () => {
              try {
                let current = Atomics.load(readyCounter, 0);

                while (current < taskCount) {
                  const waitResult = Atomics.wait(readyCounter, 0, current);
                  current = Atomics.load(readyCounter, 0);
                }

                let currentWaiting = Atomics.load(waitingCounter, 0);
                while (currentWaiting < taskCount) {
                  const waitResult = Atomics.wait(waitingCounter, 0, currentWaiting);
                  currentWaiting = Atomics.load(waitingCounter, 0);
                }

                Atomics.store(dataArray, 0, 1n);
                const count = Atomics.notify(dataArray, 0, taskCount);
                if (count !== taskCount) {
                  throw new Error(`awaken${taskCount}task${count}`);
                }
                resolve(undefined);
              } catch (err: Error) {
                console.error(`${TAG} catch error: code =>  message => ${err.message}`);
                reject(err);
              }
            });
          });

          await Promise.all([...taskArray, notifyWorker]);
          const finalValue = Atomics.load(dataArray, 0);
          expect(finalValue).assertEqual(1n);
        } catch (err: Error) {
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      })
  })
}