'use static';
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

import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';

const PAGE_URL = 'MainAbility/pages/Menu/subMenuBuilder';
const PAGE_NAME = 'subMenuBuilderIndex';

async function navigatePage(): Promise<void> {
  const routerInstance = AppStorage.get<Router>('router') as Router;
  routerInstance.clear();
  if (routerInstance.getState().name !== PAGE_NAME) {
    routerInstance.replaceUrl({ url: PAGE_URL });
    await CommonFunc.sleep(800);
  }
}

export default function SubMenuBuilderTest(): void {
  describe('SubMenuBuilderTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        await navigatePage();
      } catch (err) {
        console.info('SubMenuBuilderTest beforeEach err: ' + JSON.stringify(err));
      }
    });
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('SubMenuBuilderTest afterEach err: ' + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   SUB_ACE_API26_SubMenuBuilder_0100
     * @tc.number SUB_ACE_API26_SubMenuBuilder_0100
     * @tc.desc   MenuItem subMenuBuilder renders sub-menu SubItemA1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_API26_SubMenuBuilder_0100', Level.LEVEL1, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn?.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemWithSubA'));
      expect(!!menuItem).assertEqual(true);
      await menuItem?.click();
      await CommonFunc.sleep(1000);
      let subItem = await driver.findComponent(ON.text('SubItemA1'));
      expect(!!subItem).assertEqual(true);
      await subItem?.click();
    });

    /**
     * @tc.name   SUB_ACE_API26_SubMenuBuilder_0200
     * @tc.number SUB_ACE_API26_SubMenuBuilder_0200
     * @tc.desc   MenuItem subMenuBuilder different builder SubMenuB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_API26_SubMenuBuilder_0200', Level.LEVEL1, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn?.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemWithSubB'));
      await menuItem?.click();
      await CommonFunc.sleep(1000);
      let subItem = await driver.findComponent(ON.text('SubItemB1'));
      expect(!!subItem).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_SubMenuBuilder_0300
     * @tc.number SUB_ACE_API26_SubMenuBuilder_0300
     * @tc.desc   MenuItem subMenuBuilder undefined has no sub-menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_API26_SubMenuBuilder_0300', Level.LEVEL1, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn?.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemSubUndefined'));
      expect(!!menuItem).assertEqual(true);
      let strJson = inspector.getInspectorByKey('menuItemSubUndefined');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('MenuItem');
      await menuItem?.click();
    });

    /**
     * @tc.name   SUB_ACE_API26_SubMenuBuilder_0400
     * @tc.number SUB_ACE_API26_SubMenuBuilder_0400
     * @tc.desc   MenuItem subMenuBuilder chaining selected and selectIcon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_API26_SubMenuBuilder_0400', Level.LEVEL1, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn?.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemChaining'));
      await menuItem?.click();
      await CommonFunc.sleep(1000);
      let subItem = await driver.findComponent(ON.text('SubItemC1'));
      expect(!!subItem).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_SubMenuBuilder_0500
     * @tc.number SUB_ACE_API26_SubMenuBuilder_0500
     * @tc.desc   MenuItem without subMenuBuilder has no sub-menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_API26_SubMenuBuilder_0500', Level.LEVEL1, async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1500);
      let showBtn = await driver.findComponent(ON.id('showMenuBtn'));
      await showBtn?.click();
      await CommonFunc.sleep(1000);
      let menuItem = await driver.findComponent(ON.id('menuItemNoSub'));
      expect(!!menuItem).assertEqual(true);
    });
  });
}
