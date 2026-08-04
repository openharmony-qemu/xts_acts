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

export default function lazyVGridLayoutModifier() {
  describe('lazyVGridLayoutModifier', () => {

    beforeAll(async (): Promise<void> => {
      console.info("lazyVGridLayoutModifier beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('lazyVGridLayoutModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyVGridLayout/lazyVGridLayoutModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get lazyVGridLayoutModifier state pages:' + JSON.stringify(pages));
        if (!('lazyVGridLayoutModifier' == pages.name)) {
          console.info('get lazyVGridLayoutModifier pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push lazyVGridLayoutModifier page error:' + err);
      }
      console.info('lazyVGridLayoutModifier beforeEach end');
    });

    /**
     * @tc.name   lazyVGridLayoutModifier_static_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_MODIFIER_STATIC_0100
     * @tc.desc   Test LazyVGridLayout attributeModifier property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridLayoutModifier_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVGridLayoutModifier_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyVGridLayout_modifier');
      console.info("[lazyVGridLayoutModifier_static_0100] columnsTemplate: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate')));
      console.info("[lazyVGridLayoutModifier_static_0100] rowsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowsGap')));
      console.info("[lazyVGridLayoutModifier_static_0100] columnsGap: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('ColumnsGap')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnsTemplate'))
        .assertEqual("1fr 1fr");
      console.info('[lazyVGridLayoutModifier_static_0100] END');
      done();
    });
  });
}