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
// import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, Point,Rect, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import  display   from '@ohos.display'
import {
  $r
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();

export default function noBarriersGroupTest() {
  describe('noBarriersGroupTest', () => {
    beforeAll(() => {
      console.info("noBarriersGroupTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("noBarriersGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/noBarriersGroup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get noBarriersGroupTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get noBarriersGroupTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push noBarriersGroupTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push noBarriersGroupTest page error:" + err);
      }
      console.info("noBarriersGroupTest beforeEach end");
    });


    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll(() => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(() => {
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('noBarriersGroup_static_001', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup001 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup1");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));

           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup001 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_002', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup002 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup2");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup002 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_003', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup003 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup3");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup003 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup003 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_004', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup004 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup4");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup004 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup004 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_005', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup005 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup5");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup005 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup005 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_006', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup006 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup6");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup006 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup006 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_007', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup007 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup7");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup007 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup007 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_008', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup008 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup8");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup008 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup008 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_009', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup009 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup9");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup009 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup009 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_0010', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup0010 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup10");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup0010 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup0010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_0011', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup0011 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup11");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup0011 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup0011 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarriersGroup_static_0012', 0, async (done: () => void): Promise<void> => {

      console.info('noBarriersGroup0012 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("noBarriersGroup12");
          console.info('noBarriersGroup START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarriersGroup0012 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarriersGroup0012 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}