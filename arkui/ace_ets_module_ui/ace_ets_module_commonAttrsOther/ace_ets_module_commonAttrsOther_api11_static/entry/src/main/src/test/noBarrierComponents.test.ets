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

export default function noBarrierComponentsTest() {
  describe('noBarrierComponentsTest', () => {
    beforeAll(() => {
      console.info("noBarrierComponentsTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("noBarrierComponentsTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/noBarrierComponents',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get noBarrierComponentsTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get noBarrierComponentsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push noBarrierComponentsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push noBarrierComponentsTest page error:" + err);
      }
      console.info("noBarrierComponentsTest beforeEach end");
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
    it('noBarrierComponents_static_001', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents001 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign1");
          console.info('noBarrierComponents001 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents001 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents001 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_002', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents002 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign2");
          console.info('noBarrierComponents002 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents002 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_003', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents003 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("textAlign3");
          console.info('noBarrierComponents003 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Text");
          console.info('noBarrierComponents003 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents002 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_004', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents004 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("list");
          console.info('noBarrierComponents004 START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("List");
          console.info('noBarrierComponents004 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents004 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_005', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents005 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Grid");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Grid");
          console.info('noBarrierComponents005 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents005 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_006', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("AlphabetIndexer");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Stack");
          console.info('noBarrierComponents006 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents006 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_007', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents006 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Blank");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Column");
          console.info('noBarrierComponents007 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents007 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_008', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents008 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Button");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Button");
          console.info('noBarrierComponents008 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents008 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents010 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Checkbox");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Checkbox");
          console.info('noBarrierComponents010 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents010 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('noBarrierComponents_static_011', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("DataPanel");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("DataPanel");
          console.info('noBarrierComponents011 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents011 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_012', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents011 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("DatePicker");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("DatePicker");
          console.info('noBarrierComponents012 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents012 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_013', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents013 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("FormComponent");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("FormComponent");
          console.info('noBarrierComponents013 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents013 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_014', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents014 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Divider");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Divider");
          console.info('noBarrierComponents014 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents014 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_015', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents015 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Gauge");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Gauge");
          console.info('noBarrierComponents015 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents015 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_016', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents016 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Image");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Image");
          console.info('noBarrierComponents016 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents016 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_017', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents017 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Marquee");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Marquee");
          console.info('noBarrierComponents017 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents017 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_018', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents018 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("PatternLock");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("PatternLock");
          console.info('noBarrierComponents018 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents018 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_019', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents019 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Progress");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Progress");
          console.info('noBarrierComponents019 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents019 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_009', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents009 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("QRCode");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("QRCode");
          console.info('noBarrierComponents009 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents009 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_020', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents020 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Radio");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Radio");
          console.info('noBarrierComponents020 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents020 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_021', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents021 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Rating");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Rating");
          console.info('noBarrierComponents021 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents021 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_022', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents022 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("RemoteWindow");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("RemoteWindow");
          console.info('noBarrierComponents022 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents022 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_023', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents023 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("RichText");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Web");
          console.info('noBarrierComponents023 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents023 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_024', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents024 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Search");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Search");
          console.info('noBarrierComponents024 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents024 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    
    it('noBarrierComponents_static_026', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents026 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Slider");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Slider");
          console.info('noBarrierComponents026 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents026 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_027', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents027 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("Toggle");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Toggle");
          console.info('noBarrierComponents027 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents027 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('noBarrierComponents_static_028', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents028 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("TimePicker");
          console.info(' START  :' + JSON.stringify(strJson));
           expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("TimePicker");
          console.info('noBarrierComponents028 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents028 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
   
    it('noBarrierComponents_static_030', 0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents030 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey("XComponent");
          console.info(' START  :' + JSON.stringify(strJson));
          expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("XComponent");
          console.info('noBarrierComponents030 END ');
        } catch (err:Error) {
          expect().assertFail()
          console.info('noBarrierComponents030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}