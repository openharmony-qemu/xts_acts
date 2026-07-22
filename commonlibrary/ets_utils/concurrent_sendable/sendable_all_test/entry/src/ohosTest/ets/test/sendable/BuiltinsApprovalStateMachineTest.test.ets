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

const enum ApprovalState {
  DRAFT = 0,
  PENDING = 1,
  APPROVING = 2,
  APPROVED = 3,
  REJECTED = 4,
  WITHDRAWN = 5
}

@Sendable
class ApprovalTransitionRecord {
  public from_: number = 0
  public to_: number = 0
  public reason_: string = ''
  public timestamp_: number = 0

  constructor(from: number, to: number, reason: string) {
    this.from_ = from
    this.to_ = to
    this.reason_ = reason
    this.timestamp_ = Date.now()
  }
}

@Sendable
class ApprovalTransitionRule {
  public from_: number = 0
  public to_: number = 0

  constructor(from: number, to: number) {
    this.from_ = from
    this.to_ = to
  }
}

@Sendable
class ApprovalRecord {
  public level_: number = 0
  public approver_: string = ''
  public result_: string = ''
  public timestamp_: number = 0

  constructor(level: number, approver: string, result: string) {
    this.level_ = level
    this.approver_ = approver
    this.result_ = result
    this.timestamp_ = Date.now()
  }
}

@Sendable
class ApprovalStateMachine {
  public currentState_: number = ApprovalState.DRAFT
  public previousState_: number = -1
  public lock_: ArkTSUtils.locks.AsyncLock

  public history_: collections.Array<ApprovalTransitionRecord>

  public rules_: collections.Array<ApprovalTransitionRule>

  public approvalRecords_: collections.Array<ApprovalRecord>

  public approvalId_: string = ''
  public currentLevel_: number = 0

  constructor(approvalId: string, lock_: ArkTSUtils.locks.AsyncLock, history_: collections.Array<ApprovalTransitionRecord>, rules_: collections.Array<ApprovalTransitionRule>, approvalRecords_: collections.Array<ApprovalRecord>) {
    this.lock_ = lock_
    this.history_ = history_
    this.rules_ = rules_
    this.approvalRecords_ = approvalRecords_

    this.approvalId_ = approvalId
    this.currentState_ = ApprovalState.DRAFT
  }

  async setupRules(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.DRAFT, ApprovalState.PENDING))
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.PENDING, ApprovalState.APPROVING))
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.PENDING, ApprovalState.WITHDRAWN))
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.APPROVING, ApprovalState.APPROVED))
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.APPROVING, ApprovalState.REJECTED))
      this.rules_.push(new ApprovalTransitionRule(ApprovalState.WITHDRAWN, ApprovalState.DRAFT))
    })
  }

  async getCurrentState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentState_)
  }

  async getPreviousState(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.previousState_)
  }

  async getApprovalId(): Promise<string> {
    return await this.lock_.lockAsync((): string => this.approvalId_)
  }

  async getCurrentLevel(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.currentLevel_)
  }

  async transition(toState: number, reason: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      let allowed: boolean = false
      for (let i: number = 0; i < this.rules_.length; i++) {
        const rule: ApprovalTransitionRule = this.rules_[i]
        if (rule.from_ === this.currentState_ && rule.to_ === toState) {
          allowed = true
          break
        }
      }
      if (!allowed) {
        return false
      }
      this.history_.push(new ApprovalTransitionRecord(this.currentState_, toState, reason))
      this.previousState_ = this.currentState_
      this.currentState_ = toState
      return true
    })
  }

  async addApprovalRecord(level: number, approver: string, result: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.approvalRecords_.push(new ApprovalRecord(level, approver, result))
      this.currentLevel_ = level + 1
    })
  }

  async getHistoryCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.history_.length)
  }

  async getApprovalRecordCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.approvalRecords_.length)
  }

  async getLastApprovalRecord(): Promise<ApprovalRecord | null> {
    return await this.lock_.lockAsync((): ApprovalRecord | null => {
      if (this.approvalRecords_.length > 0) {
        return this.approvalRecords_[this.approvalRecords_.length - 1]
      }
      return null
    })
  }

  async isInState(state: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.currentState_ === state)
  }

  async isFinalState(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      return this.currentState_ === ApprovalState.APPROVED ||
             this.currentState_ === ApprovalState.REJECTED
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentState_ = ApprovalState.DRAFT
      this.previousState_ = -1
      this.currentLevel_ = 0
      while (this.history_.length > 0) { this.history_.pop() }
      while (this.approvalRecords_.length > 0) { this.approvalRecords_.pop() }
    })
  }
}

