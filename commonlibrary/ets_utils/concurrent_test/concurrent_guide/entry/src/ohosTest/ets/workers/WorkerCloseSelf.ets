/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  let data: string = e.data as string
  if (data === 'close') {
    workerPort.postMessage('closing')
    workerPort.close()
  } else {
    workerPort.postMessage('echo: ' + data)
  }
}
