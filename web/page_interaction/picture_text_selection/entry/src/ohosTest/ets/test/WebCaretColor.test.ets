/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPABILITY: ('retrieve' | 'gesture')[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 187001;
let driver = Driver.create();

async function runCaretCase(action: string, eventId: number, expected: string | number | boolean): Promise<void> {
  let actual: string | number | boolean = 'unset';
  let got: boolean = false;
  events_emitter.once({
    eventId: eventId,
    priority: events_emitter.EventPriority.LOW
  }, (backData: events_emitter.EventData) => {
    actual = backData?.data?.ACTION;
    got = true;
  });
  Utils.emitEvent(action, EVENT_ID_SET_SUITE_KEY);
  await Utils.waitAndClickComponent(driver, 'WebCaretColorButton', action);
  await Utils.waitForExist(() => got, action + '_returnCheck', true, 300, 50);
  expect(got).assertTrue();
  expect(actual).assertEqual(expected);
}

export default function WebCaretColorTest() {
  describe('WebCaretColorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCaretColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebCaretColor' == pages.name)) {
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id('WebCaretColorButton'), 10000);
        }
      } catch (err) {
        console.error('push WebCaretColor page error: ' + err);
      }
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_PARAM_STRING_0100
     * @tc.name   SUB_WEB_CARETCOLOR_PARAM_STRING_0100
     * @tc.desc   caretColor string #FFFF0000 applies and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_PARAM_STRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorString', 187010, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_PARAM_ENUM_0200
     * @tc.name   SUB_WEB_CARETCOLOR_PARAM_ENUM_0200
     * @tc.desc   caretColor Color.Blue applies and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_PARAM_ENUM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorEnum', 187020, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_PARAM_NULL_0300
     * @tc.name   SUB_WEB_CARETCOLOR_PARAM_NULL_0300
     * @tc.desc   caretColor null resets the attribute and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_PARAM_NULL_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorNull', 187030, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_PARAM_UNDEFINED_0400
     * @tc.name   SUB_WEB_CARETCOLOR_PARAM_UNDEFINED_0400
     * @tc.desc   caretColor undefined resets the attribute and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_PARAM_UNDEFINED_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorUndefined', 187040, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_RETURN_0500
     * @tc.name   SUB_WEB_CARETCOLOR_RETURN_0500
     * @tc.desc   caretColor returns WebAttribute so width can chain and page shows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_RETURN_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorReturn', 187050, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_ERRORCODE_0600
     * @tc.name   SUB_WEB_CARETCOLOR_ERRORCODE_0600
     * @tc.desc   caretColor #00000000 reset sentinel does not throw, error code 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_ERRORCODE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCaretCase('emitCaretColorError', 187060, 0);
        done();
      })
  })
}
