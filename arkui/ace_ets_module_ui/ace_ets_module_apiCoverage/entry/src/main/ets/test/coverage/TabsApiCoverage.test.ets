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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';


export default function tabsApiCoverageTest() {
  describe('TabsApiCoverageTest', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] TabsApiCoverageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/coverage/TabsApiCoverage',
      };
      try {
        router.clear();
        await router.pushUrl(options);
        await CommonFunc.sleep(1500);
      } catch (err) {
        console.info('[ARKUI_DYN] TabsApiCoverageTest push error:' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_TABSCTRL_0100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_TABSCTRL_0100
     * @tc.desc Cover TabsController.getBarDisplayMode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_TABSCTRL_0100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('tabsCtrlFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_BARSTYLE_0200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_BARSTYLE_0200
     * @tc.desc Cover TabBarStyle BOTTOM/SIDEBAR/SIDEBAR_ADAPTABLE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_BARSTYLE_0200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('tabBarStyleFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_SIDEBARSEARCH_0300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_SIDEBARSEARCH_0300
     * @tc.desc Cover TabsSidebarSearchableOptions and filter callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_SIDEBARSEARCH_0300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('sidebarSearchFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_DISPLAYMODE_0400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_DISPLAYMODE_0400
     * @tc.desc Cover TabBarDisplayMode BOTTOM_TABBAR/SIDEBAR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_DISPLAYMODE_0400', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('displayModeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_BREAKPOINT_0500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_BREAKPOINT_0500
     * @tc.desc Cover TabsBreakpointType sm/md/lg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_BREAKPOINT_0500', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('breakpointFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_TABSATTR_0600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_TABSATTR_0600
     * @tc.desc Cover TabsAttribute sidebar/barStyle/colors APIs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_TABSATTR_0600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('tabsAttrFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_TABVIS_0700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_TABVIS_0700
     * @tc.desc Cover TabVisibility and tabBarVisibility
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_TABVIS_0700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('tabVisibilityFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_FSLAUNCH_0800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_FSLAUNCH_0800
     * @tc.desc Cover FullScreenLaunchComponent and content builder
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_FSLAUNCH_0800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('fsLaunchFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_DYNLAYOUT_0900
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_DYNLAYOUT_0900
     * @tc.desc Cover DynamicLayout interface and attribute
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_DYNLAYOUT_0900', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('dynamicLayoutFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_UICTXTYPE_1000
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_UICTXTYPE_1000
     * @tc.desc Cover GestureEventListenerCallback and NodeIdentity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_UICTXTYPE_1000', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('uiCtxTypeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_APPRESP_1100
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_APPRESP_1100
     * @tc.desc Cover AppResponse.versionCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_APPRESP_1100', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('appRespFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_CONTENT_1200
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_CONTENT_1200
     * @tc.desc Cover Content type symbol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_CONTENT_1200', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('contentFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_COMMONTYPES_1300
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_COMMONTYPES_1300
     * @tc.desc Cover Summary/DataSyncOptions/SheetOptions/TipsMessageType
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_COMMONTYPES_1300', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('commonTypesFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_PROGRESSMASK_1400
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_PROGRESSMASK_1400
     * @tc.desc Cover ProgressMask.enableBreathingAnimation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_PROGRESSMASK_1400', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('progressMaskFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_SHAPE_1500
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_SHAPE_1500
     * @tc.desc Cover EllipseShape and PathShape constructors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_SHAPE_1500', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('shapeFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_COMMONMETHOD_1600
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_COMMONMETHOD_1600
     * @tc.desc Cover CommonMethod borderWidth/borderColor/useEffect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_COMMONMETHOD_1600', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('commonMethodFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_COMPONENT3D_1700
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_COMPONENT3D_1700
     * @tc.desc Cover Component3DInterface constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_COMPONENT3D_1700', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('component3dFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_TABS_APICOVERAGE_PAGETRANS_1800
     * @tc.name SUB_ARKUI_TABS_APICOVERAGE_PAGETRANS_1800
     * @tc.desc Cover CommonTransition via PageTransitionEnter/Exit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKUI_TABS_APICOVERAGE_PAGETRANS_1800', Level.LEVEL1, async (done: Function) => {
      let node = getInspectorByKey('pageTransFlag');
      expect(JSON.parse(node).$attrs.content).assertEqual('ok');
      done();
    });
  });
}
