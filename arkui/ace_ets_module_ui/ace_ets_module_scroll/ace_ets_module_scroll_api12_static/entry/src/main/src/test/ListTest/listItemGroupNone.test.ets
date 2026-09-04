'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
export default function listItemGroupNone() {
  describe('listItemGroupNone', () => {
    beforeEach(async (): Promise<void> => {
      console.info("listItemGroupNone beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listItemGroupNone",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listItemGroupNone state pages:" + JSON.stringify(pages));
        if (!("listItemGroupNone" == pages.name)) {
          console.info("get listItemGroupNone pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listItemGroupNone page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listItemGroupNone page error:" + err);
      }
      console.info("listItemGroupNone beforeEach end");
    });


    
    /**
     * @tc.number   listItemGroupNone_static_0100
     * @tc.name     listItemGroupNone_static_0100
     * @tc.desc     listItemGroupNone_static_0100
     * @tc.level    Level.LEVEL0
     */
it('listItemGroupNone_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[listItemGroupNone_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('itemGroupArea_none');
      console.info("[listItemGroupNone_static_0100] component obj is: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info("[listItemGroupNone_static_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('ListItemGroupArea.NONE'); //NONE
      console.info('[listItemGroupNone_static_0100] END');
      done();
    });
  })
}
