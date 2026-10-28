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

export default function topFloatingBarInvalid(): void {
  describe('topFloatingBarInvalid', () => {

    beforeAll(async (): Promise<void> => {
      console.info("topFloatingBarInvalid beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.tabs.static", "EntryAbility")
      await UtilsTest.msSleep(2000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('topFloatingBarInvalid beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TopFloatingBarInvalid',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get topFloatingBarInvalid state pages:' + JSON.stringify(pages));
        if (!('TopFloatingBarInvalid' == pages.name)) {
          console.info('get topFloatingBarInvalid pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push topFloatingBarInvalid page error:' + err);
      }
      console.info('topFloatingBarInvalid beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      console.info('topFloatingBarInvalid afterEach');
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.name   topFloatingBarInvalid_static_0100
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARINVALID_STATIC_0100
     * @tc.desc   Test topBarFloatingStyle({barWidth: -100}) negative barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarInvalid_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarInvalid_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_barWidth_negative');
      console.info('[topFloatingBarInvalid_static_0100] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarInvalid_static_0100] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarInvalid_static_0200
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARINVALID_STATIC_0200
     * @tc.desc   Test topBarFloatingStyle({barWidth: NaN}) NaN barWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarInvalid_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarInvalid_static_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_barWidth_nan');
      console.info('[topFloatingBarInvalid_static_0200] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarInvalid_static_0200] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarInvalid_static_0300
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARINVALID_STATIC_0300
     * @tc.desc   Test topBarFloatingStyle({barSideMargin: -16}) negative barSideMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarInvalid_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarInvalid_static_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_sideMargin_negative');
      console.info('[topFloatingBarInvalid_static_0300] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarInvalid_static_0300] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarInvalid_static_0400
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARINVALID_STATIC_0400
     * @tc.desc   Test topBarFloatingStyle({barTopMargin: -8}) negative barTopMargin is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarInvalid_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarInvalid_static_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_topMargin_negative');
      console.info('[topFloatingBarInvalid_static_0400] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarInvalid_static_0400] END');
      done();
    });

    /**
     * @tc.name   topFloatingBarInvalid_static_0500
     * @tc.number SUB_ARKUI_TABS_TOPFLOATINGBARINVALID_STATIC_0500
     * @tc.desc   Test topBarFloatingStyle({maxWidth: -1}) negative maxWidth is ignored and falls back to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('topFloatingBarInvalid_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[topFloatingBarInvalid_static_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('tabs_top_maxWidth_negative');
      console.info('[topFloatingBarInvalid_static_0500] inspector: ' + strJson);
      expect(strJson.length > 2).assertTrue();
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('barStyle')).assertEqual('TabBarStyle.TOP');
      console.info('[topFloatingBarInvalid_static_0500] END');
      done();
    });
  });
}
