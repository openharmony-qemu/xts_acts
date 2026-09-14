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

import { worker, MessageEvents, collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import { SendableClass } from '../utils/TestUtils';

@Concurrent
function workerForEachTask(set: collections.Set<number>): number {
  let count = 0;
  set.forEach((_value: number): void => {
    count++;
  });
  return count;
}

@Concurrent
function workerAddTask(set: collections.Set<number>, value: number): number {
  set.add(value);
  return set.size;
}

const workerPort = worker.workerPort;

class WorkerMessage {
  type: string = '';
  set?: Object;
  value?: number;
  size?: number;
  flag?: SharedArrayBuffer;
}


workerPort.onmessage = async (event: MessageEvents): Promise<void> => {
  let data = event.data as WorkerMessage;

  switch (data.type) {
    case 'size': {
      let set = data.set as collections.Set<number>;
      workerPort.postMessage({ result: set.size });
      break;
    }

    case 'forEach': {
      let set = data.set as collections.Set<number>;
      let count = 0;
      set.forEach((_value: number): void => {
        count++;
      });
      workerPort.postMessage({ result: count });
      break;
    }

    case 'forEachString': {
      let set = data.set as collections.Set<string>;
      let count = 0;
      set.forEach((_value: string): void => {
        count++;
      });
      workerPort.postMessage({ result: count });
      break;
    }

    case 'forEachSendable': {
      let set = data.set as Set<Object>;
      let count = 0;
      set.forEach((): void => {
        count++;
      });
      workerPort.postMessage({ result: count });
      break;
    }

    case 'add': {
      let set = data.set as collections.Set<number>;
      set.add(data.value as number);
      // 写完成信号，确保共享内存修改对主线程可见
      let flag = data.flag as SharedArrayBuffer;
      if (flag !== undefined) {
        let flagView = new Int32Array(flag);
        Atomics.store(flagView, 0, 1);
        Atomics.notify(flagView, 0, 1);
      }
      workerPort.postMessage({ result: set.size });
      break;
    }

    case 'delete': {
      let set = data.set as collections.Set<number>;
      let result = set.delete(data.value as number);
      // 写完成信号，确保共享内存修改对主线程可见
      let flag = data.flag as SharedArrayBuffer;
      if (flag !== undefined) {
        let flagView = new Int32Array(flag);
        Atomics.store(flagView, 0, 1);
        Atomics.notify(flagView, 0, 1);
      }
      workerPort.postMessage({ result: result });
      break;
    }

    case 'createSet': {
      let size = data.size as number;
      let set = new collections.Set<number>();
      for (let i = 0; i < size; i++) {
        set.add(i);
      }
      // 写完成信号，确保 Worker 创建的 Set 对主线程可见
      let flag = data.flag as SharedArrayBuffer;
      if (flag !== undefined) {
        let flagView = new Int32Array(flag);
        Atomics.store(flagView, 0, 1);
        Atomics.notify(flagView, 0, 1);
      }
      workerPort.postMessage({ set: set });
      break;
    }

    // TC_CONC_SET_WORKER_005: Worker 创建 SendableClass Set 返回主线程
    case 'createSendableSet': {
      let size = data.size as number;
      let set = new collections.Set<SendableClass>();
      for (let i = 0; i < size; i++) {
        set.add(new SendableClass(i));
      }
      let flag = data.flag as SharedArrayBuffer;
      if (flag !== undefined) {
        let flagView = new Int32Array(flag);
        Atomics.store(flagView, 0, 1);
        Atomics.notify(flagView, 0, 1);
      }
      workerPort.postMessage({ set: set });
      break;
    }

    // 接收嵌套 Set<Map<string, number>>
    case 'nestedSize': {
      let set = data.set as collections.Set<collections.Map<string, number>>;
      let count = 0;
      set.forEach((item: collections.Map<string, number>): void => {
        count++;
      });
      workerPort.postMessage({
        result: count
      });
      break;
    }

    //Worker + TaskPool 组合
    case 'taskPoolCombine': {
      let set = data.set as collections.Set<number>;
      let task = new taskpool.Task(workerForEachTask, set);
      let result: Object = [];
      try {
        result = await taskpool.execute(task);
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }
      workerPort.postMessage({
        result: result
      });
      break;
    }

    default: {
      workerPort.postMessage({
        result: -1
      });
      break;
    }

    case 'taskPoolNotify': {
      let set = data.set as collections.Set<number>;
      let newValue = data.value as number;

      // 在 Worker 中通过 TaskPool 执行添加操作
      let task = new taskpool.Task(workerAddTask, set, newValue);
      let result: Object = [];
      try {
        result = await taskpool.execute(task);
      } catch (err) {
        console.error(`result await taskpool.execute failed: ${JSON.stringify(err)}`);
      }

      // 写完成信号，确保 TaskPool 修改对主线程可见
      let flag = data.flag as SharedArrayBuffer;
      if (flag !== undefined) {
        let flagView = new Int32Array(flag);
        Atomics.store(flagView, 0, 1);
        Atomics.notify(flagView, 0, 1);
      }

      workerPort.postMessage({
        result: result
      });
      break;
    }

    case 'largeKeys': {
      let set = data.set as collections.Set<number>;
      let count = 0;
      let iterator = set.keys();
      while (true) {
        let result = iterator.next();
        if (result.done) {
          break;
        }
        count++;
      }
      workerPort.postMessage({
        result: count
      });
      break;
    }

    case 'valuesAddError': {
      let set = data.set as collections.Set<number>;
      let code = 0;
      try {
        set.forEach((_value: number): void => {
          set.add(999);
        });
      } catch (e) {
        code = e.code;
      }
      workerPort.postMessage({
        result: code
      });
      break;
    }

    case 'keysDeleteError': {
      let set = data.set as collections.Set<number>;
      let code = 0;
      try {
        set.forEach((value: number): void => {
          set.delete(value);
        });
      } catch (e) {
        code = e.code;
      }
      workerPort.postMessage({
        result: code
      });
      break;
    }

    case 'errorRecoverSize': {
      let set = data.set as collections.Set<number>;
      let sizeBefore = set.size;
      let errorCode = 0;

      try {
        set.forEach((_value: number): void => {
          set.clear(); // 触发错误
        });
      } catch (e) {
        errorCode = e.code;
      }

      // 错误发生后，检查 size 是否正确
      let sizeAfter = set.size;

      workerPort.postMessage({
        errorCode: errorCode,
        sizeBefore: sizeBefore,
        sizeAfter: sizeAfter
      });
      break;
    }

    case 'errorRecoverTraverse': {
      let set = data.set as collections.Set<number>;
      let errorCode = 0;

      // 触发错误
      try {
        set.forEach((_value: number): void => {
          set.clear();
        });
      } catch (e) {
        errorCode = e.code;
      }

      // 错误发生后，重新遍历验证数据完整性
      let traverseCount = 0;
      let sum = 0;
      set.forEach((value: number): void => {
        traverseCount++;
        sum += value;
      });

      workerPort.postMessage({
        errorCode: errorCode,
        traverseCount: traverseCount,
        sum: sum
      });
      break;
    }

  }
};