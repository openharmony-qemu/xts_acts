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
import { List, ListItemGroup, ListItem, StickyStyle } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function stickyFooterGroup() {
  describe('stickyFooterGroup', () => {

    beforeAll(async (): Promise<void> => {
      console.info("stickyFooterGroup beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('stickyFooterGroup beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListItemGroup/stickyFooterGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get stickyFooterGroup state pages:' + JSON.stringify(pages));
        if (!('stickyFooterGroup' == pages.name)) {
          console.info('get stickyFooterGroup pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push stickyFooterGroup page error:' + err);
      }
      console.info('stickyFooterGroup beforeEach end');
    });


    /**
     * @tc.name   stickyFooterGroup_static_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_STICKY_FOOTER_STATIC_0100
     * @tc.desc   Test ListItemGroup sticky property with only footer value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('stickyFooterGroup_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[stickyFooterGroup_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('group_sticky_only_footer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[stickyFooterGroup_static_0100] $attrs: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[stickyFooterGroup_static_0100] sticky: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sticky')));
      
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('sticky')))
        .assertEqual('\"StickyStyle.Footer\"');
      console.info('[stickyFooterGroup_static_0100] END');
      done();
    })
  })
}