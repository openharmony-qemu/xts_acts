/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRStateMachine {
  public currentState_: number = 0
  public previousState_: number = -1
  public transitionCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async getIRStates(): Promise<number[]> {
    return await this.lock_.lockAsync((): number[] => [this.currentState_, this.previousState_, this.transitionCount_])
  }
}

@Sendable
class TransitionIRStateMachine {
  public state_: number = 0
  public count_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async transition(newState: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.state_ = newState
      this.count_++
    })
  }

  async getState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.state_)
  }
}

@Sendable
class SharedHiddenClassStateMachine {
  public state_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

}

@Sendable
class ICStateMachine {
  public state_: number = 1
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async getState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.state_)
  }
}

@Sendable
class CrossThreadStateMachine {
  public state_: number = 5
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

}

@Sendable
class HistoryIRStateMachine {
  public history_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(history_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.history_ = history_
    this.lock_ = lock_
  }

}

@Sendable
class StableIRStateMachine {
  public state_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async transition(newState: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.state_ = newState
    })
  }
}

@Sendable
class BoundaryStateMachine {
  public state_: number = 0
  public maxState_: number = 100
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async getIRProperties(): Promise<number[]> {
    return await this.lock_.lockAsync((): number[] => [this.state_, this.maxState_])
  }
}

@Concurrent
function readCrossThreadStateTask(sm: CrossThreadStateMachine): number {
  return sm.state_
}

@Concurrent
async function transitionIRTask(sm: StableIRStateMachine, ns: number): Promise<void> {
  return await sm.lock_.lockAsync((): void => {
    sm.state_ = ns

  })
}

export default function BuiltinsStateMachineIRTest(): void {
  describe('BuiltinsStateMachineIRTest', () => {
    it('testStateMachineIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: IRStateMachine = new IRStateMachine(new ArkTSUtils.locks.AsyncLock())
      const states: number[] = await sm.getIRStates()
      expect(states[0]).assertEqual(0)
      expect(states[1]).assertEqual(-1)
    })

    it('testStateMachineIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: TransitionIRStateMachine = new TransitionIRStateMachine(new ArkTSUtils.locks.AsyncLock())
      await sm.transition(1)
      expect(await sm.getState()).assertEqual(1)
    })

    it('testStateMachineIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm1: SharedHiddenClassStateMachine = new SharedHiddenClassStateMachine(new ArkTSUtils.locks.AsyncLock())
      const sm2: SharedHiddenClassStateMachine = new SharedHiddenClassStateMachine(new ArkTSUtils.locks.AsyncLock())
      expect(sm1.state_).assertEqual(0)
      expect(sm2.state_).assertEqual(0)
    })

    it('testStateMachineIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: ICStateMachine = new ICStateMachine(new ArkTSUtils.locks.AsyncLock())
      for (let i: number = 0; i < 50; i++) {
        expect(await sm.getState()).assertEqual(1)
      }
    })

    it('testStateMachineIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: CrossThreadStateMachine = new CrossThreadStateMachine(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readCrossThreadStateTask, sm))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(5)
      }
    })

    it('testStateMachineIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: HistoryIRStateMachine = new HistoryIRStateMachine(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
      await sm.lock_.lockAsync((): void => {
        sm.history_.push(0)
        sm.history_.push(1)
        sm.history_.push(2)
      })
      expect(sm.history_.length).assertEqual(3)
    })

    it('testStateMachineIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: StableIRStateMachine = new StableIRStateMachine(new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(transitionIRTask, sm, i))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      const finalState: number = await sm.lock_.lockAsync((): number => sm.state_)
      expect(finalState).assertLargerOrEqual(0)
    })

    it('testStateMachineIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sm: BoundaryStateMachine = new BoundaryStateMachine(new ArkTSUtils.locks.AsyncLock())
      const props: number[] = await sm.getIRProperties()
      expect(props.length).assertEqual(2)
      expect(props[1]).assertEqual(100)
    })
  })
}
