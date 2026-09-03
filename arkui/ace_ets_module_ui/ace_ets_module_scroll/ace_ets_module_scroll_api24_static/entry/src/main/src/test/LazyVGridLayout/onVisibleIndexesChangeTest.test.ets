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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Component, Driver, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import {
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Entry,
  Image,
  ImageFit,
  Scroller,
  Text,
  TextAttribute,
} from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'

export default function onVisibleIndexesChangeTest() {

  describe('onVisibleIndexesChangeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("onVisibleIndexesChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/onVisibleIndexesChangeTest",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onVisibleIndexesChangeTest state pages:" + JSON.stringify(pages));
        if (!("onVisibleIndexesChangeTest" == pages.name)) {
          console.info("get onVisibleIndexesChangeTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onVisibleIndexesChangeTest page error:" + err);
      }
      console.info("onVisibleIndexesChangeTest beforeEach end");
    });


    /**
     * @tc.name   onVisibleIndexesChangeTest_static_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_0100
     * @tc.desc   Test LazyVGridLayout component with onVisibleIndexesChange event,
     *             verify that LazyVGridLayout component exists and is correctly configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onVisibleIndexesChangeTest_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyVGridLayout_on1');
        console.info("[onVisibleIndexesChangeTest_static_0100] type: " +
          JSON.parseJsonElement(strJson).getString('$type'));

        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("LazyVGridLayout");
        console.info('[onVisibleIndexesChangeTest_static_0100] END');
        done();
      } catch (error) {
        console.error('[onVisibleIndexesChangeTest_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    })
  })
}
