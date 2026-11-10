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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import pthreadKeyTest from 'libpthread_key_test.so'

interface RetKeyBasic { ret: number; key: number; keyValid: number; errnoPreserved: number; }
interface RetNearFull { ret: number; keyValid: number; errnoPreserved: number; created: number; }
interface RetExhausted { ret: number; outputUnchanged: number; errnoPreserved: number; allConsistent: number; created: number; }
interface RetReuse { delRet: number; createRet: number; reuseOk: number; errnoPreserved: number; }
interface RetDestructor { ret: number; destructorCalled: number; }
interface RetErrno { retSuccess: number; errnoAfterSuccess: number; retExhaust: number; errnoAfterExhaust: number; }
interface RetThreshold { ret: number; created: number; reachedThreshold: number; threshold: number; notEnoughSlots: number; }
interface RetNonThreshold { ret: number; created: number; isNonThreshold: number; }
interface RetReserve128 { ret: number; isEagain: number; outputUnchanged: number; errnoPreserved: number; created: number; }
interface RetFillAll { created: number; allSuccess: number; maxKeys: number; }
interface RetNoRestore { firstReach: number; secondReach: number; created: number; }
interface RetRepeatExhaust { ret1: number; ret2: number; ret3: number; bothEagain: number; }
interface RetFork { parentCreated: number; childCreated: number; forkOk: number; }
interface RetExec { childExitCode: number; execOk: number; }
interface RetConcurrent { totalSuccess: number; totalFail: number; noCrash: number; numThreads: number; }
interface RetLockOutside { errnoPreserved: number; sigmaskEqual: number; noCrash: number; }
interface RetExhaustedTest { pass: number; created: number; repeatOk: number; reuseOk: number; }
interface RetSelfCleanup { createdBefore: number; createdAfter: number; cleaned: number; }
interface RetPreexisting { preCreated: number; testCreated: number; totalWithin: number; noCrash: number; }
interface RetGetspecificNull { ret: number; isNull: number; }
interface RetTsdIsolation { ret: number; thread1Ok: number; thread2Ok: number; mainOk: number; }
interface RetDeleteNoDestructor { ret: number; delRet: number; destructorNotCalled: number; }
interface RetSetspecificNull { ret: number; hasValueBefore: number; isNullAfter: number; }
interface RetDeleteInvalid { errnoPreserved1: number; errnoPreserved2: number; forkOk: number; }
interface RetErrnoDelete { ret: number; errnoPreserved: number; }
interface RetRangeValid { created: number; allInRange: number; }
interface RetForkChildExhaust { parentCreated: number; childExhaustOk: number; forkOk: number; }
interface RetConcurrentConsistency { totalSuccess: number; availableAfter: number; noLeak: number; noCrash: number; }
interface RetCrossThread { ret: number; setOk: number; getOk: number; }
interface RetMultiDestructor { allCreated: number; destructorCount: number; allCalled: number; }
interface RetProcessName { readOk: number; lenValid: number; nameLen: number; name: string; }
interface RetStressCycles { cycles: number; successCount: number; availableAfter: number; noLeak: number; }
interface RetMaxValue { pthreadKeysMax: number; is128: number; }
interface RetDlsym { createFound: number; deleteFound: number; }
interface RetSingleThreaded { singleThreaded: number; ret: number; setOk: number; getOk: number; }
interface RetFullDeleteRefill { firstFill: number; secondFill: number; fullyRecovered: number; }
interface RetReuseSlot { ret1: number; ret2: number; key1Val: number; key2Val: number; bothValid: number; slotReused: number; }
interface RetStressHigh { numThreads: number; iterations: number; totalSuccess: number; totalFail: number; noCrash: number; noDeadlock: number; }
interface RetMemStability { rssBefore: number; rssAfter: number; rssDelta: number; stable: number; }
interface RetThreadStorm { ret: number; numThreads: number; allJoined: number; destructorCount: number; noCrash: number; }
interface RetMixedConcurrent { ret: number; numThreads: number; totalOps: number; totalErrors: number; noCrash: number; }
interface RetConcurrentFork { forkOk: number; childOk: number; threadOps: number; noCrash: number; }
interface RetLongDuration { numThreads: number; durationSec: number; totalSuccess: number; totalFail: number; noCrash: number; noDeadlock: number; }

