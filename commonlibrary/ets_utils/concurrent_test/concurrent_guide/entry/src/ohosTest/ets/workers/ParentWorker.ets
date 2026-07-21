/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  let data: string = e.data as string
  if (data === 'create_child') {
    let childWorker: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/ChildWorker.ets')
    childWorker.onmessage = (childEvent: MessageEvents): void => {
      workerPort.postMessage('child_msg:' + (childEvent.data as string))
    }
    childWorker.onexit = (code: number): void => {
      workerPort.postMessage('child_terminated')
    }
    workerPort.postMessage('child_created')
  } else if (data.startsWith('send_to_child:')) {
    let payload: string = data.substring(14)
    let childWorker: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/ChildWorker.ets')
    childWorker.onmessage = (childEvent: MessageEvents): void => {
      workerPort.postMessage('final_result:' + (childEvent.data as string))
    }
    childWorker.postMessage(payload)
  } else if (data === 'terminate_child') {
    workerPort.postMessage('child_terminated')
  } else if (data === 'close_self') {
    workerPort.close()
  } else {
    workerPort.postMessage('echo: ' + data)
  }
}
