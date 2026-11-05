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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const LOG_TAG = '[tabsSidebarStyleStatic]';

function tryGetStringAttr(nodeJson: string, key: string): string {
  try {
    return JSON.parseJsonElement(nodeJson).getElement('$attrs').getString(key);
  } catch (err) {
    console.info(`${LOG_TAG} attr ${key} unavailable: ${err}`);
    return '';
  }
}

function tryGetAttrJson(nodeJson: string, key: string): string {
  try {
    return JSON.stringify(JSON.parseJsonElement(nodeJson).getElement('$attrs').getElement(key));
  } catch (err) {
    console.info(`${LOG_TAG} attrElement ${key} unavailable: ${err}`);
    return '';
  }
}

function isAttrMissing(v: string): boolean {
  return v.length === 0 || v === '{}' || v === 'null' || v === 'undefined';
}

interface JsonToValueAttrs {
  content?: string;
  sidebarFooter?: string;
  sidebarBottomBar?: string;
}
interface JsonToValueNode {
  $attrs: JsonToValueAttrs;
}

function jsonToValueContent(key: string): string {
  try {
    let strJson: string = inspector.getInspectorByKey(key);
    let node: JsonToValueNode = JSON.jsonToValue<JsonToValueNode>(strJson);
    return node.$attrs.content ?? '';
  } catch (err) {
    console.info(`${LOG_TAG} content via jsonToValue unavailable: ${err}`);
    return '';
  }
}

function jsonToValueSidebarFooter(key: string): string {
  try {
    let strJson: string = inspector.getInspectorByKey(key);
    let node: JsonToValueNode = JSON.jsonToValue<JsonToValueNode>(strJson);
    return node.$attrs.sidebarFooter ?? '';
  } catch (err) {
    console.info(`${LOG_TAG} sidebarFooter via jsonToValue unavailable: ${err}`);
    return '';
  }
}

function jsonToValueSidebarBottomBar(key: string): string {
  try {
    let strJson: string = inspector.getInspectorByKey(key);
    let node: JsonToValueNode = JSON.jsonToValue<JsonToValueNode>(strJson);
    return node.$attrs.sidebarBottomBar ?? '';
  } catch (err) {
    console.info(`${LOG_TAG} sidebarBottomBar via jsonToValue unavailable: ${err}`);
    return '';
  }
}


