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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { Color } from '@ohos.arkui.component'
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

export default function backPressBehaviorList() {
  describe('backPressBehaviorList', () => {

    beforeAll(async (): Promise<void> => {
      console.info("backPressBehaviorList beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('backPressBehaviorList beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/backPressBehaviorList',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get backPressBehaviorList state pages:' + JSON.stringify(pages));
        if (!('backPressBehaviorList' == pages.name)) {
          console.info('get backPressBehaviorList pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push backPressBehaviorList page error:' + err);
      }
      console.info('backPressBehaviorList beforeEach end');
    });


    /**
     * @tc.name   backPressBehaviorList_static_0100
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_STATIC_0100
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[backPressBehaviorList_static_0100] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_backPressBehavior_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[backPressBehaviorList_static_0100] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[backPressBehaviorList_static_0100] backPressBehavior: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('backPressBehavior'));

      expect(obj.getString('$type')).assertEqual('List');
      console.info('[backPressBehaviorList_static_0100] END');
      done();
    });

    /**
     * @tc.name   backPressBehaviorList_static_0200
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_STATIC_0200
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[backPressBehaviorList_static_0200] START');
      await Utils.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_backPressBehavior_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[backPressBehaviorList_static_0200] obj.$type: " + JSON.stringify(obj.getString('$type')));
      console.info("[backPressBehaviorList_static_0200] backPressBehavior: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('backPressBehavior'));

      expect(obj.getString('$type')).assertEqual('List');
      console.info('[backPressBehaviorList_static_0200] END');
      done();
    });

    /**
     * @tc.name   backPressBehaviorList_static_0300
     * @tc.number SUB_ARKUI_LIST_BACKPRESSBEHAVIOR_STATIC_0300
     * @tc.desc   Test List backPressBehavior closeSwipeAction property with undefined value, should restore to default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('backPressBehaviorList_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[backPressBehaviorList_static_0300] START');
      await Utils.sleep(1000);
      let strJsonDefault = inspector.getInspectorByKey('list_backPressBehavior_true');
      let objDefault= JSON.parseJsonElement(strJsonDefault);
      let strJson = inspector.getInspectorByKey('list_backPressBehavior_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[backPressBehaviorList_static_0300] backPressBehaviorDefault: " +
        objDefault.getElement('$attrs').tryGetElement('backPressBehavior'));
      console.info("[backPressBehaviorList_static_0300] backPressBehavior: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('backPressBehavior'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      expect(obj.getElement('$attrs').tryGetElement('backPressBehavior'))
        .assertEqual(objDefault.getElement('$attrs').tryGetElement('backPressBehavior'));
      console.info('[backPressBehaviorList_static_0300] END');
      done();
    })
  })
}