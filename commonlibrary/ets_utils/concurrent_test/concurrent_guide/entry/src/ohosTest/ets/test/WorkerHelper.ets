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
  a: number = 0
  b: number = 0
  op: string = ''

  constructor(a: number, b: number, op: string) {
    this.a = a
    this.b = b
    this.op = op
  }
}

export class EchoRequest {
  type: string = 'echo'
  payload: string = ''

  constructor(payload: string) {
    this.payload = payload
  }
}

export class CallAddValuesRequest {
  type: string = 'call_add_values'
  objName: string = ''

  constructor(objName: string) {
    this.objName = objName
  }
}

/** Typed payloads accepted by WorkerExchange.send (ArkTS forbids unknown). */
export type WorkerRequest = WorkerReadyRequest | CalculateRequest | EchoRequest | CallAddValuesRequest

function readResponseType(resp: ESObject): string {
  return resp['type'] as string
}

export class WorkerExchange {
  private wk: worker.ThreadWorker
  private pendingResolve: ((data: ESObject) => void) | null = null
  private pendingReject: ((err: Error) => void) | null = null
  private terminated: boolean = false

  constructor(wk: worker.ThreadWorker) {
    this.wk = wk
    this.wk.onmessage = (e: MessageEvents): void => {
      if (this.pendingResolve !== null) {
        let resolver: (data: ESObject) => void = this.pendingResolve
        this.pendingResolve = null
        this.pendingReject = null
        resolver(e.data as ESObject)
      } else {
        // Unexpected message (e.g. after terminate or without pending send) — do not silently ignore
        console.warn('WorkerExchange: unexpected onmessage, terminated=' +
          (this.terminated ? 'true' : 'false'))
      }
    }
    this.wk.onmessageerror = (_e: MessageEvents): void => {
      this.rejectPending(new Error('WorkerExchange onmessageerror'))
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

  send(data: string | WorkerRequest): Promise<ESObject> {
    // Force serial await: concurrent send would overwrite pending and hang the previous Promise
    if (this.pendingResolve !== null) {
      return Promise.reject(new Error(
        'WorkerExchange.send requires serial await; previous request still pending')) as Promise<ESObject>
    }
    if (this.terminated) {
      return Promise.reject(new Error('WorkerExchange already terminated')) as Promise<ESObject>
    }
    return new Promise<ESObject>((resolve: (value: ESObject) => void, reject: (reason: Error) => void) => {
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

  async sendString(data: string): Promise<string> {
    let resp: ESObject = await this.send(data)
    return resp as string
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
    try {
      await new Promise<void>((resolve: () => void, reject: (reason: Error) => void) => {
        this.wk.onexit = (): void => {
          resolve()
        }
        try {
          this.wk.terminate()
        } catch (e) {
          if (e instanceof Error) {
            reject(e)
          } else {
            reject(new Error('ThreadWorker.terminate failed'))
          }
        }
      })
    } finally {
      // Always drop callback refs so WorkerExchange/ThreadWorker can be GC'd
      this.wk.onmessage = undefined
      this.wk.onmessageerror = undefined
      this.wk.onerror = undefined
      this.wk.onexit = undefined
    }
  }
}

export async function createEchoWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  try {
    let resp: string = await exchange.sendString(WORKER_READY_PROBE)
    if (resp !== ECHO_WORKER_READY) {
      throw new Error('EchoWorker not ready')
    }
    return exchange
  } catch (e) {
    await exchange.terminate()
    if (e instanceof Error) {
      throw e
    }
    throw new Error('EchoWorker ready probe failed')
  }
}

export async function createTaskTypeWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  try {
    let readyReq: WorkerReadyRequest = new WorkerReadyRequest()
    let resp: ESObject = await exchange.send(readyReq)
    if (readResponseType(resp) !== OBJECT_WORKER_READY) {
      throw new Error('TaskTypeWorker not ready')
    }
    return exchange
  } catch (e) {
    await exchange.terminate()
    if (e instanceof Error) {
      throw e
    }
    throw new Error('TaskTypeWorker ready probe failed')
  }
}

export async function createInvokeWorkerExchange(path: string): Promise<WorkerExchange> {
  let wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  let exchange: WorkerExchange = new WorkerExchange(wk)
  try {
    let readyReq: WorkerReadyRequest = new WorkerReadyRequest()
    let resp: ESObject = await exchange.send(readyReq)
    if (readResponseType(resp) !== OBJECT_WORKER_READY) {
      throw new Error('InvokeWorker not ready')
    }
    return exchange
  } catch (e) {
    await exchange.terminate()
    if (e instanceof Error) {
      throw e
    }
    throw new Error('InvokeWorker ready probe failed')
  }
}
