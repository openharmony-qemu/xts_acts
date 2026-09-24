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
 * 补充覆盖：realtime/cpu/uptime 数值语义（编译期 long，运行时不用 typeof 'long'），
 * 不改动原 ProcessInterfacetTest。
 * StdProcess 为静态 ArkTS 进程全局 API（与同仓其它用例一致，无需显式 import）。
 */
export default function ProcessRealtimeValueTest(): void {
  describe('ProcessRealtimeValueTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
      // 只读接口，无共享可变状态需要恢复
    })
     afterAll(async (): Promise<void> => { await Utils.msSleep(500); });

    /**
     * @tc.name    ProcessRealtimeValueTest0100
     * @tc.number  SUB_PROCESS_REALTIME_VALUE_TEST_0100
     * @tc.desc    Verify getStartRealtime() remains stable across repeated calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessRealtimeValueTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessRealtimeValueTest0100';
      console.info(`${caseName}, test start`);
       const startTime: long = StdProcess.getStartRealtime();
       for (let i = 0; i < 10; i++) {
         const currentTime: long = StdProcess.getStartRealtime();
         expect(startTime).assertEqual(currentTime);
      }
      console.info(`${caseName}, test end`);
      done();
    })

    /**
     * @tc.name    ProcessRealtimeValueTest0200
     * @tc.number  SUB_PROCESS_REALTIME_VALUE_TEST_0200
     * @tc.desc    Verify getPastCpuTime() is non-decreasing across repeated calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessRealtimeValueTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessRealtimeValueTest0200';
      console.info(`${caseName}, test start`);
       let previous: long = StdProcess.getPastCpuTime();
       for (let i = 0; i < 10; i++) {
         const currentTime: long = StdProcess.getPastCpuTime();
         expect(currentTime).assertLargerOrEqual(previous);
         previous = currentTime;
      }
      console.info(`${caseName}, test end`);
      done();
    })

    /**
     * @tc.name    ProcessRealtimeValueTest0300
     * @tc.number  SUB_PROCESS_REALTIME_VALUE_TEST_0300
     * @tc.desc    Verify uptime() is non-decreasing across repeated calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessRealtimeValueTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessRealtimeValueTest0300';
      console.info(`${caseName}, test start`);
       let previous: long = StdProcess.uptime();
       for (let i = 0; i < 10; i++) {
         const currentTime: long = StdProcess.uptime();
         expect(currentTime).assertLargerOrEqual(previous);
         previous = currentTime;
      }
      console.info(`${caseName}, test end`);
      done();
    })
  })
}
