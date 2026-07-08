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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function BindContextMenuResponseTypeTest(): void {
  describe('BindContextMenuResponseTypeTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      const pages = routerInstance.getState();
      if (pages.name !== 'BindContextMenuResponseTypeIndex') {
        routerInstance.replaceUrl({
          url: 'MainAbility/pages/bindContextMenu/BindContextMenuResponseType',
        });
      }
      await Utils.sleep(500);
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.number  BindContextMenuResponseType_LongPress_0100
     * @tc.name    BindContextMenuResponseType_LongPress_0100
     * @tc.desc    bindContextMenu with ResponseType.LongPress opens context menu on long press
     * @tc.level   Level.LEVEL0
     */
    it('BindContextMenuResponseType_LongPress_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const btn = await driver.findComponent(ON.id('LongPressText'));
      expect(!!btn).assertEqual(true);
      if (btn) {
        await btn.longClick();
      }
      await CommonFunc.sleep(1000);
      const menuItem = await driver.findComponent(ON.text('context menu item'));
      expect(menuItem !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number  BindContextMenuResponseType_RightClick_0100
     * @tc.name    BindContextMenuResponseType_RightClick_0100
     * @tc.desc    bindContextMenu with ResponseType.RightClick is bound on target column
     * @tc.level   Level.LEVEL0
     */
    it('BindContextMenuResponseType_RightClick_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      await CommonFunc.sleep(1000);
      const column = await driver.findComponent(ON.id('TestColumn'));
      expect(!!column).assertEqual(true);
      const node = JSON.parseJsonElement(inspector.getInspectorByKey('TestColumn'));
      expect(node.getString('$type')).assertEqual('Column');
      const label = await driver.findComponent(ON.id('TestColumnLabel'));
      expect(!!label).assertEqual(true);
      done();
    });
  });
}
