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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import Utils from '../Utils.test'
import router from '@ohos.router';
import componentUtils from '@ohos.arkui.componentUtils'; //报错，可以改成： from '@ohos.arkui.UIContext';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
import inspector from '@ohos.arkui.inspector'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ActsgetcomponentaddTest() {
  describe('ActsgetcomponentaddTest', () => {
    beforeAll(() => {
      console.info("Builder0050TestJsunit beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/getcomponentadd',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getcomponentadd state success " + JSON.stringify(pages));
        if (!("getcomponentadd" == pages.name)) {
          console.info("get getcomponentadd state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getcomponentadd page error: " + err);
      }
    });
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0010
     * @tc.name     ArkUX_Get_component_add_static_0010
     * @tc.desc     ArkUX_Get_component_add_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0010 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0010');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0010 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0020
     * @tc.name     ArkUX_Get_component_add_static_0020
     * @tc.desc     ArkUX_Get_component_add_static_0020
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0020 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0020');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0020 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0030
     * @tc.name     ArkUX_Get_component_add_static_0030
     * @tc.desc     ArkUX_Get_component_add_static_0030
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0030 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0030');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0030 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0040
     * @tc.name     ArkUX_Get_component_add_static_0040
     * @tc.desc     ArkUX_Get_component_add_static_0040
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0040 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0040');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0040 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0050
     * @tc.name     ArkUX_Get_component_add_static_0050
     * @tc.desc     ArkUX_Get_component_add_static_0050
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0050 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0050');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0050 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0060
     * @tc.name     ArkUX_Get_component_add_static_0060
     * @tc.desc     ArkUX_Get_component_add_static_0060
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0060 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0060');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0060 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0070
     * @tc.name     ArkUX_Get_component_add_static_0070
     * @tc.desc     ArkUX_Get_component_add_static_0070
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0070 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0070');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0070 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0080
     * @tc.name     ArkUX_Get_component_add_static_0080
     * @tc.desc     ArkUX_Get_component_add_static_0080
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0080 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0080');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0080 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0080 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0090
     * @tc.name     ArkUX_Get_component_add_static_0090
     * @tc.desc     ArkUX_Get_component_add_static_0090
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0090 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0090');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0090 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0100
     * @tc.name     ArkUX_Get_component_add_static_0100
     * @tc.desc     ArkUX_Get_component_add_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0100 START');
      setTimeout(() => {
        try {
          // let strJson = Utils.getComponentRect('ArkUX_Get_component_add_0100');
          // expect(typeof (strJson.width)).assertEqual("number");
          // expect(typeof (strJson.height)).assertEqual("number");
          // expect(typeof (strJson.localOffsetX)).assertEqual("number");
          // expect(typeof (strJson.localOffsetY)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetX)).assertEqual("number");
          // expect(typeof (strJson.windowOffsetY)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetX)).assertEqual("number");
          // expect(typeof (strJson.screenOffsetY)).assertEqual("number");
          console.info('ArkUX_Get_component_add_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    
    
    /*
     * @tc.number   ArkUX_Get_component_add_static_0110
     * @tc.name     ArkUX_Get_component_add_static_0110
     * @tc.desc     ArkUX_Get_component_add_static_0110
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Get_component_add_static_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Get_component_add_0110 START');
      setTimeout(() => {
        try {
          if (AppStorage.get<number>("winLeft") == 0) {
            // let strJson = inspector.getInspectorByKey('ArkUX_Get_component_add_0110');
            // console.info('ArkUX_Get_component_add_0110 START  :' + JSON.stringify(strJson));
            // console.info('ArkUX_Get_component_add_0110 obj is：' + JSON.stringify(JSON.parseJsonElement(strJson)))
            // let getRectangleById = componentUtils.getRectangleById('');//TypeError: Property 'getRectangleById' does not exist on type 'componentUtils'，可以改成：let componentUtils: ComponentUtils = new ComponentUtils(); let getRectangleById = componentUtils.getRectangleById('');
            // let Matrix4_1 = getRectangleById.transform[0];
            // let Matrix4_2 = getRectangleById.transform[1];
            // let Matrix4_3 = getRectangleById.transform[2];
            // let Matrix4_4 = getRectangleById.transform[3];
            // let Matrix4_5 = getRectangleById.transform[4];
            // let Matrix4_6 = getRectangleById.transform[5];
            // let Matrix4_7 = getRectangleById.transform[6];
            // let Matrix4_8 = getRectangleById.transform[7];
            // let Matrix4_9 = getRectangleById.transform[8];
            // let Matrix4_10 = getRectangleById.transform[9];
            // let Matrix4_11 = getRectangleById.transform[10];
            // let Matrix4_12 = getRectangleById.transform[11];
            // let Matrix4_13 = getRectangleById.transform[12];
            // let Matrix4_14 = getRectangleById.transform[13];
            // let Matrix4_15 = getRectangleById.transform[14];
            // let Matrix4_16 = getRectangleById.transform[15];
            // let localOffsetX = getRectangleById.localOffset.x;
            // let localOffsetY = getRectangleById.localOffset.y;
            // let windowOffsetX = getRectangleById.windowOffset.x;
            // let windowOffsetY = getRectangleById.windowOffset.y;
            // let screenOffsetX = getRectangleById.screenOffset.x;
            // let screenOffsetY = getRectangleById.screenOffset.y;
            // console.info('ArkUX_Get_component_add_0110 START  :' + getRectangleById);
            // console.info('ArkUX_Get_component_add_0110 START  :' + typeof getRectangleById);
            // expect(typeof getRectangleById).assertEqual("object")
            // expect(Matrix4_1).assertEqual(1)
            // expect(Matrix4_2).assertEqual(0)
            // expect(Matrix4_3).assertEqual(0)
            // expect(Matrix4_4).assertEqual(0)
            // expect(Matrix4_5).assertEqual(0)
            // expect(Matrix4_6).assertEqual(1)
            // expect(Matrix4_7).assertEqual(0)
            // expect(Matrix4_8).assertEqual(0)
            // expect(Matrix4_9).assertEqual(0)
            // expect(Matrix4_10).assertEqual(0)
            // expect(Matrix4_11).assertEqual(1)
            // expect(Matrix4_12).assertEqual(0)
            // expect(Matrix4_13).assertEqual(0)
            // expect(Matrix4_14).assertEqual(0)
            // expect(Matrix4_15).assertEqual(0)
            // expect(Matrix4_16).assertEqual(1)
            // expect(localOffsetX).assertEqual(0)
            // expect(localOffsetY).assertEqual(0)
            // expect(windowOffsetX).assertEqual(0)
            // expect(windowOffsetY).assertEqual(0)
            // expect(screenOffsetX).assertEqual(0)
            // expect(screenOffsetY).assertEqual(0)
          }
          console.info('ArkUX_Get_component_add_0110 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_add_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}