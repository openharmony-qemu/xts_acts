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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import { uiMaterial } from '@kit.ArkUI';

export default function navigationMaterial() {
  describe('navigationMaterial', () => {
    beforeEach(async (done: Function) => {
      console.info('navigationMaterial beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigation/navigationMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get navigationMaterial state pages:' + JSON.stringify(pages));
        if (!('navigationMaterial' == pages.name)) {
          console.info('get navigationMaterial pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push navigationMaterial page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push navigationMaterial page error:' + err);
      }
      console.info('navigationMaterial beforeEach end');
      done();
    });

    /**
     * @tc.name   navigationMaterial_0010
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMMATERIAL_PARAM_0100
     * @tc.desc   test Navigation systemMaterial set uiMaterial.ImmersiveStyle.ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('navigationMaterial_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[navigationMaterial_0010] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
      let strJson: string = getInspectorByKey('nav_systemMaterial_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[navigationMaterial_0010] component obj is: ' + JSON.stringify(obj));
      console.info('[navigationMaterial_0010] title is: ' + JSON.stringify(obj.$attrs.title));
      expect(obj.$attrs.title).assertEqual('true');
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      console.info('[navigationMaterial_0010] END');
      done();
    });

    /**
     * @tc.name   navigationMaterial_0020
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMMATERIAL_PARAM_0200
     * @tc.desc   test Navigation systemMaterial set uiMaterial.ImmersiveStyle.THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('navigationMaterial_0020', Level.LEVEL3, async (done: Function) => {
      console.info('[navigationMaterial_0020] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[3]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
      let strJson: string = getInspectorByKey('nav_systemMaterial_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[navigationMaterial_0020] component obj is: ' + JSON.stringify(obj));
      console.info('[navigationMaterial_0020] title is: ' + JSON.stringify(obj.$attrs.title));
      expect(obj.$attrs.title).assertEqual('false');
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      console.info('[navigationMaterial_0020] END');
      done();
    });

    /**
     * @tc.name   navigationMaterial_0030
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMMATERIAL_PARAM_0300
     * @tc.desc   test Navigation systemMaterial set uiMaterial.ImmersiveStyle.REGULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('navigationMaterial_0030', Level.LEVEL3, async (done: Function) => {
      console.info('[navigationMaterial_0030] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[5]
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
      let strJson: string = getInspectorByKey('nav_systemMaterial_un');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[navigationMaterial_0030] component obj is: ' + JSON.stringify(obj));
      console.info('[navigationMaterial_0030] title is: ' + JSON.stringify(obj.$attrs.title));
      expect(obj.$attrs.title).assertEqual('un');
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      console.info('[navigationMaterial_0030] END');
      done();
    });

    /**
     * @tc.name   navigationMaterial_0040
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMMATERIAL_PARAM_0400
     * @tc.desc   test Navigation systemMaterial set uiMaterial.ImmersiveStyle.ULTRA_THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('navigationMaterial_0040', Level.LEVEL3, async (done: Function) => {
      console.info('[navigationMaterial_0040] START');
      await CommonFunc.sleep(1000);
      let tree: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[7]
      let btn2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[7]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
      let strJson: string = getInspectorByKey('nav_systemMaterial_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[navigationMaterial_0040] component obj is: ' + JSON.stringify(obj));
      console.info('[navigationMaterial_0040] title is: ' + JSON.stringify(obj.$attrs.title));
      expect(obj.$attrs.title).assertEqual('null');
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      console.info('[navigationMaterial_0040] END');
      done();
    });
  })
}