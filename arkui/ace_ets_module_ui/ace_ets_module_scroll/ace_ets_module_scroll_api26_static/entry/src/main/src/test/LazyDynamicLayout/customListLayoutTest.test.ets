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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function customListLayoutTest() {
  describe('customListLayoutTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("customListLayoutTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(2000)
    });

    beforeEach(async () => {
      console.info('customListLayoutTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyDynamicLayout/customListLayoutTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get customListLayoutTest state pages:' + JSON.stringify(pages));
        if (!('customListLayoutTest' == pages.name)) {
          console.info('get customListLayoutTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push customListLayoutTest page error:' + err);
      }
      console.info('customListLayoutTest beforeEach end');
    });

    /**
     * @tc.name   customListLayoutTest_static_0100
     * @tc.number SUB_ARKUI_LAZYDYNAMICLAYOUT_TYPE_STATIC_0100
     * @tc.desc   Test LazyDynamicLayout property with type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('customListLayoutTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[customListLayoutTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyDynamicLayout_test');
      console.info("[customListLayoutTest_static_0100] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("LazyDynamicLayout");
      console.info('[customListLayoutTest_static_0100] END');
      done();
    });
  });
}