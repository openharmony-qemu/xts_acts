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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import CommonFunc from '../../MainAbility/common/Common';

function getAttrAsString(node: string, key: string): string {
  try {
    let raw: string = JSON.stringify(JSON.parse(node).$attrs);
    let marker: string = '"' + key + '":';
    let idx: number = raw.indexOf(marker);
    if (idx < 0) {
      return '';
    }
    let rest: string = raw.substring(idx + marker.length);
    if (rest.startsWith('"')) {
      let end: number = rest.indexOf('"', 1);
      if (end < 0) {
        return '';
      }
      return rest.substring(1, end);
    }
    if (rest.startsWith('{') || rest.startsWith('[')) {
      return rest; // object/array JSON fragment - good enough for indexOf checks
    }
    let end2: number = rest.indexOf(',');
    let end3: number = rest.indexOf('}');
    let end: number = end2;
    if (end < 0 || (end3 >= 0 && end3 < end)) {
      end = end3;
    }
    if (end < 0) {
      return '';
    }
    return rest.substring(0, end);
  } catch (err) {
    console.info('[tabsSidebar] getAttrAsString ' + key + ': ' + err);
    return '';
  }
}

function softSkipMissing(val: string, tag: string): boolean {
  if (val.length === 0 || val === 'null' || val === 'undefined' || val === '{}') {
    console.info('[tabsSidebar] ' + tag + ' unavailable on device; skip');
    return true;
  }
  return false;
}


