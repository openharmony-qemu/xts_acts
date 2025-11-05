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


import { afterEach, beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium/index';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../../ets/MainAbility/common/Common';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, time)
  })
}


export default function textInputJsunit() {

  describe('textInputTest', () => {
    /**
     * run before testcase
     */
    beforeAll(() => {
      console.info("textInputJsunit beforeEach start");


      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textInputJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInput',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textInputJsunit state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get textInputJsunit pages.name:" + '');
         
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textInputJsunit page error:" + err);
      }
      console.info("textInputJsunit beforeEach end");
    });


    /**
     * run after testcase
     */
    afterEach(async () => {
    });

    
    /*
     * @tc.number   testTextInput_static_010
     * @tc.name     testTextInput_static_010
     * @tc.desc     testTextInput_static_010
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_010', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput_static_010 START');
      let strJson = inspector.getInspectorByKey('textInput1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.getElement('$attrs').getString('enterKeyType')));
      console.info("[textInput1] get inspector value is: " + obj.getElement('$attrs').getString('placeholderFont'));
      console.info("[textInput1] get inspector value is: " + obj.getElement('$attrs').getElement('placeholderFont').getString('size'));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      console.info("[textInput1] get inspector value is: " + JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect(obj.getElement('$type')).assertEqual('TextInput');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');
      expect(obj.getElement('$attrs').getString('caretColor')).assertEqual('#FF000000');
      expect(obj.getElement('$attrs').getString('placeholderColor')).assertEqual('#FFC0C0C0');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('40.00fp');
      expect(obj.getElement('$attrs').getString('height')).assertEqual('60.00vp');
      expect(obj.getElement('$attrs').getString('placeholderFont')).assertContain('FontStyle.Normal');
      console.info('testTextInput_static_010 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_020
     * @tc.name     testTextInput_static_020
     * @tc.desc     testTextInput_static_020
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_020', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput020 START');
      let strJson = inspector.getInspectorByKey('textInput2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput2] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      console.info('testTextInput020 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_030
     * @tc.name     testTextInput_static_030
     * @tc.desc     testTextInput_static_030
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_030', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput030 START');
      let strJson = inspector.getInspectorByKey('textInput3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput3] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');
      console.info('testTextInput030 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_040
     * @tc.name     testTextInput_static_040
     * @tc.desc     testTextInput_static_040
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_040', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput040 START');
      let strJson = inspector.getInspectorByKey('textInput4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput4] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');
      console.info('testTextInput040 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_050
     * @tc.name     testTextInput_static_050
     * @tc.desc     testTextInput_static_050
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_050', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput050 START');
      let strJson = inspector.getInspectorByKey('textInput5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput5] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Normal');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      console.info('testTextInput050 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_060
     * @tc.name     testTextInput_static_060
     * @tc.desc     testTextInput_static_060
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_060', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput060 START');
      let strJson = inspector.getInspectorByKey('textInput6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput6] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');
      console.info('testTextInput060 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_070
     * @tc.name     testTextInput_static_070
     * @tc.desc     testTextInput_static_070
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_070', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput070 START');
      let strJson = inspector.getInspectorByKey('textInput7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput7] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      console.info('testTextInput070 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_080
     * @tc.name     testTextInput_static_080
     * @tc.desc     testTextInput_static_080
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_080', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput080 START');
      let strJson = inspector.getInspectorByKey('textInput8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput8] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');
      console.info('testTextInput080 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_090
     * @tc.name     testTextInput_static_090
     * @tc.desc     testTextInput_static_090
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_090', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput090 START');
      let strJson = inspector.getInspectorByKey('textInput9');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput9] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');
      console.info('testTextInput090 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_100
     * @tc.name     testTextInput_static_100
     * @tc.desc     testTextInput_static_100
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput100 START');
      let strJson = inspector.getInspectorByKey('textInput10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput10] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Password');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      console.info('testTextInput100 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_110
     * @tc.name     testTextInput_static_110
     * @tc.desc     testTextInput_static_110
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_110', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput110 START');
      let strJson = inspector.getInspectorByKey('textInput11');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput11] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');
      console.info('testTextInput110 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_120
     * @tc.name     testTextInput_static_120
     * @tc.desc     testTextInput_static_120
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_120', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput120 START');
      let strJson = inspector.getInspectorByKey('textInput12');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput12] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      console.info('testTextInput120 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_130
     * @tc.name     testTextInput_static_130
     * @tc.desc     testTextInput_static_130
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_130', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput130 START');
      let strJson = inspector.getInspectorByKey('textInput13');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput13] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');
      console.info('testTextInput130 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_140
     * @tc.name     testTextInput_static_140
     * @tc.desc     testTextInput_static_140
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_140', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput140 START');
      let strJson = inspector.getInspectorByKey('textInput14');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput14] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');
      console.info('testTextInput140 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_150
     * @tc.name     testTextInput_static_150
     * @tc.desc     testTextInput_static_150
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_150', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput150 START');
      let strJson = inspector.getInspectorByKey('textInput15');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput15] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.Email');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      console.info('testTextInput150 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_160
     * @tc.name     testTextInput_static_160
     * @tc.desc     testTextInput_static_160
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_160', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput160 START');
      let strJson = inspector.getInspectorByKey('textInput16');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput16] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.NUMBER');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Go');
      console.info('testTextInput160 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_170
     * @tc.name     testTextInput_static_170
     * @tc.desc     testTextInput_static_170
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_170', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput170 START');
      let strJson = inspector.getInspectorByKey('textInput17');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput17] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.NUMBER');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Search');
      console.info('testTextInput170 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_180
     * @tc.name     testTextInput_static_180
     * @tc.desc     testTextInput_static_180
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_180', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput180 START');
      let strJson = inspector.getInspectorByKey('textInput18');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput18] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.NUMBER');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Send');
      console.info('testTextInput180 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_190
     * @tc.name     testTextInput_static_190
     * @tc.desc     testTextInput_static_190
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_190', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput190 START');
      let strJson = inspector.getInspectorByKey('textInput19');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput19] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.NUMBER');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Next');
      console.info('testTextInput190 End');
      done();
    });

    
    /*
     * @tc.number   testTextInput_static_200
     * @tc.name     testTextInput_static_200
     * @tc.desc     testTextInput_static_200
     * @tc.level    Level.LEVEL1
     */
it('testTextInput_static_200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testTextInput200 START');
      let strJson = inspector.getInspectorByKey('textInput20');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textInput20] get inspector value is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('InputType.NUMBER');
      expect(obj.getElement('$attrs').getString('enterKeyType')).assertEqual('EnterKeyType.Done');
      console.info('testTextInput200 End');
      done();
    });
  })
}
