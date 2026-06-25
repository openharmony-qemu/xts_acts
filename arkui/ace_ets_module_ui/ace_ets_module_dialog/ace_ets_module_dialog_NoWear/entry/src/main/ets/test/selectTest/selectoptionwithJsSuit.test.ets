/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'

export default function selectoptionwithJsSuit() {
  describe('selectoptionwithJsSuit', () => {
    beforeEach(async (done: Function) => {
      console.info("selectoptionwithJsSuit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/selectoptionwith',
      }
      try {
        let pages = router.getState();
        console.info("get selectoptionwithJsSuit state pages: " + JSON.stringify(pages));
        if (pages.name !== 'selectoptionwith') {
          router.clear();
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push selectoptionwithJsSuit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectoptionwithJsSuit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });

    /**
     * @tc.number	SUB_ACE_TS_COMPONENTselectoptionwith_01
     * @tc.name		selectoptionwithJsSuit_0100
     * @tc.desc		Confirm if there is a callback01
	 * @tc.level     Level 2
     * @tc.type :
     * @tc.size :
     */

    it('selectoptionwithJsSuit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[selectoptionwithJsSuit_0100] START');
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('selectoption1', 10, '')).assertTrue();
      await CommonFunc.sleep(1000);
      let obj: Record<string, ESObject> = JSON.parse(getInspectorByKey('selectoption1'));
      console.info("[selectoptionwithJsSuit_0100] obj is: " + JSON.stringify(obj));
      console.info("[selectoptionwithJsSuit_0100] obj optionWidth is: " + JSON.stringify(obj.$attrs.optionWidth));
      expect(obj.$attrs.optionWidth=='0.000000').assertTrue();
      console.info('[selectoptionwithJsSuit_0100] END');
      done();
    });
	
    /**
     * @tc.number    SUB_ACE_TS_COMPONENTselectoptionwith_02
     * @tc.name      selectoptionwithJsSuit_0200
     * @tc.desc      Confirm if there is a callback02
     * @tc.level     Level 2
     * @tc.type :
     * @tc.size :
     */
	 
    it('selectoptionwithJsSuit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[selectoptionwithJsSuit_0200] START');
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('selectoption2', 10, '')).assertTrue();
      await CommonFunc.sleep(1000);
      let obj2: Record<string, ESObject> = JSON.parse(getInspectorByKey('selectoption2'));
      console.info("[selectoptionwithJsSuit_0200] obj2 is: " + JSON.stringify(obj2));
      console.info("[selectoptionwithJsSuit_0200] obj2 optionWidth is: " + JSON.stringify(obj2.$attrs.optionWidth));
      expect(obj2.$attrs.optionWidth=='0.000000').assertTrue();
      console.info('[selectoptionwithJsSuit_0200] END');
      done();
    });
  })
}