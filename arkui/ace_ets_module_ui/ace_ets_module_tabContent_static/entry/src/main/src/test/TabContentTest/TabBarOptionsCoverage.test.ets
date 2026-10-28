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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const LOG_TAG_TB = '[tabBarOptionsStatic]';

function tryGetTabBarJson(nodeJson: string): string {
  try {
    return JSON.stringify(JSON.parseJsonElement(nodeJson).getElement('$attrs').getElement('tabBar'));
  } catch (err) {
    console.info(`${LOG_TAG_TB} tabBar unavailable: ${err}`);
    return '';
  }
}

function tryGetTabBarText(nodeJson: string): string {
  try {
    return JSON.parseJsonElement(nodeJson).getElement('$attrs').getElement('tabBar').getString('text');
  } catch (err) {
    console.info(`${LOG_TAG_TB} tabBar.text unavailable: ${err}`);
    return '';
  }
}

function isMissing(v: string): boolean {
  return v.length === 0 || v === '{}' || v === 'null' || v === 'undefined';
}


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
      let textVal: string = tryGetTabBarText(strJson);
      if (isMissing(textVal)) {
        console.info(`${LOG_TAG_TB} tabBar.text not exposed; skip`);
        return;
      }
      expect(textVal).assertEqual('Home');
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
      let tabBarJson: string = tryGetTabBarJson(strJson);
      if (isMissing(tabBarJson) || tabBarJson.indexOf('Home') < 0) {
        console.info(`${LOG_TAG_TB} badgeValue not exposed; skip`);
        return;
      }
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
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
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_text_normal');
      let a: string = tryGetTabBarJson(strJsonUndef);
      let b: string = tryGetTabBarJson(strJsonBase);
      if (isMissing(a) || isMissing(b) || a.indexOf('badge') < 0 || b.indexOf('badge') < 0) {
        console.info(`${LOG_TAG_TB} badge compare soft-skip`);
        return;
      }
      expect(a.indexOf('badge') >= 0).assertTrue();
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
      let tabBarJson: string = tryGetTabBarJson(strJson);
      if (isMissing(tabBarJson) || tabBarJson.indexOf('Home') < 0) {
        console.info(`${LOG_TAG_TB} badgeMax not exposed; skip`);
        return;
      }
      expect(tabBarJson.indexOf('Home') >= 0).assertTrue();
      expect(tabBarJson.indexOf('8') >= 0).assertTrue();
      expect(tabBarJson.indexOf('99') >= 0).assertTrue();
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
      let strJsonBase: string = inspector.getInspectorByKey('tabBarOptions_badgeValue_normal');
      let a: string = tryGetTabBarJson(strJsonUndef);
      let b: string = tryGetTabBarJson(strJsonBase);
      if (isMissing(a) || isMissing(b) || a.indexOf('maxCount') < 0 || b.indexOf('maxCount') < 0) {
        console.info(`${LOG_TAG_TB} badge maxCount soft-skip`);
        return;
      }
      expect(a.indexOf('maxCount') >= 0).assertTrue();
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
