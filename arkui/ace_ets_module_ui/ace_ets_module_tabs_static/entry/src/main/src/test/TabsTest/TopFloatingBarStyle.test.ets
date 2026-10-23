'use static';
/**
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

export default function topFloatingBarStyle(): void {
  describe('topFloatingBarStyle', () => {

    beforeAll(async (): Promise<void> => {
      console.info("topFloatingBarStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.tabs.static", "EntryAbility")
      await UtilsTest.msSleep(2000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('topFloatingBarStyle beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get topFloatingBarStyle state pages:' + JSON.stringify(pages));
        if (!('TopFloatingBarStyle' == pages.name)) {
          console.info('get topFloatingBarStyle pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push topFloatingBarStyle page error:' + err);
      }
      console.info('topFloatingBarStyle beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      console.info('topFloatingBarStyle afterEach');
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0100
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0100
     * @tc.desc   Test barStyle(TOP) with topBarFloatingStyle({barWidth, maskColor, maskHeight}) renders correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_basic');
      console.info('[topFloatingBarStyle_static_0100] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0100] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarStyle_static_0100] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0200
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0200
     * @tc.desc   Test topBarFloatingStyle({barWidth: 400}) renders floating container with specified width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_barWidth');
      console.info('[topFloatingBarStyle_static_0200] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0200] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('barWidth')).assertEqual('400.00vp');
      console.info('[topFloatingBarStyle_static_0200] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0300
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0300
     * @tc.desc   Test topBarFloatingStyle({maskColor, maskHeight}) renders mask with specified color and height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_mask');
      console.info('[topFloatingBarStyle_static_0300] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0300] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('maskColor')).assertEqual('#33000000');
      expect(topBarFloatingStyle.getString('maskHeight')).assertEqual('200.00vp');
      console.info('[topFloatingBarStyle_static_0300] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0400
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0400
     * @tc.desc   Test topBarFloatingStyle({maxWidth: 500}) constrains floating bar width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_maxWidth');
      console.info('[topFloatingBarStyle_static_0400] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0400] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('maxWidth')).assertEqual('500.00vp');
      console.info('[topFloatingBarStyle_static_0400] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0500
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0500
     * @tc.desc   Test topBarFloatingStyle({offset: {x: 20, y: 0}}) offsets floating bar position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_offset');
      console.info('[topFloatingBarStyle_static_0500] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0500] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      console.info('[topFloatingBarStyle_static_0500] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0600
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0600
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: 16, barTopMargin: 8}) renders margins correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0600] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_margin');
      console.info('[topFloatingBarStyle_static_0600] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0600] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('barSideMargin')).assertEqual('16.00vp');
      expect(topBarFloatingStyle.getString('barTopMargin')).assertEqual('8.00vp');
      console.info('[topFloatingBarStyle_static_0600] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0700
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0700
     * @tc.desc   Test barPosition(Start) is ignored when barStyle(TOP) is set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0700] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_barPosition_ignored');
      console.info('[topFloatingBarStyle_static_0700] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarStyle_static_0700] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0800
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0800
     * @tc.desc   Test topBarFloatingStyle({barWidth: '50%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0800] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_barWidth_percent');
      console.info('[topFloatingBarStyle_static_0800] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0800] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('barWidth')).assertEqual('50.00%');
      console.info('[topFloatingBarStyle_static_0800] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_0900
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_0900
     * @tc.desc   Test topBarFloatingStyle({maskHeight: '20%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_0900] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_maskHeight_percent');
      console.info('[topFloatingBarStyle_static_0900] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_0900] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('maskHeight')).assertEqual('20.00%');
      console.info('[topFloatingBarStyle_static_0900] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_1000
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_1000
     * @tc.desc   Test topBarFloatingStyle({maxWidth: '80%'}) percentage value renders correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_1000] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_maxWidth_percent');
      console.info('[topFloatingBarStyle_static_1000] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_1000] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('maxWidth')).assertEqual('80.00%');
      console.info('[topFloatingBarStyle_static_1000] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarStyle_static_1100
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARSTYLE_STATIC_1100
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: '5%', barTopMargin: '2%'}) percentage values render correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarStyle_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarStyle_static_1100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_margin_percent');
      console.info('[topFloatingBarStyle_static_1100] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      let topBarFloatingStyle = obj.getElement('$attrs').getElement('topBarFloatingStyle');
      console.info('[topFloatingBarStyle_static_1100] topBarFloatingStyle: ' + JSON.stringify(topBarFloatingStyle));
      expect(topBarFloatingStyle.getString('barSideMargin')).assertEqual('5.00%');
      expect(topBarFloatingStyle.getString('barTopMargin')).assertEqual('2.00%');
      console.info('[topFloatingBarStyle_static_1100] END');
      done();
    });
  });
}
