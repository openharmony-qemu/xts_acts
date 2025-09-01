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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router, Font } from '@ohos.arkui.UIContext';
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

export default function stageFontTest() {
  describe('stageFontTest', () => {


    beforeAll(() => {
      console.info("stageFontTest beforeEach start");


      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("stageFontTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/stageFont'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get stageFontTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get stageFontTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push stageFontTest page error:" + err);
      }
      console.info("stageFontTest beforeEach end");
    });

    afterEach(async () => {

    })
    afterAll(() => {

    })

    
    /*
     * @tc.number   Stage_Font_static_0100
     * @tc.name     Stage_Font_static_0100
     * @tc.desc     Stage_Font_static_0100
     * @tc.level    Level.LEVEL2
     */
it('Stage_Font_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('Stage_Font_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('button');
          console.info('Stage_Font_static_0100 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_static_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('')labelStyle is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('labelStyle')));
          console.info("Stage_Font_static_0100 fontFamily is: " +
          JSON.stringify(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('labelStyle'))));
          expect(JSON.parseJsonElement(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('labelStyle')).getString('font')).getString('family')).assertEqual("fontCustom");
          console.info('Stage_Font_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /*
     * @tc.number   Stage_Font_static_0200
     * @tc.name     Stage_Font_static_0200
     * @tc.desc     Stage_Font_static_0200
     * @tc.level    Level.LEVEL2
     */
it('Stage_Font_static_0200', Level.LEVEL2, async (done: ()=>void) => {
      console.info('Stage_Font_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('text');
          console.info('Stage_Font_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("Stage_Font_static_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily')));
          expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("fontCustom");
          console.info('Stage_Font_static_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /*
     * @tc.number   Stage_Font_static_0300
     * @tc.name     Stage_Font_static_0300
     * @tc.desc     Stage_Font_static_0300
     * @tc.level    Level.LEVEL2
     */
it('Stage_Font_static_0300', Level.LEVEL2, async (done: ()=>void) => {
      console.info('Stage_Font_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textArea');
          console.info('Stage_Font_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("fontCustom");
          console.info('Stage_Font_static_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /*
     * @tc.number   Stage_Font_static_0400
     * @tc.name     Stage_Font_static_0400
     * @tc.desc     Stage_Font_static_0400
     * @tc.level    Level.LEVEL2
     */
it('Stage_Font_static_0400', Level.LEVEL2, async (done: ()=>void) => {
      console.info('Stage_Font_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textInput');
          console.info('Stage_Font_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("Stage_Font_static_0400 JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily')));
          expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("fontCustom");
          console.info('Stage_Font_static_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /*
     * @tc.number   Stage_Font_static_0500
     * @tc.name     Stage_Font_static_0500
     * @tc.desc     Stage_Font_static_0500
     * @tc.level    Level.LEVEL2
     */
it('Stage_Font_static_0500', Level.LEVEL2, async (done: ()=>void) => {
      console.info('Stage_Font_static_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('textSpan');
          console.info('Stage_Font_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("Stage_Font_static_0500 JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontFamily')));
          expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual("fontCustom");
          console.info('Stage_Font_static_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}