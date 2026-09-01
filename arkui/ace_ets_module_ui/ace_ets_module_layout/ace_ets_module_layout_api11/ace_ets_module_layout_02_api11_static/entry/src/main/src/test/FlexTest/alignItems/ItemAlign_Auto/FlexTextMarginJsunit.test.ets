'use static';

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

import { describe, beforeEach, it, expect, Level, afterEach } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';

export default function flexTextMargin_AutoJsunit() {

  describe('flexItemAlignAutoTest4', () => {

    beforeEach(async (): Promise<void> => {
      console.info("flexItemAlignAutoTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/ItemAlign_Auto_FlexTextMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get flexItemAlignAutoTest4 state pages:" + JSON.stringify(pages));
        if (!("ItemAlign_Auto_FlexTextMargin" == pages.name)) {
          console.info("get flexItemAlignAutoTest4 pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push flexItemAlignAutoTest4 page error:" + err);
      }
      console.info("flexItemAlignAutoTest4 beforeEach end");
    });


    afterEach( async () : Promise<void>=> {
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('flexItemAlignAutoTest4 sleep err: ' + JSON.stringify(err));
      }
      console.info("ItemAlign_Auto_FlexTextMargin after each called");
    });

/**
     * @tc.number   testFlexItemAlignAutoTextMarginMeet_static
     * @tc.name     testFlexItemAlignAutoTextMarginMeet_static
     * @tc.desc     testFlexItemAlignAutoTextMarginMeet_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoTextMarginMeet_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignAutoTextMarginMeet_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'margin', value: 10
        });
      }
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('flexItemAlignAutoTest4 sleep err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexTextMargin01');

      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi1:'+ Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi2:'+ Math.floor(Math.abs(textMargin02.left - textMargin01.right - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi3:'+ Math.floor(Math.abs(textMargin02.right - textMargin03.left)));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi4:'+ Math.floor(Math.abs(textMargin01.top - flexTextMargin01.top - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi5:'+ Math.floor(Math.abs(textMargin02.top - textMargin03.top)));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi6:'+ Math.floor(Math.abs(textMargin03.top - flexTextMargin01.top)));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi7:'+ Math.floor(Math.abs(textMargin01.bottom - textMargin01.top - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazh18:'+ Math.floor(Math.abs(textMargin02.bottom - textMargin02.top -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi9:'+ Math.floor(Math.abs(textMargin03.bottom - textMargin03.top - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi10:'+ Math.floor(Math.abs(textMargin01.right - textMargin01.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi11:'+ Math.floor(Math.abs(textMargin02.right - textMargin02.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testFlexItemAlignAutoTextMarginMeet_static_chazhi12:'+ Math.floor(Math.abs(textMargin03.right - textMargin03.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));

      expect(Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.left - textMargin01.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.right - textMargin03.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin01.top - flexTextMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(10)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.top - textMargin03.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.top - flexTextMargin01.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(textMargin01.bottom - textMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.bottom - textMargin03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin01.right - textMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.right - textMargin02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.right - textMargin03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextMarginMeet_static END');
    });
 
/**
     * @tc.number   testFlexItemAlignAutoTextMarginOverflow_static
     * @tc.name     testFlexItemAlignAutoTextMarginOverflow_static
     * @tc.desc     testFlexItemAlignAutoTextMarginOverflow_static
     * @tc.level    Level.LEVEL0
     */
it('testFlexItemAlignAutoTextMarginOverflow_static', Level.LEVEL0, async () : Promise<void>=> {
      console.info('new testFlexItemAlignAutoTextMarginOverflow_static START');
      let result = AppStorage.get<MessageManager<number>>("messageManager")
      if (result !== null) {
        result!.notify({
          name: 'margin', value: 30
        });
      }
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('flexItemAlignAutoTest4 sleep err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('ItemAlign_Auto_flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('ItemAlign_Auto_flexTextMargin01');

      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi1:'+ Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi2:'+ Math.floor(Math.abs(textMargin02.left - textMargin01.right -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi3:'+ Math.floor(Math.abs(textMargin02.right - textMargin03.left)));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi4:'+ Math.floor(Math.abs(textMargin03.right - flexTextMargin01.right)));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi5:'+ Math.floor(Math.abs(textMargin01.top - flexTextMargin01.top - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi6:'+ Math.floor(Math.abs(textMargin02.top - textMargin03.top)));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi7:'+ Math.floor(Math.abs(textMargin03.top - flexTextMargin01.top)));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi8:'+ Math.floor(Math.abs(textMargin01.bottom - textMargin01.top -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi9:'+ Math.floor(Math.abs(textMargin02.bottom - textMargin02.top - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi10:'+ Math.floor(Math.abs(textMargin03.bottom - textMargin03.top -
       Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi11:'+ Math.floor(Math.abs(textMargin01.right - textMargin01.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi12:'+ Math.floor(Math.abs(textMargin02.right - textMargin02.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))));
      console.info('testFlexItemAlignAutoTextMarginOverflow_static_chazhi13:'+ Math.floor(Math.abs(textMargin03.right - textMargin03.left - 
      Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))));

      expect(Math.floor(Math.abs(textMargin01.left - flexTextMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.left - textMargin01.right - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.right - textMargin03.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.right - flexTextMargin01.right)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin01.top - flexTextMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(30)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.top - textMargin03.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.top - flexTextMargin01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin01.bottom - textMargin01.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.bottom - textMargin02.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(100)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.bottom - textMargin03.top - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(150)))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(textMargin01.right - textMargin01.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 2).assertTrue();
      expect(Math.floor(Math.abs(textMargin02.right - textMargin02.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 3).assertTrue();
      expect(Math.floor(Math.abs(textMargin03.right - textMargin03.left - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(440 / 3)))) <= 3).assertTrue();

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('constructor').getString('alignItems')).assertEqual('ItemAlign.Auto');
      console.info('new testFlexItemAlignAutoTextMarginOverflow_static END');
    });

  })
}
