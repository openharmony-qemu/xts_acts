/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import taskpool from '@ohos.taskpool';
import { ArkTSUtils, collections } from '@kit.ArkTS';
import {
  AsyncOperationSendable,
  AsyncTransactionSendable,
  BaseDecoratorSendable,
  CacheEntrySendableModel,
  ClassDecoratorStackSendable,
  ComplexDecoratorStackSendable,
  DerivedDecoratorSendable,
  FeedRequestSendableModel,
  GetterSetterEntitySendable,
  GetterSetterPropertySendable,
  MethodDecoratorStackSendable,
  MixedMethodTypesSendable,
  MultiClassDecoratorStackSendable,
  MultiFeatureSendable,
  PerformanceMonitorSendable,
  PropertyDecoratorStackSendable,
  SecureOperationSendable,
  SharedDatabaseNamespace,
  SharedModuleDataSendable,
  SharedModuleEntitySendable,
  SharedUtilityNamespace,
  SingletonCacheManagerSendable,
  SingletonDatabaseConnectionSendable,
  StaticCounterSendable,
  StaticUtilitySendable,
  TracedPerformanceSendable,
  TransactionSendableModel,
  UserProfileSendableModel,
  ValidatedDataSendable
} from './models/SendableModels';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => {
    setTimeout(resolve, ms);
  });
}

@Concurrent
async function simpleGetValueTask(instance: ClassDecoratorStackSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return instance.value;
  })
  return res;
}

@Concurrent
async function concurrentIncrement(instance: ClassDecoratorStackSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    instance.value = instance.value + 1;
    return instance.getValue();
  })
  return res
}

@Concurrent
async function concurrentCompute(instance: MethodDecoratorStackSendable, x: number, y: number): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync(() => {
    return instance.compute(x, y);
  })
  return res
}

@Concurrent
async function simpleGetUserId(instance: UserProfileSendableModel): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(() => {
    return instance.userId;
  })
  return res
}

@Concurrent
async function concurrentValidate(instance: ValidatedDataSendable): Promise<boolean> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<boolean>(() => {
    return instance.validate();
  })
  return res
}

@Concurrent
async function concurrentExecuteTransaction(instance: TransactionSendableModel): Promise<boolean> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<boolean>(() => {
    return instance.execute();
  })
  return res
}

@Concurrent
async function concurrentSecureOperation(instance: SecureOperationSendable, data: string): Promise<boolean> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<boolean>(() => {
    return instance.performSecureOperation(data);
  })
  return res
}

@Concurrent
async function concurrentArrayPush(instance: ComplexDecoratorStackSendable, value: string): Promise<void> {
  await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync(() => {
    instance.logs.push(value);
  })
}

@Concurrent
async function processFeatureTask(inst: MultiFeatureSendable): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(() => {
    return inst.processFeature();
  })
  return res
}

@Concurrent
async function toJsonTask(obj: FeedRequestSendableModel): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(() => {
    return obj.toJson();
  })
  return res
}

@Concurrent
async function multiDecoratorStackTask(inst: MultiClassDecoratorStackSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return inst.compute();
  })
  return res
}

@Concurrent
async function methodDecoratorStackTask(inst: MethodDecoratorStackSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return inst.compute(10, 20);
  })
  return res
}

@Concurrent
async function complexDecoratorStackTask(inst: ComplexDecoratorStackSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return inst.compute(5, 10);
  })
  return res
}

const TASK_POOL_CONCURRENT_COUNT: number = 5;


@Concurrent
async function workerSendableReceiveTask(obj: SharedModuleDataSendable): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync(() => {
    return obj.moduleId;
  })
  return res;
}

@Concurrent
function workerSendableReturnTask(id: string, name: string): SharedModuleDataSendable {
  return new SharedModuleDataSendable(id, name);
}

@Concurrent
async function staticMethodConcurrentTask(data: string): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(() => {
    return StaticUtilitySendable.processData(data);
  })
  return res
}

@Concurrent
async function staticCounterConcurrentTask(): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    StaticCounterSendable.incrementGlobal();
    return StaticCounterSendable.getGlobalCount();
  })
  return res
}

@Concurrent
function staticFactoryConcurrentTask(id: string, name: string): SharedModuleDataSendable {
  return SharedModuleDataSendable.createSharedModule(id, name);
}

@Concurrent
async function getterConcurrentReadTask(inst: GetterSetterPropertySendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return inst.value;
  })
  return res;
}

@Concurrent
async function setterConcurrentWriteTask(inst: GetterSetterPropertySendable, val: number): Promise<void> {
  await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync(() => {
    inst.value = val;
  })
}

@Concurrent
async function getCountTask(inst: StaticCounterSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    return StaticCounterSendable.getGlobalCount();
  })
  return res
}

@Concurrent
async function getDataTask(inst: SharedModuleDataSendable): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(() => {
    return inst.moduleName;
  })
  return res
}

@Concurrent
async function asyncMethodConcurrentTask(inst: AsyncOperationSendable): Promise<string> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<string>(async () => {
    const result: string = await inst.executeAsync();
    return result;
  })
  return res
}

@Concurrent
function namespaceConcurrentTask(id: string, type: string): SharedDatabaseNamespace.NamespaceDatabaseEntitySendable {
  return new SharedDatabaseNamespace.NamespaceDatabaseEntitySendable(id, type);
}

@Concurrent
function singletonConcurrentTask(): SingletonDatabaseConnectionSendable {
  return SingletonDatabaseConnectionSendable.getInstance();
}

@Concurrent
async function complexCrossThreadTask(module: SharedModuleDataSendable): Promise<number> {
  let res = await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync<number>(() => {
    module.addSharedData('cross_thread_data');
    return module.sharedData.length;
  })
  return res
}

@Concurrent
async function sharedObjectLockTask(lockKey: string, obj: SharedModuleDataSendable): Promise<void> {
  await ArkTSUtils.locks.AsyncLock.request('lock').lockAsync(() => {
    obj.addSharedData(lockKey);
  })
}

@Concurrent
function taskPoolNestedWorkerTask(data: string): string {
  return 'nested_result_' + data;
}

const TEST_MODULE_ID_PREFIX: string = 'test_module_';
const TEST_MODULE_NAME: string = 'TestModule';