@Concurrent
function readApprovalStateTask(sm: ApprovalStateMachine): number {
  return sm.currentState_
}

export default function BuiltinsApprovalStateMachineTest(): void {
  describe('BuiltinsApprovalStateMachineTest', (): void => {
    let approvalSM: ApprovalStateMachine

    beforeEach(async (): Promise<void> => {
      approvalSM = new ApprovalStateMachine('approval_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<ApprovalTransitionRecord>(), new collections.Array<ApprovalTransitionRule>(), new collections.Array<ApprovalRecord>())
      await approvalSM.setupRules()
    })

    afterEach(async (): Promise<void> => {
      await approvalSM.reset()
    })

    /**
     * @tc.name   testApprovalStateMachine0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0100
     * @tc.desc   Verify approval state machine initial DRAFT state and fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.DRAFT)
      expect(await approvalSM.getApprovalId()).assertEqual('approval_001')
      expect(await approvalSM.getHistoryCount()).assertEqual(0)
      expect(await approvalSM.getCurrentLevel()).assertEqual(0)
    })

    /**
     * @tc.name   testApprovalStateMachine0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0200
     * @tc.desc   Verify transition from DRAFT to PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await approvalSM.transition(ApprovalState.PENDING, 'submit for approval')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.PENDING)
      expect(await approvalSM.getHistoryCount()).assertEqual(1)
    })

    /**
     * @tc.name   testApprovalStateMachine0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0300
     * @tc.desc   Verify transition from PENDING to APPROVING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      expect(await approvalSM.transition(ApprovalState.APPROVING, 'start approval process')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.APPROVING)
    })

    /**
     * @tc.name   testApprovalStateMachine0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0400
     * @tc.desc   Verify full approval path ends in APPROVED final state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.APPROVING, 'start')
      expect(await approvalSM.transition(ApprovalState.APPROVED, 'all approved')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.APPROVED)
      expect(await approvalSM.isFinalState()).assertTrue()
    })

    /**
     * @tc.name   testApprovalStateMachine0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0500
     * @tc.desc   Verify approval path ends in REJECTED final state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.APPROVING, 'start')
      expect(await approvalSM.transition(ApprovalState.REJECTED, 'rejected by manager')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.REJECTED)
      expect(await approvalSM.isFinalState()).assertTrue()
    })

    /**
     * @tc.name   testApprovalStateMachine0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0600
     * @tc.desc   Verify transition from PENDING to WITHDRAWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      expect(await approvalSM.transition(ApprovalState.WITHDRAWN, 'user withdraw')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.WITHDRAWN)
    })

    /**
     * @tc.name   testApprovalStateMachine0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0700
     * @tc.desc   Verify WITHDRAWN can transition back to DRAFT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.WITHDRAWN, 'withdraw')
      expect(await approvalSM.transition(ApprovalState.DRAFT, 'back to draft')).assertTrue()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.DRAFT)
    })

    /**
     * @tc.name   testApprovalStateMachine0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0800
     * @tc.desc   Verify multi-level approval records and current level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.APPROVING, 'start')
      await approvalSM.addApprovalRecord(0, 'manager1', 'approved')
      await approvalSM.addApprovalRecord(1, 'manager2', 'approved')
      await approvalSM.addApprovalRecord(2, 'director', 'approved')
      expect(await approvalSM.getApprovalRecordCount()).assertEqual(3)
      expect(await approvalSM.getCurrentLevel()).assertEqual(3)
      const lastRecord: ApprovalRecord | null = await approvalSM.getLastApprovalRecord()
      expect(lastRecord !== null && lastRecord !== undefined).assertTrue()
      if (lastRecord !== null) {
        expect(lastRecord.approver_).assertEqual('director')
        expect(lastRecord.result_).assertEqual('approved')
      }
    })

    /**
     * @tc.name   testApprovalStateMachine0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_0900
     * @tc.desc   Verify illegal transition from DRAFT to APPROVED is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApprovalStateMachine0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await approvalSM.transition(ApprovalState.APPROVED, 'skip approval')).assertFalse()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.DRAFT)
    })

    /**
     * @tc.name   testApprovalStateMachine1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_1000
     * @tc.desc   Verify transition from APPROVED final state is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApprovalStateMachine1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.APPROVING, 'start')
      await approvalSM.transition(ApprovalState.APPROVED, 'approved')
      expect(await approvalSM.transition(ApprovalState.PENDING, 'try again')).assertFalse()
      expect(await approvalSM.getCurrentState()).assertEqual(ApprovalState.APPROVED)
    })

    /**
     * @tc.name   testApprovalStateMachine1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_1100
     * @tc.desc   Verify TaskPool concurrent read of APPROVING state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApprovalStateMachine1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit')
      await approvalSM.transition(ApprovalState.APPROVING, 'start')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readApprovalStateTask, approvalSM))
      }
      const promises: Promise<Object>[] = []
      for (let i: number = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(ApprovalState.APPROVING)
      }
    })

    /**
     * @tc.name   testApprovalStateMachine1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_1200
     * @tc.desc   Verify transition history count after three transitions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await approvalSM.transition(ApprovalState.PENDING, 'submit by user')
      await approvalSM.transition(ApprovalState.APPROVING, 'start process')
      await approvalSM.transition(ApprovalState.APPROVED, 'all levels approved')
      expect(await approvalSM.getHistoryCount()).assertEqual(3)
    })

    /**
     * @tc.name   testApprovalStateMachine1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_APPROVAL_STATE_MACHINE_TEST_1300
     * @tc.desc   Verify two independent approval state machines do not interfere
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApprovalStateMachine1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const approvalSM1: ApprovalStateMachine = new ApprovalStateMachine('approval_001', new ArkTSUtils.locks.AsyncLock(), new collections.Array<ApprovalTransitionRecord>(), new collections.Array<ApprovalTransitionRule>(), new collections.Array<ApprovalRecord>())
      const approvalSM2: ApprovalStateMachine = new ApprovalStateMachine('approval_002', new ArkTSUtils.locks.AsyncLock(), new collections.Array<ApprovalTransitionRecord>(), new collections.Array<ApprovalTransitionRule>(), new collections.Array<ApprovalRecord>())
      await approvalSM1.setupRules()
      await approvalSM2.setupRules()
      await approvalSM1.transition(ApprovalState.PENDING, 'submit')
      await approvalSM1.transition(ApprovalState.APPROVING, 'start')
      await approvalSM1.transition(ApprovalState.APPROVED, 'approved')
      await approvalSM2.transition(ApprovalState.PENDING, 'submit')
      await approvalSM2.transition(ApprovalState.APPROVING, 'start')
      await approvalSM2.transition(ApprovalState.REJECTED, 'rejected')
      expect(await approvalSM1.getCurrentState()).assertEqual(ApprovalState.APPROVED)
      expect(await approvalSM2.getCurrentState()).assertEqual(ApprovalState.REJECTED)
      await approvalSM1.reset()
      await approvalSM2.reset()
    })
  })
}
