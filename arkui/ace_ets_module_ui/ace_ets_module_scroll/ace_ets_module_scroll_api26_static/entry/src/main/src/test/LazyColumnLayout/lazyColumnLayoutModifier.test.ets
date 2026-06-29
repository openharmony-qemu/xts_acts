'use static'
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

export default function lazyColumnLayoutModifier() {
  describe('lazyColumnLayoutModifier', () => {

    beforeAll(async (): Promise<void> => {
      console.info("lazyColumnLayoutModifier beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('lazyColumnLayoutModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyColumnLayout/lazyColumnLayoutModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get lazyColumnLayoutModifier state pages:' + JSON.stringify(pages));
        if (!('lazyColumnLayoutModifier' == pages.name)) {
          console.info('get lazyColumnLayoutModifier pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push lazyColumnLayoutModifier page error:' + err);
      }
      console.info('lazyColumnLayoutModifier beforeEach end');
    });

    /**
     * @tc.name   lazyColumnLayoutModifier_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_MODIFIER_STATIC_0100
     * @tc.desc   Test LazyColumnLayout attributeModifier property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnLayoutModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnLayoutModifier_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumnLayout_modifier');
      console.info("[lazyColumnLayoutModifier_static_0100] space: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')));
      console.info("[lazyColumnLayoutModifier_static_0100] alignItems: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual("20.00vp");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual("HorizontalAlign.Center");
      console.info('[lazyColumnLayoutModifier_static_0100] END');
      done();
    });
  });
}