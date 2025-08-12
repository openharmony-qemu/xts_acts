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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
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
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

export default function progressTest() {
  describe('ActsProgressTest', () => {
    beforeAll(() => {
      console.info("ActsProgressTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.other.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("ActsProgressTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/Progress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ActsProgressTest state success " + JSON.stringify(pages));
        if (!("Progress" == pages.name)) {
          console.info("get ActsProgressTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ActsProgressTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ActsProgressTest after each called");
    });


    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0100
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to 0x00ff00
     */
    it('ArkUX_Stage_Progress_updateColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0100 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0200
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_Progress_updateColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0200 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0200 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0300
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_Progress_updateColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0300 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0300 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_Progress_updateColor_static_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0300', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
 *tc.number ArkUX_Stage_Progress_updateColor_static_0400
 *tc.name   Tests the updateColor property of the Progress component
 *tc.desc   Set the updateColor property parameter to Color.Pink
 */
    it('ArkUX_Stage_Progress_updateColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0400 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0400 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_static_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0500
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to $r("app.color.Progress_updateColor")
     */
    it('ArkUX_Stage_Progress_updateColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0500 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0500 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_Progress_updateColor_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0600
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to 0xff006cde
     */
    it('ArkUX_Stage_Progress_updateColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0600 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0700
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to "#33006cde"
     */
    it('ArkUX_Stage_Progress_updateColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0700 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0700 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0800
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to "rgba(0,108,222,0.8)"
     */
    it('ArkUX_Stage_Progress_updateColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0800 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0800 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#CC006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_static_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0800', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_0900
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to $r("app.color.Progress_updateColor_transparency")
     */
    it('ArkUX_Stage_Progress_updateColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_0900 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_0900 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#33006CDE");
          console.info('ArkUX_Stage_Progress_updateColor_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1000
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to an outlier ""
    */
    it('ArkUX_Stage_Progress_updateColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1000 START');
      setTimeout(async () => {
        try {
          let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default = JSON.parseJsonElement(strJson_default);
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1000 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
          console.info('ArkUX_Stage_Progress_updateColor_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1000', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
     *tc.number ArkUX_Stage_Progress_updateColor_static_1100
     *tc.name   Tests the updateColor property of the Progress component
     *tc.desc   Set the updateColor property parameter to an outlier null
     */
    it('ArkUX_Stage_Progress_updateColor_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1100 START');
      setTimeout(async () => {
        try {
          let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default = JSON.parseJsonElement(strJson_default);
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1100 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
          console.info('ArkUX_Stage_Progress_updateColor_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1200
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to an outlier undefined
    */
    it('ArkUX_Stage_Progress_updateColor_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1200 START');
      setTimeout(async () => {
        try {
          let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default = JSON.parseJsonElement(strJson_default);
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1200 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
          console.info('ArkUX_Stage_Progress_updateColor_static_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1300
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to an outlier 'bgr(138,43,226)'
    */
    it('ArkUX_Stage_Progress_updateColor_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1300 START');
      setTimeout(async () => {
        try {
          let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default = JSON.parseJsonElement(strJson_default);
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1300 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1300 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
          console.info('ArkUX_Stage_Progress_updateColor_static_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1300', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1400
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to "rgba(0,108,222,70)"
    *          and again set the updateColor property parameter to Color.Pink.
    */
    it('ArkUX_Stage_Progress_updateColor_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1400 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1400 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1400 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Progress_updateColor_static_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1400', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1500
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to "rgba(0,108,222,70)"
    *          and again set the updateColor property parameter to outlier undefined.
    */
    it('ArkUX_Stage_Progress_updateColor_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1500 START');
      setTimeout(async () => {
        try {
          let strJson_default = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor_default');
          let obj_default = JSON.parseJsonElement(strJson_default);
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1500 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual(obj_default.getElement('$attrs').getString('updateColor'));
          console.info('ArkUX_Stage_Progress_updateColor_static_1500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });


    /*
    *tc.number ArkUX_Stage_Progress_updateColor_static_1600
    *tc.name   Tests the updateColor property of the Progress component
    *tc.desc   Set the updateColor property parameter to 0x00ff00
    *          and the universal property backgroundColor property value to Color.Pink
    */
    it('ArkUX_Stage_Progress_updateColor_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateColor_static_1600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateColor_static_1600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateColor_static_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateColor_static_1600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateColor_static_1600 component obj.getElement('$attrs').getString('updateColor') is: " +
          JSON.stringify(obj.getElement('$attrs').getString('updateColor')));
          expect(obj.getElement('$attrs').getString('updateColor')).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Progress_updateColor_static_1600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateColor_static_1600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateColor_Button_1600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0100
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to 0
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0100 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0200
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to 5
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0200 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0200 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0200 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0200', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0500
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to null
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0500 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0500 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0500 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0500', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0600
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to undefined
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0600 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0600 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0600 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0600', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0700
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to -2
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0700 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0700 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0700 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0700', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_0900
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to normal twice
    */
    it('ArkUX_Stage_Progress_updateProgress_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_0900 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0900 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_0900 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(1);
          console.info('ArkUX_Stage_Progress_updateProgress_static_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_0900', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_1000
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to normal first and then abnormal
    */
    it('ArkUX_Stage_Progress_updateProgress_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_1000 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_1000 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_1000 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(0);
          console.info('ArkUX_Stage_Progress_updateProgress_static_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1000', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });

    /*
    *tc.number ArkUX_Stage_Progress_updateProgress_static_1100
    *tc.name   Tests the updateProgress property of the Progress component
    *tc.desc   Set the updateProgress property parameter to first exception and then normal
    */
    it('ArkUX_Stage_Progress_updateProgress_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Progress_updateProgress_static_1100 START');
      setTimeout(async () => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_Progress_updateColor');
          console.info('ArkUX_Stage_Progress_updateProgress_static_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_Progress_updateProgress_static_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Progress_updateProgress_static_1100 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_Progress_updateProgress_static_1100 component obj.getElement('$attrs').getDouble('updateProgress') is: " +
          JSON.stringify(obj.getElement('$attrs').getDouble('updateProgress')));
          expect(obj.getElement('$attrs').getDouble('updateProgress')).assertEqual(5);
          console.info('ArkUX_Stage_Progress_updateProgress_static_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Progress_updateProgress_static_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 3000)
      setTimeout(async () => {
        let result = inspector.sendEventByKey('ArkUX_Stage_Progress_updateProgress_Button_1100', 10, '')
        expect(result).assertEqual(true);
      }, 1000)
    });
  })
}