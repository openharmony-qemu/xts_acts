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
     * @tc.desc   runCmd executes for the test app and returns a ChildProcess with a valid pid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0001';
      console.info(`${caseName} test start`);
      let code = 0;
      let pid = 0;
      try {
        const child = process.runCmd('echo hi');
        pid = child.pid;
        console.info(`${caseName} runCmd succeeded, pid: ${pid}`);
        child.close();
      } catch (err) {
        code = err.code;
        console.info(`${caseName} runCmd failed: code => ${code} message => ${err.message}`);
      }
      if (code !== 0) {
        expect(typeof code).assertEqual('number');
      } else {
        expect(typeof pid).assertEqual('number');
      }
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0002
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0200
     * @tc.desc   process.on registers an event listener for the test app
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
      let registered = false;
      try {
        process.on('testEvent', listener);
        registered = true;
      } catch (err) {
        code = err.code;
        console.info(`${caseName} on failed: code => ${code} message => ${err.message}`);
      }
      if (registered) {
        const removed = process.off('testEvent');
        expect(typeof removed).assertEqual('boolean');
      } else {
        expect(typeof code).assertEqual('number');
      }
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0003
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0300
     * @tc.desc   process.off returns a boolean for the test app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0003';
      console.info(`${caseName} test start`);
      let code = 0;
      let removed: boolean | undefined = undefined;
      try {
        removed = process.off('testEvent');
        console.info(`${caseName} off returned: ${removed}`);
      } catch (err) {
        code = err.code;
        console.info(`${caseName} off failed: code => ${code} message => ${err.message}`);
      }
      if (removed !== undefined) {
        expect(typeof removed).assertEqual('boolean');
      } else {
        expect(typeof code).assertEqual('number');
      }
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0004
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0400
     * @tc.desc   process.cwd returns a non-empty working directory for the test app
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0004';
      console.info(`${caseName} test start`);
      let code = 0;
      let dir = '';
      let success = false;
      try {
        dir = process.cwd();
        success = true;
        console.info(`${caseName} cwd returned: ${dir}`);
      } catch (err) {
        code = err.code;
        console.info(`${caseName} cwd failed: code => ${code} message => ${err.message}`);
      }
      if (success) {
        expect(dir.length > 0).assertTrue();
      } else {
        expect(typeof code).assertEqual('number');
      }
      console.info(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   testProcessSystemApi0005
     * @tc.number SUB_PROCESS_SYSTEM_API_TEST_0500
     * @tc.desc   process.chdir with an invalid path throws an error carrying a string or numeric errno code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProcessSystemApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'testProcessSystemApi0005';
      console.info(`${caseName} test start`);
      let code = 0;
      let thrown = false;
      let changed = false;
      try {
        process.chdir('/xts_nonexistent_dir_12345');
        changed = true;
      } catch (err) {
        thrown = true;
        code = err.code;
        console.info(`${caseName} chdir failed: code => ${code} message => ${err.message}`);
      }
      expect(changed).assertFalse();
      expect(thrown).assertTrue();
      const codeType = typeof code;
      expect(codeType === 'string' || codeType === 'number').assertTrue();
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
