/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import boardInfo from '@ohos.boardInfo'

export default function BoardInfoTest() {
  describe('BoardInfoTest', function () {

    beforeAll(function () {
      console.info('beforeAll: Prerequisites at the test suite level.');
    })
    beforeEach(function () {
      console.info('beforeEach: Prerequisites at the test case level.');
    })
    afterEach(function () {
      console.info('afterEach: Test case-level clearance.');
    })
    afterAll(function () {
      console.info('afterAll: Test suite-level cleanup.');
    })

    console.info('start################################start');

    /**
     * @tc.name boardinfo_test_001
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0100
     * @tc.desc Get the cpuId.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_001 start');
      let cpuId = boardInfo.cpuId;
      if (cpuId != "" && cpuId != null && cpuId != undefined) {
        console.info('the value of boardInfo.cpuId is :' + cpuId);
        expect(cpuId).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value cpuId is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_001 : end');
    })

    /**
     * @tc.name boardinfo_test_002
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0200
     * @tc.desc Get the cpuArch.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_002 start');
      let cpuArch = boardInfo.cpuArch;
      if (cpuArch != "" && cpuArch != null && cpuArch != undefined) {
        console.info('the value of boardInfo.cpuArch is :' + cpuArch);
        expect(cpuArch).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value cpuArch is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_002 : end');
    })

    /**
     * @tc.name boardinfo_test_003
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0300
     * @tc.desc Get the cpuVendor.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_003 start');
      let cpuVendor = boardInfo.cpuVendor;
      if (cpuVendor != "" && cpuVendor != null && cpuVendor != undefined) {
        console.info('the value of boardInfo.cpuVendor is :' + cpuVendor);
        expect(cpuVendor).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value cpuVendor is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_003 : end');
    })

    /**
     * @tc.name boardinfo_test_004
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0400
     * @tc.desc Get the boardSn.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_004 start');
      try {
        let boardSn = boardInfo.boardSn;
        console.info('the value of boardInfo.boardSn is :' + boardSn);
        expect(boardSn).assertInstanceOf('String');
      } catch (err) {
        console.info('boardInfo.boardSn error, code: ' + err.code);
        expect(Number(err.code)).assertEqual(201);
      }
      done();
      console.info('boardinfo_test_004 : end');
    })

    /**
     * @tc.name boardinfo_test_005
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0500
     * @tc.desc Get the boardVendor.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_005 start');
      let boardVendor = boardInfo.boardVendor;
      if (boardVendor != "" && boardVendor != null && boardVendor != undefined) {
        console.info('the value of boardInfo.boardVendor is :' + boardVendor);
        expect(boardVendor).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value boardVendor is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_005 : end');
    })

    /**
     * @tc.name boardinfo_test_006
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0600
     * @tc.desc Get the boardName.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_006 start');
      let boardName = boardInfo.boardName;
      if (boardName != "" && boardName != null && boardName != undefined) {
        console.info('the value of boardInfo.boardName is :' + boardName);
        expect(boardName).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value boardName is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_006 : end');
    })

    /**
     * @tc.name boardinfo_test_007
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0700
     * @tc.desc Get the biosVendor.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_007 start');
      let biosVendor = boardInfo.biosVendor;
      if (biosVendor != "" && biosVendor != null && biosVendor != undefined) {
        console.info('the value of boardInfo.biosVendor is :' + biosVendor);
        expect(biosVendor).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value biosVendor is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_007 : end');
    })

    /**
     * @tc.name boardinfo_test_008
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0800
     * @tc.desc Get the biosVersion.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_008 start');
      let biosVersion = boardInfo.biosVersion;
      if (biosVersion != "" && biosVersion != null && biosVersion != undefined) {
        console.info('the value of boardInfo.biosVersion is :' + biosVersion);
        expect(biosVersion).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value biosVersion is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_008 : end');
    })

    /**
     * @tc.name boardinfo_test_009
     * @tc.number SUB_STARTUP_JS_BOARDINFO_0900
     * @tc.desc Get the biosDate.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('boardinfo_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info('boardinfo_test_009 start');
      let biosDate = boardInfo.biosDate;
      if (biosDate != "" && biosDate != null && biosDate != undefined) {
        console.info('the value of boardInfo.biosDate is :' + biosDate);
        expect(biosDate).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value biosDate is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('boardinfo_test_009 : end');
    })
  })
}
