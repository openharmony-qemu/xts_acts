'use static'
/**
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== 'CustomDialogHandedness') {
    routerInstance.replaceUrl({ url: 'MainAbility/pages/CustomDialog/CustomDialogHandedness' });
    await CommonFunc.sleep(1000);
  }
}

export default function CustomDialogHandednessTest(): void {
  describe('CustomDialogHandednessTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.api26.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => { await navigatePage(); });
    afterEach(async (): Promise<void> => { await Utils.sleep(1000); });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogHandedness_0100
     * @tc.number SUB_ACE_API26_CustomDialogHandedness_0100
     * @tc.desc   HandednessFollowMode enum Values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogHandedness_0100', Level.LEVEL0, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('check_enum'));
      await btn?.click();
      await CommonFunc.sleep(500);
      let txt = await driver.findComponent(ON.id('handedness_enum_text'));
      expect(await txt?.getText()).assertEqual('PASS');
    });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogHandedness_0200
     * @tc.number SUB_ACE_API26_CustomDialogHandedness_0200
     * @tc.desc   CustomDialogController adaptToHandedness NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogHandedness_0200', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('open_none'));
      await btn?.click();
      await CommonFunc.sleep(1000);
      let txt = await driver.findComponent(ON.text('mode_NONE'));
      expect(!!txt).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_handedness_btn'));
      await closeBtn?.click();
    });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogHandedness_0300
     * @tc.number SUB_ACE_API26_CustomDialogHandedness_0300
     * @tc.desc   CustomDialogController adaptToHandedness FOLLOW_ANCHOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogHandedness_0300', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('open_anchor'));
      await btn?.click();
      await CommonFunc.sleep(1000);
      let txt = await driver.findComponent(ON.text('mode_FOLLOW_ANCHOR'));
      expect(!!txt).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_handedness_btn'));
      await closeBtn?.click();
    });

    /**
     * @tc.name   SUB_ACE_API26_CustomDialogHandedness_0400
     * @tc.number SUB_ACE_API26_CustomDialogHandedness_0400
     * @tc.desc   CustomDialogController adaptToHandedness FOLLOW_GRIP_HAND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_CustomDialogHandedness_0400', Level.LEVEL0, async () => {
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('open_grip'));
      await btn?.click();
      await CommonFunc.sleep(1000);
      let txt = await driver.findComponent(ON.text('mode_FOLLOW_GRIP_HAND'));
      expect(!!txt).assertEqual(true);
      let closeBtn = await driver.findComponent(ON.id('close_handedness_btn'));
      await closeBtn?.click();
    });
  });
}
