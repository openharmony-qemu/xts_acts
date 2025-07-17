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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import keyCodeNdk from 'libkeycodendk.so'
import { Driver } from '@kit.TestKit';
import Utils from './common/Utils';

const KEY_CODE_EVENT_OK = 1;
const KEY_CODE_EVENT_ERROR = 0;

export default function KeyCodeNdkTest() {
  describe('KeyCodeNdkTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`KeyCodeTest/KeyCodeTest`, done);
    });
    /**
     * @tc.number  : KEY_APOSTROPHE_TEST
     * @tc.level   : Level3
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('KEY_APOSTROPHE_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_APOSTROPHE_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2063);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_APOSTROPHE();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_APOSTROPHE_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_GRAVE_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_GRAVE_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2056);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_GRAVE();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_GRAVE_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })


    it('KEY_MINUS_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_MINUS_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2057);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_MINUS();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_MINUS_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_EQUALS_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_MINUS_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2058);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_EQUALS();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_MINUS_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_LEFT_BRACKET_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_LEFT_BRACKET_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2059);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_LEFT_BRACKET();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_LEFT_BRACKET_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_RIGHT_BRACKET_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_RIGHT_BRACKET_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2060);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_RIGHT_BRACKET();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_RIGHT_BRACKET_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_BACKSLASH_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_BACKSLASH_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2061);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_BACKSLASH();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_BACKSLASH_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_SEMICOLON_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_SEMICOLON_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2062);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_SEMICOLON();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_SEMICOLON_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_SLASH_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_SLASH_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2064);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_SLASH();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_SLASH_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })

    it('KEY_AT_TEST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>KEY_AT_TEST start====");
          let driver = await Driver.create()
          Utils.sleep(1000)
          await driver.triggerKey(2065);
          Utils.sleep(1000)
          let a: number = keyCodeNdk.GetKeyCodeEvent_KEY_AT();
          expect(KEY_CODE_EVENT_OK).assertEqual(a);
          done()
        } catch (err) {
          console.error("====>KEY_AT_TEST catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_ERROR);
          done()
        }
      })
  })
}
