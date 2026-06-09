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

export default function showDefaultSelectedIconTest() {
  describe('showDefaultSelectedIconTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showDefaultSelectedIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/showDefaultSelectedIcon',
      }
      let pages = router.getState();
      console.info("get showDefaultSelectedIconTest state pages: " + JSON.stringify(pages));
      if (pages.name !== 'showDefaultSelectedIcon') {
        router.clear();
        let result = await router.pushUrl(options);
        await Utils.sleep(3000);
        console.info("push showDefaultSelectedIconTest success: " + JSON.stringify(result));
      } else {
        await Utils.sleep(1000);
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showDefaultSelectedIcon_0100
     * @tc.name      SUB_ACE_Select_showDefaultSelectedIcon_0100
     * @tc.desc      set showDefaultSelectedIcon:false,levelUniqueId: Normal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0100 START');
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showDefaultSelectedIcon_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showDefaultSelectedIcon_select');
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual('false');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0100 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showDefaultSelectedIcon_0200
     * @tc.name      SUB_ACE_Select_showDefaultSelectedIcon_0200
     * @tc.desc      set showDefaultSelectedIcon:true,levelUniqueId: Normal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0200 START');
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showDefaultSelectedIcon_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showDefaultSelectedIcon_select');
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual('true');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0200 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showDefaultSelectedIcon_0300
     * @tc.name      SUB_ACE_Select_showDefaultSelectedIcon_0300
     * @tc.desc      set showDefaultSelectedIcon:undefined,levelUniqueId: Abnormal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0300 START');
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showDefaultSelectedIcon_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showDefaultSelectedIcon_select');
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual('false');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0300 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Select_showDefaultSelectedIcon_0400
     * @tc.name      SUB_ACE_Select_showDefaultSelectedIcon_0400
     * @tc.desc      set showDefaultSelectedIcon:null,levelUniqueId: Abnormal value
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_Select_showDefaultSelectedIcon_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0400 START');
      await Utils.sleep(SLEEP_TIME);
      expect(sendEventByKey('showDefaultSelectedIcon_button', UI_EVENT_CLICK, '')).assertTrue();
      await Utils.sleep(SLEEP_TIME);
      let obj: ESObject = Utils.parseInspectorKey('showDefaultSelectedIcon_select');
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual('false');
      console.info('SUB_ACE_Select_showDefaultSelectedIcon_0400 END');
      done();
    });
  })
}
