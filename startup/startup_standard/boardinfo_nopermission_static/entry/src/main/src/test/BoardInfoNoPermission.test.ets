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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "@ohos/hypium-static/src/main/indexStatic";
import boardInfo from '@ohos.boardInfo'

export default function BoardInfoNoPermissionTest() {
  describe("BoardInfoNoPermissionTest", (): void => {
    beforeAll((): void => {
      console.info('BoardInfoNoPermissionTest beforeAll');
    })

    /**
     * @tc.name   boardinfo_noperm_test_static_0100
     * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0100
     * @tc.desc   Access boardSn without ohos.permission.ACCESS_BOARD_INFO permission, expect error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_noperm_test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_noperm_test_static_0100 start');
      try {
        let boardSn = boardInfo.boardSn;
        console.info('the value of boardInfo.boardSn is :' + boardSn);
        expect(typeof boardSn).assertEqual('string');
      } catch (err) {
        console.info('boardInfo.boardSn permission denied, code: ' + err.code);
        expect(err.code).assertEqual(201);
      }
      done();
      console.info('boardinfo_noperm_test_static_0100 : end');
    })

    /**
     * @tc.name   boardinfo_noperm_test_static_0200
     * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0200
     * @tc.desc   Access boardSn multiple times without ohos.permission.ACCESS_BOARD_INFO permission, verify error code 201 is consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_noperm_test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_noperm_test_static_0200 start');
      for (let i: int = 0; i < 3; i++) {
        console.info('boardinfo_noperm_test_static_0200 iteration: ' + i);
        try {
          let boardSn = boardInfo.boardSn;
          console.info('boardinfo_noperm_test_static_0200 iteration ' + i + ' boardSn value: ' + boardSn);
          expect(typeof boardSn).assertEqual('string');
        } catch (err) {
          console.info('boardinfo_noperm_test_static_0200 iteration ' + i + ' error code: ' + err.code);
          expect(err.code).assertEqual(201);
        }
      }
      done();
      console.info('boardinfo_noperm_test_static_0200 : end');
    })

    /**
     * @tc.name   boardinfo_noperm_test_static_0300
     * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0300
     * @tc.desc   Verify boardSn error message is not empty when permission denied.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('boardinfo_noperm_test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('boardinfo_noperm_test_static_0300 start');
      try {
        let boardSn = boardInfo.boardSn;
        console.info('the value of boardInfo.boardSn is :' + boardSn);
        expect(typeof boardSn).assertEqual('string');
      } catch (err) {
        console.info('boardInfo.boardSn permission denied, code: ' + err.code + ', message: ' + err.message);
        expect(err.code).assertEqual(201);
        expect(err.message.length).assertLarger(0);
      }
      done();
      console.info('boardinfo_noperm_test_static_0300 : end');
    })
  })
}
