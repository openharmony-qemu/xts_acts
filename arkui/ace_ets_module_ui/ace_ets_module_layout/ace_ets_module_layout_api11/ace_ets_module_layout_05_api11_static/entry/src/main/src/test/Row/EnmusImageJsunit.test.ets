'use static';
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
import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import Utils from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';


export default function enumsImageJsunit() {
  describe('enumsImage', () => {

    beforeEach(async (): Promise<void> => {
      console.info("enumsImageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/enumsImage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get enumsImageJsunit state pages: " + JSON.stringify(pages));
        if (!("enumsImage" == pages.name)) {
          console.info("get enumsImageJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enumsImageJsunit page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('enumsImageTest await err: ' + JSON.stringify(err));
      }
      console.info('[ afterEach ] ===================enumsImageTest test after each called===================');
    });
    
    
    

/**
     * @tc.number   enumsImageTest_static_0100
     * @tc.name     enumsImageTest_static_0100
     * @tc.desc     enumsImageTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('enumsImageTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsImageTest_static_0100 START');
      let strJson: string = inspector.getInspectorByKey('Image');
      console.info("enumsImageTest_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
     console.info("enumsImageTest_static_0100 component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('backgroundImageSize')).assertEqual('ImageSize.Auto');
      console.info('enumsImageTest_static_0100 END');
      done();
    });
    
    
    

/**
     * @tc.number   enumsImageTest_static_0200
     * @tc.name     enumsImageTest_static_0200
     * @tc.desc     enumsImageTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('enumsImageTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('enumsImageTest_static_0200 START');
      let strJson: string = inspector.getInspectorByKey('Image');
      console.info("enumsImageTest_static_0200 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson)
     console.info("enumsImageTest_static_0200 component obj is: " + JSON.stringify(obj));
     console.info("enumsImageTest_static_0200 component obj1 is: " + obj.getElement('$attrs').getString('backgroundImage').split(', ')[1]);
     expect(obj.getElement('$attrs').getString('backgroundImage').split(', ')[1]).assertEqual('ImageRepeat.Y');
      console.info('enumsImageTest_static_0200 END');
      done();
    });
  })
}
