'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function DragPreviewOptions() {
  describe('DragPreviewOptions', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragPreviewOptions/DragPreviewOptions',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DragPreviewOptions state pages: ' + JSON.stringify(pages));
        if (!('DragPreviewOptions' == pages.name)) {
          console.info('get DragPreviewOptions state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DragPreviewOptions page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('DragPreviewOptions after each error: ' + err);
      }
      console.info('DragPreviewOptions after each called');
    });

    
    
/**
     * @tc.number   DDragPreviewOptions_static_0010
     * @tc.name     DDragPreviewOptions_static_0010
     * @tc.desc     DDragPreviewOptions_static_0010
     * @tc.level    Level.LEVEL0
     */
it('DDragPreviewOptions_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('DragPreviewOptions_0010 START');
      let driver = Driver.create()
      let text = await (driver.findComponent(ON.id('Text2')) as Promise<Component>);
      let button = await (driver.findComponent(ON.id('TestButton')) as Promise<Component>);
      await text.dragTo(button);
      await CommonFunc.sleep(5000);
      let strJson = inspector.getInspectorByKey('Text1');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info('[DragPreviewOptions_0010] component obj is: ' + JSON.stringify(obj));
      console.info('[DragPreviewOptions_0010] title: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('suc');
      console.info('[DragPreviewOptions_0010] END');
      done();
    });
  })
}