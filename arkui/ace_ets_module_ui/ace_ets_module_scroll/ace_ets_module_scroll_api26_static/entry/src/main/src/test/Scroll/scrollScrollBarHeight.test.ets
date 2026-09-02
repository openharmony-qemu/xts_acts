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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ScrollScrollBarHeight() {
  describe('ScrollScrollBarHeight', () => {

    beforeEach(async (): Promise<void> => {
      console.info('ScrollScrollBarHeight beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollScrollBarHeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollScrollBarHeight state pages:' + JSON.stringify(pages));
        if (!('scrollScrollBarHeight' == pages.name)) {
          console.info('get ScrollScrollBarHeight pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push ScrollScrollBarHeight page error:' + err);
      }
      console.info('ScrollScrollBarHeight beforeEach end');
    });

    /**
     * @tc.number ScrollScrollBarHeight_static_0100
     * @tc.name   SUB_ARKUI_SCROLL_SCROLLBARHEIGHT_STATIC_0100
     * @tc.desc   Set the ScrollBarHeight value return 50.00vp.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level.LEVEL0
     */
    it('ScrollScrollBarHeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('scroll_scrollBarHeight');
      let obj = JSON.parseJsonElement(strJson);
      let content :string = obj.getElement('$attrs').getString('scrollBarHeight');
      console.log('[ScrollScrollBarHeight_static_0100] content '+ content)
      expect(content).assertEqual('50.00vp');
      done();
    });
  })
}