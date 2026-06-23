/**
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

const SLEEP_TIME = 1000;
const UI_EVENT_CLICK: number = 10;

export default function showInSubWindowValueTest() {
  describe('showInSubWindowValueTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showInSubWindowValueTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/showInSubWindow',
      }
      let pages = router.getState();
      console.info("get showInSubWindowValueTest state pages: " + JSON.stringify(pages));
      if (pages.name !== 'showInSubWindow') {
        router.clear();
        let result = await router.pushUrl(options);
        await Utils.sleep(3000);
        console.info("push showInSubWindowValueTest success: " + JSON.stringify(result));
      } else {
        await Utils.sleep(1000);
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showInSubWindow_0100
     * @tc.name      showInSubWindow_value_0001
     * @tc.desc      set showInSubWindow:false,levelUniqueId: Normal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showInSubWindow_value_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('showInSubWindow_value_0001 START');
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showInSubWindow_select');
      expect(obj.$attrs.showInSubWindow).assertEqual('false');
      console.info('showInSubWindow_value_0001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showInSubWindow_0200
     * @tc.name      showInSubWindow_value_0002
     * @tc.desc      set showInSubWindow:true,levelUniqueId: Normal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showInSubWindow_value_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('showInSubWindow_value_0002 START');
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showInSubWindow_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showInSubWindow_select');
      expect(obj.$attrs.showInSubWindow).assertEqual('true');
      console.info('showInSubWindow_value_0002 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showInSubWindow_0300
     * @tc.name      showInSubWindow_value_0003
     * @tc.desc      set showInSubWindow:undefined,levelUniqueId: Abnormal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showInSubWindow_value_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('showInSubWindow_value_0003 START');
      let resource: ESObject = Utils.parseInspectorKey('resource');
      let showInSubWindowValue: string = JSON.stringify(resource.$attrs.content);
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showInSubWindow_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showInSubWindow_select');
      if (showInSubWindowValue === '"false"') {
        expect(obj.$attrs.showInSubWindow).assertEqual('false');
      } else {
        expect(obj.$attrs.showInSubWindow).assertEqual('true');
      }
      console.info('showInSubWindow_value_0003 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showInSubWindow_0400
     * @tc.name      showInSubWindow_value_0004
     * @tc.desc      set showInSubWindow:null,levelUniqueId: Abnormal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showInSubWindow_value_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('showInSubWindow_value_0004 START');
      let resource: ESObject = Utils.parseInspectorKey('resource');
      let showInSubWindowValue: string = JSON.stringify(resource.$attrs.content);
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showInSubWindow_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showInSubWindow_select');
      if (showInSubWindowValue === '"false"') {
        expect(obj.$attrs.showInSubWindow).assertEqual('false');
      } else {
        expect(obj.$attrs.showInSubWindow).assertEqual('true');
      }
      console.info('showInSubWindow_value_0004 END');
      done();
    });
  })
}
