/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import taskpool from '@ohos.taskpool';

export function check<T>(testName: string, p: Promise<T>): Promise<string> {
  hilog.info(0x0000, testName, 'starting check for test');
  return p.then(
    () => {
      hilog.info(0x0000, testName, 'passed check for test');
      return "PASSED";
    }, (e: Error) => {
    hilog.info(0x0000, testName, 'Test failed: ' + "\nError message: " + e.message + "\nStack: \n" + e.stack);
    return "FAILED: " + "\nError message: " + e.message + "\nStack: \n" + e.stack;
  })
}

export function check_negative<T>(testName: string, p: Promise<T>): Promise<string> {
  hilog.info(0x0000, testName, 'starting negative check for test');
  return p.then(
    () => {
      hilog.info(0x0000, testName, 'Test failed: ' + "Expected Error was not caught");
      return "FAILED: " + "Expected Error was not caught"
    }, (e: Error) => {
    hilog.info(0x0000, testName, "\nExpected Error message: " + e.message + "\nStack: \n" + e.stack);
    return "PASSED";
  })
}

export function compareBuffers(source: SharedArrayBuffer, target: SharedArrayBuffer): boolean {
  if(source.byteLength != target.byteLength) return false;

  let srcView = new DataView(source, 0, source.byteLength);
  let trgView = new DataView(target, 0, target.byteLength);

  for(let i = 0; i< srcView.byteLength; i++) {
    if(srcView.getInt8(i) == trgView.getInt8(i)) continue;
    return false;
  }

  return true;
}

export async function skipConditional(reasonToSkip: string, requiredToSkip: boolean, runIfNotSkip: () => Object): Promise<Object> {
  // NOTE requiredToSkip allows simple reliable way to toggle skip on and off when experimenting and debugging
  if(requiredToSkip) {
    hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', "skip test case: " + reasonToSkip);
    return "PASSED";
  }
  return runIfNotSkip();
}

// Keep migrated taskpool helpers in the original suite-wide utility module.
// Reuse the existing Utils.sleep implementation rather than adding a second one.
export function sleep(time: number): Promise<void> {
  return Utils.sleep(time)
}

// Cancel leftover tasks from preceding suites before running priority/config tests.
export async function drainTaskPool(): Promise<void> {
  let drainedRounds: number = 0
  while (drainedRounds < 10) {
    let leftover: number = 0
    const infos: taskpool.TaskInfo[] = taskpool.getTaskPoolInfo().taskInfos
    for (let i = 0; i < infos.length; i++) {
      leftover++
      try {
        taskpool.cancel(infos[i].taskId)
      } catch (e) {
        // Tasks can finish between collection and cancellation.
      }
    }
    if (leftover === 0) {
      break
    }
    await sleep(1000)
    drainedRounds++
  }
}

// Run the full GC in a worker to avoid blocking the host thread.
declare class ArkTools {
  static forceFullGC(): void;
}

@Concurrent
function utilsForceFullGcInBackground(): void {
  ArkTools.forceFullGC();
}

export async function cooperativeGc(): Promise<void> {
  try {
    const gcTask: taskpool.Task = new taskpool.Task(utilsForceFullGcInBackground)
    await taskpool.execute(gcTask)
  } catch (e) {
    // A GC task failure must not prevent the next suite from running.
  }
}

const FILL_CHUNK: number = 256 * 1024

// Yield between chunks when building large arrays to avoid host-thread stalls.
export async function fillBigArrayChunked(size: number, chunk?: number): Promise<number[]> {
  let arr: number[] = new Array<number>(size)
  let step: number = (chunk === undefined || chunk <= 0) ? FILL_CHUNK : chunk
  let i: number = 0
  while (i < size) {
    let end: number = (i + step < size) ? (i + step) : size
    for (; i < end; i++) {
      arr[i] = i
    }
    if (i < size) {
      await sleep(0)
    }
  }
  return arr
}

// Imported @Concurrent helper used by nested-execute taskpool tests.
@Concurrent
export function nestedSubFunc(n: number): number {
  return n * 2
}

export default class Utils {
  static sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: Function) => setTimeout(resolve, ms))
  }

  static syncSleep(ms: number): void {
    const start: number = Date.now()
    while (Date.now() - start < ms) {
      // busy-wait for synchronous delay
    }
  }
}
