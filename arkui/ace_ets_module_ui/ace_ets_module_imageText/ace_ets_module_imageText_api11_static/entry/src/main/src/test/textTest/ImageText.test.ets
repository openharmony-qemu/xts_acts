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
import { describe, beforeEach, afterEach, it, expect, Level,beforeAll } from "@ohos/hypium-binary/src/main/indexStatic"
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ImageTextTest() {

  const SUITE = 'ImageText'
  describe('ImageTextTest', () => {

    beforeAll(async (): Promise<void> => {
      console.info("ImageTextTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageTextTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/text/ImageText",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ImageTextTest state pages:" + JSON.stringify(pages));
        if (!("ImageText" == pages.name)) {
          console.info("get ImageTextTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageTextTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageTextTest page error:" + err);
      }
      console.info("ImageTextTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0100
     * @tc.name     ArkUI_Image_Text_static_0100
     * @tc.desc     ArkUI_Image_Text_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0100'
      console.info(`${SUITE} ${CASE} START`);

      let strJson1: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan1');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('verticalAlign').split('.')[1]).assertEqual('BASELINE')

      let strJson2: string  = inspector.getInspectorByKey('ImageText' + '_ImageSpan2');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('verticalAlign').split('.')[1]).assertEqual('CENTER')

      let strJson3: string  = inspector.getInspectorByKey('ImageText' + '_ImageSpan3');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('verticalAlign').split('.')[1]).assertEqual('TOP')

      let strJson4: string  = inspector.getInspectorByKey('ImageText' + '_ImageSpan4');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('verticalAlign').split('.')[1]).assertEqual('BOTTOM')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0200
     * @tc.name     ArkUI_Image_Text_static_0200
     * @tc.desc     ArkUI_Image_Text_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0200'
      console.info(`${SUITE} ${CASE} START`);

      let strJson5: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan5');
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Contain')

      let strJson6: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan6');
      expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Cover')

      let strJson7: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan7');
      expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Auto')

      let strJson8: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan8');
      expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.Fill')

      let strJson9: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan9');
      expect(JSON.parseJsonElement(strJson9).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.ScaleDown')

      let strJson10: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan10');
      expect(JSON.parseJsonElement(strJson10).getElement('$attrs').getString('objectFit')).assertEqual('ImageFit.None')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0300
     * @tc.name     ArkUI_Image_Text_static_0300
     * @tc.desc     ArkUI_Image_Text_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0300'
      console.info(`${SUITE} ${CASE} START`);

      let strJson: string = inspector.getInspectorByKey('ImageText' + '_Text1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').tryGetElement('textIndent')).assertEqual(undefined)
      if (inspector.sendEventByKey('ImageText_Button1', 10, '')) {
        let strJson: string = inspector.getInspectorByKey('ImageText' + '_Text1');

        expect(obj.getElement('$attrs').tryGetElement('textIndent')).assertEqual(undefined)
      }
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0400
     * @tc.name     ArkUI_Image_Text_static_0400
     * @tc.desc     ArkUI_Image_Text_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0400'
      console.info(`${SUITE} ${CASE} START`);

      let strJson12: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan12');
      expect(JSON.parseJsonElement(strJson12).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson12).getElement('$attrs').getString('width')).assertEqual('276.00px')
      let strJson13: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan13');
      expect(JSON.parseJsonElement(strJson13).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson13).getElement('$attrs').getString('width')).assertEqual('276.00px')
      let strJson14: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan14');
      expect(JSON.parseJsonElement(strJson14).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson14).getElement('$attrs').getString('width')).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0500
     * @tc.name     ArkUI_Image_Text_static_0500
     * @tc.desc     ArkUI_Image_Text_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0500'
      console.info(`${SUITE} ${CASE} START`);

      let strJson15: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan15');
      expect(JSON.parseJsonElement(strJson15).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson15).getElement('$attrs').getString('width')).assertEqual('276.00px')
      let strJson16: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan16');
      expect(JSON.parseJsonElement(strJson16).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson16).getElement('$attrs').getString('width')).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0600
     * @tc.name     ArkUI_Image_Text_static_0600
     * @tc.desc     ArkUI_Image_Text_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0600'
      console.info(`${SUITE} ${CASE} START`);

      let strJson17: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan17');
      expect(JSON.parseJsonElement(strJson17).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson17).getElement('$attrs').getString('width')).assertEqual('276.00px')
      let strJson18: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan18');
      expect(JSON.parseJsonElement(strJson18).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson18).getElement('$attrs').getString('width')).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    
    /**
     * @tc.number   ArkUI_Image_Text_static_0700
     * @tc.name     ArkUI_Image_Text_static_0700
     * @tc.desc     ArkUI_Image_Text_static_0700
     * @tc.level    Level.LEVEL1
     */
    it('ArkUI_Image_Text_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      let CASE: string = 'ArkUI_Image_Text_static_0700'
      console.info(`${SUITE} ${CASE} START`);

      let strJson19: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan19');
      expect(JSON.parseJsonElement(strJson19).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson19).getElement('$attrs').getString('width')).assertEqual('276.00px')
      let strJson20: string = inspector.getInspectorByKey('ImageText' + '_ImageSpan20');
      expect(JSON.parseJsonElement(strJson20).getElement('$attrs').getString('height')).assertEqual('183.00px')
      expect(JSON.parseJsonElement(strJson20).getElement('$attrs').getString('width')).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

  })
}
