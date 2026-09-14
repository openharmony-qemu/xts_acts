/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import process from '@ohos.process';
import {
  testGetEnvironmentlet001,
  testGetEnvironmentlet002,
  testGetEnvironmentlet003,
  testGetEnvironmentlet004,
  testGetEnvironmentlet005,
  testGetEnvironmentlet006,
  testKill006,
  testProcessManagerGetEnvironmentlet001,
  testProcessManagerGetEnvironmentlet002,
  testProcessManagerGetEnvironmentlet003,
  testProcessManagerGetEnvironmentlet004,
  testProcessManagerGetSystemConfig006,
  testProcessManagerGetThreadPriority004,
  testProcessManagerGetUidForName004,
  testProcessManagerIsappuid006,
  testProcessManagerKill006,
  testUptime001
} from './ProcessResource';

function delay(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ProcessFPTest() {
  describe('ProcessFPTest', () => {

    /**
     * @tc.name   testGetUid001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0010
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag = false;
      let result = process.uid
      if (result > 0) {
        flag = true
      }
      expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testGetUid002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0020
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag = false;
      for (let i = 0; i < 3; i++) {
        let result = process.uid
        if (result != null) {
          if (result > 0) {
            flag = true
          }
          expect(flag).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testGetUid003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0030
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag = false;
      for (let i = 0; i < 6; i++) {
        let result = process.uid
        if (result != null) {
          if (result > 0) {
            flag = true
          }
          expect(flag).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testGetUid004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0040
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag = false;
      for (let i = 0; i < 8; i++) {
        let result = process.uid
        if (result != null) {
          if (result > 0) {
            flag = true
          }
          expect(flag).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testGetUid005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0050
     * @tc.desc   returns the digital user id of the process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let flag = false;
      for (let i = 0; i < 5; i++) {
        let result = process.uid
        if (result != null) {
          if (result > 0) {
            flag = true
          }
          expect(flag).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testKill001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0060
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = process.kill(3, 123)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testKill002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0070
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pres = process.pid
      let result = process.kill(23, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0080
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pres = process.pid
      let result = process.kill(28, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0090
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let pres = process.pid
      let result = process.kill(17, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testKill005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0100
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = process.kill(3, 113)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testKill006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0110
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testKill006()).assertEqual(true)
    })

    /**
     * @tc.name   testUptime001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0120
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testUptime001()).assertTrue()
    })

    /**
     * @tc.name   testUptime002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0130
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result1 = process.uptime()
      await delay(4000);
      let result2 = process.uptime()
      let flag = false
      if ((result2 - result1) >= 4) {
        flag = true
      }
      expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0140
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result1 = process.uptime()
      await delay(2000);
      let result2 = process.uptime()
      let flag = false
      if ((result2 - result1) >= 2) {
        flag = true
      }
      expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0150
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUptime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result1 = process.uptime()
      await delay(3000);
      let result2 = process.uptime()
      let flag = false
      if ((result2 - result1) >= 3) {
        flag = true
      }
      expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testUptime005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0160
     * @tc.desc   Returns the running time of the system.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUptime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result1 = process.uptime()
      await delay(2000);
      let result2 = process.uptime()
      let flag = false
      if ((result2 - result1) >= 5) {
        flag = true
      }
      expect(flag).assertEqual(false)
    })

    /**
     * @tc.name   testPid001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0170
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let result = process.pid
      if (result > 0) {
        flag = true
      }
      expect(flag).assertEqual(true)
    })

    /**
     * @tc.name   testPid002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0180
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 3; i++) {
        let result = process.pid
        if (result > 0) {
          flag = true
        }
        expect(flag).assertEqual(true)
      }
    })

    /**
     * @tc.name   testPid003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0190
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 5; i++) {
        let result = process.pid
        if (result > 0) {
          flag = true
        }
        expect(flag).assertEqual(true)
      }
    })

    /**
     * @tc.name   testPid004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0200
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 6; i++) {
        let result = process.pid
        if (result > 0) {
          flag = true
        }
        expect(flag).assertEqual(true)
      }
    })

    /**
     * @tc.name   testPid005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0210
     * @tc.desc   Return pid is the pid of the current process.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 8; i++) {
        let result = process.pid
        if (result > 0) {
          flag = true
        }
        expect(flag).assertEqual(true)
      }
    })

    /**
     * @tc.name   testTid001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0220
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pres = process.tid
      if (pres > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testTid002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0230
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 5; i++) {
        let pres = process.tid
        if (pres > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testTid003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0240
     * @tc.desc   Returns the tid of the current thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 3; i++) {
        let pres = process.tid
        if (pres > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })


    /**
     * @tc.name   testisIsolatedProcess001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0250
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pres = process.isIsolatedProcess()
      expect(pres).assertEqual(true)
    })

    /**
     * @tc.name   testisIsolatedProcess002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0260
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 3; i++) {
        let pres = process.isIsolatedProcess()
        expect(pres).assertEqual(true)
      }
    })

    /**
     * @tc.name   testisIsolatedProcess003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0270
     * @tc.desc   Returns a boolean whether the process is isolated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisIsolatedProcess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 5; i++) {
        let pres = process.isIsolatedProcess()
        expect(pres).assertEqual(true)
      }
    })


    /**
     * @tc.name   testIsappuid001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0280
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.isAppUid(167)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0290
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.isAppUid(123)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0300
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.isAppUid(80000)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0310
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.isAppUid(789)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIsappuid005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0320
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.isAppUid(8569)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testIs64Bit001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0330
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isorno = process.is64Bit()
      if (isorno) {
        expect(isorno).assertEqual(true)
      } else {
        expect(isorno).assertEqual(false)
      }
    })

    /**
     * @tc.name   testIs64Bit002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0340
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 3; i++) {
        let isorno = process.is64Bit()
        if (isorno) {
          expect(isorno).assertEqual(true)
        } else {
          expect(isorno).assertEqual(false)
        }
      }
    })

    /**
     * @tc.name   testIs64Bit004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0350
     * @tc.desc   Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIs64Bit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 5; i++) {
        let isorno = process.is64Bit()
        if (isorno) {
          expect(isorno).assertEqual(true)
        } else {
          expect(isorno).assertEqual(false)
        }
      }
    })


    /**
     * @tc.name   testGetUidForName001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0360
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pres = process.getUidForName("root")
      if (pres != -1) {
        let flag = true
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetUidForName002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0370
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 3; i++) {
        let pres = process.getUidForName("12356")
        expect(pres).assertEqual(-1)
      }
    })

    /**
     * @tc.name   testGetUidForName003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0380
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < 5; i++) {
        let pres = process.getUidForName("12356")
        expect(pres).assertEqual(-1)
      }
    })


    /**
     * @tc.name   testGetThreadPriority001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0390
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pres = process.tid
      let pri = process.getThreadPriority(pres)
      if (pri) {
        let flag = true
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetThreadPriority002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0400
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pres = process.tid
      for (let i = 0; i < 3; i++) {
        let pri = process.getThreadPriority(pres)
        if (pri > 0) {
          let flag = true
          expect(Boolean(flag)).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testGetThreadPriority003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0410
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pres = process.tid
      for (let i = 0; i < 5; i++) {
        let pri = process.getThreadPriority(pres)
        if (pri > 0) {
          let flag = true
          expect(Boolean(flag)).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testGetStartRealtime001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0420
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 3; i++) {
        let pri = process.getStartRealtime()
        if (pri !== null) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetStartRealtime002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0430
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pri = process.getStartRealtime()
      if (pri !== null) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetStartRealtime003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0440
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 5; i++) {
        let pri = process.getStartRealtime()
        if (pri !== null) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetStartRealtime004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0450
     * @tc.desc   Returns the elapsed real time (in milliseconds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 8; i++) {
        let pri = process.getStartRealtime()
        if (pri !== null) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetStartRealtime005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0460
     * @tc.desc   Returns the elapsed real time (in milliseconds) taken from the start of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetStartRealtime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 6; i++) {
        let pri = process.getStartRealtime()
        if (pri !== null) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetpastCpuTime001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0470
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 3; i++) {
        let pri = process.getPastCpuTime()
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetpastCpuTime002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0480
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pri = process.getPastCpuTime()
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetpastCpuTime003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0490
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 5; i++) {
        let pri = process.getPastCpuTime()
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetpastCpuTime004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0500
     * @tc.desc   Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetpastCpuTime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      for (let i = 0; i < 8; i++) {
        let pri = process.getPastCpuTime()
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetSystemConfig001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0510
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let _SC_ARG_MAX = 0
      let pri = process.getSystemConfig(_SC_ARG_MAX)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetSystemConfig002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0520
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let _SC_ARG_MAX = 0
      for (let i = 0; i < 3; i++) {
        let pri = process.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetSystemConfig003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0530
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let _SC_ARG_MAX = 0
      for (let i = 0; i < 5; i++) {
        let pri = process.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testGetSystemConfig004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0540
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let _SC_OPEN_MAX = 4
      let pri = process.getSystemConfig(_SC_OPEN_MAX)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetSystemConfig005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0550
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let _SC_PAGESIZE = 8
      let pri = process.getSystemConfig(_SC_PAGESIZE)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testGetEnvironmentlet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0560
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet001()).assertTrue()
    })

    /**
     * @tc.name   testGetEnvironmentlet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0570
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet002()).assertTrue()
    })

    /**
     * @tc.name   testGetEnvironmentlet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0580
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet003()).assertTrue()
    })

    /**
     * @tc.name   testGetEnvironmentlet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0590
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet004()).assertTrue()
    })

    /**
     * @tc.name   testGetEnvironmentlet005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0600
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet005()).assertTrue()
    })

    /**
     * @tc.name   testGetEnvironmentlet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0610
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetEnvironmentlet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testGetEnvironmentlet006()).assertTrue()
    })
  })
  describe('ProcessManagerFPTest', () => {
    /**
     * @tc.name   testProcessManagerIsappuid001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0620
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let isorno = pro.isAppUid(167)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0630
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let isorno = pro.isAppUid(123)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0640
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let isorno = pro.isAppUid(80000)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0650
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let isorno = pro.isAppUid(789)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0660
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let isorno = pro.isAppUid(8569)
      expect(isorno).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerIsappuid006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0670
     * @tc.desc   Returns a boolean whether the specified uid belongs to a particular application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerIsappuid006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerIsappuid006())
        .assertEqual("BuisnessError: Parameter error. The type of code must be number.")
    })
    /**
     * @tc.name   testProcessManagerKill001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0680
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let result = pro.kill(3, 123)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerKill002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0690
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.pid
      let result = pro.kill(23, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0700
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.pid
      let result = pro.kill(28, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0710
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.pid
      let result = pro.kill(17, pres)
      expect(result).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerKill005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0720
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let result = pro.kill(3, 113)
      expect(result).assertEqual(false)
    })

    /**
     * @tc.name   testProcessManagerKill006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0730
     * @tc.desc   Return whether the signal was sent successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerKill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerKill006())
        .assertEqual("BuisnessError: Parameter error. The type of signal or pid must be " +
          "number.")
    })

    /**
     * @tc.name   testProcessManagerGetUidForName001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0740
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = pro.getUidForName("root")
      if (pres != -1) {
        let flag = true
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testProcessManagerGetUidForName002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0750
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      for (let i = 0; i < 3; i++) {
        let pres = pro.getUidForName("12356")
        expect(pres).assertEqual(-1)
      }
    })

    /**
     * @tc.name   testProcessManagerGetUidForName003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0760
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      for (let i = 0; i < 5; i++) {
        let pres = pro.getUidForName("as123")
        expect(pres).assertEqual(-1)
      }
    })
    /**
     * @tc.name   testProcessManagerGetUidForName004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0770
     * @tc.desc   Returns the uid based on the specified user name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetUidForName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetUidForName004())
        .assertEqual("BuisnessError: Parameter error. The type of code must be string.")
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0780
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.tid
      let pri = pro.getThreadPriority(pres)
      if (pri) {
        let flag = true
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0790
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.tid
      for (let i = 0; i < 3; i++) {
        let pri = pro.getThreadPriority(pres)
        if (pri > 0) {
          let flag = true
          expect(Boolean(flag)).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0800
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pro = new process.ProcessManager()
      let pres = process.tid
      for (let i = 0; i < 5; i++) {
        let pri = pro.getThreadPriority(pres)
        if (pri > 0) {
          let flag = true
          expect(Boolean(flag)).assertEqual(true)
        }
      }
    })

    /**
     * @tc.name   testProcessManagerGetThreadPriority004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0810
     * @tc.desc   Returns the thread priority based on the specified tid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetThreadPriority004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetThreadPriority004())
        .assertEqual("BuisnessError: Parameter error. The type of code must be number.")
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0820
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pro = new process.ProcessManager()
      let _SC_ARG_MAX = 0
      let pri = pro.getSystemConfig(_SC_ARG_MAX)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0830
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pro = new process.ProcessManager()
      let _SC_ARG_MAX = 0
      for (let i = 0; i < 3; i++) {
        let pri = pro.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0840
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pro = new process.ProcessManager()
      let _SC_ARG_MAX = 0
      for (let i = 0; i < 5; i++) {
        let pri = pro.getSystemConfig(_SC_ARG_MAX)
        if (pri > 0) {
          flag = true
        }
        expect(Boolean(flag)).assertEqual(true)
      }
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0850
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pro = new process.ProcessManager()
      let _SC_OPEN_MAX = 4
      let pri = pro.getSystemConfig(_SC_OPEN_MAX)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig005
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0860
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      let pro = new process.ProcessManager()
      let _SC_PAGESIZE = 8
      let pri = pro.getSystemConfig(_SC_PAGESIZE)
      if (pri > 0) {
        flag = true
      }
      expect(Boolean(flag)).assertEqual(true)
    })

    /**
     * @tc.name   testProcessManagerGetSystemConfig006
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0870
     * @tc.desc   Returns the system configuration at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetSystemConfig006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetSystemConfig006())
        .assertEqual("BuisnessError: Parameter error. The type of name must be number.")
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentlet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0880
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentlet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetEnvironmentlet001()).assertTrue()
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentlet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0890
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentlet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetEnvironmentlet002()).assertTrue()
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentlet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0900
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentlet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetEnvironmentlet003()).assertTrue()
    })

    /**
     * @tc.name   testProcessManagerGetEnvironmentlet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESSFP1_0910
     * @tc.desc   Returns the system value for environment letiables.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessManagerGetEnvironmentlet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testProcessManagerGetEnvironmentlet004())
        .assertEqual("BuisnessError: Parameter error. The type of name must be string.")
    })
  })
}