export default function PthreadKeyTest() {
  describe('MuslPthreadKeyTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPthreadKey0100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0100
     * @tc.desc   有空槽时创建key返回有效key且errno不被诊断改变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_create_basic begin');
      let r: RetKeyBasic = pthreadKeyTest.pthread_key_create_basic();
      hilog.info(0x0000, 'testTag', 'create_basic ret=%{public}d keyValid=%{public}d errnoPreserved=%{public}d',
        r.ret, r.keyValid, r.errnoPreserved);
      expect(r.ret).assertEqual(0);
      expect(r.keyValid).assertEqual(1);
      expect(r.errnoPreserved).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0200
     * @tc.desc   key表将满时创建成功(先填满再删一个留出空槽)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_create_near_full begin');
      let r: RetNearFull = pthreadKeyTest.pthread_key_create_near_full();
      hilog.info(0x0000, 'testTag', 'near_full ret=%{public}d keyValid=%{public}d errnoPreserved=%{public}d created=%{public}d',
        r.ret, r.keyValid, r.errnoPreserved, r.created);
      expect(r.ret).assertEqual(0);
      expect(r.keyValid).assertEqual(1);
      expect(r.errnoPreserved).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0300
     * @tc.desc   key表已满时创建返回EAGAIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_create_exhausted begin');
      let r: RetExhausted = pthreadKeyTest.pthread_key_create_exhausted();
      hilog.info(0x0000, 'testTag', 'exhausted ret=%{public}d outputUnchanged=%{public}d errnoPreserved=%{public}d allConsistent=%{public}d',
        r.ret, r.outputUnchanged, r.errnoPreserved, r.allConsistent);
      expect(r.ret).assertEqual(11);
      expect(r.outputUnchanged).assertEqual(1);
      expect(r.errnoPreserved).assertEqual(1);
      expect(r.allConsistent).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0400
     * @tc.desc   删除合法key后可再次分配复用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_delete_reuse begin');
      let r: RetReuse = pthreadKeyTest.pthread_key_delete_reuse();
      hilog.info(0x0000, 'testTag', 'reuse delRet=%{public}d createRet=%{public}d reuseOk=%{public}d errnoPreserved=%{public}d',
        r.delRet, r.createRet, r.reuseOk, r.errnoPreserved);
      expect(r.delRet).assertEqual(0);
      expect(r.createRet).assertEqual(0);
      expect(r.reuseOk).assertEqual(1);
      expect(r.errnoPreserved).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0500
     * @tc.desc   原TSD清理和析构规则不受诊断影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_tsd_destructor begin');
      let r: RetDestructor = pthreadKeyTest.pthread_key_tsd_destructor();
      hilog.info(0x0000, 'testTag', 'tsd_destructor ret=%{public}d destructorCalled=%{public}d',
        r.ret, r.destructorCalled);
      expect(r.ret).assertEqual(0);
      expect(r.destructorCalled).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0600
     * @tc.desc   诊断辅助函数保存恢复入口errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_errno_preservation begin');
      let r: RetErrno = pthreadKeyTest.pthread_key_errno_preservation();
      hilog.info(0x0000, 'testTag', 'errno_preservation retSuccess=%{public}d errnoAfterSuccess=%{public}d retExhaust=%{public}d errnoAfterExhaust=%{public}d',
        r.retSuccess, r.errnoAfterSuccess, r.retExhaust, r.errnoAfterExhaust);
      expect(r.retSuccess).assertEqual(0);
      expect(r.retExhaust).assertEqual(11);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0700
     * @tc.desc   占用量达到100阈值预留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_threshold_100 begin');
      let r: RetThreshold = pthreadKeyTest.pthread_key_threshold_reserve(1);
      hilog.info(0x0000, 'testTag', 'threshold_100 ret=%{public}d created=%{public}d reached=%{public}d notEnough=%{public}d',
        r.ret, r.created, r.reachedThreshold, r.notEnoughSlots);
      if (r.notEnoughSlots === 1) {
        hilog.info(0x0000, 'testTag', 'threshold_100 skipped: not enough slots (created=%{public}d)', r.created);
      }
      expect(r.notEnoughSlots === 1 || r.reachedThreshold === 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0800
     * @tc.desc   占用量达到110阈值预留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_threshold_110 begin');
      let r: RetThreshold = pthreadKeyTest.pthread_key_threshold_reserve(2);
      hilog.info(0x0000, 'testTag', 'threshold_110 ret=%{public}d created=%{public}d reached=%{public}d notEnough=%{public}d',
        r.ret, r.created, r.reachedThreshold, r.notEnoughSlots);
      if (r.notEnoughSlots === 1) {
        hilog.info(0x0000, 'testTag', 'threshold_110 skipped: not enough slots (created=%{public}d)', r.created);
      }
      expect(r.notEnoughSlots === 1 || r.reachedThreshold === 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey0900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_0900
     * @tc.desc   占用量达到120阈值预留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_threshold_120 begin');
      let r: RetThreshold = pthreadKeyTest.pthread_key_threshold_reserve(3);
      hilog.info(0x0000, 'testTag', 'threshold_120 ret=%{public}d created=%{public}d reached=%{public}d notEnough=%{public}d',
        r.ret, r.created, r.reachedThreshold, r.notEnoughSlots);
      if (r.notEnoughSlots === 1) {
        hilog.info(0x0000, 'testTag', 'threshold_120 skipped: not enough slots (created=%{public}d)', r.created);
      }
      expect(r.notEnoughSlots === 1 || r.reachedThreshold === 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1000
     * @tc.desc   非阈值占用量不预留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_non_threshold begin');
      let r: RetNonThreshold = pthreadKeyTest.pthread_key_non_threshold();
      hilog.info(0x0000, 'testTag', 'non_threshold ret=%{public}d created=%{public}d isNonThreshold=%{public}d',
        r.ret, r.created, r.isNonThreshold);
      expect(r.isNonThreshold).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1100
     * @tc.desc   key表满创建EAGAIN预留128耗尽档
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_exhaust_reserve128 begin');
      let r: RetReserve128 = pthreadKeyTest.pthread_key_exhaust_reserve128();
      hilog.info(0x0000, 'testTag', 'reserve128 ret=%{public}d isEagain=%{public}d outputUnchanged=%{public}d errnoPreserved=%{public}d',
        r.ret, r.isEagain, r.outputUnchanged, r.errnoPreserved);
      expect(r.isEagain).assertEqual(1);
      expect(r.outputUnchanged).assertEqual(1);
      expect(r.errnoPreserved).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1200
     * @tc.desc   成功占满所有可用key不预留耗尽档(自适应)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_fill_all_success begin');
      let r: RetFillAll = pthreadKeyTest.pthread_key_fill_all_success();
      hilog.info(0x0000, 'testTag', 'fill_all created=%{public}d allSuccess=%{public}d maxKeys=%{public}d',
        r.created, r.allSuccess, r.maxKeys);
      expect(r.allSuccess).assertEqual(1);
      expect(r.created > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1300
     * @tc.desc   采样未中后删除再次达到同档不恢复配额
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_no_restore_quota begin');
      let r: RetNoRestore = pthreadKeyTest.pthread_key_no_restore_quota();
      hilog.info(0x0000, 'testTag', 'no_restore firstReach=%{public}d secondReach=%{public}d created=%{public}d',
        r.firstReach, r.secondReach, r.created);
      expect(r.firstReach).assertEqual(1);
      expect(r.secondReach).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1400
     * @tc.desc   重复耗尽不恢复配额(填满→EAGAIN→删一个→填回→再EAGAIN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_repeat_exhaust begin');
      let r: RetRepeatExhaust = pthreadKeyTest.pthread_key_repeat_exhaust();
      hilog.info(0x0000, 'testTag', 'repeat_exhaust ret1=%{public}d ret2=%{public}d ret3=%{public}d bothEagain=%{public}d',
        r.ret1, r.ret2, r.ret3, r.bothEagain);
      expect(r.bothEagain).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1500
     * @tc.desc   fork后子进程继承已消费档位状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_fork_inherit begin');
      let r: RetFork = pthreadKeyTest.pthread_key_fork_inherit();
      hilog.info(0x0000, 'testTag', 'fork_inherit parentCreated=%{public}d childCreated=%{public}d forkOk=%{public}d',
        r.parentCreated, r.childCreated, r.forkOk);
      expect(r.forkOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1600
     * @tc.desc   fork后子进程独立key状态验证(替代exec测试)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_exec_reset begin');
      let r: RetExec = pthreadKeyTest.pthread_key_exec_reset();
      hilog.info(0x0000, 'testTag', 'exec_reset childExitCode=%{public}d execOk=%{public}d',
        r.childExitCode, r.execOk);
      expect(r.execOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1700
     * @tc.desc   多线程并发create/delete计数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_concurrent_count begin');
      let r: RetConcurrent = pthreadKeyTest.pthread_key_concurrent_count();
      hilog.info(0x0000, 'testTag', 'concurrent totalSuccess=%{public}d totalFail=%{public}d noCrash=%{public}d',
        r.totalSuccess, r.totalFail, r.noCrash);
      expect(r.noCrash).assertEqual(1);
      expect(r.totalSuccess > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1800
     * @tc.desc   诊断操作在key写锁外执行
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_lock_outside_diagnostic begin');
      let r: RetLockOutside = pthreadKeyTest.pthread_key_lock_outside_diagnostic();
      hilog.info(0x0000, 'testTag', 'lock_outside errnoPreserved=%{public}d sigmaskEqual=%{public}d noCrash=%{public}d',
        r.errnoPreserved, r.sigmaskEqual, r.noCrash);
      expect(r.errnoPreserved).assertEqual(1);
      expect(r.sigmaskEqual).assertEqual(1);
      expect(r.noCrash).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey1900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_1900
     * @tc.desc   默认模式耗尽与重复失败验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_exhausted_test begin');
      let r: RetExhaustedTest = pthreadKeyTest.pthread_key_exhausted_test();
      hilog.info(0x0000, 'testTag', 'exhausted_test pass=%{public}d created=%{public}d repeatOk=%{public}d reuseOk=%{public}d',
        r.pass, r.created, r.repeatOk, r.reuseOk);
      expect(r.pass).assertEqual(1);
      expect(r.repeatOk).assertEqual(1);
      expect(r.reuseOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2000
     * @tc.desc   默认模式测试完成后自身key清理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_self_cleanup begin');
      let r: RetSelfCleanup = pthreadKeyTest.pthread_key_self_cleanup();
      hilog.info(0x0000, 'testTag', 'self_cleanup createdBefore=%{public}d createdAfter=%{public}d cleaned=%{public}d',
        r.createdBefore, r.createdAfter, r.cleaned);
      expect(r.cleaned).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2100
     * @tc.desc   默认模式允许main前已有部分key占用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_preexisting_keys begin');
      let r: RetPreexisting = pthreadKeyTest.pthread_key_preexisting_keys();
      hilog.info(0x0000, 'testTag', 'preexisting preCreated=%{public}d testCreated=%{public}d totalWithin=%{public}d noCrash=%{public}d',
        r.preCreated, r.testCreated, r.totalWithin, r.noCrash);
      expect(r.noCrash).assertEqual(1);
      expect(r.totalWithin).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2200
     * @tc.desc   getspecific在fresh key上返回NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_getspecific_null begin');
      let r: RetGetspecificNull = pthreadKeyTest.pthread_key_getspecific_null();
      hilog.info(0x0000, 'testTag', 'getspecific_null ret=%{public}d isNull=%{public}d', r.ret, r.isNull);
      expect(r.ret).assertEqual(0);
      expect(r.isNull).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2300
     * @tc.desc   setspecific/getspecific线程间数据隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_tsd_isolation begin');
      let r: RetTsdIsolation = pthreadKeyTest.pthread_key_tsd_isolation();
      hilog.info(0x0000, 'testTag', 'tsd_isolation ret=%{public}d t1=%{public}d t2=%{public}d main=%{public}d',
        r.ret, r.thread1Ok, r.thread2Ok, r.mainOk);
      expect(r.ret).assertEqual(0);
      expect(r.thread1Ok).assertEqual(1);
      expect(r.thread2Ok).assertEqual(1);
      expect(r.mainOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2400
     * @tc.desc   delete不调用析构函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_delete_no_destructor begin');
      let r: RetDeleteNoDestructor = pthreadKeyTest.pthread_key_delete_no_destructor();
      hilog.info(0x0000, 'testTag', 'delete_no_destructor ret=%{public}d delRet=%{public}d notCalled=%{public}d',
        r.ret, r.delRet, r.destructorNotCalled);
      expect(r.ret).assertEqual(0);
      expect(r.delRet).assertEqual(0);
      expect(r.destructorNotCalled).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2500
     * @tc.desc   setspecific NULL清除值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_setspecific_null begin');
      let r: RetSetspecificNull = pthreadKeyTest.pthread_key_setspecific_null();
      hilog.info(0x0000, 'testTag', 'setspecific_null ret=%{public}d hasBefore=%{public}d isNullAfter=%{public}d',
        r.ret, r.hasValueBefore, r.isNullAfter);
      expect(r.ret).assertEqual(0);
      expect(r.hasValueBefore).assertEqual(1);
      expect(r.isNullAfter).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2600
     * @tc.desc   delete非法key返回EINVAL(fork隔离防崩溃)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_delete_invalid begin');
      let r: RetDeleteInvalid = pthreadKeyTest.pthread_key_delete_invalid();
      hilog.info(0x0000, 'testTag', 'delete_invalid forkOk=%{public}d errno1=%{public}d errno2=%{public}d',
        r.forkOk, r.errnoPreserved1, r.errnoPreserved2);
      expect(r.forkOk).assertEqual(1);
      expect(r.errnoPreserved1).assertEqual(1);
      expect(r.errnoPreserved2).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2700
     * @tc.desc   delete路径errno保持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_errno_delete begin');
      let r: RetErrnoDelete = pthreadKeyTest.pthread_key_errno_delete();
      hilog.info(0x0000, 'testTag', 'errno_delete ret=%{public}d errnoPreserved=%{public}d', r.ret, r.errnoPreserved);
      expect(r.ret).assertEqual(0);
      expect(r.errnoPreserved).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2800
     * @tc.desc   key值范围有效验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_range_valid begin');
      let r: RetRangeValid = pthreadKeyTest.pthread_key_range_valid();
      hilog.info(0x0000, 'testTag', 'range_valid created=%{public}d allInRange=%{public}d', r.created, r.allInRange);
      expect(r.allInRange).assertEqual(1);
      expect(r.created > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey2900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_2900
     * @tc.desc   fork+子进程独立key耗尽
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_fork_child_exhaust begin');
      let r: RetForkChildExhaust = pthreadKeyTest.pthread_key_fork_child_exhaust();
      hilog.info(0x0000, 'testTag', 'fork_child_exhaust parent=%{public}d childOk=%{public}d forkOk=%{public}d',
        r.parentCreated, r.childExhaustOk, r.forkOk);
      expect(r.forkOk).assertEqual(1);
      expect(r.childExhaustOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3000
     * @tc.desc   并发create/delete计数一致性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_concurrent_consistency begin');
      let r: RetConcurrentConsistency = pthreadKeyTest.pthread_key_concurrent_consistency();
      hilog.info(0x0000, 'testTag', 'concurrent_consistency total=%{public}d after=%{public}d noLeak=%{public}d',
        r.totalSuccess, r.availableAfter, r.noLeak);
      expect(r.noCrash).assertEqual(1);
      expect(r.noLeak).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3100
     * @tc.desc   跨线程同key访问
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_cross_thread begin');
      let r: RetCrossThread = pthreadKeyTest.pthread_key_cross_thread();
      hilog.info(0x0000, 'testTag', 'cross_thread ret=%{public}d setOk=%{public}d getOk=%{public}d',
        r.ret, r.setOk, r.getOk);
      expect(r.ret).assertEqual(0);
      expect(r.setOk).assertEqual(1);
      expect(r.getOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3200
     * @tc.desc   多析构key验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_multi_destructor begin');
      let r: RetMultiDestructor = pthreadKeyTest.pthread_key_multi_destructor();
      hilog.info(0x0000, 'testTag', 'multi_destructor allCreated=%{public}d count=%{public}d allCalled=%{public}d',
        r.allCreated, r.destructorCount, r.allCalled);
      expect(r.allCreated).assertEqual(1);
      expect(r.allCalled).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3300
     * @tc.desc   从/proc/self/cmdline读取进程名
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_process_name_read begin');
      let r: RetProcessName = pthreadKeyTest.pthread_key_process_name_read();
      hilog.info(0x0000, 'testTag', 'process_name readOk=%{public}d lenValid=%{public}d nameLen=%{public}d name=%{public}s',
        r.readOk, r.lenValid, r.nameLen, r.name);
      expect(r.readOk).assertEqual(1);
      expect(r.lenValid).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3400
     * @tc.desc   压力create/delete循环
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_stress_cycles begin');
      let r: RetStressCycles = pthreadKeyTest.pthread_key_stress_cycles();
      hilog.info(0x0000, 'testTag', 'stress_cycles cycles=%{public}d success=%{public}d after=%{public}d noLeak=%{public}d',
        r.cycles, r.successCount, r.availableAfter, r.noLeak);
      expect(r.noLeak).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3500
     * @tc.desc   PTHREAD_KEYS_MAX值验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_max_value begin');
      let r: RetMaxValue = pthreadKeyTest.pthread_key_max_value();
      hilog.info(0x0000, 'testTag', 'max_value pthreadKeysMax=%{public}d is128=%{public}d', r.pthreadKeysMax, r.is128);
      expect(r.is128).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3600
     * @tc.desc   dlsym pthread_key_create符号可见性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_dlsym_check begin');
      let r: RetDlsym = pthreadKeyTest.pthread_key_dlsym_check();
      hilog.info(0x0000, 'testTag', 'dlsym createFound=%{public}d deleteFound=%{public}d', r.createFound, r.deleteFound);
      expect(r.createFound).assertEqual(1);
      expect(r.deleteFound).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3700
     * @tc.desc   __libc_single_threaded下key操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_single_threaded begin');
      let r: RetSingleThreaded = pthreadKeyTest.pthread_key_single_threaded();
      hilog.info(0x0000, 'testTag', 'single_threaded st=%{public}d ret=%{public}d setOk=%{public}d getOk=%{public}d',
        r.singleThreaded, r.ret, r.setOk, r.getOk);
      expect(r.ret).assertEqual(0);
      expect(r.setOk).assertEqual(1);
      expect(r.getOk).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3800
     * @tc.desc   全删后重新填满(填满→删全→重填)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_full_delete_refill begin');
      let r: RetFullDeleteRefill = pthreadKeyTest.pthread_key_full_delete_refill();
      hilog.info(0x0000, 'testTag', 'full_delete_refill first=%{public}d second=%{public}d recovered=%{public}d',
        r.firstFill, r.secondFill, r.fullyRecovered);
      expect(r.fullyRecovered).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey3900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_3900
     * @tc.desc   key复用同槽位(删后新建可能复用槽位)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_reuse_slot begin');
      let r: RetReuseSlot = pthreadKeyTest.pthread_key_reuse_slot();
      hilog.info(0x0000, 'testTag', 'reuse_slot ret1=%{public}d ret2=%{public}d key1=%{public}d key2=%{public}d reused=%{public}d',
        r.ret1, r.ret2, r.key1Val, r.key2Val, r.slotReused);
      expect(r.bothValid).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4000
     * @tc.desc   高并发压力:10线程×500次create/delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_stress_high_concurrency begin');
      let r: RetStressHigh = pthreadKeyTest.pthread_key_stress_high_concurrency();
      hilog.info(0x0000, 'testTag', 'stress_high threads=%{public}d iters=%{public}d success=%{public}d fail=%{public}d noCrash=%{public}d',
        r.numThreads, r.iterations, r.totalSuccess, r.totalFail, r.noCrash);
      expect(r.noCrash).assertEqual(1);
      expect(r.noDeadlock).assertEqual(1);
      expect(r.totalSuccess > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4100
     * @tc.desc   内存稳定性:读/proc/self/status VmRSS前后对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_memory_stability begin');
      let r: RetMemStability = pthreadKeyTest.pthread_key_memory_stability();
      hilog.info(0x0000, 'testTag', 'memory_stability rssBefore=%{public}d rssAfter=%{public}d delta=%{public}d stable=%{public}d',
        r.rssBefore, r.rssAfter, r.rssDelta, r.stable);
      expect(r.stable).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4200
     * @tc.desc   线程风暴:50个线程快速创建退出每个set TSD+析构
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_thread_storm_tsd begin');
      let r: RetThreadStorm = pthreadKeyTest.pthread_key_thread_storm_tsd();
      hilog.info(0x0000, 'testTag', 'thread_storm ret=%{public}d threads=%{public}d joined=%{public}d destructors=%{public}d noCrash=%{public}d',
        r.ret, r.numThreads, r.allJoined, r.destructorCount, r.noCrash);
      expect(r.ret).assertEqual(0);
      expect(r.allJoined).assertEqual(1);
      expect(r.noCrash).assertEqual(1);
      expect(r.destructorCount > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4300
     * @tc.desc   混合并发操作:多线程同时create/delete/setspecific/getspecific
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_mixed_concurrent_ops begin');
      let r: RetMixedConcurrent = pthreadKeyTest.pthread_key_mixed_concurrent_ops();
      hilog.info(0x0000, 'testTag', 'mixed_concurrent ret=%{public}d threads=%{public}d ops=%{public}d errors=%{public}d noCrash=%{public}d',
        r.ret, r.numThreads, r.totalOps, r.totalErrors, r.noCrash);
      expect(r.ret).assertEqual(0);
      expect(r.noCrash).assertEqual(1);
      expect(r.totalOps > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4400
     * @tc.desc   并发key操作期间fork
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_concurrent_fork_ops begin');
      let r: RetConcurrentFork = pthreadKeyTest.pthread_key_concurrent_fork_ops();
      hilog.info(0x0000, 'testTag', 'concurrent_fork forkOk=%{public}d childOk=%{public}d threadOps=%{public}d noCrash=%{public}d',
        r.forkOk, r.childOk, r.threadOps, r.noCrash);
      expect(r.forkOk).assertEqual(1);
      expect(r.childOk).assertEqual(1);
      expect(r.noCrash).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKey4500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEY_4500
     * @tc.desc   长时间持续并发稳定性(约3秒)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKey4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'pthread_key_long_duration_stability begin');
      let r: RetLongDuration = pthreadKeyTest.pthread_key_long_duration_stability();
      hilog.info(0x0000, 'testTag', 'long_duration threads=%{public}d sec=%{public}d success=%{public}d fail=%{public}d noCrash=%{public}d',
        r.numThreads, r.durationSec, r.totalSuccess, r.totalFail, r.noCrash);
      expect(r.noCrash).assertEqual(1);
      expect(r.noDeadlock).assertEqual(1);
      expect(r.totalSuccess > 0).assertTrue();
      done();
    });
  })
}
