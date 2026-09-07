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
 	 import { describe, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
 	 import router from '@ohos.router';
 	 import {
 	   Component,
 	   Driver,
 	   ON,
 	   MatchPattern,
 	   DisplayRotation,
 	   ResizeDirection,
 	   WindowMode,
 	   PointerMatrix} from '@ohos.UiTest';
 	 import CommonFunc from '../../../ets/MainAbility/common/Common';
 	 import RectValue from '../../../ets/MainAbility/common/Rect';
 	 import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
 	 import { AppStorage } from '@ohos.arkui.stateManagement';

 	 import inspector from '@ohos.arkui.inspector';

 	 import { UIContext, Router } from '@ohos.arkui.UIContext';
 	 
 	 import text from "@ohos.graphics.text";
 	 import {KeyCode} from '@ohos.multimodalInput.keyCode';
 	 export default function orphanCharOptimization(): void{
 	   describe('orphanCharOptimization', () => {
 	 
 	     beforeEach(async (): Promise<void> => {
 	       console.info("==============================");
 	       let options: router.RouterOptions = {
 	         url: 'MainAbility/pages/orphanCharOptimization/orphanCharOptimization',
 	       }
 	       try {
 	         const routerInstance = AppStorage.get<Router>("router") as Router
 	         routerInstance.clear();
 	         let pages = routerInstance.getState();
 	         console.info('get getCurrentLocalPositionstate pages:' + JSON.stringify(pages));
 	         if (!('getCurrentLocalPosition' == pages.name)) {
 	           console.info('get getCurrentLocalPosition state pages.name:' + JSON.stringify(pages.name));
 	           routerInstance.pushUrl(options);
 	           await CommonFunc.sleep(2000);
 	         }
 	       } catch (err) {
 	         console.error('push getCurrentLocalPosition page error:' + err);
 	       }
 	     });
 	 
 	     afterEach(async (): Promise<void> => {
 	       try {
 	       await CommonFunc.sleep(1000);
 	       console.info('getCurrentLocalPosition after each called');
 	       } catch (e) {
 	         console.error('error: ' + JSON.stringify(e));
 	       }
 	     });
 	     /**
 	      * @tc.number   SUB_ACE_ARKUI_OPTIMIZATION_0100
 	      * @tc.name     SUB_ACE_ARKUI_OPTIMIZATION_0100
 	      * @tc.desc     SUB_ACE_ARKUI_OPTIMIZATION_0100
 	      * @tc.level   Level.LEVEL0
 	      */
 	     it('SUB_ACE_ARKUI_OPTIMIZATION_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
 	       try {
 	       console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] START');
 	       await CommonFunc.sleep(1000);
 	       let driver: Driver = Driver.create();
 	       let button = await (driver.findComponent(ON.id('true')) as Promise<Component>);
 	       await button.click()
 	       await CommonFunc.sleep(1000);
 	 
 	       let strJson: string;
 	       let obj: object;
 	       strJson = inspector.getInspectorByKey('jsRichEditor');
 	       await CommonFunc.sleep(200);
 	       obj = JSON.parseJsonElement(strJson);
 	       console.info("[SUB_ACE_ARKUI_OPTIMIZATION_0100] component obj is: " + JSON.stringify(obj));
 	       await CommonFunc.sleep(1000);
 	       expect(obj.getElement('$attrs').getString('orphanCharOptimization')).assertEqual('true');
 	       console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] END');
 	 
 	       strJson = inspector.getInspectorByKey('jsText');
 	       await CommonFunc.sleep(200);
 	       obj = JSON.parseJsonElement(strJson);
 	       console.info("[SUB_ACE_ARKUI_OPTIMIZATION_0100] component obj is: " + JSON.stringify(obj));
 	       await CommonFunc.sleep(1000);
 	       expect(obj.getElement('$attrs').getString('orphanCharOptimization')).assertEqual('true');
 	       console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] END');
 	 
 	       strJson = inspector.getInspectorByKey('jsTextArea');
 	       await CommonFunc.sleep(200);
 	       obj = JSON.parseJsonElement(strJson);
 	       console.info("[SUB_ACE_ARKUI_OPTIMIZATION_0100] component obj is: " + JSON.stringify(obj));
 	       await CommonFunc.sleep(1000);
 	       expect(obj.getElement('$attrs').getString('orphanCharOptimization')).assertEqual('true');
 	       console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] END');
 	 
 	       strJson = inspector.getInspectorByKey('jsTextInput');
 	       await CommonFunc.sleep(200);
 	       obj = JSON.parseJsonElement(strJson);
 	       console.info("[SUB_ACE_ARKUI_OPTIMIZATION_0100] component obj is: " + JSON.stringify(obj));
 	       await CommonFunc.sleep(1000);
 	       expect(obj.getElement('$attrs').getString('orphanCharOptimization')).assertEqual('true');
 	       console.info('[SUB_ACE_ARKUI_OPTIMIZATION_0100] END');
 	       } catch (e) {
 	         console.error('error: ' + JSON.stringify(e));
 	         expect().assertFail();
 	       } finally {
 	         done();
 	       }
 	     });
 	   })
 	 }