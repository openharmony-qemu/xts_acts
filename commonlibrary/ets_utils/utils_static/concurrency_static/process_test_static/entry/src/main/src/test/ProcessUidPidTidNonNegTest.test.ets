'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util';

/**
 * 补充覆盖：uid/pid/tid 非负断言（兼容 root UID=0），不改动原 ProcessSupplementTest。
 */
export default function ProcessUidPidTidNonNegTest(): void {
  describe('ProcessUidPidTidNonNegTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
      // 只读查询，无环境侧效应需恢复
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(500);
    })

    /**
     * @tc.name    ProcessUidPidTidNonNegTest0100
     * @tc.number  SUB_PROCESS_UID_PID_TID_NON_NEG_TEST_0100
     * @tc.desc    Verify StdProcess.uid() is non-negative and stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessUidPidTidNonNegTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessUidPidTidNonNegTest0100';
      console.info(`${caseName}, test start`);
      const firstUid: int = StdProcess.uid();
      expect(typeof firstUid).assertEqual('int');
      expect(firstUid).assertLargerOrEqual(0);
      for (let i = 0; i < 100; i++) {
        const uid: int = StdProcess.uid();
        expect(typeof uid).assertEqual('int');
        expect(uid).assertEqual(firstUid);
      }
      console.info(`${caseName}, test end`);
      done();
    })

    /**
     * @tc.name    ProcessUidPidTidNonNegTest0200
     * @tc.number  SUB_PROCESS_UID_PID_TID_NON_NEG_TEST_0200
     * @tc.desc    Verify StdProcess.pid() is non-negative and stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessUidPidTidNonNegTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessUidPidTidNonNegTest0200';
      console.info(`${caseName}, test start`);
      const firstPid: int = StdProcess.pid();
      expect(typeof firstPid).assertEqual('int');
      expect(firstPid).assertLargerOrEqual(0);
      for (let i = 0; i < 100; i++) {
        const pid: int = StdProcess.pid();
        expect(typeof pid).assertEqual('int');
        expect(pid).assertEqual(firstPid);
      }
      console.info(`${caseName}, test end`);
      done();
    })

    /**
     * @tc.name    ProcessUidPidTidNonNegTest0300
     * @tc.number  SUB_PROCESS_UID_PID_TID_NON_NEG_TEST_0300
     * @tc.desc    Verify StdProcess.tid() is non-negative and stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessUidPidTidNonNegTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessUidPidTidNonNegTest0300';
      console.info(`${caseName}, test start`);
      const firstTid: int = StdProcess.tid();
      expect(typeof firstTid).assertEqual('int');
      expect(firstTid).assertLargerOrEqual(0);
      for (let i = 0; i < 100; i++) {
        const tid: int = StdProcess.tid();
        expect(typeof tid).assertEqual('int');
        expect(tid).assertEqual(firstTid);
      }
      console.info(`${caseName}, test end`);
      done();
    })
  })
}
