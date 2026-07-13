'use static';
/**
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function SubMenuBuilderTest(): void {
  describe('SubMenuBuilderTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      const pages = routerInstance.getState();
      if (pages.name !== 'onWillAppearOpenMenuIndex') {
        routerInstance.replaceUrl({ url: 'MainAbility/pages/openMenu/onWillAppearOpenMenu' });
      }
      await Utils.sleep(500);
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
    });

    it('SubMenuBuilder_openMenu_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await Utils.sleep(1000);
      const btn = await driver.findComponent(ON.id('onWillAppearOpenMenu'));
      expect(!!btn).assertEqual(true);
      if (btn) {
        await btn.click();
      }
      await Utils.sleep(1500);
      const subItem = await driver.findComponent(ON.text('新建文件夹'));
      expect(subItem !== undefined).assertTrue();
      done();
    });

    it('SubMenuBuilder_subMenu_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await Utils.sleep(1000);
      const btn = await driver.findComponent(ON.id('onWillAppearOpenMenu'));
      if (btn) {
        await btn.click();
      }
      await Utils.sleep(1500);
      const folderItem = await driver.findComponent(ON.text('新建文件夹'));
      expect(!!folderItem).assertEqual(true);
      if (folderItem) {
        await folderItem.click();
      }
      await Utils.sleep(1000);
      const subMenuItem = await driver.findComponent(ON.text('图标'));
      expect(subMenuItem !== undefined).assertTrue();
      done();
    });
  });
}
