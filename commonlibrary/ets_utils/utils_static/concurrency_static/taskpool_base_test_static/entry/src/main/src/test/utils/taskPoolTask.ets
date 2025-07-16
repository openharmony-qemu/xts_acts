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

import  HashMap  from '@ohos.util.HashMap';

async function testFailed(args: int): Promise<HashMap<String, int>> {
  await new Promise<int>(resolve => {
    setTimeout(() => {
      resolve(1)
    }, 100)
  });
  throw new Error('This is a deliberate failure for testing purposes');
  let hashMap1: HashMap<String, Int> = new HashMap<String, Int>();
  hashMap1.set('a', args);
  return hashMap1;
}

const periodicTask = (interval: int, count: int): Promise<int> => {
  let executions = 0;
  return new Promise<int>((resolve: (val: int) => void) => {
    let intervalId: number; // 先声明变量
    intervalId = setInterval(() => {
      executions++;
      console.info(`Periodic task execution ${executions}`);
      if (executions >= count) {
        clearInterval(intervalId);
        resolve(1);
      }
    }, interval);
  });
}

function inspectStatus(arg: Number): Number {
  if (taskpool.Task.isCanceled()) {
    return arg + 2;
  }
  return arg + 1;
}

function additionDelay(delay: int): void {
  let start: int = new Date().getTime() as int;
  while (new Date().getTime() - start < delay) {
    continue;
  }
}

function waitForRunner(finalString: string): string {
  return finalString;
}

function wait1s(args: Number): Number {
  let t: Number = Date.now();
  while (Date.now() - t < 1000) {
    continue;
  }
  console.info('wait1s: ' + args);
  return args;
}

export {
  testFailed,
  periodicTask,
  inspectStatus,
  additionDelay,
  waitForRunner,
  wait1s,
  }