/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { worker, MessageEvents } from '@kit.ArkTS';

const WORKER_READY_PROBE: string = '__ready__'
const ECHO_WORKER_READY: string = 'ready'
const OBJECT_WORKER_READY: string = 'ready'

class WorkerReadyRequest {
  type: string = WORKER_READY_PROBE
}

export class CalculateRequest {
  type: string = 'calculate'
  a: number
  b: number
  op: string

  constructor(a: number, b: number, op: string) {
    this.a = a
    this.b = b
    this.op = op
  }
}

export class EchoRequest {
  type: string = 'echo'
  payload: string

  constructor(payload: string) {
    this.payload = payload
  }
}

export class CallAddValuesRequest {
  type: string = 'call_add_values'
  objName: string

  constructor(objName: string) {
    this.objName = objName
  }
}

export class WorkerExchange {
  private wk: worker.ThreadWorker
  private pending: ((data: Object) => void) | null = null

  constructor(wk: worker.ThreadWorker) {
    this.wk = wk
    this.wk.onmessage = (e: MessageEvents): void => {
      if (this.pending !== null) {
        let resolver: (data: Object) => void = this.pending
        this.pending = null
        resolver(e.data as Object)
      }
    }
  }

  getWorker(): worker.ThreadWorker {
    return this.wk
  }

  send(data: string | Object): Promise<Object> {
    // Force serial await: concurrent send would overwrite pending and hang the previous Promise
    if (this.pending !== null) {
      throw new Error('WorkerExchange.send requires serial await; previous request still pending')
    }
    return new Promise<Object>((resolve: (value: Object) => void) => {
      this.pending = resolve
      this.wk.postMessage(data)
    })
  }

  sendString(data: string): Promise<string> {
    return this.send(data) as Promise<string>
  }
}

export async function createEchoWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  let resp: string = await exchange.sendString(WORKER_READY_PROBE)
  if (resp !== ECHO_WORKER_READY) {
    throw new Error('EchoWorker not ready')
  }
  return exchange
}

export async function createTaskTypeWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  let readyReq: WorkerReadyRequest = new WorkerReadyRequest()
  let resp: Record<string, Object> = await exchange.send(readyReq) as Record<string, Object>
  if ((resp['type'] as string) !== OBJECT_WORKER_READY) {
    throw new Error('TaskTypeWorker not ready')
  }
  return exchange
}

export async function createInvokeWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  let readyReq: WorkerReadyRequest = new WorkerReadyRequest()
  let resp: Record<string, Object> = await exchange.send(readyReq) as Record<string, Object>
  if ((resp['type'] as string) !== OBJECT_WORKER_READY) {
    throw new Error('InvokeWorker not ready')
  }
  return exchange
}
