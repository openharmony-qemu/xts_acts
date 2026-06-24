/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

@Sendable
class SharedData {
  public value: number = 0
  public name: string = ''
  public count: number = 0
}

workerPort.onmessage = (e: MessageEvents): void => {
  let data = e.data as Record<string, Object>
  let msgType: string = data['type'] as string
  if (msgType === 'sendable_test') {
    let val: number = data['value'] as number
    let nm: string = data['name'] as string
    workerPort.postMessage({ type: 'sendable_response', value: val, name: nm })
  } else if (msgType === 'modify_shared') {
    let newVal: number = data['newValue'] as number
    workerPort.postMessage({ type: 'modified', newValue: newVal })
  } else if (msgType === 'echo') {
    workerPort.postMessage('received')
  } else {
    workerPort.postMessage('unknown')
  }
}

workerPort.onmessageerror = (e: MessageEvents): void => {
  workerPort.postMessage({ type: 'message_error' })
}
