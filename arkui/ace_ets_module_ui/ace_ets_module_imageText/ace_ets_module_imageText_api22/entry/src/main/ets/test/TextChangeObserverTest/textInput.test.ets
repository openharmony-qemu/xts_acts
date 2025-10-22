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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function textInputTest() {
  describe('textInputTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextChangeObserver/textInput',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get textInputTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get textInputTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push textInputTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push textInputTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('textChangeObserverTest after each called');
    });

    /**
     * @tc.number    textInputTest_0010
     * @tc.name      textInputTest_0010
     * @tc.desc      Global observer enabled or disabled, text change of the textInput component, Expected: observed text is 'textInputTest_0010'
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('textInputTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest_0010] START');

      let driver:Driver = Driver.create();
      
      let globalObserverOpenButton: Component = await driver.findComponent(ON.id('全局监听(开)'));
      await globalObserverOpenButton.click();

      let textInput: Component = await driver.findComponent(ON.id('textInput'));
      await textInput.inputText('textInputTest_0010', { paste: true, addition: false });

      let globalOutputTextInput: Component = await driver.findComponent(ON.id('globalOutputTextInput'));
      let globalOutput = await globalOutputTextInput.getText();
      
      console.info('[textInputTest_0010] textContent: ' + globalOutput);
      expect(globalOutput).assertEqual('textInputTest_0010');

      let globalObserverCloseButton: Component = await driver.findComponent(ON.id('全局监听(关)'));
      await globalObserverCloseButton.click();

      await textInput.inputText('Add', { paste: true, addition: true });

      let globalOutput2 = await globalOutputTextInput.getText();

      console.info('[textInputTest_0010] textContent: ' + globalOutput2);
      expect(globalOutput2).assertEqual('textInputTest_0010');

      console.info('[textInputTest_0010] END');
      done();
    });

    /**
     * @tc.number    textInputTest_0011
     * @tc.name      textInputTest_0011
     * @tc.desc      Local observer enabled or disabled, text change of the textInput component, Expected: observed text is 'textInputTest_0011'
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('textInputTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[textInputTest_0011] START');

      let driver:Driver = Driver.create();
      
      let localObserverOpenButton: Component = await driver.findComponent(ON.id('局部textInput(开)'));
      await localObserverOpenButton.click();

      let textInput: Component = await driver.findComponent(ON.id('textInput'));
      await textInput.inputText('textInputTest_0011', { paste: true, addition: false });

      let localOutputTextInput: Component = await driver.findComponent(ON.id('localOutputTextInput'));
      let localOutput = await localOutputTextInput.getText();

      console.info('[textInputTest_0011] textContent: ' + localOutput);
      expect(localOutput).assertEqual('textInputTest_0011');

      let localObserverCloseButton: Component = await driver.findComponent(ON.id('局部textInput(关)'));
      await localObserverCloseButton.click();

      await textInput.inputText('Add', { paste: true, addition: true });

      let localOutput2 = await localOutputTextInput.getText();

      console.info('[textInputTest_0011] textContent: ' + localOutput2);
      expect(localOutput2).assertEqual('textInputTest_0011');

      console.info('[textInputTest_0011] END');
      done();
    });
  })
}