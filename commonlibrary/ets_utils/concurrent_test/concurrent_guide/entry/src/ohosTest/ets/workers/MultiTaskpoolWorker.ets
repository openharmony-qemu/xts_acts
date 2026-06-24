/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

@Concurrent
function multiCompute(id: number): number {
  return id * 10
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === 'create_multiple') {
    let count: number = data['count'] as number
    let completed: number = 0
    for (let i: number = 0; i < count; i++) {
      let task: taskpool.Task = new taskpool.Task(multiCompute, i)
      taskpool.execute(task).then((result: Object) => {
        workerPort.postMessage({ type: 'result', id: i, value: result })
        completed++
        if (completed >= count) {
          workerPort.postMessage({ type: 'all_done', total: completed })
        }
      }).catch((err: Error) => {
        workerPort.postMessage({ type: 'task_error', id: i, message: err.message })
      })
    }
  } else {
    workerPort.postMessage({ type: 'unknown' })
  }
}
