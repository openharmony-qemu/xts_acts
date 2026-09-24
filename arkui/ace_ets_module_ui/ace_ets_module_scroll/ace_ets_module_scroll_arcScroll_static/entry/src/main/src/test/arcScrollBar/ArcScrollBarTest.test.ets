'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component, Rect, Point } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ArcScrollBarTest() {
  describe('ArcScrollBarTest', () => {
    beforeEach(async () => {
      console.info('ArcScrollBarTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/arcScrollBar/ArcScrollBarTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ArcScrollBarTest state pages:' + JSON.stringify(pages));
        if (!('ArcScrollBarTest' == pages.name)) {
          console.info('get ArcScrollBarTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ArcScrollBarTest page error:' + err);
      }
      console.info('ArcScrollBarTest beforeEach end');
    });

    /**
     * @tc.name   ArcScrollBarCreate_static_0100
     * @tc.number SUB_ARKUI_ARCSCROLLBAR_CREATE_STATIC_0100
     * @tc.desc   Test ArcScrollBar is created successfully with scroller and state options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ArcScrollBarCreate_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ArcScrollBarCreate_static_0100] START');
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let scrollBar = await driver.findComponent(ON.type('ArcScrollBar'));
        expect(scrollBar !== null).assertTrue();
        console.info('[ArcScrollBarCreate_static_0100] END');
        done();
      } catch (error) {
        console.error('[ArcScrollBarCreate_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
