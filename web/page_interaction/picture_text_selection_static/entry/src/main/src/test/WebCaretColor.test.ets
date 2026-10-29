'use static';
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '../hypium_lib/index';
import Utils from './Util.test';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

async function navigateToWebCaretColorPage(): Promise<void> {
  let driver = Driver.create();
  if (await driver.findComponent(ON.id('WebCaretColorButton')) != null) {
    return;
  }
  await Utils.emitEvent('SwitchNextPageStatic', 10);
  await Utils.clickComponent('WebInitTestButton');
  await Utils.msSleep(1500);
  if (await driver.findComponent(ON.id('WebCaretColorButton')) != null) {
    return;
  }
  await Utils.emitEvent('SwitchNextPageStatic', 10);
  await Utils.clickComponent('WebInitTestButton');
  await Utils.msSleep(1500);
  await Utils.emitEvent('SwitchNextPageStatic', 10);
  await Utils.clickComponent('WebEnableDataDetectorButton');
  await Utils.msSleep(2000);
  if (await driver.findComponent(ON.id('WebCaretColorButton')) != null) {
    return;
  }
  await Utils.emitEvent('emitSwitchToWebCaretColorPage', 10);
  await Utils.clickComponent('WebInitTestButton');
  await Utils.msSleep(2000);
}

async function runCaretCase(action: string, eventId: int, expected: Object): Promise<void> {
  let actual: Object = -1;
  let got: boolean = false;
  events_emitter.once({
    eventId: eventId,
    priority: events_emitter.EventPriority.LOW
  }, (backData: events_emitter.EventData): void => {
    const data = backData.data as Record<string, RecordData>;
    actual = data['ACTION'] as Object;
    got = true;
  });
  await Utils.emitEvent(action, 10);
  await Utils.clickComponent('WebCaretColorButton');
  for (let i: int = 0; i < 50; i++) {
    if (got) {
      break;
    }
    await Utils.msSleep(300);
  }
  expect(got).assertTrue();
  expect(actual).assertEqual(expected);
}

export default function WebCaretColorStaticTest(): void {
  describe('WebCaretColorStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user === undefined) {
        user = '100';
      }
      let cmd: string = 'aa start -a EntryAbility -b com.pageInteraction.test.static -u ' + user;
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(3000);
      await navigateToWebCaretColorPage();
    });

    /**
     * @tc.number SUB_WEB_CARETCOLOR_STATIC_PARAM_STRING_0100
     * @tc.name   SUB_WEB_CARETCOLOR_STATIC_PARAM_STRING_0100
     * @tc.desc   caretColor string #FFFF0000 applies and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_STATIC_PARAM_STRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runCaretCase('emitCaretColorString', 187110, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_STATIC_PARAM_ENUM_0200
     * @tc.name   SUB_WEB_CARETCOLOR_STATIC_PARAM_ENUM_0200
     * @tc.desc   caretColor Color.Blue applies and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_STATIC_PARAM_ENUM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runCaretCase('emitCaretColorEnum', 187120, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_STATIC_PARAM_UNDEFINED_0300
     * @tc.name   SUB_WEB_CARETCOLOR_STATIC_PARAM_UNDEFINED_0300
     * @tc.desc   caretColor undefined resets the attribute and page finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_STATIC_PARAM_UNDEFINED_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runCaretCase('emitCaretColorUndefined', 187130, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_STATIC_RETURN_0400
     * @tc.name   SUB_WEB_CARETCOLOR_STATIC_RETURN_0400
     * @tc.desc   caretColor returns WebAttribute so width can chain and page shows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_STATIC_RETURN_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runCaretCase('emitCaretColorReturn', 187140, true);
        done();
      })

    /**
     * @tc.number SUB_WEB_CARETCOLOR_STATIC_ERRORCODE_0500
     * @tc.name   SUB_WEB_CARETCOLOR_STATIC_ERRORCODE_0500
     * @tc.desc   caretColor #00000000 reset sentinel does not throw, error code 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CARETCOLOR_STATIC_ERRORCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runCaretCase('emitCaretColorError', 187150, 0);
        done();
      })
  })
}
