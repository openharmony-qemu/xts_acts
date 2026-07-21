/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';

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
  private pendingResolve: ((data: Object) => void) | null = null
  private pendingReject: ((err: Error) => void) | null = null
  private terminated: boolean = false

  constructor(wk: worker.ThreadWorker) {
    this.wk = wk
    this.wk.onmessage = (e: MessageEvents): void => {
      if (this.pendingResolve !== null) {
        let resolver: (data: Object) => void = this.pendingResolve
        this.pendingResolve = null
        this.pendingReject = null
        resolver(e.data as Object)
      }
    }
    this.wk.onerror = (e: ErrorEvent): void => {
      this.rejectPending(new Error(e.message))
    }
  }

  getWorker(): worker.ThreadWorker {
    return this.wk
  }

  private rejectPending(err: Error): void {
    if (this.pendingReject !== null) {
      let rejector: (reason: Error) => void = this.pendingReject
      this.pendingResolve = null
      this.pendingReject = null
      rejector(err)
    }
  }

  send(data: string | Object): Promise<Object> {
    // Force serial await: concurrent send would overwrite pending and hang the previous Promise
    if (this.pendingResolve !== null) {
      throw new Error('WorkerExchange.send requires serial await; previous request still pending')
    }
    if (this.terminated) {
      throw new Error('WorkerExchange already terminated')
    }
    return new Promise<Object>((resolve: (value: Object) => void, reject: (reason: Error) => void) => {
      this.pendingResolve = resolve
      this.pendingReject = reject
      try {
        this.wk.postMessage(data)
      } catch (e) {
        this.pendingResolve = null
        this.pendingReject = null
        // Keep original error object (e.g. BusinessError with code) for caller assertions
        reject(e as Error)
      }
    })
  }

  sendString(data: string): Promise<string> {
    return this.send(data) as Promise<string>
  }

  /**
   * Release the underlying ThreadWorker. Safe to call once; subsequent calls are no-ops.
   */
  async terminate(): Promise<void> {
    if (this.terminated) {
      return
    }
    this.terminated = true
    this.rejectPending(new Error('WorkerExchange terminated'))
    await new Promise<void>((resolve: () => void) => {
      this.wk.onexit = (): void => {
        resolve()
      }
      this.wk.terminate()
    })
  }
}

export async function createEchoWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  let resp: string = await exchange.sendString(WORKER_READY_PROBE)
  if (resp !== ECHO_WORKER_READY) {
    await exchange.terminate()
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
    await exchange.terminate()
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
    await exchange.terminate()
    throw new Error('InvokeWorker not ready')
  }
  return exchange
}