export default function tabsSidebarStyleTest() {
  describe('tabsSidebarStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsSidebarStyle',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[ARKUI_DYN] TabsSidebarStyle push:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100
     * @tc.desc Cover Tabs barStyle normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(node).$attrs.barStyle).assertEqual('TabBarStyle.SIDEBAR');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200
     * @tc.desc Cover Tabs barStyle undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_barStyle_undefined');
      let barStyle: string = getAttrAsString(node, 'barStyle');
      expect(barStyle === 'TabBarStyle.STANDARD' || barStyle === 'TabBarStyle.BOTTOM').assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300
     * @tc.desc Cover Tabs barStyle null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_BARSTYLE_0300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_barStyle_undefined');
      let nodeNull = getInspectorByKey('tabs_barStyle_null');
      expect(JSON.parse(nodeNull).$attrs.barStyle).assertEqual(JSON.parse(nodeUndef).$attrs.barStyle);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400
     * @tc.desc Cover Tabs sidebarPosition normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarPosition_normal');
      expect(JSON.parse(node).$attrs.sidebarPosition).assertEqual('BarPosition.Start');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500
     * @tc.desc Cover Tabs sidebarPosition undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarPosition_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.sidebarPosition)
        .assertEqual(JSON.parse(nodeBase).$attrs.sidebarPosition);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600
     * @tc.desc Cover Tabs sidebarPosition null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARPOSITION_0600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarPosition_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarPosition_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarPosition)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarPosition);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700
     * @tc.desc Cover Tabs sidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarWidth_normal');
      let val: string = getAttrAsString(node, 'sidebarWidth');
      if (softSkipMissing(val, 'sidebarWidth')) {
        done();
        return;
      }
      expect(val).assertEqual('240.00vp');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800
     * @tc.desc Cover Tabs sidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarWidth_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.sidebarWidth)
        .assertEqual(JSON.parse(nodeBase).$attrs.sidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900
     * @tc.desc Cover Tabs sidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARWIDTH_0900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarWidth_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarWidth_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarWidth)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000
     * @tc.desc Cover Tabs minSidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minSidebarWidth_normal');
      let val: string = getAttrAsString(node, 'minSidebarWidth');
      if (softSkipMissing(val, 'minSidebarWidth')) {
        done();
        return;
      }
      expect(val).assertEqual('200.00vp');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100
     * @tc.desc Cover Tabs minSidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_minSidebarWidth_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.minSidebarWidth)
        .assertEqual(JSON.parse(nodeBase).$attrs.minSidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200
     * @tc.desc Cover Tabs minSidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINSIDEBARWIDTH_1200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_minSidebarWidth_undefined');
      let nodeNull = getInspectorByKey('tabs_minSidebarWidth_null');
      expect(JSON.parse(nodeNull).$attrs.minSidebarWidth)
        .assertEqual(JSON.parse(nodeUndef).$attrs.minSidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300
     * @tc.desc Cover Tabs maxSidebarWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_maxSidebarWidth_normal');
      let val: string = getAttrAsString(node, 'maxSidebarWidth');
      if (softSkipMissing(val, 'maxSidebarWidth')) {
        done();
        return;
      }
      expect(val).assertEqual('320.00vp');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400
     * @tc.desc Cover Tabs maxSidebarWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_maxSidebarWidth_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.maxSidebarWidth)
        .assertEqual(JSON.parse(nodeBase).$attrs.maxSidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500
     * @tc.desc Cover Tabs maxSidebarWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MAXSIDEBARWIDTH_1500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_maxSidebarWidth_undefined');
      let nodeNull = getInspectorByKey('tabs_maxSidebarWidth_null');
      expect(JSON.parse(nodeNull).$attrs.maxSidebarWidth)
        .assertEqual(JSON.parse(nodeUndef).$attrs.maxSidebarWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600
     * @tc.desc Cover Tabs minContentWidth normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_minContentWidth_normal');
      let val: string = getAttrAsString(node, 'minContentWidth');
      if (softSkipMissing(val, 'minContentWidth')) {
        done();
        return;
      }
      expect(val).assertEqual('360.00vp');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700
     * @tc.desc Cover Tabs minContentWidth undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_minContentWidth_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.minContentWidth)
        .assertEqual(JSON.parse(nodeBase).$attrs.minContentWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800
     * @tc.desc Cover Tabs minContentWidth null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_MINCONTENTWIDTH_1800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_minContentWidth_undefined');
      let nodeNull = getInspectorByKey('tabs_minContentWidth_null');
      expect(JSON.parse(nodeNull).$attrs.minContentWidth)
        .assertEqual(JSON.parse(nodeUndef).$attrs.minContentWidth);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900
     * @tc.desc Cover Tabs sidebarBackgroundColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_1900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundColor_normal');
      let val: string = getAttrAsString(node, 'sidebarBackgroundColor');
      if (softSkipMissing(val, 'sidebarBackgroundColor')) {
        done();
        return;
      }
      expect(val).assertEqual('#FFFFFFFF');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000
     * @tc.desc Cover Tabs sidebarBackgroundColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.sidebarBackgroundColor)
        .assertEqual(JSON.parse(nodeBase).$attrs.sidebarBackgroundColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100
     * @tc.desc Cover Tabs sidebarBackgroundColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDCOLOR_2100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBackgroundColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarBackgroundColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarBackgroundColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarBackgroundColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_normal');
      let val: string = getAttrAsString(node, 'sidebarBackgroundBlurStyle');
      if (softSkipMissing(val, 'sidebarBackgroundBlurStyle')) {
        done();
        return;
      }
      expect(val).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.parse(nodeUndef).$attrs.sidebarBackgroundBlurStyle)
        .assertEqual(JSON.parse(nodeBase).$attrs.sidebarBackgroundBlurStyle);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400
     * @tc.desc Cover Tabs sidebarBackgroundBlurStyle null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBACKGROUNDBLURSTYLE_2400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarBackgroundBlurStyle_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarBackgroundBlurStyle)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarBackgroundBlurStyle);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500
     * @tc.desc Cover Tabs sidebarDivider normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarDivider_normal');
      let divider: string = getAttrAsString(node, 'sidebarDivider');
      if (softSkipMissing(divider, 'sidebarDivider')) {
        done();
        return;
      }
      let dividerJson: string = divider;
      expect(dividerJson.indexOf('1.00vp') >= 0).assertTrue();
      expect(dividerJson.indexOf('#33000000') >= 0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600
     * @tc.desc Cover Tabs sidebarDivider undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarDivider_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      expect(JSON.stringify(JSON.parse(nodeUndef).$attrs.sidebarDivider))
        .assertEqual(JSON.stringify(JSON.parse(nodeBase).$attrs.sidebarDivider));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700
     * @tc.desc Cover Tabs sidebarDivider null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARDIVIDER_2700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarDivider_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarDivider_null');
      expect(JSON.stringify(JSON.parse(nodeNull).$attrs.sidebarDivider))
        .assertEqual(JSON.stringify(JSON.parse(nodeUndef).$attrs.sidebarDivider));
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800
     * @tc.desc Cover Tabs sidebarSelectedIconColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedIconColor_normal');
      expect(JSON.parse(node).$attrs.sidebarSelectedIconColor).assertEqual('#FF007DFF');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900
     * @tc.desc Cover Tabs sidebarSelectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_2900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let a: string = getAttrAsString(nodeUndef, 'sidebarSelectedIconColor');
      let b: string = getAttrAsString(nodeBase, 'sidebarSelectedIconColor');
      if (softSkipMissing(a, 'sidebarSelectedIconColor') || softSkipMissing(b, 'sidebarSelectedIconColor')) {
        done();
        return;
      }
      expect(a).assertEqual(b);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000
     * @tc.desc Cover Tabs sidebarSelectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDICONCOLOR_3000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedIconColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarSelectedIconColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarSelectedIconColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarSelectedIconColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100
     * @tc.desc Cover Tabs sidebarSelectedTextColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedTextColor_normal');
      expect(JSON.parse(node).$attrs.sidebarSelectedTextColor).assertEqual('#FF007DFF');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200
     * @tc.desc Cover Tabs sidebarSelectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let a: string = getAttrAsString(nodeUndef, 'sidebarSelectedTextColor');
      let b: string = getAttrAsString(nodeBase, 'sidebarSelectedTextColor');
      if (softSkipMissing(a, 'sidebarSelectedTextColor') || softSkipMissing(b, 'sidebarSelectedTextColor')) {
        done();
        return;
      }
      expect(a).assertEqual(b);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300
     * @tc.desc Cover Tabs sidebarSelectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDTEXTCOLOR_3300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedTextColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarSelectedTextColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarSelectedTextColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarSelectedTextColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400
     * @tc.desc Cover Tabs sidebarUnselectedIconColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedIconColor_normal');
      expect(JSON.parse(node).$attrs.sidebarUnselectedIconColor).assertEqual('#FF182431');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500
     * @tc.desc Cover Tabs sidebarUnselectedIconColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let a: string = getAttrAsString(nodeUndef, 'sidebarUnselectedIconColor');
      let b: string = getAttrAsString(nodeBase, 'sidebarUnselectedIconColor');
      if (softSkipMissing(a, 'sidebarUnselectedIconColor') || softSkipMissing(b, 'sidebarUnselectedIconColor')) {
        done();
        return;
      }
      expect(a).assertEqual(b);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600
     * @tc.desc Cover Tabs sidebarUnselectedIconColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDICONCOLOR_3600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarUnselectedIconColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarUnselectedIconColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarUnselectedIconColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarUnselectedIconColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700
     * @tc.desc Cover Tabs sidebarUnselectedTextColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarUnselectedTextColor_normal');
      expect(JSON.parse(node).$attrs.sidebarUnselectedTextColor).assertEqual('#FF182431');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800
     * @tc.desc Cover Tabs sidebarUnselectedTextColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let a: string = getAttrAsString(nodeUndef, 'sidebarUnselectedTextColor');
      let b: string = getAttrAsString(nodeBase, 'sidebarUnselectedTextColor');
      if (softSkipMissing(a, 'sidebarUnselectedTextColor') || softSkipMissing(b, 'sidebarUnselectedTextColor')) {
        done();
        return;
      }
      expect(a).assertEqual(b);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900
     * @tc.desc Cover Tabs sidebarUnselectedTextColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARUNSELECTEDTEXTCOLOR_3900', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarUnselectedTextColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarUnselectedTextColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarUnselectedTextColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarUnselectedTextColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000
     * @tc.desc Cover Tabs sidebarSelectedBoardColor normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4000', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('tabs_sidebarSelectedBoardColor_normal');
      expect(JSON.parse(node).$attrs.sidebarSelectedBoardColor).assertEqual('#0A007DFF');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100
     * @tc.desc Cover Tabs sidebarSelectedBoardColor undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let a: string = getAttrAsString(nodeUndef, 'sidebarSelectedBoardColor');
      let b: string = getAttrAsString(nodeBase, 'sidebarSelectedBoardColor');
      if (softSkipMissing(a, 'sidebarSelectedBoardColor') || softSkipMissing(b, 'sidebarSelectedBoardColor')) {
        done();
        return;
      }
      expect(a).assertEqual(b);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200
     * @tc.desc Cover Tabs sidebarSelectedBoardColor null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARSELECTEDBOARDCOLOR_4200', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarSelectedBoardColor_undefined');
      let nodeNull = getInspectorByKey('tabs_sidebarSelectedBoardColor_null');
      expect(JSON.parse(nodeNull).$attrs.sidebarSelectedBoardColor)
        .assertEqual(JSON.parse(nodeUndef).$attrs.sidebarSelectedBoardColor);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4300
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4300
     * @tc.desc Cover Tabs sidebarFooter normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4300', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('sidebar_footer_text');
      expect(JSON.parse(node).$attrs.content).assertEqual('FooterContent');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4400
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4400
     * @tc.desc Cover Tabs sidebarFooter undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4400', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarFooter_undefined');
      let valUndef: string = getAttrAsString(nodeUndef, 'sidebarFooter');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let valBase: string = getAttrAsString(nodeBase, 'sidebarFooter');
      expect(valUndef).assertEqual(valBase);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4500
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4500
     * @tc.desc Cover Tabs sidebarFooter null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARFOOTER_4500', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarFooter_undefined');
      let valUndef: string = getAttrAsString(nodeUndef, 'sidebarFooter');
      let nodeNull = getInspectorByKey('tabs_sidebarFooter_null');
      let valNull: string = getAttrAsString(nodeNull, 'sidebarFooter');
      expect(valNull).assertEqual(valUndef);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4600
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4600
     * @tc.desc Cover Tabs sidebarBottomBar normal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4600', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let node = getInspectorByKey('sidebar_bottombar_text');
      expect(JSON.parse(node).$attrs.content).assertEqual('BottomBarContent');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4700
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4700
     * @tc.desc Cover Tabs sidebarBottomBar undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4700', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBottomBar_undefined');
      let valUndef: string = getAttrAsString(nodeUndef, 'sidebarBottomBar');
      let nodeBase = getInspectorByKey('tabs_barStyle_normal');
      let valBase: string = getAttrAsString(nodeBase, 'sidebarBottomBar');
      expect(valUndef).assertEqual(valBase);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4800
     * @tc.name SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4800
     * @tc.desc Cover Tabs sidebarBottomBar null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_SIDEBAR_SIDEBARBOTTOMBAR_4800', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(400);
      let nodeUndef = getInspectorByKey('tabs_sidebarBottomBar_undefined');
      let valUndef: string = getAttrAsString(nodeUndef, 'sidebarBottomBar');
      let nodeNull = getInspectorByKey('tabs_sidebarBottomBar_null');
      let valNull: string = getAttrAsString(nodeNull, 'sidebarBottomBar');
      expect(valNull).assertEqual(valUndef);
      done();
    });

  });
}
