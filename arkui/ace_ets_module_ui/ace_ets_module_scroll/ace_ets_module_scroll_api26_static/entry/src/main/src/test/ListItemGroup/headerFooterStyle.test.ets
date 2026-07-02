'use static';
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
import { ListItemGroupHeaderFooterStyle } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function headerFooterStyle() {
  describe('headerFooterStyle', () => {

    beforeAll(async (): Promise<void> => {
      console.info("headerFooterStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('headerFooterStyle beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListItemGroup/headerFooterStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get headerFooterStyle state pages:' + JSON.stringify(pages));
        if (!('headerFooterStyle' == pages.name)) {
          console.info('get headerFooterStyle pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push headerFooterStyle page error:' + err);
      }
      console.info('headerFooterStyle beforeEach end');
    });

    
    /**
     * @tc.name   listItemGroupHeaderStyle_static_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_STATIC_0100
     * @tc.desc   Test ListItemGroup headerStyle property with NONE value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupHeaderStyle_static_0100] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_headerStyle_none');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupHeaderStyle_static_0100] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[listItemGroupHeaderStyle_static_0100] headerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('headerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('listItemGroupHeaderStyle_static_0100 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.NONE).assertEqual(0);
      console.info('[listItemGroupHeaderStyle_static_0100] END');
      done();
    })

    /**
     * @tc.name   listItemGroupHeaderStyle_static_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_STATIC_0200
     * @tc.desc   Test ListItemGroup headerStyle property with FLOATING value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupHeaderStyle_static_0200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_headerStyle_floating');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupHeaderStyle_static_0200] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[listItemGroupHeaderStyle_static_0200] headerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('headerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('listItemGroupHeaderStyle_static_0200 FLOATING: ' + ListItemGroupHeaderFooterStyle.FLOATING);
      expect(ListItemGroupHeaderFooterStyle.FLOATING).assertEqual(1);

      console.info('[listItemGroupHeaderStyle_static_0200] END');
      done();
    })

    /**
     * @tc.name   listItemGroupHeaderStyle_static_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_HEADERSTYLE_STATIC_0300
     * @tc.desc   Test ListItemGroup headerStyle property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupHeaderStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupHeaderStyle_static_0300] START');
      await Utils.sleep(1000);
      let strJsonDefault = inspector.getInspectorByKey('list_headerStyle_none');
      let objDefault= JSON.parseJsonElement(strJsonDefault);
      let strJson = inspector.getInspectorByKey('list_headerStyle_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupHeaderStyle_static_0300] headerStyleDefault: " +
        objDefault.getElement('$attrs').tryGetElement('headerStyle'));
      console.info("[listItemGroupHeaderStyle_static_0300] headerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('headerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('[listItemGroupHeaderStyle_static_0300] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_static_0100
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_STATIC_0100
     * @tc.desc   Test ListItemGroup footerStyle property with NONE value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupFooterStyle_static_0100] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_footerStyle_none');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupFooterStyle_static_0100] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[listItemGroupFooterStyle_static_0100] footerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('footerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('ListItemGroupArea_0200 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.NONE).assertEqual(0);
      console.info('[listItemGroupFooterStyle_static_0100] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_static_0200
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_STATIC_0200
     * @tc.desc   Test ListItemGroup footerStyle property with FLOATING value
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupFooterStyle_static_0200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_footerStyle_floating');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupFooterStyle_static_0200] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[listItemGroupFooterStyle_static_0200] footerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('footerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('ListItemGroupArea_0200 NONE: ' + ListItemGroupHeaderFooterStyle.NONE);
      expect(ListItemGroupHeaderFooterStyle.FLOATING).assertEqual(1);
      console.info('[listItemGroupFooterStyle_static_0200] END');
      done();
    })

    /**
     * @tc.name   listItemGroupFooterStyle_static_0300
     * @tc.number SUB_ARKUI_LISTITEMGROUP_FOOTERSTYLE_STATIC_0300
     * @tc.desc   Test ListItemGroup footerStyle property with undefined value, should restore to default
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listItemGroupFooterStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupFooterStyle_static_0300] START');
      await Utils.sleep(1000);
      let strJsonDefault = inspector.getInspectorByKey('list_footerStyle_none');
      let objDefault= JSON.parseJsonElement(strJsonDefault);
      let strJson = inspector.getInspectorByKey('list_footerStyle_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[listItemGroupFooterStyle_static_0300] footerStyleDefault: " +
        objDefault.getElement('$attrs').tryGetElement('footerStyle'));
      console.info("[listItemGroupFooterStyle_static_0300] footerStyle: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('footerStyle'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('ListItemGroup');
      console.info('[listItemGroupFooterStyle_static_0300] END');
      done();
    })
  })
}