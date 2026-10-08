'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import boardInfo from '@ohos.boardInfo'

export default function BoardInfoTest() {
  describe("BoardInfoTest", (): void => {
    const hasSysCap: boolean = canIUse('SystemCapability.Startup.BoardInfo');

    beforeAll((): void => {
      console.info('BoardInfoTest beforeAll');
    })

    /**
     * @tc.name   boardinfo_test_static_0100
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0100
     * @tc.desc   Get the cpuId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0100 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let cpuId = boardInfo.cpuId;
      console.info('the value of boardInfo.cpuId is :' + cpuId);
      expect(typeof cpuId).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0100 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0200
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0200
     * @tc.desc   Get the cpuArch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0200 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let cpuArch = boardInfo.cpuArch;
      console.info('the value of boardInfo.cpuArch is :' + cpuArch);
      expect(typeof cpuArch).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0200 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0300
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0300
     * @tc.desc   Get the cpuVendor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0300 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let cpuVendor = boardInfo.cpuVendor;
      console.info('the value of boardInfo.cpuVendor is :' + cpuVendor);
      expect(typeof cpuVendor).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0300 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0400
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0400
     * @tc.desc   Get the boardSn with permission, expect success or permission denied error 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0400 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        let boardSn = boardInfo.boardSn;
        console.info('the value of boardInfo.boardSn is :' + boardSn);
        expect(typeof boardSn).assertEqual('string');
      } catch (err) {
        console.info('boardInfo.boardSn permission denied, code: ' + err.code);
        expect(err.code).assertEqual(201);
      }
      done();
      console.info('boardinfo_test_static_0400 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0500
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0500
     * @tc.desc   Get the boardVendor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0500 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let boardVendor = boardInfo.boardVendor;
      console.info('the value of boardInfo.boardVendor is :' + boardVendor);
      expect(typeof boardVendor).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0500 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0600
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0600
     * @tc.desc   Get the boardName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0600 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let boardName = boardInfo.boardName;
      console.info('the value of boardInfo.boardName is :' + boardName);
      expect(typeof boardName).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0600 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0700
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0700
     * @tc.desc   Get the biosVendor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0700 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let biosVendor = boardInfo.biosVendor;
      console.info('the value of boardInfo.biosVendor is :' + biosVendor);
      expect(typeof biosVendor).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0700 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0800
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0800
     * @tc.desc   Get the biosVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0800 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let biosVersion = boardInfo.biosVersion;
      console.info('the value of boardInfo.biosVersion is :' + biosVersion);
      expect(typeof biosVersion).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0800 : end');
    })

    /**
     * @tc.name   boardinfo_test_static_0900
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0900
     * @tc.desc   Get the biosDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_test_static_0900 start');
      if (!hasSysCap) {
        console.info('not supported, skip');
        expect(true).assertTrue();
        done();
        return;
      }
      let biosDate = boardInfo.biosDate;
      console.info('the value of boardInfo.biosDate is :' + biosDate);
      expect(typeof biosDate).assertEqual('string');
      done();
      console.info('boardinfo_test_static_0900 : end');
    })
  })
}