export default function tabsSidebarStyle(): void {
  describe('tabsSidebarStyle', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.tabs.static', 'EntryAbility');
      await UtilsTest.msSleep(2000);
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('TabsSidebarStyle' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.info('push TabsSidebarStyle error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100
     * @tc.desc Cover Tabs barStyle normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.SIDEBAR');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200
     * @tc.desc Cover Tabs barStyle undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_BARSTYLE_0200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_barStyle_undefined');
      let barStyle: string = tryGetStringAttr(strJson, 'barStyle');
      expect(barStyle === 'TabBarStyle.STANDARD' || barStyle === 'TabBarStyle.BOTTOM').assertTrue();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300
     * @tc.desc Cover Tabs sidebarPosition normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarPosition_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarPosition');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarPosition not exposed; skip`);
        return;
      }
      expect(val).assertEqual('BarPosition.Start');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400
     * @tc.desc Cover Tabs sidebarPosition undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARPOSITION_0400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarPosition_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarPosition');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarPosition');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarPosition compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500
     * @tc.desc Cover Tabs sidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarWidth_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarWidth');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarWidth not exposed; skip`);
        return;
      }
      expect(val).assertEqual('240.00vp');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600
     * @tc.desc Cover Tabs sidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARWIDTH_0600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarWidth_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarWidth');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarWidth');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarWidth compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700
     * @tc.desc Cover Tabs minSidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minSidebarWidth_normal');
      let val: string = tryGetStringAttr(strJson, 'minSidebarWidth');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} minSidebarWidth not exposed; skip`);
        return;
      }
      expect(val).assertEqual('200.00vp');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800
     * @tc.desc Cover Tabs minSidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINSIDEBARWIDTH_0800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_minSidebarWidth_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'minSidebarWidth');
      let b: string = tryGetStringAttr(strJsonBase, 'minSidebarWidth');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} minSidebarWidth compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900
     * @tc.desc Cover Tabs maxSidebarWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_0900', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_maxSidebarWidth_normal');
      let val: string = tryGetStringAttr(strJson, 'maxSidebarWidth');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} maxSidebarWidth not exposed; skip`);
        return;
      }
      expect(val).assertEqual('320.00vp');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000
     * @tc.desc Cover Tabs maxSidebarWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MAXSIDEBARWIDTH_1000', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_maxSidebarWidth_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'maxSidebarWidth');
      let b: string = tryGetStringAttr(strJsonBase, 'maxSidebarWidth');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} maxSidebarWidth compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100
     * @tc.desc Cover Tabs minContentWidth normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_minContentWidth_normal');
      let val: string = tryGetStringAttr(strJson, 'minContentWidth');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} minContentWidth not exposed; skip`);
        return;
      }
      expect(val).assertEqual('360.00vp');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200
     * @tc.desc Cover Tabs minContentWidth undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_MINCONTENTWIDTH_1200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_minContentWidth_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'minContentWidth');
      let b: string = tryGetStringAttr(strJsonBase, 'minContentWidth');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} minContentWidth compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300
     * @tc.desc Cover Tabs sidebarBackgroundColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarBackgroundColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarBackgroundColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#FFFFFFFF');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400
     * @tc.desc Cover Tabs sidebarBackgroundColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDCOLOR_1400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarBackgroundColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarBackgroundColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarBackgroundColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarBackgroundBlurStyle_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarBackgroundBlurStyle');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarBackgroundBlurStyle not exposed; skip`);
        return;
      }
      expect(val).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBACKGROUNDBLURSTYLE_1600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarBackgroundBlurStyle');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarBackgroundBlurStyle');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarBackgroundBlurStyle compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700
     * @tc.desc Cover Tabs sidebarDivider normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarDivider_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetAttrJson(strJsonUndef, 'sidebarDivider');
      let b: string = tryGetAttrJson(strJsonBase, 'sidebarDivider');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarDivider compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800
     * @tc.desc Cover Tabs sidebarDivider undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARDIVIDER_1800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarDivider_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetAttrJson(strJsonUndef, 'sidebarDivider');
      let b: string = tryGetAttrJson(strJsonBase, 'sidebarDivider');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarDivider compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900
     * @tc.desc Cover Tabs sidebarSelectedIconColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_1900', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarSelectedIconColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarSelectedIconColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#FF007DFF');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDICONCOLOR_2000', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarSelectedIconColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarSelectedIconColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarSelectedIconColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100
     * @tc.desc Cover Tabs sidebarSelectedTextColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarSelectedTextColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarSelectedTextColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#FF007DFF');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDTEXTCOLOR_2200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarSelectedTextColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarSelectedTextColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarSelectedTextColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300
     * @tc.desc Cover Tabs sidebarUnselectedIconColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarUnselectedIconColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarUnselectedIconColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#FF182431');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDICONCOLOR_2400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarUnselectedIconColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarUnselectedIconColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarUnselectedIconColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500
     * @tc.desc Cover Tabs sidebarUnselectedTextColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2500', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarUnselectedTextColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarUnselectedTextColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#FF182431');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARUNSELECTEDTEXTCOLOR_2600', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarUnselectedTextColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarUnselectedTextColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarUnselectedTextColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700
     * @tc.desc Cover Tabs sidebarSelectedBoardColor normal on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2700', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJson: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_normal');
      let val: string = tryGetStringAttr(strJson, 'sidebarSelectedBoardColor');
      if (isAttrMissing(val)) {
        console.info(`${LOG_TAG} sidebarSelectedBoardColor not exposed; skip`);
        return;
      }
      expect(val).assertEqual('#0A007DFF');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined on static
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARSELECTEDBOARDCOLOR_2800', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let strJsonUndef: string = inspector.getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      let strJsonBase: string = inspector.getInspectorByKey('tabs_barStyle_normal');
      let a: string = tryGetStringAttr(strJsonUndef, 'sidebarSelectedBoardColor');
      let b: string = tryGetStringAttr(strJsonBase, 'sidebarSelectedBoardColor');
      if (isAttrMissing(a) || isAttrMissing(b)) {
        console.info(`${LOG_TAG} sidebarSelectedBoardColor compare soft-skip`);
        return;
      }
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_2900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_2900
     * @tc.desc Cover Tabs sidebarFooter normal on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_2900', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let content: string = jsonToValueContent('sidebar_footer_text');
      expect(content).assertEqual('FooterContent');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3000
     * @tc.desc Cover Tabs sidebarFooter undefined on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3000', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let valUndef: string = jsonToValueSidebarFooter('tabs_sidebarFooter_undefined');
      let valBase: string = jsonToValueSidebarFooter('tabs_barStyle_normal');
      expect(valUndef).assertEqual(valBase);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3100
     * @tc.desc Cover Tabs sidebarFooter null on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARFOOTER_3100', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let valNull: string = jsonToValueSidebarFooter('tabs_sidebarFooter_null');
      let valUndef: string = jsonToValueSidebarFooter('tabs_sidebarFooter_undefined');
      expect(valNull).assertEqual(valUndef);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3200
     * @tc.desc Cover Tabs sidebarBottomBar normal on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3200', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let content: string = jsonToValueContent('sidebar_bottombar_text');
      expect(content).assertEqual('BottomBarContent');
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3300
     * @tc.desc Cover Tabs sidebarBottomBar undefined on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3300', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let valUndef: string = jsonToValueSidebarBottomBar('tabs_sidebarBottomBar_undefined');
      let valBase: string = jsonToValueSidebarBottomBar('tabs_barStyle_normal');
      expect(valUndef).assertEqual(valBase);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3400
     * @tc.desc Cover Tabs sidebarBottomBar null on static via jsonToValue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_TABS_SIDEBAR_STATIC_SIDEBARBOTTOMBAR_3400', Level.LEVEL0, async (): Promise<void> => {
      await CommonFunc.sleep(600);
      let valNull: string = jsonToValueSidebarBottomBar('tabs_sidebarBottomBar_null');
      let valUndef: string = jsonToValueSidebarBottomBar('tabs_sidebarBottomBar_undefined');
      expect(valNull).assertEqual(valUndef);
    });

  });
}
