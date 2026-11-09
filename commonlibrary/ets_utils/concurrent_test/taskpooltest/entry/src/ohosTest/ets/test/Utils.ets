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
import taskpool from '@ohos.taskpool';

// Shared bounded sleep helper added for migrated taskpool.rar suites (taskpool_1 接口思维导图) in this HAP.
export function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time)
  })
}

// Shared environment-restoration helper for migrated suites: cancel leftover
// pool tasks (e.g. uncancelled periodic tasks from preceding suites) so that
// IDLE-priority arbitration and pool-telemetry cases observe a genuinely idle
// pool. Discovery via getTaskPoolInfo + cancel(taskId), same device-proven
// pattern as TaskpoolCancelTaskIdTest; bounded 10s drain loop.
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
        // task may finish concurrently; next poll re-checks
      }
    }
    if (leftover === 0) {
      break
    }
    await sleep(1000)
    drainedRounds++
  }
}

// Cooperative single full-GC executed on a taskpool worker (not the main thread),
// mirroring the board-validated ActsTaskpoolAsyncrunnerTest v3 pattern
// (repair_20261019 adaf091ccf3 + 2ab0ea76283). Used at suite boundaries of the
// configs-family suites to flatten accumulated heap growth during long full runs
// (THREAD_BLOCK_6S main-thread stall family, see BUILD_RUN_EVIDENCE_20261020.md).
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
    // GC task failure must never break a suite boundary
  }
}

// Chunked big-array builder that keeps the host (main) thread responsive.
// Filling multi-megabyte number[] args (the oversized-params 10200006 family)
// in one synchronous loop blocked the main thread >6s and triggered the
// hildog THREAD_BLOCK_6S watchdog (appfreeze-20010627 solo2 2026-10-20:
// ExecuteTaskGroupConfigsTest4200 consuming 7667ms, stack
// ObjectFastOperator::SetPropertyByIndex). Yielding to the event loop every
// FILL_CHUNK elements bounds each synchronous segment well below the 6s
// watchdog threshold while producing the identical array content/size, so
// serialization-limit assertions (10200006) are unchanged.
const FILL_CHUNK: number = 256 * 1024

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

// Exported @Concurrent child shared by the nested-execute probes in
// ExecuteFuncTest / ExecuteTaskTest: imported symbols are the only
// cross-function references allowed inside @Concurrent function bodies
// (taskpool-introduction.md closure rule), so this helper lives in a
// separate module. Moved here from ExecuteFuncGenericTest.test.ets when
// that suite migrated to the Task test HAP (PR review 2026-10-22).
@Concurrent
export function nestedSubFunc(n: number): number {
  return n * 2
}
