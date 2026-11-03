/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import CommonFunc from '../MainAbility/common/Common';

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SelectTest beforeEach start");
      await CommonFunc.sleep(500);
      done()
    });

    afterEach(async () => {
      console.info("overlay after each called");
    });


    /*
     *@tc.number SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030
     *@tc.name   SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 200
     */
    it('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030 START');
      let strJson = getInspectorByKey('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 300) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 300) <= 2).assertTrue();

      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0030 END ');
      done();
    });

    /*
     *@tc.number SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040
     *@tc.name   SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to 400
     */
    it('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040 START');
      let strJson = getInspectorByKey('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 600) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 600) <= 2).assertTrue();

      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0040 END ');
      done();
    });

    /*
     *@tc.number SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050
     *@tc.name   SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_TRIGGER and 600
     */
    it('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050 START');
      let strJson = getInspectorByKey('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 900) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 900) <= 2).assertTrue();

      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0050 END ');
      done();
    });

    /*
     *@tc.number SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060
     *@tc.name   SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to FIT_CONTENT and 600
     */
    it('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060 START');
      let strJson = getInspectorByKey('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060 obj is: " + JSON.stringify(obj));

      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 1200) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 1200) <= 2).assertTrue();

      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0060 END ');
      done();
    });

    /*
     *@tc.number SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070
     *@tc.name   SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070
     *@tc.desc   Sets the optionWidth and optionHeight property parameter to default value
     */
    it('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070', Level.LEVEL1, async (done: Function) => {
      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070 START');
      let strJson = getInspectorByKey('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070 obj is: " + JSON.stringify(obj));
      let optionWidth: ESObject = obj.$attrs.optionWidth;
      let optionHeight: ESObject = obj.$attrs.optionHeight;

      expect(Math.abs(Math.round(optionWidth) - 1500) <= 2).assertTrue();
      expect(Math.abs(Math.round(optionHeight) - 1500) <= 2).assertTrue();

      console.info('SUB_ARKUI_ACE_ENGINE_SELECT_VISUAL_0070 END ');
      done();
    });
	
  })
}