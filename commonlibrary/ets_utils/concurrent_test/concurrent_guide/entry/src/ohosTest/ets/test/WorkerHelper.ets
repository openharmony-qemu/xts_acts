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

const WORKER_READY_PROBE: string = '__ready__';
const ECHO_WORKER_READY: string = 'ready';
const OBJECT_WORKER_READY: string = 'ready';
/** Fail send if Worker never replies (ms). Below Test.json testcase-timeout. */
const WORKER_SEND_TIMEOUT_MS: number = 10000
/** Force-continue terminate if onexit never fires (ms). */
const WORKER_TERMINATE_TIMEOUT_MS: number = 5000

class WorkerReadyRequest {
  type: string = WORKER_READY_PROBE;
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

/** Typed object responses from TaskType/Invoke workers (ready / calculate / echo). */
export class WorkerMessageResponse {
  type: string = ''
  value: number = 0
  payload: string = ''
}

/** Echo workers reply with string; TaskType/Invoke reply with WorkerMessageResponse. */
export type WorkerResponse = WorkerMessageResponse | string

function readResponseType(resp: WorkerMessageResponse): string {
  return resp.type
}

export class WorkerExchange {
  private wk: worker.ThreadWorker
  private pendingResolve: ((data: WorkerResponse) => void) | null = null
  private pendingReject: ((err: Error) => void) | null = null
  private pendingTimeoutId: number = -1
  private terminated: boolean = false

  constructor(wk: worker.ThreadWorker) {
    this.wk = wk
    this.wk.onmessage = (e: MessageEvents): void => {
      if (this.pendingResolve !== null) {
        let resolver: (data: WorkerResponse) => void = this.pendingResolve
        this.clearPending()
        resolver(e.data as WorkerResponse)
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

  private clearPendingTimeout(): void {
    if (this.pendingTimeoutId !== -1) {
      clearTimeout(this.pendingTimeoutId)
      this.pendingTimeoutId = -1
    }
  }

  private clearPending(): void {
    this.clearPendingTimeout()
    this.pendingResolve = null
    this.pendingReject = null
  }

  private rejectPending(err: Error): void {
    if (this.pendingReject !== null) {
      let rejector: (reason: Error) => void = this.pendingReject
      this.clearPending()
      rejector(err)
    } else {
      this.clearPendingTimeout()
    }
  }

  send<T extends WorkerResponse>(data: string | WorkerRequest): Promise<T> {
    // Force serial await: concurrent send would overwrite pending and hang the previous Promise
    if (this.pendingResolve !== null) {
      return Promise.reject(new Error(
        'WorkerExchange.send requires serial await; previous request still pending')) as Promise<T>
    }
    if (this.terminated) {
      return Promise.reject(new Error('WorkerExchange already terminated')) as Promise<T>
    }
    return new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
      this.pendingResolve = (raw: WorkerResponse): void => {
        resolve(raw as T)
      }
      this.pendingReject = reject
      this.pendingTimeoutId = setTimeout((): void => {
        this.pendingTimeoutId = -1
        this.rejectPending(new Error('WorkerExchange.send timed out after ' +
          WORKER_SEND_TIMEOUT_MS.toString() + 'ms'))
      }, WORKER_SEND_TIMEOUT_MS)
      try {
        this.wk.postMessage(data)
      } catch (e) {
        this.clearPending()
        if (e instanceof Error) {
          // Preserve Error subclasses such as BusinessError for caller assertions
          reject(e)
        } else {
          reject(new Error('WorkerExchange postMessage failed'))
        }
        return
      }
    })
  }

  sendString(data: string): Promise<string> {
    return this.send<string>(data)
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
        let settled: boolean = false
        let exitTimeoutId: number = setTimeout((): void => {
          if (!settled) {
            settled = true
            console.warn('WorkerExchange.terminate: onexit timed out after ' +
              WORKER_TERMINATE_TIMEOUT_MS.toString() + 'ms, continue')
            resolve()
          }
        }, WORKER_TERMINATE_TIMEOUT_MS)
        this.wk.onexit = (): void => {
          if (!settled) {
            settled = true
            clearTimeout(exitTimeoutId)
            resolve()
          }
        }
        try {
          this.wk.terminate()
        } catch (e) {
          if (!settled) {
            settled = true
            clearTimeout(exitTimeoutId)
            if (e instanceof Error) {
              reject(e)
            } else {
              reject(new Error('ThreadWorker.terminate failed'))
            }
          }
        }
      })
    } finally {
      // Clear handlers with no-ops (callback types may not accept undefined)
      this.wk.onmessage = (_e: MessageEvents): void => {}
      this.wk.onmessageerror = (_e: MessageEvents): void => {}
      this.wk.onerror = (_e: ErrorEvent): void => {}
      this.wk.onexit = (_code: number): void => {}
    }
  }
}

async function createWorkerExchange(
  path: string,
  probeReady: (exchange: WorkerExchange) => Promise<void>,
  failLabel: string
): Promise<WorkerExchange> {
  const wk: worker.ThreadWorker = new worker.ThreadWorker(path)
  const exchange: WorkerExchange = new WorkerExchange(wk)
  try {
    await probeReady(exchange)
    return exchange
  } catch (e) {
    await exchange.terminate()
    if (e instanceof Error) {
      throw e
    }
    throw new Error(failLabel + ' ready probe failed')
  }
}

export async function createEchoWorkerExchange(path: string): Promise<WorkerExchange> {
  return createWorkerExchange(path, async (exchange: WorkerExchange): Promise<void> => {
    const resp: string = await exchange.sendString(WORKER_READY_PROBE)
    if (resp !== ECHO_WORKER_READY) {
      throw new Error('EchoWorker not ready')
    }
  }, 'EchoWorker')
}

export async function createTaskTypeWorkerExchange(path: string): Promise<WorkerExchange> {
  return createWorkerExchange(path, async (exchange: WorkerExchange): Promise<void> => {
    const readyReq: WorkerReadyRequest = new WorkerReadyRequest()
    const resp: WorkerMessageResponse = await exchange.send<WorkerMessageResponse>(readyReq)
    if (readResponseType(resp) !== OBJECT_WORKER_READY) {
      throw new Error('TaskTypeWorker not ready')
    }
  }, 'TaskTypeWorker')
}

export async function createInvokeWorkerExchange(path: string): Promise<WorkerExchange> {
  return createWorkerExchange(path, async (exchange: WorkerExchange): Promise<void> => {
    const readyReq: WorkerReadyRequest = new WorkerReadyRequest()
    const resp: WorkerMessageResponse = await exchange.send<WorkerMessageResponse>(readyReq)
    if (readResponseType(resp) !== OBJECT_WORKER_READY) {
      throw new Error('InvokeWorker not ready')
    }
  }, 'InvokeWorker')
}
