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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, loadAndSetUpUiTest} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextMaxLines() {
  describe('TextMaxLines', () => {
    beforeAll(() => {
      console.info("TextMaxLines beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextMaxLines beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/TextMaxLines",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextMaxLines state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextMaxLines pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextMaxLines page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMaxLines page error:" + err);
      }
      console.info("TextMaxLines beforeEach end");
    }); 


    /**
     * @tc.number: TextMaxLines_0010
     * @tc.name  : TextMaxLines_0010
     * @tc.desc  : set Text: TextMaxLines
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextMaxLines_static_0010', 0, async (done: () => void): Promise<void> => {
      console.info('TextMaxLines_0010 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('maxLines')).assertEqual('4');
      console.info('TextMaxLines_0010 END');
      done();
    });
	
	/**
     * @tc.number: TextLineHeight_0020
     * @tc.name  : TextLineHeight_0020
     * @tc.desc  : set Text: TextLineHeight
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextLineHeight_static_0020', 0, async (done: () => void): Promise<void> => {
      console.info('TextLineHeight_0020 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('lineHeight')).assertEqual('10.00fp');
      console.info('TextLineHeight_0020 END');
      done();
    });
	
	/**
     * @tc.number: TextBaselineOffset_0030
     * @tc.name  : TextBaselineOffset_0030
     * @tc.desc  : set Text: TextBaselineOffset
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextBaselineOffset_static_0030', 0, async (done: () => void): Promise<void> => {
      console.info('TextBaselineOffset_0030 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('baselineOffset')).assertEqual('10');
      console.info('TextBaselineOffset_0030 END');
      done();
    });
	
	/**
     * @tc.number: TextFontStyle_0040
     * @tc.name  : TextFontStyle_0040
     * @tc.desc  : set Text: TextFontStyle
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextFontStyle_static_0040', 0, async (done: () => void): Promise<void> => {
      console.info('TextFontStyle_0040 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      console.info('TextFontStyle_0040 END');
      done();
    });

    /**
     * @tc.number: TextLetterSpacing_0050
     * @tc.name  : TextLetterSpacing_0050
     * @tc.desc  : set Text: TextLetterSpacing
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextLetterSpacing_static_0050', 0, async (done: () => void): Promise<void> => {
      console.info('TextLetterSpacing_0050 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('letterSpacing')).assertEqual('5.00fp');
      console.info('TextLetterSpacing_0050 END');
      done();
    });

    /**
     * @tc.number: TextTextAlign_0060
     * @tc.name  : TextTextAlign_0060
     * @tc.desc  : set Text: TextTextAlign
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextTextAlign_static_0060', 0, async (done: () => void): Promise<void> => {
      console.info('TextTextAlign_0060 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Center');
      console.info('TextTextAlign_0060 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0070
     * @tc.name  : TextConstraintSize_0070
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_static_0070', 0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0070 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('minWidth')).assertEqual('100.00vp');
      console.info('TextConstraintSize_0070 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0080
     * @tc.name  : TextConstraintSize_0080
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_static_0080', 0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0080 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('maxWidth')).assertEqual('200.00vp');
      console.info('TextConstraintSize_0080 END');
      done();
    });

    /**
     * @tc.number: TextConstraintSize_0090
     * @tc.name  : TextConstraintSize_0090
     * @tc.desc  : set Text: TextConstraintSize
     * @tc.level : Level 1
     * @tc.type :
     * @tc.size :
     */
    it('TextConstraintSize_static_0090', 0, async (done: () => void): Promise<void> => {
      console.info('TextConstraintSize_0090 START');
      let TextMaxLines_1 = inspector.getInspectorByKey('textMaxLines1');
      expect(''+JSON.parseJsonElement(JSON.parseJsonElement(TextMaxLines_1).getElement('$attrs').getString('constraintSize')).getString('minHeight')).assertEqual('100.00vp');
      console.info('TextConstraintSize_0090 END');
      done();
    });
  })
}