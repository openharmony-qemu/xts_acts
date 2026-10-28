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
    * @tc.name   tabsSidebarDisplayStyle_static_0100
    * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_STATIC_0100
    * @tc.desc   Test Tabs sidebarDisplayStyle with TabsSidebarDisplayStyle.EMBED on static
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL0
    */
   it('tabsSidebarDisplayStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
     await CommonFunc.sleep(1000);
     let strJson = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_embed');
     let obj = JSON.parseJsonElement(strJson);
     let sidebarDisplayStyle = obj.getElement('$attrs').getElement('sidebarDisplayStyle');
     console.log('[tabsSidebarDisplayStyle_static_0100] sidebarDisplayStyle: ' +
JSON.stringify(sidebarDisplayStyle));
     expect(obj.getElement('$attrs').getString('sidebarDisplayStyle')).assertEqual('SidebarDisplayStyle.EMBED');
     done();
   });

   /**
    * @tc.name   tabsSidebarDisplayStyle_static_0200
    * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_STATIC_0200
    * @tc.desc   Test Tabs sidebarDisplayStyle with TabsSidebarDisplayStyle.DISPLACE on static
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL0
    */
   it('tabsSidebarDisplayStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
     await CommonFunc.sleep(1000);
     let strJson = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_displace');
     let obj = JSON.parseJsonElement(strJson);
     let sidebarDisplayStyle = obj.getElement('$attrs').getElement('sidebarDisplayStyle');
     console.log('[tabsSidebarDisplayStyle_static_0200] sidebarDisplayStyle: ' +
JSON.stringify(sidebarDisplayStyle));
     expect(obj.getElement('$attrs').getString('sidebarDisplayStyle')).assertEqual('SidebarDisplayStyle.DISPLACE');
     done();
   });

   /**
    * @tc.name   tabsSidebarDisplayStyle_static_0300
    * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_STATIC_0300
    * @tc.desc   Test Tabs sidebarDisplayStyle with undefined on static, should restore to default EMBED
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL0
    */
   it('tabsSidebarDisplayStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
     await CommonFunc.sleep(1000);
     let strJson = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_undefined');
     let obj = JSON.parseJsonElement(strJson);
     let sidebarDisplayStyle = obj.getElement('$attrs').getElement('sidebarDisplayStyle');
     console.log('[tabsSidebarDisplayStyle_static_0300] sidebarDisplayStyle: ' +
JSON.stringify(sidebarDisplayStyle));
     expect(obj.getElement('$attrs').getString('sidebarDisplayStyle')).assertEqual('SidebarDisplayStyle.EMBED');
     done();
   });

   /**
    * @tc.name   tabsSidebarDisplayStyle_static_0400
    * @tc.number SUB_ARKUI_TABS_SIDEBARDISPLAYSTYLE_STATIC_0400
    * @tc.desc   Test Tabs sidebarDisplayStyle default (not set) on static, should be EMBED
    * @tc.type   FUNCTION
    * @tc.size   SMALLTEST
    * @tc.level  LEVEL0
    */
   it('tabsSidebarDisplayStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
     await CommonFunc.sleep(1000);
     let strJson = inspector.getInspectorByKey('tabs_sidebarDisplayStyle_default');
     let obj = JSON.parseJsonElement(strJson);
     let sidebarDisplayStyle = obj.getElement('$attrs').getElement('sidebarDisplayStyle');
     console.log('[tabsSidebarDisplayStyle_static_0400] sidebarDisplayStyle: ' +
JSON.stringify(sidebarDisplayStyle));
     expect(obj.getElement('$attrs').getString('sidebarDisplayStyle')).assertEqual('SidebarDisplayStyle.EMBED');
     done();
   });

 });
}

