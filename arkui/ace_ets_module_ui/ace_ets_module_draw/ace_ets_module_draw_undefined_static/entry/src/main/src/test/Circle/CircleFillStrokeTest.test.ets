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

import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function CircleFillStrokeTest() {
  describe('CircleFillStrokeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('CircleFillStrokeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Circle/CircleFillStroke',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get CircleFillStroke state pages:' + JSON.stringify(pages));
        if (!('pointsUndefined' == pages.name)) {
          console.info('get CircleFillStroke pages.name:' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CircleFillStroke page error:' + err);
      }
      console.info('CircleFillStroke beforeEach end');
    });

    /**
     * @tc.name   CircleFillStrokeTest_0100
     * @tc.number SUB_ArkUI_Ace_CircleFillStrokeTest_0100
     * @tc.desc   add ArkUI static api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CircleFillStrokeTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[CircleFillStrokeTest_0100] START');
      try {
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('CircleFillStroke1');
      let strJson2 = inspector.getInspectorByKey('CircleFillStroke2');
      let strJson3 = inspector.getInspectorByKey('TextDrawModifier');

      expect(JSON.parseJsonElement(strJson1).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson2).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson3).getString('$type')).assertEqual('Text');

      console.info('[CircleFillStrokeTest_0100] END');
      done();
      } catch (err) {
        console.error('CircleFillStrokeTest_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

  })
}