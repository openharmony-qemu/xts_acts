'use static';
/*
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function tabsSidebarDisplayStyle(): void {
  describe('tabsSidebarDisplayStyle', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.tabs.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarDisplayStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('TabsSidebarDisplayStylePage' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.info('push TabsSidebarDisplayStyle error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0100
     * @tc.desc Cover Tabs sidebarDisplayStyle EMBED on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_embed');
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0100] strJson: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let displayStyleValue: string = JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sidebarDisplayStyle')
      );
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0100] sidebarDisplayStyle: ' + displayStyleValue);
      expect(displayStyleValue).assertEqual('"TabsSidebarDisplayStyle.EMBED"');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0200
     * @tc.desc Cover Tabs sidebarDisplayStyle DISPLACE on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_displace');
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0200] strJson: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let displayStyleValue: string = JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sidebarDisplayStyle')
      );
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0200] sidebarDisplayStyle: ' + displayStyleValue);
      expect(displayStyleValue).assertEqual('"TabsSidebarDisplayStyle.DISPLACE"');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300
     * @tc.desc Cover Tabs sidebarDisplayStyle undefined on static, should restore to default EMBED
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_undefined');
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300] strJson: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let strJsonDefault: string = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_default');
      let displayStyleValue: string = JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sidebarDisplayStyle')
      );
      let displayStyleDefaultValue: string = JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getElement('sidebarDisplayStyle')
      );
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300] sidebarDisplayStyle: ' + displayStyleValue);
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0300] default sidebarDisplayStyle: ' + displayStyleDefaultValue);
      expect(displayStyleValue).assertEqual(displayStyleDefaultValue);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0400
     * @tc.desc Cover Tabs sidebarDisplayStyle default (not set) on static, should be EMBED
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_default');
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0400] strJson: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let displayStyleValue: string = JSON.stringifyJsonElement(
        JSON.parseJsonElement(strJson).getElement('$attrs').getElement('sidebarDisplayStyle')
      );
      console.info('[SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDISPLAYSTYLE_0400] sidebarDisplayStyle: ' + displayStyleValue);
      expect(displayStyleValue).assertEqual('"TabsSidebarDisplayStyle.EMBED"');
    });

  });
}