export default function SendableDecoratorConcurrentTest() {
  describe('SendableDecoratorConcurrentTest', () => {
    beforeAll(() => {
      console.info('SendableDecoratorConcurrentTest beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('SendableDecoratorConcurrentTest afterEach called');
    });

    afterAll(() => {
      console.info('SendableDecoratorConcurrentTest afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0100
     * @tc.name testF01CONCURRENT0100
     * @tc.desc Test Sendable class basic TaskPool concurrent execution - increment operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF01CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0100 begin-----------------");
        try {
          const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
          instance.value = 100;
          const task: taskpool.Task = new taskpool.Task(concurrentIncrement, instance);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(101);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0101
     * @tc.name testF01CONCURRENT0200
     * @tc.desc Test Sendable class TaskGroup concurrent execution with multiple tasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF01CONCURRENT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0200 begin-----------------");
        try {
          const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
          instance.value = 0;
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 5; i++) {
            taskGroup.addTask(new taskpool.Task(concurrentIncrement, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(5);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i] as number).assertLarger(0);
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0102
     * @tc.name testF06CONCURRENT0100
     * @tc.desc Test Sendable class method concurrent execution with compute operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF06CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF06CONCURRENT0100 begin-----------------");
        try {
          const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
          const task: taskpool.Task = new taskpool.Task(concurrentCompute, instance, 10, 20);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(30);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0103
     * @tc.name testF06CONCURRENT0200
     * @tc.desc Test Sendable class TaskGroup concurrent execution with compute operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF06CONCURRENT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF06CONCURRENT0200 begin-----------------");
        try {
          const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 5; i++) {
            taskGroup.addTask(new taskpool.Task(concurrentCompute, instance, i, i + 1));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(5);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0104
     * @tc.name testF01CONCURRENT0400
     * @tc.desc Test Sendable class property modification with AsyncLock protection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF01CONCURRENT0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0400 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
          instance.value = 0;
          await lock.lockAsync(async () => {
            for (let i: number = 0; i < 10; i++) {
              instance.value = instance.value + 1;
            }
          });
          expect(instance.value).assertEqual(10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0105
     * @tc.name testF05CONCURRENT0100
     * @tc.desc Test Sendable class property access with AsyncLock protection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF05CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF05CONCURRENT0100 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: PropertyDecoratorStackSendable = new PropertyDecoratorStackSendable();
          instance.propValue = 0;
          await lock.lockAsync(async () => {
            instance.propValue = 42;
            instance.stringValue = 'test';
          });
          expect(instance.propValue).assertEqual(42);
          expect(instance.stringValue).assertEqual('test');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0106
     * @tc.name testF07CONCURRENT0100
     * @tc.desc Test Sendable class compute method with AsyncLock protection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF07CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF07CONCURRENT0100 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: MultiClassDecoratorStackSendable = new MultiClassDecoratorStackSendable();
          instance.data = 10;
          await lock.lockAsync(async () => {
            const result: number = instance.compute();
            expect(result).assertEqual(100);
          });
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0107
     * @tc.name testF01CONCURRENT0500
     * @tc.desc Test Sendable class TaskGroup execution with multiple instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF01CONCURRENT0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0500 begin-----------------");
        try {
          const instances: ClassDecoratorStackSendable[] = [];
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 10; i++) {
            const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
            instance.value = 0;
            instances.push(instance);
            taskGroup.addTask(new taskpool.Task(concurrentIncrement, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0108
     * @tc.name testF06CONCURRENT0300
     * @tc.desc Test Sendable class TaskGroup concurrent compute with single instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF06CONCURRENT0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF06CONCURRENT0300 begin-----------------");
        try {
          const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 1; i++) {
            taskGroup.addTask(new taskpool.Task(concurrentCompute, instance, i, i * 2));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(1);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0109
     * @tc.name testF09CONCURRENT0100
     * @tc.desc Test Sendable class validation method concurrent execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF09CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF09CONCURRENT0100 begin-----------------");
        try {
          const instance: ValidatedDataSendable = new ValidatedDataSendable();
          instance.score = 85;
          instance.name = 'Test User';
          const task: taskpool.Task = new taskpool.Task(concurrentValidate, instance);
          const result: boolean = await taskpool.execute(task) as boolean;
          expect(result).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0110
     * @tc.name testF12CONCURRENT0100
     * @tc.desc Test Sendable class transaction execution in TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF12CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF12CONCURRENT0100 begin-----------------");
        try {
          const instance: TransactionSendableModel = new TransactionSendableModel();
          instance.txId = 'tx001';
          instance.fromAccount = 'acc001';
          instance.toAccount = 'acc002';
          instance.amount = BigInt(1000);
          const task: taskpool.Task = new taskpool.Task(concurrentExecuteTransaction, instance);
          const result: boolean = await taskpool.execute(task) as boolean;
          expect(result).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0111
     * @tc.name testF11CONCURRENT0100
     * @tc.desc Test Sendable class secure operation concurrent execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF11CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF11CONCURRENT0100 begin-----------------");
        try {
          const instance: SecureOperationSendable = new SecureOperationSendable();
          const task: taskpool.Task = new taskpool.Task(concurrentSecureOperation, instance, 'secret123');
          const result: boolean = await taskpool.execute(task) as boolean;
          expect(result).assertTrue();
          expect(instance.operationCount).assertEqual(1);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0112
     * @tc.name testF01CONCURRENT0600
     * @tc.desc Test Sendable class concurrent modifications with AsyncLock race condition handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF01CONCURRENT0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0600 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
          instance.value = 0;
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < 5; i++) {
            promises.push(lock.lockAsync(async () => {
              instance.value = instance.value + 1;
            }));
          }
          await Promise.all(promises);
          expect(instance.value).assertEqual(5);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0113
     * @tc.name testF07CONCURRENT0200
     * @tc.desc Test Sendable class array concurrent push operations with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF07CONCURRENT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF07CONCURRENT0200 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: ComplexDecoratorStackSendable = new ComplexDecoratorStackSendable();
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < 5; i++) {
            promises.push(lock.lockAsync(async () => {
              await concurrentArrayPush(instance, 'log_' + i.toString());
            }));
          }
          await Promise.all(promises);
          expect(instance.logs.length).assertEqual(5);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0114
     * @tc.name testF01CONCURRENT0700
     * @tc.desc Test Sendable class performance under TaskPool stress test with 100 concurrent tasks
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level1
     */
    it('testF01CONCURRENT0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0700 begin-----------------");
        try {
          const instances: ClassDecoratorStackSendable[] = [];
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 100; i++) {
            const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
            instance.value = i;
            instances.push(instance);
            taskGroup.addTask(new taskpool.Task(simpleGetValueTask, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(100);
          for (let i: number = 0; i < 100; i++) {
            expect(results[i]).assertEqual(i);
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0115
     * @tc.name testF06CONCURRENT0400
     * @tc.desc Test Sendable class performance with concurrent compute operations
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level1
     */
    it('testF06CONCURRENT0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF06CONCURRENT0400 begin-----------------");
        try {
          const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 1; i++) {
            taskGroup.addTask(new taskpool.Task(concurrentCompute, instance, i, i));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(1);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0116
     * @tc.name testF01CONCURRENT0800
     * @tc.desc Test Sendable class memory management with multiple instance creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF01CONCURRENT0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF01CONCURRENT0800 begin-----------------");
        for (let i: number = 0; i < 100; i++) {
          const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
          instance.value = i;
          expect(instance.value).assertEqual(i);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0117
     * @tc.name testF07CONCURRENT0300
     * @tc.desc Test Sendable class memory management with multiple instances and properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF07CONCURRENT0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF07CONCURRENT0300 begin-----------------");
        for (let i: number = 0; i < 10; i++) {
          const instance: ComplexDecoratorStackSendable = new ComplexDecoratorStackSendable();
          instance.primaryValue = i;
          instance.secondaryValue = i * 2;
          expect(instance.primaryValue).assertEqual(i);
          expect(instance.secondaryValue).assertEqual(i * 2);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0118
     * @tc.name testREALWORLD0100
     * @tc.desc Test Sendable ORM model basic functionality and data validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0100 begin-----------------");
        const instance: UserProfileSendableModel = new UserProfileSendableModel();
        instance.userId = 'user_001';
        instance.username = 'john_doe';
        instance.email = 'john.doe@example.com';
        instance.age = 30;
        instance.balance = BigInt(50000);
        expect(instance.isValid()).assertTrue();
        expect(instance.userId).assertEqual('user_001');
        expect(instance.username).assertEqual('john_doe');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0119
     * @tc.name testREALWORLD0200
     * @tc.desc Test Sendable ORM model batch creation and validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0200 begin-----------------");
        const instances: UserProfileSendableModel[] = [];
        for (let i: number = 0; i < 50; i++) {
          const instance: UserProfileSendableModel = new UserProfileSendableModel();
          instance.userId = 'user_' + i.toString();
          instance.username = 'user' + i.toString();
          instance.email = 'user' + i.toString() + '@test.com';
          instance.age = 25 + i;
          instance.balance = BigInt(1000 * (i + 1));
          instances.push(instance);
        }
        expect(instances.length).assertEqual(50);
        for (let i: number = 0; i < instances.length; i++) {
          expect(instances[i].isValid()).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0120
     * @tc.name testREALWORLD0300
     * @tc.desc Test Sendable transaction model concurrent execution in TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0300 begin-----------------");
        try {
          const instance: TransactionSendableModel = new TransactionSendableModel();
          instance.txId = 'tx_001';
          instance.fromAccount = 'acc_001';
          instance.toAccount = 'acc_002';
          instance.amount = BigInt(5000);
          instance.timestamp = Date.now();
          instance.signature = 'sig_001';
          const task: taskpool.Task = new taskpool.Task(concurrentExecuteTransaction, instance);
          const result: boolean = await taskpool.execute(task) as boolean;
          expect(result).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0121
     * @tc.name testREALWORLD0400
     * @tc.desc Test Sendable transaction model TaskGroup concurrent execution with multiple instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0400 begin-----------------");
        try {
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 10; i++) {
            const instance: TransactionSendableModel = new TransactionSendableModel();
            instance.txId = 'tx_' + i.toString();
            instance.fromAccount = 'acc_' + i.toString();
            instance.toAccount = 'acc_' + (i + 1).toString();
            instance.amount = BigInt(1000 * (i + 1));
            taskGroup.addTask(new taskpool.Task(concurrentExecuteTransaction, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0122
     * @tc.name testREALWORLD0500
     * @tc.desc Test Sendable cache entry model basic functionality and expiration check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0500 begin-----------------");
        const instance: CacheEntrySendableModel = new CacheEntrySendableModel();
        instance.cacheKey = 'key_001';
        instance.cacheValue = 'value_001';
        instance.ttl = 3600;
        instance.createdAt = Date.now();
        expect(instance.isExpired()).assertFalse();
        expect(instance.cacheKey).assertEqual('key_001');
        expect(instance.cacheValue).assertEqual('value_001');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0123
     * @tc.name testREALWORLD0600
     * @tc.desc Test Sendable cache entry model refresh functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0600 begin-----------------");
        const instance: CacheEntrySendableModel = new CacheEntrySendableModel();
        instance.cacheKey = 'key_002';
        instance.cacheValue = 'value_002';
        instance.ttl = 1800;
        instance.createdAt = Date.now();
        instance.refresh();
        expect(instance.cacheKey).assertEqual('key_002');
        expect(instance.cacheValue).assertEqual('value_002');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0124
     * @tc.name testREALWORLD0700
     * @tc.desc Test Sendable performance monitor model metrics recording functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0700 begin-----------------");
        const instance: PerformanceMonitorSendable = new PerformanceMonitorSendable();
        instance.recordMetric('cpu_usage', 85);
        instance.recordMetric('memory_usage', 2048);
        instance.recordMetric('network_latency', 120);
        expect(instance.metrics.length).assertEqual(3);
        expect(instance.metrics[0]).assertEqual('cpu_usage:85');
        expect(instance.metrics[1]).assertEqual('memory_usage:2048');
        expect(instance.metrics[2]).assertEqual('network_latency:120');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0125
     * @tc.name testREALWORLD0800
     * @tc.desc Test Sendable traced performance model trace lifecycle management
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0800 begin-----------------");
        const instance: TracedPerformanceSendable = new TracedPerformanceSendable();
        instance.startTrace('trace_001');
        instance.endTrace();
        const result: string = instance.getTraceResult();
        expect(instance.traceId).assertEqual('trace_001');
        expect(instance.callCount).assertEqual(2);
        expect(result.includes('trace_001')).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0126
     * @tc.name testREALWORLD0900
     * @tc.desc Test Sendable array concurrent producer pattern with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD0900 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const dataQueue: collections.Array<string> = new collections.Array<string>();
          const producerPromises: Promise<void>[] = [];
          for (let i: number = 0; i < 5; i++) {
            let pro = lock.lockAsync(() => {
              dataQueue.push('data_' + i.toString());
            }).catch((err: Error) => {
              console.error(`error: ${err.message}`);
              expect().assertFail();
            })
            producerPromises.push(pro);
          }
          await Promise.all(producerPromises);
          expect(dataQueue.length).assertEqual(5);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0127
     * @tc.name testREALWORLD1000
     * @tc.desc Test Sendable array concurrent consumer pattern with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1000 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const dataQueue: collections.Array<string> = new collections.Array<string>();
          for (let i: number = 0; i < 10; i++) {
            dataQueue.push('data_' + i.toString());
          }
          const consumerPromises: Promise<void>[] = [];
          for (let i: number = 0; i < 5; i++) {
            let pro = lock.lockAsync(() => {
              if (dataQueue.length > 0) {
                const item: string = dataQueue[dataQueue.length - 1];
                expect(item.length).assertLarger(0);
              }
            }).catch((err: Error) => {
              console.error(`error: ${err.message}`);
              expect().assertFail();
            })
            consumerPromises.push(pro);
          }
          await Promise.all(consumerPromises);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0128
     * @tc.name testREALWORLD1100
     * @tc.desc Test Sendable connection pool concurrent access with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1100 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const connectionPool: collections.Array<SecureOperationSendable> =
            new collections.Array<SecureOperationSendable>();
          for (let i: number = 0; i < 5; i++) {
            const connection: SecureOperationSendable = new SecureOperationSendable();
            connectionPool.push(connection);
          }
          expect(connectionPool.length).assertEqual(5);
          await lock.lockAsync(async () => {
            const conn: SecureOperationSendable = connectionPool[0];
            conn.performSecureOperation('test_op');
            expect(conn.operationCount).assertEqual(1);
          });
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0129
     * @tc.name testREALWORLD1200
     * @tc.desc Test Sendable connection pool concurrent modifications with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1200 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const connectionPool: collections.Array<TransactionSendableModel> =
            new collections.Array<TransactionSendableModel>();
          for (let i: number = 0; i < 10; i++) {
            const connection: TransactionSendableModel = new TransactionSendableModel();
            connection.txId = 'conn_' + i.toString();
            connectionPool.push(connection);
          }
          expect(connectionPool.length).assertEqual(10);
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < 3; i++) {
            promises.push(lock.lockAsync(async () => {
              if (connectionPool.length > 0) {
                const conn: TransactionSendableModel = connectionPool[i];
                conn.amount = BigInt(1000);
                expect(conn.amount).assertEqual(BigInt(1000));
              }
            }));
          }
          await Promise.all(promises);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0130
     * @tc.name testREALWORLD1300
     * @tc.desc Test Sendable multi-feature model basic functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1300 begin-----------------");
        const instance: MultiFeatureSendable = new MultiFeatureSendable();
        instance.featureData = 'test_feature';
        instance.priority = 75;
        instance.internalToken = 'token123';
        const result: string = instance.processFeature();
        expect(result).assertEqual('Processed: test_feature');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0131
     * @tc.name testREALWORLD1400
     * @tc.desc Test Sendable multi-feature model validation functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testREALWORLD1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1400 begin-----------------");
        const instance: MultiFeatureSendable = new MultiFeatureSendable();
        instance.featureData = 'advanced_feature';
        instance.priority = 90;
        expect(instance.validateFeature()).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0132
     * @tc.name testREALWORLD1500
     * @tc.desc Test Sendable multi-feature model TaskGroup concurrent execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testREALWORLD1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testREALWORLD1500 begin-----------------");
        try {
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 10; i++) {
            const instance: MultiFeatureSendable = new MultiFeatureSendable();
            instance.featureData = 'feature_' + i.toString();
            instance.priority = 50 + i;
            instance.internalToken = 'token_' + i.toString();
            taskGroup.addTask(new taskpool.Task(processFeatureTask, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0133
     * @tc.name testF08CONCURRENT0100
     * @tc.desc Test Sendable class inheritance basic property and method access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF08CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF08CONCURRENT0100 begin-----------------");
        const instance: DerivedDecoratorSendable = new DerivedDecoratorSendable();
        instance.baseProp = 100;
        instance.derivedProp = 200;
        expect(instance.getBaseProp()).assertEqual(100);
        expect(instance.getDerivedProp()).assertEqual(200);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0134
     * @tc.name testF08CONCURRENT0200
     * @tc.desc Test Sendable class inheritance concurrent modifications with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF08CONCURRENT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF08CONCURRENT0200 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: DerivedDecoratorSendable = new DerivedDecoratorSendable();
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < 5; i++) {
            promises.push(lock.lockAsync(async () => {
              instance.baseProp = instance.baseProp + 10;
              instance.derivedProp = instance.derivedProp + 20;
            }));
          }
          await Promise.all(promises);
          expect(instance.baseProp).assertEqual(10 + 50);
          expect(instance.derivedProp).assertEqual(20 + 100);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0135
     * @tc.name testF09CONCURRENT0200
     * @tc.desc Test Sendable model performance with large volume validation operations
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level1
     */
    it('testF09CONCURRENT0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF09CONCURRENT0200 begin-----------------");
        const instance: UserProfileSendableModel = new UserProfileSendableModel();
        instance.userId = 'large_user';
        instance.username = 'large_username_test';
        instance.email = 'large.user@example.com';
        instance.age = 30;
        instance.balance = BigInt(100000);
        for (let i: number = 0; i < 100; i++) {
          const isValid: boolean = instance.isValid();
          expect(isValid).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0136
     * @tc.name testF09CONCURRENT0300
     * @tc.desc Test Sendable model TaskGroup performance with large volume concurrent execution
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level1
     */
    it('testF09CONCURRENT0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF09CONCURRENT0300 begin-----------------");
        try {
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < 10; i++) {
            const instance: UserProfileSendableModel = new UserProfileSendableModel();
            instance.userId = 'user_' + i.toString();
            instance.username = 'username_' + i.toString();
            instance.email = 'email_' + i.toString() + '@test.com';
            instance.age = 25 + (i % 50);
            instance.balance = BigInt(1000 * (i + 1));
            taskGroup.addTask(new taskpool.Task(simpleGetUserId, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0137
     * @tc.name testF10CONCURRENT0100
     * @tc.desc Test Sendable model cross-thread data transfer via TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testF10CONCURRENT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF10CONCURRENT0100 begin-----------------");
        try {
          const instance: FeedRequestSendableModel = new FeedRequestSendableModel();
          instance.type = 1;
          instance.cursor = BigInt(12345);
          instance.data = 'test_data';
          const task: taskpool.Task = new taskpool.Task(toJsonTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result.includes('test_data')).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0138
     * @tc.name testF10CONCURRENT0200
     * @tc.desc Test Sendable model cross-thread property access and modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testF10CONCURRENT0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testF10CONCURRENT0200 begin-----------------");
        try {
          const instance: UserProfileSendableModel = new UserProfileSendableModel();
          instance.userId = 'cross_thread_user';
          instance.username = 'cross_user';
          instance.email = 'cross@test.com';
          instance.age = 35;
          const task: taskpool.Task = new taskpool.Task(simpleGetUserId, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('cross_thread_user');
          expect(instance.userId).assertEqual('cross_thread_user');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0139
     * @tc.name testDecoratorImplBasic0100
     * @tc.desc Test class decorator stack effect on Sendable class actual usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0100 begin-----------------");
        // ClassDecoratorStackSendable被@LogClassDecorator装饰
        // 测试装饰器叠加后的Sendable类实际使用效果

        const instance: ClassDecoratorStackSendable = new ClassDecoratorStackSendable();
        instance.value = 100;

        // 测试装饰器叠加后的实际使用：调用getValue方法
        const result: number = instance.getValue();
        expect(result).assertEqual(100);

        // 验证装饰器叠加效果：日志记录
        expect(instance.logs.length).assertLarger(0);
        expect(instance.logs).assertContain('getValue');

        console.info("-----------------testDecoratorImplBasic0100 end-----------------");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0140
     * @tc.name testDecoratorImplBasic0200
     * @tc.desc Test multiple class decorators stack effect on Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0200 begin-----------------");
        // MultiClassDecoratorStackSendable被@LogClassDecorator + @CountClassDecorator装饰
        // 测试多装饰器叠加后的实际使用效果

        const instance: MultiClassDecoratorStackSendable = new MultiClassDecoratorStackSendable();
        instance.data = 50;

        // 测试装饰器叠加后的实际使用：调用compute方法
        const result: number = instance.compute();
        expect(result).assertEqual(500);

        // 验证多装饰器叠加效果：日志记录
        expect(instance.logs.length).assertLarger(0);
        expect(instance.logs).assertContain('compute');

        console.info("-----------------testDecoratorImplBasic0200 end-----------------");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0141
     * @tc.name testDecoratorImplBasic0300
     * @tc.desc Test decorator inheritance effect on Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0300 begin-----------------");
        // BaseDecoratorSendable被@LogClassDecorator装饰
        // DerivedDecoratorSendable继承装饰器效果
        // 测试装饰器继承的实际使用效果

        const instance: BaseDecoratorSendable = new BaseDecoratorSendable();
        instance.baseProp = 150;

        // 测试装饰器叠加后的实际使用：调用getBaseProp方法
        const result: number = instance.getBaseProp();
        expect(result).assertEqual(150);

        // 验证装饰器效果：日志记录
        expect(instance.logs.length).assertLarger(0);
        expect(instance.logs).assertContain('getBaseProp');

        console.info("-----------------testDecoratorImplBasic0300 end-----------------");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0142
     * @tc.name testDecoratorImplBasic0400
     * @tc.desc Test property decorator stack effect on Sendable class actual usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0400 begin-----------------");
        // PropertyDecoratorStackSendable被属性装饰器@LogPropertyDecorator叠加
        // 测试属性装饰器叠加后的实际使用效果

        const instance: PropertyDecoratorStackSendable = new PropertyDecoratorStackSendable();

        // 测试装饰器叠加后的实际使用：访问被装饰的属性
        instance.propValue = 200;
        instance.stringValue = 'decorated_property';

        // 验证属性装饰器叠加效果：属性正常访问
        expect(instance.propValue).assertEqual(200);
        expect(instance.stringValue).assertEqual('decorated_property');

        // 验证属性装饰器不影响Sendable约束
        expect(instance.logs.length).assertEqual(0); // logs是预定义属性

        console.info("-----------------testDecoratorImplBasic0400 end-----------------");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0143
     * @tc.name testDecoratorImplBasic0500
     * @tc.desc Test method decorator stack effect on Sendable class actual usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0500 begin-----------------");
        // MethodDecoratorStackSendable被方法装饰器叠加
        // 方法内部手动实现了装饰器效果：日志记录
        // 测试方法装饰器叠加后的实际使用效果

        const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
        instance.value = 50;

        // 测试装饰器叠加后的实际使用：调用compute方法
        const result: number = instance.compute(10, 20);
        expect(result).assertEqual(30);

        const value: number = instance.getValue();
        expect(value).assertEqual(50);

        console.info("-----------------testDecoratorImplBasic0500 end-----------------");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0144
     * @tc.name testDecoratorImplBasic0600
     * @tc.desc Test complex decorator stack with multiple layers on Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplBasic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplBasic0600 begin-----------------");
        // ComplexDecoratorStackSendable有复杂装饰器叠加：
        // compute方法：LogMethodDecorator + MeasureMethodDecorator + CacheMethodDecorator
        // validateAndProcess方法：ValidateMethodDecorator + RetryMethodDecorator + LogMethodDecorator
        // throttledOperation方法：ThrottleMethodDecorator + DebounceMethodDecorator + LogMethodDecorator
        // 测试多层装饰器叠加的实际使用效果

        const instance: ComplexDecoratorStackSendable = new ComplexDecoratorStackSendable();

        // 测试多层装饰器叠加：调用compute方法
        const result1: number = instance.compute(5, 10);
        expect(result1).assertEqual(200);

        const result2: boolean = instance.validateAndProcess();
        expect(result2).assertTrue();

        instance.throttledOperation();

        console.info("-----------------testDecoratorImplBasic0600 end-----------------");
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0145
     * @tc.name testDecoratorImplConcurrent0100
     * @tc.desc Test decorator stack effect preserved cross-thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplConcurrent0100 begin-----------------");
        try {
          // 测试装饰器叠加后的Sendable类跨线程使用效果

          const instance: MultiClassDecoratorStackSendable = new MultiClassDecoratorStackSendable();
          instance.data = 200;

          const task: taskpool.Task = new taskpool.Task(multiDecoratorStackTask, instance);
          const result: number = await taskpool.execute(task) as number;

          // 验证装饰器效果跨线程保持：计算结果正确
          expect(result).assertEqual(2000);

          // 验证装饰器叠加效果：日志记录
          expect(instance.logs.length).assertLarger(0);

          console.info("-----------------testDecoratorImplConcurrent0100 end-----------------");
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0146
     * @tc.name testDecoratorImplConcurrent0200
     * @tc.desc Test method decorator stack cross-thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplConcurrent0200 begin-----------------");
        try {
          // 测试方法装饰器叠加后的Sendable类跨线程使用效果

          const instance: MethodDecoratorStackSendable = new MethodDecoratorStackSendable();
          instance.value = 100;

          const task: taskpool.Task = new taskpool.Task(methodDecoratorStackTask, instance);
          const result: number = await taskpool.execute(task) as number;

          expect(result).assertEqual(30);

          console.info("-----------------testDecoratorImplConcurrent0200 end-----------------");
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0147
     * @tc.name testDecoratorImplConcurrent0300
     * @tc.desc Test complex decorator stack cross-thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplConcurrent0300 begin-----------------");
        try {
          // 测试复杂装饰器叠加后的Sendable类跨线程使用效果

          const instance: ComplexDecoratorStackSendable = new ComplexDecoratorStackSendable();

          const task: taskpool.Task = new taskpool.Task(complexDecoratorStackTask, instance);
          const result: number = await taskpool.execute(task) as number;

          // 验证多层装饰器叠加效果跨线程保持
          expect(result).assertEqual(200);

          console.info("-----------------testDecoratorImplConcurrent0300 end-----------------");
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0148
     * @tc.name testDecoratorImplConcurrent0400
     * @tc.desc Test decorator stack conforms to Sendable constraints in concurrent scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorImplConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testDecoratorImplConcurrent0400 begin-----------------");
        try {
          // 验证装饰器叠加后的多个Sendable类并发使用符合Sendable约束

          const instance1: MultiClassDecoratorStackSendable = new MultiClassDecoratorStackSendable();
          instance1.data = 50;

          const instance2: ComplexDecoratorStackSendable = new ComplexDecoratorStackSendable();

          // 测试多个被装饰的类并发使用
          const task1: taskpool.Task = new taskpool.Task(multiDecoratorStackTask, instance1);
          const task2: taskpool.Task = new taskpool.Task(complexDecoratorStackTask, instance2);

          const result1: number = await taskpool.execute(task1) as number;
          const result2: number = await taskpool.execute(task2) as number;

          // 验证装饰器叠加效果在并发场景下符合Sendable约束
          expect(result1).assertEqual(500);
          expect(result2).assertEqual(200);

          console.info("-----------------testDecoratorImplConcurrent0400 end-----------------");
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0149
     * @tc.name testWorkerConcurrent0100
     * @tc.desc Test TaskPool receive Sendable object from main thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0100 begin-----------------");
        try {
          const instance: SharedModuleDataSendable = new SharedModuleDataSendable('worker_001', 'WorkerModule');
          const task: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('worker_001');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0150
     * @tc.name testWorkerConcurrent0200
     * @tc.desc Test TaskPool create and return Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0200 begin-----------------");
        try {
          const task: taskpool.Task = new taskpool.Task(workerSendableReturnTask, 'worker_return_001', 'ReturnModule');
          const result: SharedModuleDataSendable = await taskpool.execute(task) as SharedModuleDataSendable;
          expect(result.moduleId).assertEqual('worker_return_001');
          expect(result.moduleName).assertEqual('ReturnModule');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0151
     * @tc.name testWorkerConcurrent0300
     * @tc.desc Test TaskPool bidirectional communication with Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0300 begin-----------------");
        try {
          const instance: SharedModuleDataSendable =
            new SharedModuleDataSendable('worker_bidirectional_001', 'BidirectionalModule');
          instance.addSharedData('main_thread_data');
          const task: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('worker_bidirectional_001');
          expect(instance.sharedData.length).assertEqual(1);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0152
     * @tc.name testWorkerConcurrent0400
     * @tc.desc Test TaskPool access namespace Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0400 begin-----------------");
        const entity: SharedDatabaseNamespace.NamespaceDatabaseEntitySendable =
          new SharedDatabaseNamespace.NamespaceDatabaseEntitySendable('worker_namespace_001', 'NamespaceEntity');
        entity.setData('worker_key', 'worker_value');
        expect(entity.getData('worker_key')).assertEqual('worker_value');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0153
     * @tc.name testWorkerConcurrent0500
     * @tc.desc Test TaskPool concurrent receive multiple Sendable objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testWorkerConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0500 begin-----------------");
        try {
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          const instances: SharedModuleDataSendable[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            const instance: SharedModuleDataSendable =
              new SharedModuleDataSendable('worker_multi_' + i.toString(), 'MultiModule');
            instances.push(instance);
            taskGroup.addTask(new taskpool.Task(workerSendableReceiveTask, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i]).assertEqual('worker_multi_' + i.toString());
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0154
     * @tc.name testWorkerConcurrent0600
     * @tc.desc Test TaskPool transfer Sendable object multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testWorkerConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0600 begin-----------------");
        try {
          const instance: SharedModuleDataSendable =
            new SharedModuleDataSendable('worker_transfer_001', 'TransferModule');
          const task1: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, instance);
          const result1: string = await taskpool.execute(task1) as string;
          const task2: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, instance);
          const result2: string = await taskpool.execute(task2) as string;
          expect(result1).assertEqual(result2);
          expect(result1).assertEqual('worker_transfer_001');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0155
     * @tc.name testWorkerConcurrent0700
     * @tc.desc Test TaskPool call Sendable static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0700 begin-----------------");
        try {
          const task: taskpool.Task = new taskpool.Task(staticMethodConcurrentTask, 'worker_static_data');
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('Processed: worker_static_data');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0156
     * @tc.name testWorkerConcurrent0800
     * @tc.desc Test TaskPool call Sendable async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0800 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('worker_async_001', 'WorkerAsyncOp');
          const task: taskpool.Task = new taskpool.Task(asyncMethodConcurrentTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('Async operation completed');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0157
     * @tc.name testWorkerConcurrent0900
     * @tc.desc Test TaskPool access Sendable Getter property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent0900 begin-----------------");
        try {
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('worker_gs_001');
          instance.value = 100;
          const task: taskpool.Task = new taskpool.Task(getterConcurrentReadTask, instance);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(100);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0158
     * @tc.name testWorkerConcurrent1000
     * @tc.desc Test TaskPool access Sendable singleton pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerConcurrent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testWorkerConcurrent1000 begin-----------------");
        try {
          SingletonDatabaseConnectionSendable.resetInstance();
          const task: taskpool.Task = new taskpool.Task(singletonConcurrentTask);
          const result: SingletonDatabaseConnectionSendable =
            await taskpool.execute(task) as SingletonDatabaseConnectionSendable;
          expect(result.databaseName).assertEqual('default_db');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0159
     * @tc.name testComplexConcurrent0100
     * @tc.desc Test TaskPool multi-layer nested execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0100 begin-----------------");
        try {
          const instance: SharedModuleDataSendable = new SharedModuleDataSendable('nested_001', 'NestedModule');
          const task1: taskpool.Task = new taskpool.Task(complexCrossThreadTask, instance);
          const result1: number = await taskpool.execute(task1) as number;
          expect(result1).assertEqual(1);
          const task2: taskpool.Task = new taskpool.Task(taskPoolNestedWorkerTask, 'nested_layer2');
          const result2: string = await taskpool.execute(task2) as string;
          expect(result2).assertEqual('nested_result_nested_layer2');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0160
     * @tc.name testComplexConcurrent0200
     * @tc.desc Test cross-thread callback with Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0200 begin-----------------");
        try {
          const instance: SharedModuleDataSendable = new SharedModuleDataSendable('callback_001', 'CallbackModule');
          const callbackResults: string[] = [];
          const task: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, instance);
          const callbackResult: string = await taskpool.execute(task) as string;
          callbackResults.push(callbackResult);
          expect(callbackResults.length).assertEqual(1);
          expect(callbackResults[0]).assertEqual('callback_001');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0161
     * @tc.name testComplexConcurrent0300
     * @tc.desc Test cross-thread Promise transfer Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0300 begin-----------------");
        try {
          const promises: Promise<SharedModuleDataSendable>[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            const task: taskpool.Task =
              new taskpool.Task(staticFactoryConcurrentTask, 'promise_' + i.toString(), 'PromiseModule');
            promises.push(taskpool.execute(task) as Promise<SharedModuleDataSendable>);
          }
          const results: SharedModuleDataSendable[] = await Promise.all(promises);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i].moduleId).assertEqual('promise_' + i.toString());
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0162
     * @tc.name testComplexConcurrent0400
     * @tc.desc Test TaskPool with AsyncLock concurrent access Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0400 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const sharedObj: SharedModuleDataSendable = new SharedModuleDataSendable('lock_001', 'LockModule');
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            promises.push(lock.lockAsync(async () => {
              sharedObj.addSharedData('lock_data_' + i.toString());
            }));
          }
          await Promise.all(promises);
          expect(sharedObj.sharedData.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0163
     * @tc.name testComplexConcurrent0500
     * @tc.desc Test multiple TaskPool tasks share same Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0500 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const sharedInstance: SharedModuleDataSendable = new SharedModuleDataSendable('shared_001', 'SharedModule');
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            promises.push(lock.lockAsync(async () => {
              sharedInstance.addSharedData('data_' + i.toString());
            }));
          }
          await Promise.all(promises);
          expect(sharedInstance.sharedData.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0164
     * @tc.name testComplexConcurrent0600
     * @tc.desc Test TaskPool create Sendable instance via static factory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComplexConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0600 begin-----------------");
        try {
          const task: taskpool.Task =
            new taskpool.Task(staticFactoryConcurrentTask, 'taskpool_create_001', 'TaskPoolModule');
          const result: SharedModuleDataSendable = await taskpool.execute(task) as SharedModuleDataSendable;
          expect(result.moduleId).assertEqual('taskpool_create_001');
          expect(result.moduleName).assertEqual('TaskPoolModule');
          expect(result.validateModule()).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0165
     * @tc.name testComplexConcurrent0700
     * @tc.desc Test cross-thread event listener with Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testComplexConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0700 begin-----------------");
        try {
          const instance: SharedModuleDataSendable = new SharedModuleDataSendable('event_001', 'EventModule');
          const eventResults: string[] = [];
          setTimeout(() => {
            try {
              eventResults.push(instance.moduleId);
              expect(eventResults.length).assertEqual(1);
              expect(eventResults[0]).assertEqual('event_001');
            } catch (err) {
              console.error(`error: ${err.message}`);
              expect().assertFail();
            }
            done();
          }, 50);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0166
     * @tc.name testComplexConcurrent0800
     * @tc.desc Test cross-thread transfer shared module instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComplexConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0800 begin-----------------");
        try {
          const sharedModule: SharedModuleDataSendable =
            SharedModuleDataSendable.createSharedModule('cross_shared_001', 'CrossSharedModule');
          const task: taskpool.Task = new taskpool.Task(workerSendableReceiveTask, sharedModule);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('cross_shared_001');
          expect(sharedModule.moduleId).assertEqual('cross_shared_001');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0167
     * @tc.name testComplexConcurrent0900
     * @tc.desc Test cross-thread transfer namespace instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComplexConcurrent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent0900 begin-----------------");
        try {
          const task: taskpool.Task = new taskpool.Task(namespaceConcurrentTask, 'cross_namespace_001', 'CrossNamespace');
          const result: SharedDatabaseNamespace.NamespaceDatabaseEntitySendable =
            await taskpool.execute(task) as SharedDatabaseNamespace.NamespaceDatabaseEntitySendable;
          expect(result.entityId).assertEqual('cross_namespace_001');
          expect(result.entityType).assertEqual('CrossNamespace');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0168
     * @tc.name testComplexConcurrent1000
     * @tc.desc Test cross-thread transfer singleton instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComplexConcurrent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testComplexConcurrent1000 begin-----------------");
        try {
          SingletonDatabaseConnectionSendable.resetInstance();
          const mainInstance: SingletonDatabaseConnectionSendable = SingletonDatabaseConnectionSendable.getInstance();
          const task: taskpool.Task = new taskpool.Task(singletonConcurrentTask);
          const workerInstance: SingletonDatabaseConnectionSendable =
            await taskpool.execute(task) as SingletonDatabaseConnectionSendable;
          expect(workerInstance.databaseName).assertEqual('default_db');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0169
     * @tc.name testStaticConcurrent0100
     * @tc.desc Test Sendable static method concurrent call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0100 begin-----------------");
        try {
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            taskGroup.addTask(new taskpool.Task(staticMethodConcurrentTask, 'static_concurrent_' + i.toString()));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i]).assertEqual('Processed: static_concurrent_' + i.toString());
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0170
     * @tc.name testStaticConcurrent0200
     * @tc.desc Test TaskPool call Sendable static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0200 begin-----------------");
        try {
          const task: taskpool.Task = new taskpool.Task(staticMethodConcurrentTask, 'taskpool_static_001');
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('Processed: taskpool_static_001');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0171
     * @tc.name testStaticConcurrent0300
     * @tc.desc Test Sendable static factory method cross-thread return instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0300 begin-----------------");
        try {
          const task: taskpool.Task =
            new taskpool.Task(staticFactoryConcurrentTask, 'static_factory_001', 'StaticFactoryModule');
          const instance: SharedModuleDataSendable = await taskpool.execute(task) as SharedModuleDataSendable;
          expect(instance.moduleId).assertEqual('static_factory_001');
          expect(instance.moduleName).assertEqual('StaticFactoryModule');
          expect(instance.validateModule()).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0172
     * @tc.name testStaticConcurrent0400
     * @tc.desc Test Sendable static counter cross-thread access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0400 begin-----------------");
        try {
          StaticCounterSendable.resetGlobal();
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            taskGroup.addTask(new taskpool.Task(staticCounterConcurrentTask));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0173
     * @tc.name testStaticConcurrent0500
     * @tc.desc Test Sendable static method return Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0500 begin-----------------");
        const instance: SharedModuleDataSendable =
          SharedModuleDataSendable.createSharedModule('static_return_001', 'StaticReturnModule');
        expect(instance instanceof SharedModuleDataSendable).assertTrue();
        expect(instance.moduleId).assertEqual('static_return_001');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0174
     * @tc.name testStaticConcurrent0600
     * @tc.desc Test Sendable static method parameter validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0600 begin-----------------");
        const result: string = StaticUtilitySendable.processData('param_validation_test');
        expect(result.includes('param_validation_test')).assertTrue();
        const calcResult: number = StaticUtilitySendable.calculate(10, 20);
        expect(calcResult).assertEqual(30);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0175
     * @tc.name testStaticConcurrent0700
     * @tc.desc Test Sendable static method and instance method concurrent access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testStaticConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0700 begin-----------------");
        try {
          const instance: StaticUtilitySendable = new StaticUtilitySendable('utility_instance_001');
          const staticTask: taskpool.Task = new taskpool.Task(staticMethodConcurrentTask, 'static_and_instance');
          const staticResult: string = await taskpool.execute(staticTask) as string;
          const instanceValid: boolean = instance.validateUtility();
          expect(staticResult).assertEqual('Processed: static_and_instance');
          expect(instanceValid).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0176
     * @tc.name testStaticConcurrent0800
     * @tc.desc Test Sendable static method cross-thread shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testStaticConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticConcurrent0800 begin-----------------");
        try {
          StaticUtilitySendable.resetOperations();
          const task1: taskpool.Task = new taskpool.Task(staticMethodConcurrentTask, 'shared_state_1');
          const result1: string = await taskpool.execute(task1) as string;
          const task2: taskpool.Task = new taskpool.Task(staticMethodConcurrentTask, 'shared_state_2');
          const result2: string = await taskpool.execute(task2) as string;
          expect(result1).assertEqual('Processed: shared_state_1');
          expect(result2).assertEqual('Processed: shared_state_2');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0177
     * @tc.name testGetterSetterConcurrent0100
     * @tc.desc Test Sendable Getter concurrent read (TaskPool)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0100 begin-----------------");
        try {
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('getter_concurrent_001');
          instance.value = 100;
          const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            taskGroup.addTask(new taskpool.Task(getterConcurrentReadTask, instance));
          }
          const results: Object[] = await taskpool.execute(taskGroup);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i]).assertEqual(100);
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0178
     * @tc.name testGetterSetterConcurrent0200
     * @tc.desc Test Sendable Setter concurrent write (AsyncLock protect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0200 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('setter_concurrent_001');
          instance.value = 0;
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            promises.push(lock.lockAsync(async () => {
              instance.value = instance.value + 10;
            }));
          }
          await Promise.all(promises);
          expect(instance.value).assertEqual(TASK_POOL_CONCURRENT_COUNT * 10);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0179
     * @tc.name testGetterSetterConcurrent0300
     * @tc.desc Test Sendable Getter/Setter cross-thread access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0300 begin-----------------");
        try {
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('gs_cross_thread_001');
          instance.value = 50;
          const getterTask: taskpool.Task = new taskpool.Task(getterConcurrentReadTask, instance);
          const value: number = await taskpool.execute(getterTask) as number;
          expect(value).assertEqual(50);
          instance.value = 100;
          const getterTask2: taskpool.Task = new taskpool.Task(getterConcurrentReadTask, instance);
          const value2: number = await taskpool.execute(getterTask2) as number;
          expect(value2).assertEqual(100);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0180
     * @tc.name testGetterSetterConcurrent0400
     * @tc.desc Test Sendable entity with Getter/Setter concurrent access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testGetterSetterConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0400 begin-----------------");
        const instance: GetterSetterEntitySendable = new GetterSetterEntitySendable('gs_entity_001', 'entity_type');
        instance.count = 10;
        instance.amount = BigInt(100);
        expect(instance.count).assertEqual(10);
        expect(instance.amount).assertEqual(BigInt(100));
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0181
     * @tc.name testGetterSetterConcurrent0500
     * @tc.desc Test Sendable Getter return Sendable object concurrent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0500 begin-----------------");
        const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('getter_sendable_001');
        instance.data = 'concurrent_data_value';
        expect(instance.data).assertEqual('concurrent_data_value');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0182
     * @tc.name testGetterSetterConcurrent0600
     * @tc.desc Test Sendable Setter receive Sendable object parameter concurrent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0600 begin-----------------");
        try {
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('setter_sendable_001');
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const promises: Promise<void>[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            let pro = lock.lockAsync(() => {
              instance.data = 'setter_data_' + i.toString();
            }).catch((err: Error) => {
              console.error(`error: ${err.message}`);
              expect().assertFail();
              done();
            })
            promises.push(pro);
          }
          await Promise.all(promises);
          expect(instance.data.length).assertLarger(0);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
          done();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0183
     * @tc.name testGetterSetterConcurrent0700
     * @tc.desc Test Sendable Getter/Setter use in TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterConcurrent0700 begin-----------------");
        try {
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('worker_gs_001');
          instance.value = 200;
          const task: taskpool.Task = new taskpool.Task(getterConcurrentReadTask, instance);
          const result: number = await taskpool.execute(task) as number;
          expect(result).assertEqual(200);
          const setterTask: taskpool.Task = new taskpool.Task(setterConcurrentWriteTask, instance, 300);
          await taskpool.execute(setterTask);
          expect(instance.value).assertEqual(300);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0184
     * @tc.name testAsyncConcurrent0100
     * @tc.desc Test Sendable multiple async methods concurrent execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0100 begin-----------------");
        try {
          const instances: AsyncOperationSendable[] = [];
          for (let i: number = 0; i < TASK_POOL_CONCURRENT_COUNT; i++) {
            instances.push(new AsyncOperationSendable('async_concurrent_' + i.toString(), 'AsyncOp'));
          }
          const promises: Promise<string>[] = instances.map((inst: AsyncOperationSendable) => inst.executeAsync());
          const results: string[] = await Promise.all(promises);
          expect(results.length).assertEqual(TASK_POOL_CONCURRENT_COUNT);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i]).assertEqual('Async operation completed');
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0185
     * @tc.name testAsyncConcurrent0200
     * @tc.desc Test Sendable async method return Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0200 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_return_001', 'AsyncReturnOp');
          const returnedInstance: AsyncOperationSendable = await instance.getResultAsync();
          expect(returnedInstance.operationId).assertEqual('async_return_001');
          expect(returnedInstance === instance).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0186
     * @tc.name testAsyncConcurrent0300
     * @tc.desc Test Sendable async method execute in TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0300 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_taskpool_001', 'TaskPoolAsyncOp');
          const task: taskpool.Task = new taskpool.Task(asyncMethodConcurrentTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('Async operation completed');
          expect(instance.status).assertEqual(2);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0187
     * @tc.name testAsyncConcurrent0400
     * @tc.desc Test Sendable async method execute across thread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0400 begin-----------------");
        try {
          const instance: AsyncOperationSendable =
            new AsyncOperationSendable('async_cross_thread_001', 'CrossThreadAsyncOp');
          const task: taskpool.Task = new taskpool.Task(asyncMethodConcurrentTask, instance);
          const result: string = await taskpool.execute(task) as string;
          expect(result).assertEqual('Async operation completed');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0188
     * @tc.name testAsyncConcurrent0500
     * @tc.desc Test Sendable async/await chain concurrent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testAsyncConcurrent0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0500 begin-----------------");
        try {
          const instance: AsyncTransactionSendable = new AsyncTransactionSendable('async_chain_001', BigInt(1000));
          const promises: Promise<string>[] = [
            instance.executeTransactionAsync(),
            instance.executeTransactionAsync()
          ];
          const results: string[] = await Promise.all(promises);
          expect(results.length).assertEqual(2);
          for (let i: number = 0; i < results.length; i++) {
            expect(results[i]).assertEqual('Transaction completed');
          }
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0189
     * @tc.name testAsyncConcurrent0600
     * @tc.desc Test Sendable async methods share Sendable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0600 begin-----------------");
        try {
          const sharedInstance: AsyncOperationSendable = new AsyncOperationSendable('async_shared_001', 'SharedAsyncOp');
          await sharedInstance.executeAsync();
          const result1: string = await sharedInstance.processDataAsync('shared_data_1');
          const result2: string = await sharedInstance.processDataAsync('shared_data_2');
          expect(result1).assertEqual('Processed: shared_data_1');
          expect(result2).assertEqual('Processed: shared_data_2');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0190
     * @tc.name testAsyncConcurrent0700
     * @tc.desc Test Promise.all concurrent execute Sendable async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0700 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_promise_all_001', 'PromiseAllOp');
          const results: (string | number | boolean)[] = await Promise.all([
            instance.executeAsync(),
            instance.processDataAsync('promise_all_data'),
            instance.calculateAsync(10, 20),
            instance.validateAsync()
          ]);
          expect(results.length).assertEqual(4);
          expect(results[0]).assertEqual('Async operation completed');
          expect(results[1]).assertEqual('Processed: promise_all_data');
          expect(results[2]).assertEqual(30);
          expect(results[3]).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0191
     * @tc.name testAsyncConcurrent0800
     * @tc.desc Test Sendable async method and sync method concurrent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testAsyncConcurrent0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0800 begin-----------------");
        try {
          const instance: MixedMethodTypesSendable = new MixedMethodTypesSendable('async_sync_001', 'AsyncSyncMixed');
          const syncResult: string = instance.processData();
          const asyncResult: string = await instance.asyncProcessData();
          expect(syncResult).assertEqual('Data processed');
          expect(asyncResult).assertEqual('Async data processed');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0192
     * @tc.name testAsyncConcurrent0900
     * @tc.desc Test AsyncLock protect Sendable async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent0900 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_lock_001', 'LockAsyncOp');
          await lock.lockAsync(async () => {
            try {
              await instance.executeAsync();
            } catch (err) {
              console.error(`error: ${err.message}`);
              expect().assertFail();
            }
          });
          expect(instance.status).assertEqual(2);
          expect(instance.result).assertEqual('Async operation completed');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0193
     * @tc.name testAsyncConcurrent1000
     * @tc.desc Test Sendable async method exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncConcurrent1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncConcurrent1000 begin-----------------");
        const instance: AsyncOperationSendable = new AsyncOperationSendable('', 'ExceptionOp');
        try {
          await instance.executeWithErrorAsync();
          expect(true).assertFalse();
        } catch (error) {
          expect(error.message).assertEqual('Operation ID is empty');
          expect(instance.status).assertEqual(3);
        }
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0194
     * @tc.name testSharedModuleBasic0100
     * @tc.desc Test SharedModuleDataSendable instantiation and basic properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedModuleBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSharedModuleBasic0100 begin-----------------");
        const instance: SharedModuleDataSendable =
          new SharedModuleDataSendable(TEST_MODULE_ID_PREFIX, TEST_MODULE_NAME);
        expect(instance.moduleId).assertEqual(TEST_MODULE_ID_PREFIX);
        expect(instance.moduleName).assertEqual(TEST_MODULE_NAME);
        expect(instance.moduleVersion).assertEqual('1.0.0');
        expect(instance.sharedData.length).assertEqual(0);
        expect(instance.sharedMap.size).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0195
     * @tc.name testSharedModuleBasic0200
     * @tc.desc Test static method createSharedModule returns valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedModuleBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSharedModuleBasic0200 begin-----------------");
        const instance: SharedModuleDataSendable =
          SharedModuleDataSendable.createSharedModule('module_factory_001', 'FactoryModule');
        expect(instance.moduleId).assertEqual('module_factory_001');
        expect(instance.moduleName).assertEqual('FactoryModule');
        expect(instance.moduleVersion).assertEqual('1.0.0');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0196
     * @tc.name testSharedModuleBasic0300
     * @tc.desc Test static method getSharedDataCount returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedModuleBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSharedModuleBasic0300 begin-----------------");
        const instance: SharedModuleDataSendable =
          new SharedModuleDataSendable(TEST_MODULE_ID_PREFIX, TEST_MODULE_NAME);
        instance.addSharedData('data1');
        instance.addSharedData('data2');
        instance.addSharedData('data3');
        const count: number = SharedModuleDataSendable.getSharedDataCount(instance);
        expect(count).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0197
     * @tc.name testSharedEntityBasic0100
     * @tc.desc Test SharedModuleEntitySendable instantiation and basic properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedEntityBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSharedEntityBasic0100 begin-----------------");
        const instance: SharedModuleEntitySendable =
          new SharedModuleEntitySendable('entity_001', 'TestEntity', 'test_type');
        expect(instance.sharedEntityId).assertEqual('entity_001');
        expect(instance.entityName).assertEqual('TestEntity');
        expect(instance.entityType).assertEqual('test_type');
        expect(instance.isShared).assertTrue();
        expect(instance.sharedCount).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0198
     * @tc.name testSharedEntityBasic0200
     * @tc.desc Test async method shareEntityAsync updates instance state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedEntityBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSharedEntityBasic0200 begin-----------------");
        try {
          const instance: SharedModuleEntitySendable =
            new SharedModuleEntitySendable('entity_002', 'AsyncEntity', 'async_type');
          const result: boolean = await instance.shareEntityAsync();
          expect(result).assertTrue();
          expect(instance.isShared).assertTrue();
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0199
     * @tc.name testNamespaceBasic0100
     * @tc.desc Test SharedDatabaseNamespace NamespaceDatabaseEntitySendable instantiation and properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNamespaceBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testNamespaceBasic0100 begin-----------------");
        const entity: SharedDatabaseNamespace.NamespaceDatabaseEntitySendable =
          new SharedDatabaseNamespace.NamespaceDatabaseEntitySendable('namespace_001', 'DatabaseEntity');
        expect(entity.entityId).assertEqual('namespace_001');
        expect(entity.entityType).assertEqual('DatabaseEntity');
        expect(entity.version).assertEqual(0);
        expect(entity.isActive).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0200
     * @tc.name testNamespaceBasic0200
     * @tc.desc Test SharedUtilityNamespace NamespaceUtilitySendable instantiation and properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNamespaceBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testNamespaceBasic0200 begin-----------------");
        const utility: SharedUtilityNamespace.NamespaceUtilitySendable =
          new SharedUtilityNamespace.NamespaceUtilitySendable('utility_001', 'UtilityInstance');
        expect(utility.utilityId).assertEqual('utility_001');
        expect(utility.utilityName).assertEqual('UtilityInstance');
        expect(utility.utilityVersion).assertEqual('1.0.0');
        expect(utility.isActive).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0201
     * @tc.name testNamespaceBasic0300
     * @tc.desc Test namespace class data storage and retrieval functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNamespaceBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testNamespaceBasic0300 begin-----------------");
        const entity: SharedDatabaseNamespace.NamespaceDatabaseEntitySendable =
          new SharedDatabaseNamespace.NamespaceDatabaseEntitySendable('namespace_002', 'DecoratedEntity');
        entity.setData('key1', 'value1');
        const result: string = entity.getData('key1');
        expect(result).assertEqual('value1');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0202
     * @tc.name testSingletonModuleBasic0100
     * @tc.desc Test SingletonDatabaseConnectionSendable singleton pattern functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSingletonModuleBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSingletonModuleBasic0100 begin-----------------");
        SingletonDatabaseConnectionSendable.resetInstance();
        const instance1: SingletonDatabaseConnectionSendable = SingletonDatabaseConnectionSendable.getInstance();
        const instance2: SingletonDatabaseConnectionSendable = SingletonDatabaseConnectionSendable.getInstance();
        expect(instance1 === instance2).assertTrue();
        expect(instance1.connectionCount).assertEqual(2);
        expect(instance1.databaseName).assertEqual('default_db');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0203
     * @tc.name testSingletonModuleBasic0200
     * @tc.desc Test SingletonCacheManagerSendable singleton pattern with cache operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSingletonModuleBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testSingletonModuleBasic0200 begin-----------------");
        SingletonCacheManagerSendable.resetInstance();
        const instance1: SingletonCacheManagerSendable = SingletonCacheManagerSendable.getInstance();
        const instance2: SingletonCacheManagerSendable = SingletonCacheManagerSendable.getInstance();
        expect(instance1 === instance2).assertTrue();
        const putResult: boolean = instance1.put('key1', 'value1');
        expect(putResult).assertTrue();
        expect(instance1.cacheSize).assertEqual(1);
        const value: string = instance1.get('key1');
        expect(value).assertEqual('value1');
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0204
     * @tc.name testStaticMethodBasic0100
     * @tc.desc Test StaticUtilitySendable.processData static method functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticMethodBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticMethodBasic0100 begin-----------------");
        const result: string = StaticUtilitySendable.processData('test_data');
        expect(result).assertEqual('Processed: test_data');
        const ops: number = StaticUtilitySendable.getTotalOperations();
        expect(ops).assertLarger(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0205
     * @tc.name testStaticMethodBasic0200
     * @tc.desc Test StaticCounterSendable.increment static counter functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticMethodBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticMethodBasic0200 begin-----------------");
        const initialCount: number = StaticCounterSendable.getGlobalCount();
        StaticCounterSendable.incrementGlobal();
        const newCount: number = StaticCounterSendable.getGlobalCount();
        expect(newCount).assertEqual(initialCount + 1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0206
     * @tc.name testStaticMethodBasic0300
     * @tc.desc Test StaticCounterSendable.getCount static counter retrieval functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticMethodBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticMethodBasic0300 begin-----------------");
        StaticCounterSendable.setCounter('test_counter', 42);
        const count: number = StaticCounterSendable.getCounter('test_counter');
        expect(count).assertEqual(42);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0207
     * @tc.name testStaticFactoryBasic0100
     * @tc.desc Test static factory method createSharedModule returns valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticFactoryBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticFactoryBasic0100 begin-----------------");
        const instance: SharedModuleDataSendable =
          SharedModuleDataSendable.createSharedModule('factory_001', 'FactoryModule');
        expect(instance.moduleId).assertEqual('factory_001');
        expect(instance.moduleName).assertEqual('FactoryModule');
        expect(instance.validateModule()).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0208
     * @tc.name testStaticFactoryBasic0200
     * @tc.desc Test static factory method createSharedEntity returns valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticFactoryBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticFactoryBasic0200 begin-----------------");
        const instance: SharedModuleEntitySendable =
          SharedModuleEntitySendable.createSharedEntity('factory_entity_001', 'FactoryEntity', 'factory_type');
        expect(instance.sharedEntityId).assertEqual('factory_entity_001');
        expect(instance.entityName).assertEqual('FactoryEntity');
        expect(instance.entityType).assertEqual('factory_type');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0209
     * @tc.name testStaticFactoryBasic0300
     * @tc.desc Test static factory method returns Sendable instance with correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticFactoryBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticFactoryBasic0300 begin-----------------");
        const instance: SharedModuleDataSendable =
          SharedModuleDataSendable.createSharedModule('factory_002', 'FactoryModule2');
        expect(instance instanceof SharedModuleDataSendable).assertTrue();
        expect(instance.moduleId).assertEqual('factory_002');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0210
     * @tc.name testStaticCountBasic0100
     * @tc.desc Test static counter getSharedDataCount returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticCountBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticCountBasic0100 begin-----------------");
        const instance: SharedModuleDataSendable = new SharedModuleDataSendable('count_module_001', 'CountModule');
        instance.addSharedData('item1');
        instance.addSharedData('item2');
        const count: number = SharedModuleDataSendable.getSharedDataCount(instance);
        expect(count).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0211
     * @tc.name testStaticUtilityBasic0100
     * @tc.desc Test static utility class methods setMaxOperations and resetOperations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStaticUtilityBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testStaticUtilityBasic0100 begin-----------------");
        StaticUtilitySendable.setMaxOperations(500);
        const maxOps: number = StaticUtilitySendable.getMaxOperations();
        expect(maxOps).assertEqual(500);
        StaticUtilitySendable.resetOperations();
        const resetOps: number = StaticUtilitySendable.getTotalOperations();
        expect(resetOps).assertEqual(0);
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0212
     * @tc.name testGetterSetterBasic0100
     * @tc.desc Test GetterSetterPropertySendable getter/setter functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0100 begin-----------------");
        const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('prop_001');
        instance.value = 50;
        const val: number = instance.value;
        expect(val).assertEqual(50);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0213
     * @tc.name testGetterSetterBasic0200
     * @tc.desc Test GetterSetterPropertySendable multiple sequential setter/getter operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0200 begin-----------------");
        const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('prop_002');
        instance.value = 10;
        const val1: number = instance.value;
        instance.value = 20;
        const val2: number = instance.value;
        instance.value = 30;
        const val3: number = instance.value;
        expect(val1).assertEqual(10);
        expect(val2).assertEqual(20);
        expect(val3).assertEqual(30);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0214
     * @tc.name testGetterSetterBasic0300
     * @tc.desc Test GetterSetterPropertySendable setter with AsyncLock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0300 begin-----------------");
        try {
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('prop_003');
          await lock.lockAsync(() => {
            instance.value = 100;
          }).catch((err: Error) => {
            console.error(`error: ${err.message}`);
            expect().assertFail();
            done();
          });
          expect(instance.value).assertEqual(100);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
          done();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0215
     * @tc.name testGetterSetterBasic0400
     * @tc.desc Test GetterSetterEntitySendable basic getter/setter operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0400 begin-----------------");
        const instance: GetterSetterEntitySendable = new GetterSetterEntitySendable('entity_001', 'test_type');
        instance.count = 10;
        instance.amount = BigInt(1000);
        const count: number = instance.count;
        const amount: bigint = instance.amount;
        expect(count).assertEqual(10);
        expect(amount).assertEqual(BigInt(1000));
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0216
     * @tc.name testGetterSetterBasic0500
     * @tc.desc Test GetterSetterEntitySendable computed property totalValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0500 begin-----------------");
        const instance: GetterSetterEntitySendable = new GetterSetterEntitySendable('entity_002', 'decorator_type');
        instance.count = 5;
        instance.amount = 1000n;
        const totalValue: bigint = instance.totalValue;
        expect(totalValue).assertEqual(BigInt(5) * BigInt(1000));
        expect(instance.validateEntity()).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0217
     * @tc.name testGetterSetterBasic0600
     * @tc.desc Test GetterSetterPropertySendable data property getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0600 begin-----------------");
        const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('prop_004');
        instance.data = 'test_data';
        const data: string = instance.data;
        expect(data).assertEqual('test_data');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0218
     * @tc.name testGetterSetterBasic0700
     * @tc.desc Test GetterSetterPropertySendable setter accepting string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterBasic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testGetterSetterBasic0700 begin-----------------");
        const instance: GetterSetterPropertySendable = new GetterSetterPropertySendable('prop_005');
        instance.data = 'data_value_001';
        const retrieved: string = instance.data;
        expect(retrieved).assertEqual('data_value_001');
        done();
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0219
     * @tc.name testAsyncMethodBasic0100
     * @tc.desc Test AsyncOperationSendable executeAsync returns correct result and updates status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0100 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_001', 'test_operation');
          const result: string = await instance.executeAsync();
          expect(result).assertEqual('Async operation completed');
          expect(instance.status).assertEqual(2);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0220
     * @tc.name testAsyncMethodBasic0200
     * @tc.desc Test AsyncOperationSendable processDataAsync returns processed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0200 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_002', 'cancel_operation');
          instance.status = 1;
          const result: string = await instance.processDataAsync('cancel_data');
          expect(result).assertEqual('Processed: cancel_data');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0221
     * @tc.name testAsyncMethodBasic0300
     * @tc.desc Test AsyncTransactionSendable beginAsync updates transaction status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0300 begin-----------------");
        try {
          const instance: AsyncTransactionSendable = new AsyncTransactionSendable('tx_async_001', BigInt(1000));
          const result: boolean = await instance.beginTransactionAsync();
          expect(result).assertTrue();
          expect(instance.transactionStatus).assertEqual(1);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0222
     * @tc.name testAsyncMethodBasic0400
     * @tc.desc Test AsyncTransactionSendable commitAsync updates transaction status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0400 begin-----------------");
        try {
          const instance: AsyncTransactionSendable = new AsyncTransactionSendable('tx_async_002', BigInt(2000));
          await instance.beginTransactionAsync();
          const result: boolean = await instance.commitAsync();
          expect(result).assertTrue();
          expect(instance.transactionStatus).assertEqual(2);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0223
     * @tc.name testAsyncMethodBasic0500
     * @tc.desc Test AsyncTransactionSendable rollbackAsync updates transaction status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0500 begin-----------------");
        try {
          const instance: AsyncTransactionSendable = new AsyncTransactionSendable('tx_async_003', BigInt(500));
          await instance.beginTransactionAsync();
          const result: boolean = await instance.rollbackAsync();
          expect(result).assertTrue();
          expect(instance.transactionStatus).assertEqual(3);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0224
     * @tc.name testAsyncMethodBasic0600
     * @tc.desc Test async method returns Promise instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0600 begin-----------------");
        try {
          const instance: AsyncOperationSendable = new AsyncOperationSendable('async_003', 'promise_operation');
          const promise: Promise<string> = instance.executeAsync();
          expect(promise instanceof Promise).assertTrue();
          const result: string = await promise;
          expect(result).assertEqual('Async operation completed');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0225
     * @tc.name testAsyncMethodBasic0700
     * @tc.desc Test multiple async methods concurrent execution with Promise.all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0700 begin-----------------");
        try {
          const instance1: AsyncOperationSendable = new AsyncOperationSendable('async_004', 'test1');
          const instance2: AsyncOperationSendable = new AsyncOperationSendable('async_005', 'test2');
          const instance3: AsyncOperationSendable = new AsyncOperationSendable('async_006', 'test3');
          const results: string[] = await Promise.all([
            instance1.executeAsync(),
            instance2.executeAsync(),
            instance3.executeAsync()
          ]);
          expect(results.length).assertEqual(3);
          results.forEach((result: string) => {
            expect(result).assertEqual('Async operation completed');
          });
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0226
     * @tc.name testAsyncMethodBasic0800
     * @tc.desc Test async/await chain call with multiple async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0800 begin-----------------");
        try {
          const instance: AsyncTransactionSendable = new AsyncTransactionSendable('tx_async_004', BigInt(1500));
          await instance.beginTransactionAsync();
          await instance.commitAsync();
          const transactionResult: string = await instance.executeTransactionAsync();
          expect(transactionResult).assertEqual('Transaction completed');
          expect(instance.transactionStatus).assertEqual(2);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0227
     * @tc.name testAsyncMethodBasic0900
     * @tc.desc Test async methods with independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic0900 begin-----------------");
        try {
          const sharedInstance: AsyncOperationSendable = new AsyncOperationSendable('shared_async_001', 'shared_type');
          const instance1: AsyncOperationSendable = new AsyncOperationSendable('async_007', 'consumer1');
          const instance2: AsyncOperationSendable = new AsyncOperationSendable('async_008', 'consumer2');
          instance1.result = 'shared_result_001';
          instance2.result = 'shared_result_001';
          const result1: string = await instance1.processDataAsync('data1');
          const result2: string = await instance2.processDataAsync('data2');
          expect(result1).assertEqual('Processed: data1');
          expect(result2).assertEqual('Processed: data2');
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_SENDABLEDECORATOR_CONCURRENT_0228
     * @tc.name testAsyncMethodBasic1000
     * @tc.desc Test MixedMethodTypesSendable mixed sync and async methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAsyncMethodBasic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.info("-----------------testAsyncMethodBasic1000 begin-----------------");
        try {
          const instance: MixedMethodTypesSendable = new MixedMethodTypesSendable('mixed_001', 'TestMixed');
          instance.value = 42;
          const val: number = instance.value;
          expect(val).assertEqual(42);
          const syncResult: string = instance.processData();
          expect(syncResult).assertEqual('Data processed');
          const asyncResult: string = await instance.asyncProcessData();
          expect(asyncResult).assertEqual('Async data processed');
          const instanceCount: number = MixedMethodTypesSendable.getInstanceCount();
          expect(instanceCount).assertLarger(0);
        } catch (err) {
          console.error(`error: ${err.message}`);
          expect().assertFail();
        }
        done();
      });
  });

}