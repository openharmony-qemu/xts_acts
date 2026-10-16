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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'
import { DeviceState } from './SendableTestEnums'


@Sendable
class DeviceTransitionRecord {
  public from_: number = 0
  public to_: number = 0
  public timestamp_: number = 0
  public deviceId_: string = ''

  constructor(from: number, to: number, deviceId: string) {
    this.from_ = from
    this.to_ = to
    this.timestamp_ = Date.now()
    this.deviceId_ = deviceId
  }
}

@Sendable
class DeviceTransitionRule {
  public from_: number = 0
  public to_: number = 0

  constructor(from: number, to: number) {
    this.from_ = from
    this.to_ = to
  }
}

@Sendable
class DeviceStateMachine {
  public currentState_: number = DeviceState.OFFLINE
  public previousState_: number = -1
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<DeviceTransitionRecord>

  public rules_: collections.Array<DeviceTransitionRule>

  public deviceId_: string = ''

  constructor(deviceId: string, lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<DeviceTransitionRecord>, rules_: collections.Array<DeviceTransitionRule>) {
    this.lock_ = lock_
    this.history_ = history_
    this.rules_ = rules_

    this.deviceId_ = deviceId
    this.currentState_ = DeviceState.OFFLINE
  }

  async setupRules(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.rules_.push(new DeviceTransitionRule(DeviceState.OFFLINE, DeviceState.ONLINE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.ONLINE, DeviceState.IDLE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.ONLINE, DeviceState.OFFLINE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.IDLE, DeviceState.BUSY))
      this.rules_.push(new DeviceTransitionRule(DeviceState.IDLE, DeviceState.OFFLINE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.BUSY, DeviceState.IDLE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.BUSY, DeviceState.OFFLINE))
      this.rules_.push(new DeviceTransitionRule(DeviceState.OFFLINE, DeviceState.ERROR))
      this.rules_.push(new DeviceTransitionRule(DeviceState.ONLINE, DeviceState.ERROR))
      this.rules_.push(new DeviceTransitionRule(DeviceState.IDLE, DeviceState.ERROR))
      this.rules_.push(new DeviceTransitionRule(DeviceState.BUSY, DeviceState.ERROR))
      this.rules_.push(new DeviceTransitionRule(DeviceState.ERROR, DeviceState.OFFLINE))
    })
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentState_)
  }

  async getPreviousState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.previousState_)
  }

  async getDeviceId(): Promise<string> {
    return await this.lock_.lockAsync((): string => this.deviceId_)
  }

  async transition(toState: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      let allowed: boolean = false
      for (let i: number = 0; i < this.rules_.length; i++) {
        const rule: DeviceTransitionRule = this.rules_[i]
        if (rule.from_ === this.currentState_ && rule.to_ === toState) {
          allowed = true
          break
        }
      }
      if (!allowed) {
        return false
      }
      this.history_.push(new DeviceTransitionRecord(this.currentState_, toState, this.deviceId_))
      this.previousState_ = this.currentState_
      this.currentState_ = toState
      return true
    })
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async getLastTransition(): Promise<DeviceTransitionRecord | null> {
    return await this.lock_.lockAsync((): DeviceTransitionRecord | null => {
      if (this.history_.length > 0) {
        return this.history_[this.history_.length - 1]
      }
      return null
    })
  }

  async isInState(state: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.currentState_ === state)
  }

  async isOnline(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      return this.currentState_ === DeviceState.ONLINE ||
             this.currentState_ === DeviceState.IDLE ||
             this.currentState_ === DeviceState.BUSY
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = DeviceState.OFFLINE
      this.previousState_ = -1
      while (this.history_.length > 0) { this.history_.pop() }
    })
  }
}

@Concurrent
function readDeviceStateTask(sm: DeviceStateMachine): number {
  return sm.currentState_
}

@Concurrent
function deviceOnlineNotifyTask(sm: DeviceStateMachine): void {
  taskpool.Task.sendData('online')
}

