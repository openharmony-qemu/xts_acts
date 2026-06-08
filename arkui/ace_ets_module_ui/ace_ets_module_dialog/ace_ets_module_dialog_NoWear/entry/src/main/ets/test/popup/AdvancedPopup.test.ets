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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

function inspectorContains(text: string): boolean {
  return JSON.stringify(getInspectorTree()).includes(text);
}

export default function AdvancedPopupTest() {
  describe('AdvancedPopupTest', () => {
    beforeEach(async (done: Function) => {
      console.info('AdvancedPopupTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Popup/AdvancedPopup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get AdvancedPopupTest state pages:' + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        await Utils.sleep(2500);
        console.info('push AdvancedPopupTest page result:' + JSON.stringify(result));
      } catch (err) {
        console.error('push AdvancedPopupTest page error:' + err);
      }
      console.info('AdvancedPopupTest beforeEach end');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Popup_AdvancedPopup_0100
     * @tc.name      AdvancedPopupTest_001
     * @tc.desc      To test the Advanced Popup
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     Level 2
     */
    it('AdvancedPopupTest_001', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('AdvancedPopupTest_001 START');
      expect(inspectorContains('message1')).assertTrue();
      console.log('AdvancedPopupTest_001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Popup_AdvancedPopup_0200
     * @tc.name      AdvancedPopupTest_002
     * @tc.desc      To test the Advanced Popup
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     Level 2
     */
    it('AdvancedPopupTest_002', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('AdvancedPopupTest_002 START');
      expect(inspectorContains('message2')).assertTrue();
      console.log('AdvancedPopupTest_002 END');
      done();
    });
  })
}
