/**
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
import { ArkTSUtils } from '@kit.ArkTS';
import { GCFull } from './GCFull';

export function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}
@Concurrent
export async function threadWait(conditionVariable: ArkTSUtils.locks.ConditionVariable): Promise<boolean> {
  let result = false;
  console.log(`TaskPool Thread Wait: Waiting...`);
  await conditionVariable.wait().then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
    result = true;
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return result;
}

@Concurrent
export async function threadWaitFor(conditionVariable: ArkTSUtils.locks.ConditionVariable, waitTime?: number): Promise<boolean> {
  let result = false;
  console.log(`TaskPool Thread Wait: Waiting...`);
  await conditionVariable.waitFor(waitTime != undefined ? waitTime : 1000).then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
    result = true;
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return result;
}


@Concurrent
export function threadWaitNotAwait(conditionVariable: ArkTSUtils.locks.ConditionVariable): boolean {
  console.log(`TaskPool Thread Wait: Waiting...`);
  conditionVariable.wait().then(() => {
    console.log(`TaskPool Thread Wait: Then continue...`);
  });
  console.log(`TaskPool Thread Wait: Notified and continuing...`);
  return true;
}

@Concurrent
export function threadNotify(conditionVariable: ArkTSUtils.locks.ConditionVariable) {
  console.log(`TaskPool Thread Notify: start...`);
  conditionVariable.notifyAll();
  console.log(`TaskPool Thread Notify: Notifying one thread...`);
}

@Concurrent
export async function threadGC(conditionVariable: ArkTSUtils.locks.ConditionVariable): Promise<boolean> {
  let result = false;
  {
    console.log(`threadGC Thread Wait: Waiting...`);
    conditionVariable.wait().then(() => {
      console.log(`threadGC Thread Wait: Then continue...`);
      result = true;
    });
    conditionVariable.notifyAll();
  }
  GCFull();
  await new Promise<number>(resolve => setTimeout(resolve, 3000));
  return result;
}

@Concurrent
export function threadNotifyOne(conditionVariable: ArkTSUtils.locks.ConditionVariable) {
  console.log(`TaskPool Thread Notify: start...`);
  conditionVariable.notifyAll();
  console.log(`TaskPool Thread Notify: Notifying one thread...`);
}
