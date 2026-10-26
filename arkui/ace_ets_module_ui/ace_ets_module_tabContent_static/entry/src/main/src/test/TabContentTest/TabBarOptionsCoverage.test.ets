'use static';
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 800;

export default function tabBarOptionsCoverageTest(): void {
  describe('tabBarOptionsCoverageTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.tabContent.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContent/TabBarOptionsCoverage',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== 'TabBarOptionsCoverage') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('TabBarOptions replaceUrl: ' + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0100
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0100
     * @tc.desc Cover TabBarOptions text normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabBarOptions_text_normal');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('tabBar').getString('text')).assertEqual('Home');
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0200
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0200
     * @tc.desc Cover TabBarOptions text undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_TEXT_0200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabBarOptions_text_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_default');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(JSON.stringify(objUndef.getElement('$attrs').getElement('tabBar')))
        .assertEqual(JSON.stringify(objBase.getElement('$attrs').getElement('tabBar')));
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0300
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0300
     * @tc.desc Cover TabBarOptions badge value normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabBarOptions_badgeValue_normal');
      let obj = JSON.parseJsonElement(strJson);
      let tabBar = obj.getElement('$attrs').getElement('tabBar');
      expect(tabBar.getString('text')).assertEqual('Home');
      expect(tabBar.getElement('badge').getInteger('value')).assertEqual(8);
      expect(tabBar.getElement('badge').getInteger('maxCount')).assertEqual(99);
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0400
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0400
     * @tc.desc Cover TabBarOptions badge value undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEVALUE_0400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabBarOptions_badgeValue_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_text_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(JSON.stringify(objUndef.getElement('$attrs').getElement('tabBar').getElement('badge')))
        .assertEqual(JSON.stringify(objBase.getElement('$attrs').getElement('tabBar').getElement('badge')));
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0500
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0500
     * @tc.desc Cover TabBarOptions badge maxCount normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabBarOptions_badgeMax_normal');
      let obj = JSON.parseJsonElement(strJson);
      let tabBar = obj.getElement('$attrs').getElement('tabBar');
      expect(tabBar.getString('text')).assertEqual('Home');
      expect(tabBar.getElement('badge').getInteger('value')).assertEqual(8);
      expect(tabBar.getElement('badge').getInteger('maxCount')).assertEqual(99);
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0600
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0600
     * @tc.desc Cover TabBarOptions badge maxCount undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_BADGEMAX_0600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabBarOptions_badgeMax_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_badgeValue_normal');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(objUndef.getElement('$attrs').getElement('tabBar').getElement('badge').getInteger('maxCount'))
        .assertEqual(objBase.getElement('$attrs').getElement('tabBar').getElement('badge').getInteger('maxCount'));
    });

    /**
     * @tc.number SUB_ARKUI_TABCONTENT_TABBAR_STATIC_UNDEF_0700
     * @tc.name SUB_ARKUI_TABCONTENT_TABBAR_STATIC_UNDEF_0700
     * @tc.desc Cover TabBarOptions tabBar undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABCONTENT_TABBAR_STATIC_UNDEF_0700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabBarOptions_tabBar_undefined');
      let objUndef = JSON.parseJsonElement(strJsonUndef);
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_default');
      let objBase = JSON.parseJsonElement(strJsonBase);
      expect(JSON.stringify(objUndef.getElement('$attrs').getElement('tabBar')))
        .assertEqual(JSON.stringify(objBase.getElement('$attrs').getElement('tabBar')));
    });

  });
}
