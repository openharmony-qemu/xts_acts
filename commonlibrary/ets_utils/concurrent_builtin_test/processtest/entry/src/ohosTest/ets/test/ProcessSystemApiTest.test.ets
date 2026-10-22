/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import process from '@ohos.process';

const SYSTEM_API_ERROR_CODE = 202;
const TAG = 'ProcessSystemApiTest';

export default function ProcessSystemApiTest() {
  describe('ProcessSystemApiTest', () => {
    beforeAll(() => {
      console.info(`${TAG}: beforeAll called`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach called`);
    })

    afterEach(() => {
      console.info(`${TAG}: afterEach called`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll called`);
    })

    /**
     * @tc.name   testProcessSystemApi0001
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0100
     * @tc.desc   runCmd is a systemapi and a third-party app is blocked with 202; the ChildProcess chain
     *            (getOutput/getErrorOutput/close/kill) is unreachable for a third-party app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0001';
      console.info(`${caseName} test start`);
      let code = 0;
      try {
        process.runCmd('echo hi');
      } catch (err) {
        code = err.code;
        console.info(`${caseName} blocked: code => ${code} message => ${err.message}`);
      }
      expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0002
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0200
     * @tc.desc   process.on is a systemapi and a third-party app is blocked with 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0002';
      console.info(`${caseName} test start`);
      const listener: process.EventListener = (evt: Object): void => {
        console.info(`${caseName} event: ${evt}`);
      };
      let code = 0;
      try {
        process.on('testEvent', listener);
      } catch (err) {
        code = err.code;
        console.info(`${caseName} blocked: code => ${code} message => ${err.message}`);
      }
      expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0003
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0300
     * @tc.desc   process.off is a systemapi and a third-party app is blocked with 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0003';
      console.info(`${caseName} test start`);
      let code = 0;
      try {
        const removed = process.off('testEvent');
        console.info(`${caseName} off returned: ${removed}`);
      } catch (err) {
        code = err.code;
        console.info(`${caseName} blocked: code => ${code} message => ${err.message}`);
      }
      expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0004
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0400
     * @tc.desc   process.cwd is a systemapi and a third-party app is blocked with 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0004';
      console.info(`${caseName} test start`);
      let code = 0;
      let dir = '';
      try {
        dir = process.cwd();
        console.info(`${caseName} cwd returned: ${dir}`);
      } catch (err) {
        code = err.code;
        console.info(`${caseName} blocked: code => ${code} message => ${err.message}`);
      }
      expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0005
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0500
     * @tc.desc   process.chdir is a systemapi and a third-party app is blocked with 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0005';
      console.info(`${caseName} test start`);
      let code = 0;
      try {
        process.chdir('/tmp');
      } catch (err) {
        code = err.code;
        console.info(`${caseName} blocked: code => ${code} message => ${err.message}`);
      }
      expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0006
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0600
     * @tc.desc   process.ppid is a systemapi; a third-party app either gets 202 or a number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0006';
      console.info(`${caseName} test start`);
      let code = 0;
      let value = 0;
      try {
        value = process.ppid;
      } catch (err) {
        code = err.code;
      }
      if (code !== 0) {
        expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      } else {
        expect(typeof value).assertEqual('number');
      }
      console.info(`${caseName} test end, code: ${code}, value: ${value}`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0007
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0700
     * @tc.desc   process.euid is a systemapi; a third-party app either gets 202 or a number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0007';
      console.info(`${caseName} test start`);
      let code = 0;
      let value = 0;
      try {
        value = process.euid;
      } catch (err) {
        code = err.code;
      }
      if (code !== 0) {
        expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      } else {
        expect(typeof value).assertEqual('number');
      }
      console.info(`${caseName} test end, code: ${code}, value: ${value}`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0008
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0800
     * @tc.desc   process.egid is a systemapi; a third-party app either gets 202 or a number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0008';
      console.info(`${caseName} test start`);
      let code = 0;
      let value = 0;
      try {
        value = process.egid;
      } catch (err) {
        code = err.code;
      }
      if (code !== 0) {
        expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      } else {
        expect(typeof value).assertEqual('number');
      }
      console.info(`${caseName} test end, code: ${code}, value: ${value}`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0009
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0900
     * @tc.desc   process.gid is a systemapi; a third-party app either gets 202 or a number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0009';
      console.info(`${caseName} test start`);
      let code = 0;
      let value = 0;
      try {
        value = process.gid;
      } catch (err) {
        code = err.code;
      }
      if (code !== 0) {
        expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      } else {
        expect(typeof value).assertEqual('number');
      }
      console.info(`${caseName} test end, code: ${code}, value: ${value}`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0010
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_1000
     * @tc.desc   process.groups is a systemapi; a third-party app either gets 202 or a number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0010';
      console.info(`${caseName} test start`);
      let code = 0;
      let value: number[] = [];
      try {
        value = process.groups;
      } catch (err) {
        code = err.code;
      }
      if (code !== 0) {
        expect(code).assertEqual(SYSTEM_API_ERROR_CODE);
      } else {
        expect(Array.isArray(value)).assertTrue();
      }
      console.info(`${caseName} test end, code: ${code}, length: ${value.length}`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0011
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_1100
     * @tc.desc   process.abort is a public API; invoking it terminates the whole process, so only its
     *            presence is asserted in-process (abnormal-exit behavior needs an out-of-process harness)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0011';
      console.info(`${caseName} test start`);
      expect(typeof process.abort).assertEqual('function');
      console.info(`${caseName} test end`);
      Done();
    })
  })
}