export default function DeviceStateMachineTest(): void {
  describe('DeviceStateMachineTest', () => {
    let deviceSM: DeviceStateMachine

    beforeEach(async (): Promise<void> => {
      deviceSM = new DeviceStateMachine('device_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<DeviceTransitionRecord>(), new collections.Array<DeviceTransitionRule>())
      await deviceSM.setupRules()
    })

    afterEach(async (): Promise<void> => {
      await deviceSM.reset()
    })

    /**
     * @tc.name   testDeviceStateMachine0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0100
     * @tc.desc   Verify testDeviceStateMachine0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.OFFLINE)
        expect(await deviceSM.getDeviceId()).assertEqual('device_001')
        expect(await deviceSM.getHistoryCount()).assertEqual(0)
      } catch (error) {
        console.error("testDeviceStateMachine0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0200
     * @tc.desc   Verify testDeviceStateMachine0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(await deviceSM.transition(DeviceState.ONLINE)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.ONLINE)
        expect(await deviceSM.isOnline()).assertTrue()
        expect(await deviceSM.getHistoryCount()).assertEqual(1)
      } catch (error) {
        console.error("testDeviceStateMachine0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0300
     * @tc.desc   Verify testDeviceStateMachine0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        expect(await deviceSM.transition(DeviceState.IDLE)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.IDLE)
        expect(await deviceSM.isOnline()).assertTrue()
      } catch (error) {
        console.error("testDeviceStateMachine0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0400
     * @tc.desc   Verify testDeviceStateMachine0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        expect(await deviceSM.transition(DeviceState.BUSY)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.BUSY)
      } catch (error) {
        console.error("testDeviceStateMachine0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0500
     * @tc.desc   Verify testDeviceStateMachine0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        await deviceSM.transition(DeviceState.BUSY)
        expect(await deviceSM.transition(DeviceState.IDLE)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.IDLE)
      } catch (error) {
        console.error("testDeviceStateMachine0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0600
     * @tc.desc   Verify testDeviceStateMachine0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        expect(await deviceSM.transition(DeviceState.OFFLINE)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.OFFLINE)
        expect(await deviceSM.isOnline()).assertFalse()
      } catch (error) {
        console.error("testDeviceStateMachine0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0700
     * @tc.desc   Verify testDeviceStateMachine0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        expect(await deviceSM.transition(DeviceState.ERROR)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.ERROR)
      } catch (error) {
        console.error("testDeviceStateMachine0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0800
     * @tc.desc   Verify testDeviceStateMachine0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.ERROR)
        expect(await deviceSM.transition(DeviceState.OFFLINE)).assertTrue()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.OFFLINE)
      } catch (error) {
        console.error("testDeviceStateMachine0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_0900
     * @tc.desc   Verify testDeviceStateMachine0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeviceStateMachine0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        expect(await deviceSM.transition(DeviceState.BUSY)).assertFalse()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.OFFLINE)
        expect(await deviceSM.getHistoryCount()).assertEqual(0)
      } catch (error) {
        console.error("testDeviceStateMachine0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1000
     * @tc.desc   Verify testDeviceStateMachine1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeviceStateMachine1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        expect(await deviceSM.transition(DeviceState.ONLINE)).assertFalse()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.IDLE)
      } catch (error) {
        console.error("testDeviceStateMachine1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1100
     * @tc.desc   Verify testDeviceStateMachine1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeviceStateMachine1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 15; i++) {
          tasks.push(new taskpool.Task(readDeviceStateTask, deviceSM))
        }
        const promises: Promise<Object>[] = []
        for (let i: number = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(DeviceState.IDLE)
        }
      } catch (error) {
        console.error("testDeviceStateMachine1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1200
     * @tc.desc   Verify testDeviceStateMachine1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await deviceSM.transition(DeviceState.ONLINE)
        await deviceSM.transition(DeviceState.IDLE)
        await deviceSM.transition(DeviceState.BUSY)
        expect(await deviceSM.getHistoryCount()).assertEqual(3)
        const lastTransition: DeviceTransitionRecord | null = await deviceSM.getLastTransition()
        expect(lastTransition !== null && lastTransition !== undefined).assertTrue()
        if (lastTransition !== null) {
          expect(lastTransition.from_).assertEqual(DeviceState.IDLE)
          expect(lastTransition.to_).assertEqual(DeviceState.BUSY)
          expect(lastTransition.deviceId_).assertEqual('device_001')
        }
      } catch (error) {
        console.error("testDeviceStateMachine1200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1300
     * @tc.desc   Verify testDeviceStateMachine1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeviceStateMachine1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const notifications: string[] = []
        const task: taskpool.Task = new taskpool.Task(deviceOnlineNotifyTask, deviceSM)
        const receivePromise: Promise<void> = new Promise<void>((resolve: () => void): void => {
          task.onReceiveData((data: string): void => {
            notifications.push(data)
            resolve()
          })
        })
        await taskpool.execute(task)
        await receivePromise
        expect(notifications.length).assertLargerOrEqual(1)
        expect(notifications[0]).assertEqual('online')
      } catch (error) {
        console.error("testDeviceStateMachine1300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1400
     * @tc.desc   Verify testDeviceStateMachine1400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeviceStateMachine1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const deviceSM1: DeviceStateMachine = new DeviceStateMachine('device_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<DeviceTransitionRecord>(), new collections.Array<DeviceTransitionRule>())
        const deviceSM2: DeviceStateMachine = new DeviceStateMachine('device_002', new ArkTSUtils.locks.AsyncLock(), new collections.Array<DeviceTransitionRecord>(), new collections.Array<DeviceTransitionRule>())
        await deviceSM1.setupRules()
        await deviceSM2.setupRules()
        await deviceSM1.transition(DeviceState.ONLINE)
        await deviceSM1.transition(DeviceState.IDLE)
        await deviceSM1.transition(DeviceState.BUSY)
        await deviceSM2.transition(DeviceState.ONLINE)
        await deviceSM2.transition(DeviceState.OFFLINE)
        expect(await deviceSM1.getCurrentState()).assertEqual(DeviceState.BUSY)
        expect(await deviceSM2.getCurrentState()).assertEqual(DeviceState.OFFLINE)
        await deviceSM1.reset()
        await deviceSM2.reset()
      } catch (error) {
        console.error("testDeviceStateMachine1400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDeviceStateMachine1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEVICESTATEMACHINE_TEST_1500
     * @tc.desc   Verify testDeviceStateMachine1500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeviceStateMachine1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const historyBefore: number = await deviceSM.getHistoryCount()
        expect(await deviceSM.transition(DeviceState.BUSY)).assertFalse()
        expect(await deviceSM.getCurrentState()).assertEqual(DeviceState.OFFLINE)
        expect(await deviceSM.getHistoryCount()).assertEqual(historyBefore)
      } catch (error) {
        console.error("testDeviceStateMachine1500 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
