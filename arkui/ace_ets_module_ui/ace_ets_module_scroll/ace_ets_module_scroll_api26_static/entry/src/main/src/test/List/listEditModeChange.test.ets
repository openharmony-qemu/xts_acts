'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function listEditModeChange() {
  describe('listEditModeChange', () => {

    beforeAll(async (): Promise<void> => {
      console.info("listEditModeChange beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('listEditModeChange beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listEditModeChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get listEditModeChange state pages:' + JSON.stringify(pages));
        if (!('listEditModeChange' == pages.name)) {
          console.info('get listEditModeChange pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push listEditModeChange page error:' + err);
      }
      console.info('listEditModeChange beforeEach end');
    });

    /**
     * @tc.name   listEditModeChange_static_0100
     * @tc.number SUB_ARKUI_LIST_ONEDITMODECHANGE_STATIC_0100
     * @tc.desc   Test List onEditModeChange property with value true and false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn_true = await driver.findComponent(ON.id('list_enableEditMode_change'));
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let result = AppStorage.get<boolean>('list_onEditModeChange');
      console.info('[listEditModeChange_static_0100] result: ' + JSON.stringify(result));
      expect(AppStorage.get<boolean>('list_onEditModeChange')).assertEqual(true);
      await CommonFunc.sleep(500);

      let btn_false = await driver.findComponent(ON.id('list_enableEditMode_change'));
      await (btn_false?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let result2 = AppStorage.get<boolean>('list_onEditModeChange');
      console.info('[listEditModeChange_static_0100] result2: ' + JSON.stringify(result2));
      expect(AppStorage.get<boolean>('list_onEditModeChange')).assertEqual(false);
      await CommonFunc.sleep(500);
      AppStorage.delete('list_onEditModeChange')
      done();
    });

    /**
     * @tc.name   listEditModeChange_static_0200
     * @tc.number SUB_ARKUI_LIST_ONEDITMODECHANGE_STATIC_0200
     * @tc.desc   Test List onEditModeChange property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeChange_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_onEditModeChange_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').tryGetElement('onEditModeChange');
      console.log('[listEditModeChange_static_0200] onEditModeChange: '+ content)
      expect(obj.getElement('$attrs').tryGetElement('onEditModeChange')).assertEqual(undefined);
      done();
    });
  })
}