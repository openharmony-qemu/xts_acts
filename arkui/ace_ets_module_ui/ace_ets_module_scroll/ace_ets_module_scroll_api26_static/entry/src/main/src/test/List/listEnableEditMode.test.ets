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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function listEnableEditMode() {
  describe('listEnableEditMode', () => {

    beforeEach(async () => {
      console.info('listEnableEditMode beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/listEnableEditMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get listEnableEditMode state pages:' + JSON.stringify(pages));
        if (!('listEnableEditMode' == pages.name)) {
          console.info('get listEnableEditMode pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push listEnableEditMode page error:' + err);
      }
      console.info('listEnableEditMode beforeEach end');
    });

    /**
     * @tc.name   listEnableEditMode_static_0100
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_STATIC_0100
     * @tc.desc   Test List enableEditMode property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_enableEditMode_true');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('enableEditMode');
      console.log('[listEnableEditMode_static_0100] enableEditMode: '+ content)
      expect(obj.getElement('$attrs').getString('enableEditMode')).assertEqual('true');
      done();
    });

    /**
     * @tc.name   listEnableEditMode_static_0200
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_STATIC_0200
     * @tc.desc   Test List enableEditMode property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_enableEditMode_false');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('enableEditMode');
      console.log('[listEnableEditMode_static_0200] enableEditMode: '+ content)
      expect(obj.getElement('$attrs').getString('enableEditMode')).assertEqual('false');
      done();
    });

    /**
     * @tc.name   listEnableEditMode_static_0300
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_STATIC_0300
     * @tc.desc   Test List enableEditMode property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('list_enableEditMode_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let content = obj.getElement('$attrs').getString('enableEditMode');
      console.log('[listEnableEditMode_static_0300] enableEditMode: '+ content)
      expect(obj.getElement('$attrs').getString('enableEditMode')).assertEqual('false');
      done();
    });
  })
}
