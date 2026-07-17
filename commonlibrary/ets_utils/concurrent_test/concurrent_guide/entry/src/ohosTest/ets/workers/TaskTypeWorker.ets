/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents): void => {
  let msgType: string = (e.data as Record<string, Object>)['type'] as string
  if (msgType === '__ready__') {
    workerPort.postMessage({ type: 'ready' })
  } else if (msgType === 'calculate') {
    let a: number = (e.data as Record<string, Object>)['a'] as number
    let b: number = (e.data as Record<string, Object>)['b'] as number
    let op: string = (e.data as Record<string, Object>)['op'] as string
    let result: number = 0
    if (op === 'add') {
      result = a + b
    } else if (op === 'multiply') {
      result = a * b
    } else if (op === 'subtract') {
      result = a - b
    }
    workerPort.postMessage({ type: 'calc_result', value: result })
  } else if (msgType === 'echo') {
    let payload: string = (e.data as Record<string, Object>)['payload'] as string
    workerPort.postMessage({ type: 'echo_response', payload: payload })
  } else if (msgType === 'heartbeat') {
    let count: number = (e.data as Record<string, Object>)['count'] as number
    let intervalId: number = setInterval((): void => {
      if (count <= 0) {
        clearInterval(intervalId)
        workerPort.postMessage({ type: 'heartbeat_done' })
      } else {
        workerPort.postMessage({ type: 'beat', remaining: count })
        count--
      }
    }, 200)
  } else if (msgType === 'error_test') {
    throw new Error('Worker internal error')
  } else if (msgType === 'close_self') {
    workerPort.postMessage({ type: 'closing' })
    workerPort.close()
  } else {
    workerPort.postMessage({ type: 'unknown', raw: e.data })
  }
}
