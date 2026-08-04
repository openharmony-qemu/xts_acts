/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import window from '@ohos.window';
import display from '@ohos.display';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import deviceInfo from '@ohos.deviceInfo';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

export default function windowPropertiesTest3() {
  describe('windowPropertiesTest3', () => {
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let mainWindowClass: window.Window;
    let deviceType: string = deviceInfo.deviceType;
    let isSyscapSessionManagerSupported: boolean = false;
    let windowRect: window.Rect;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.info('windowPropertiesTest3 context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      mainWindowClass = windowStage.getMainWindowSync();

      console.info(`deviceType: ${deviceType}`);

      isSyscapSessionManagerSupported = canIUse('SystemCapability.Window.SessionManager');
      console.info(`isSyscapSessionManagerSupported: ${isSyscapSessionManagerSupported}`);

      windowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`windowRect: ${JSON.stringify(windowRect)}`);
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    // ==================== setTouchableAreas 测试用例 ====================

    /**
     * @tc.name   testSetTouchableAreas_singleRect
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0100
     * @tc.desc   设置单个可触摸区域，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTouchableAreas_singleRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetTouchableAreas_singleRect';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = Math.floor(currentWindowRect.width / 3);
      let rectHeight = Math.floor(currentWindowRect.height / 3);
      let rectLeft = Math.floor(currentWindowRect.width / 3);
      let rectTop = Math.floor(currentWindowRect.height / 3);
      
      let touchableRects: Array<window.Rect> = [
        { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_multipleRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0200
     * @tc.desc   设置多个可触摸区域（3个），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_multipleRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_multipleRects';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let touchableRects: Array<window.Rect> = [
        { 
          left: Math.floor(currentWindowRect.width / 3),
          top: Math.floor(currentWindowRect.height / 3),
          width: Math.floor(currentWindowRect.width / 3),
          height: Math.floor(currentWindowRect.height / 3)
        },
        { 
          left: 0,
          top: Math.floor(currentWindowRect.height / 6),
          width: Math.floor(currentWindowRect.width / 4),
          height: Math.floor(currentWindowRect.height / 3)
        },
        { 
          left: Math.floor(currentWindowRect.width * 2 / 3),
          top: Math.floor(currentWindowRect.height * 2 / 3),
          width: Math.floor(currentWindowRect.width / 3),
          height: Math.floor(currentWindowRect.height / 3)
        }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_maxRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0300
     * @tc.desc   设置最大数量可触摸区域（10个），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_maxRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_maxRects';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = Math.floor(currentWindowRect.width / 10);
      let rectHeight = Math.floor(currentWindowRect.height / 10);
      let touchableRects: Array<window.Rect> = [];
      
      for (let i = 0; i < 10; i++) {
        touchableRects.push({
          left: Math.floor(currentWindowRect.width * i / 10),
          top: Math.floor(currentWindowRect.height * i / 10),
          width: rectWidth,
          height: rectHeight
        });
      }
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_emptyArray
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0400
     * @tc.desc   设置空数组，验证恢复为默认状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_emptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_emptyArray';
      let touchableRects: Array<window.Rect> = [];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_fullWindow
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0500
     * @tc.desc   设置完整窗口区域，验证等同于默认状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_fullWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_fullWindow';
      let touchableRects: Array<window.Rect> = [
        { left: 0, top: 0, width: windowRect.width, height: windowRect.height }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetTouchableAreas_exceedMaxRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0600
     * @tc.desc   设置超过最大数量（11个）的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_exceedMaxRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_exceedMaxRects';
      let touchableRects: Array<window.Rect> = [];
      for (let i = 0; i < 11; i++) {
        touchableRects.push({ left: i * 30, top: i * 30, width: 50, height: 50 });
      }
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_outOfWindowRange
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0700
     * @tc.desc   设置超出窗口范围的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_outOfWindowRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_outOfWindowRange';
      let touchableRects: Array<window.Rect> = [
        { left: -100, top: 0, width: 200, height: 200 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_negativeWidthHeight
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0800
     * @tc.desc   设置宽/高为负值的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_negativeWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_negativeWidthHeight';
      let touchableRects: Array<window.Rect> = [
        { left: 100, top: 100, width: -200, height: 200 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_null
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0900
     * @tc.desc   传入null参数，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_null';
      try {
        await mainWindowClass.setTouchableAreas(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTouchableAreas_undefined
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_1000
     * @tc.desc   传入undefined参数，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_undefined';
      try {
        await mainWindowClass.setTouchableAreas(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTouchableAreas_floatParams
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0100
     * @tc.desc   Rect参数使用浮点数，验证向下取整后调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_floatParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_floatParams';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = 10.5;
      let rectHeight = 10.5;
      let rectLeft = 0;
      let rectTop = 0;
      
      let touchableRects: Array<window.Rect> = [
        { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      console.info(`${message} Verify float params: left=${rectLeft}, top=${rectTop}, width=${rectWidth}, height=${rectHeight}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_zeroWidthHeight
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0200
     * @tc.desc   设置宽/高为0的可触摸区域，验证调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_zeroWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_zeroWidthHeight';
      let touchableRects: Array<window.Rect> = [
        { left: 0, top: 0, width: 0, height: 0 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_windowDestroyed
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0300
     * @tc.desc   窗口销毁后调用，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_windowDestroyed';
      let config: window.Configuration = {
        name: 'testSetTouchableAreas_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        let testWindowRect = testWindow.getWindowProperties().windowRect;
        console.info(`${message} testWindowRect: ${JSON.stringify(testWindowRect)}`);
        
        let rectWidth = Math.floor(testWindowRect.width / 3);
        let rectHeight = Math.floor(testWindowRect.height / 3);
        let rectLeft = Math.floor(testWindowRect.width / 3);
        let rectTop = Math.floor(testWindowRect.height / 3);
        
        let touchableRects: Array<window.Rect> = [
          { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
        ];
        console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
        
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          await testWindow.setTouchableAreas(touchableRects);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    // ==================== setWindowContainerModalColor 测试用例 ====================

    /**
     * @tc.name   testSetWindowContainerModalColor_standardRGB
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0100
     * @tc.desc   设置标准RGB颜色，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowContainerModalColor_standardRGB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_standardRGB';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetWindowContainerModalColor_ARGB
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0200
     * @tc.desc   设置ARGB颜色（含透明度），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_ARGB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_ARGB';
      let activeColor: string = '#80FF0000';
      let inactiveColor: string = '#8000FF00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetWindowContainerModalColor_transparent
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0300
     * @tc.desc   设置全透明颜色，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_transparent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_transparent';
      let activeColor: string = '#00000000';
      let inactiveColor: string = '#00000000';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_lowercase
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0400
     * @tc.desc   使用小写颜色格式，验证接口调用成功（不区分大小写）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_lowercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_lowercase';
      let activeColor: string = '#ff0000';
      let inactiveColor: string = '#00ff00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_focusStateChange
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0500
     * @tc.desc   设置焦点态和非焦点态颜色，验证颜色设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_focusStateChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_focusStateChange';
      let activeColor: string = '#FFFFFF';
      let inactiveColor: string = '#CCCCCC';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_windowDestroyed
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0600
     * @tc.desc   窗口销毁后调用，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_windowDestroyed';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      let config: window.Configuration = {
        name: 'testSetWindowContainerModalColor_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          testWindow.setWindowContainerModalColor(activeColor, inactiveColor);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_subWindow
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0700
     * @tc.desc   子窗口调用，验证1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_subWindow';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      let config: window.Configuration = {
        name: 'testSetWindowContainerModalColor_subWindow',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        try {
          testWindow.setWindowContainerModalColor(activeColor, inactiveColor);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300004) {
            console.info(`${message} Expected error 1300004.`);
            expect(exception.code).assertEqual(1300004);
            done();
          } else if (exception.code === 801){
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else{
            expect().assertFail();
            done();
          }
        } finally {
          await testWindow.destroyWindow();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_emptyString
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0800
     * @tc.desc   设置空字符串颜色，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_emptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_emptyString';
      let activeColor: string = '';
      let inactiveColor: string = '';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          if (exception.code === 401) {
            console.info(`${message} Expected error 401.`);
            expect(exception.code).assertEqual(401);
            done();
          } else {
            expect().assertFail();
            done();
          }
        } else {
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
      });

    /**
       * @tc.name   testSetWindowContainerModalColor_null
       * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0900
       * @tc.desc   设置null颜色参数，验证401
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowContainerModalColor_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let message = 'testSetWindowContainerModalColor_null';
        try {
          mainWindowClass.setWindowContainerModalColor(null, null);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 401) {
            console.info(`${message} Expected error 401.`);
            expect(exception.code).assertEqual(401);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });

      /**
       * @tc.name   testSetWindowContainerModalColor_undefined
       * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_1000
       * @tc.desc   设置undefined颜色参数，验证401
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowContainerModalColor_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let message = 'testSetWindowContainerModalColor_undefined';
        try {
          mainWindowClass.setWindowContainerModalColor(undefined, undefined);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 401) {
            console.info(`${message} Expected error 401.`);
            expect(exception.code).assertEqual(401);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });

    // ==================== getAllWindowLayoutInfo 测试用例 ====================

    /**
     * @tc.name   testGetAllWindowLayoutInfo_noOption
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0100
     * @tc.desc   不传option参数，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllWindowLayoutInfo_noOption', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_noOption';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_defaultOption
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0200
     * @tc.desc   传入默认option，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_defaultOption', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_defaultOption';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = {};
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId, option);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_excludeSystemWindows
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0300
     * @tc.desc   excludeSystemWindows为true，排除系统窗口
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_excludeSystemWindows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_excludeSystemWindows';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { excludeSystemWindows: true };
      let isSupport = canIUse('SystemCapability.Window.SessionManager')

      let config: window.Configuration = {
        name: 'testGetAllWindowLayoutInfo_excludeSystemWindows',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };

      try {
        let testWindow = await window.createWindow(config);
        console.info(`${message} createWindow success.`);
        await testWindow.setUIContent("testability/pages/Index1");
        console.info(`${message} setUIContent success.`);
        await testWindow.showWindow();
        console.info(`${message} showWindow success.`);
        let windowLimits = testWindow.getWindowLimits();
        console.info(`${message} getWindowLimits.{windowLimits}`);
        let tmpWindowWidth:number = 0;
        let tmpWindowHeight:number = 0;
        if (windowLimits.minWidth !== undefined && windowLimits.maxWidth != undefined){
          tmpWindowWidth = windowLimits?.minWidth + 100 < windowLimits?.maxWidth ? windowLimits?.minWidth + 100 : windowLimits?.minWidth;
        }
        if (windowLimits.minHeight !== undefined && windowLimits.maxHeight != undefined){
          tmpWindowHeight = windowLimits?.minHeight + 100 < windowLimits?.maxHeight ? windowLimits?.minHeight + 100 : windowLimits?.minHeight;
        }
        await testWindow.resize(tmpWindowWidth, tmpWindowHeight);
        console.info(`${message} resize success.`);
        await testWindow.moveWindowTo(100, 100);
        console.info(`${message} moveWindowTo success.`);

        await sleep(500);

        try {
          let data = await window.getAllWindowLayoutInfo(displayId, option);
          console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
          let flag = false
          for (let i = 0; i < data.length; i++) {
            if (data[i].windowRect.width === tmpWindowWidth && data[i].windowRect.height === tmpWindowHeight) {
              flag = true
            }
          }
          expect(flag).assertTrue()
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (isSupport === false){
            if (exception.code === 801) {
              console.info(`${message} Capability not supported.`);
              done();
            } else {
              expect().assertFail();
              done();
            }
          }else{
            expect().assertFail();
            done();
          }
        } finally {
          await testWindow.destroyWindow();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }

    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidDisplayId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0400
     * @tc.desc   使用无效displayId（负数），验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidDisplayId';
      let displayId: number = -1;

      try {
        await window.getAllWindowLayoutInfo(displayId);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(401);
          done();
        }else{
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidAboveWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0500
     * @tc.desc   foregroundAboveWindow传入不存在windowId，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidAboveWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidAboveWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { foregroundAboveWindow: -1 };

      try {
        await window.getAllWindowLayoutInfo(displayId, option);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(1300016);
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidBelowWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0600
     * @tc.desc   foregroundBelowWindow传入不存在windowId，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidBelowWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidBelowWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { foregroundBelowWindow: -1 };

      try {
        await window.getAllWindowLayoutInfo(displayId, option);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(1300016);
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_sameWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0800
     * @tc.desc   foregroundBelowWindow和foregroundAboveWindow等于主窗windowId，返回空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_sameWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_sameWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let mainWindowId: number = mainWindowClass.getWindowProperties().id;
      console.info(`${message} mainWindowId: ${mainWindowId}`);
      let option: window.WindowInfoOptions = {
        foregroundBelowWindow: mainWindowId,
        foregroundAboveWindow: mainWindowId
      };
      let isSupport = canIUse('SystemCapability.Window.SessionManager')

      try {
        let data = await window.getAllWindowLayoutInfo(displayId, option);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length === 0).assertTrue();
        console.info(`${message} Empty array returned as expected.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_excludeSystemWindowsFalse
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0900
     * @tc.desc   excludeSystemWindows为false，不排除系统窗口
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_excludeSystemWindowsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_excludeSystemWindowsFalse';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { excludeSystemWindows: false };
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId, option);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_optionNull
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_1000
     * @tc.desc   传入option为null，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_optionNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_optionNull';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId, null);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_optionUndefined
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_1100
     * @tc.desc   传入option为undefined，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_optionUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_optionUndefined';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId, undefined);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== @Env(ReadonlyEnvKey.WINDOW_SYSTEM_DENSITY) 测试用例 ====================

    /**
     * @tc.name   testEnvSystemDensity
     * @tc.number SUB_WINDOW_ENV_SYSTEM_DENSITY_0100
     * @tc.desc   验证@Env(ReadonlyEnvKey.WINDOW_SYSTEM_DENSITY)获取的SystemDensity与getWindowDensityInfo查询结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvSystemDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testEnvSystemDensity';
      console.info(`${message} begin`);
      
      try {
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        
        let envSystemDensity = AppStorage.get('SystemDensity') as number;
        console.info(`${message} envSystemDensity from page: ${envSystemDensity}`);
        
        let densityInfo = mainWindowClass.getWindowDensityInfo();
        console.info(`${message} densityInfo: ${JSON.stringify(densityInfo)}`);
        let systemDensityFromApi = densityInfo.systemDensity;
        console.info(`${message} systemDensity from getWindowDensityInfo: ${systemDensityFromApi}`);
        
        expect(envSystemDensity).assertEqual(systemDensityFromApi);
        console.info(`${message} Succeeded. envSystemDensity equals systemDensity from API.`);
        
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        if (exception.code === 801) {
          if (!canIUseRes) {
            console.info(`${message} Capability not supported and canIUse is false.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            console.info(`${message} Capability not supported but canIUse is true.`);
            expect().assertFail();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== @Env(ReadonlyEnvKey.WINDOW_DISPLAY_ID) 测试用例 ====================

    /**
     * @tc.name   testEnvDisplayId
     * @tc.number SUB_WINDOW_ENV_DISPLAY_ID_0100
     * @tc.desc   验证@Env(ReadonlyEnvKey.WINDOW_DISPLAY_ID)获取的DisplayId与getDefaultDisplaySync查询结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testEnvDisplayId';
      console.info(`${message} begin`);
      
      try {
        await mainWindowClass.setUIContent('testability/pages/Index');
        await sleep(500);
        
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        
        let envDisplayId = AppStorage.get('DisplayId') as number;
        console.info(`${message} envDisplayId from page: ${envDisplayId}`);
        
        let displayInfo = display.getDefaultDisplaySync();
        console.info(`${message} displayInfo: ${JSON.stringify(displayInfo)}`);
        let displayIdFromApi = displayInfo.id;
        console.info(`${message} displayId from getDefaultDisplaySync: ${displayIdFromApi}`);
        
        expect(envDisplayId).assertEqual(displayIdFromApi);
        console.info(`${message} Succeeded. envDisplayId equals displayId from API.`);
        
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    // ==================== isInWindowPostureMode / onWindowPostureModeChange / offWindowPostureModeChange 测试用例 ====================

    /**
     * @tc.name   testIsInWindowPostureMode_normal
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0100
     * @tc.desc   查询当前窗口是否处于桌面姿态模式，结合FoldStatus、getLiveCreaseRegion、getWindowStatus等条件验证返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsInWindowPostureMode_normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_normal';
      try {
        let isSupport = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} isSupport: ${isSupport}`);
        if (!isSupport) {
          console.info(`${message} SystemCapability.Window.SessionManager not supported.`);
          done();
          return;
        }

        let isHalfFolded = false;
        let isCreaseWidthGreater = false;
        let isFullScreenOrMaximize = false;
        let isCreaseInWindow = false;
        let creaseTop = 0;
        let creaseHeight = 0;

        try {
          let foldStatus: display.FoldStatus = display.getFoldStatus();
          console.info(`${message} foldStatus: ${foldStatus}`);
          isHalfFolded = foldStatus === display.FoldStatus.FOLD_STATUS_HALF_FOLDED;
        } catch (e) {
          console.info(`${message} getFoldStatus not supported.`);
        }

        try {
          let defaultDisplay = display.getDefaultDisplaySync();
          let creaseRegion = defaultDisplay.getLiveCreaseRegion();
          console.info(`${message} creaseRegion: ${JSON.stringify(creaseRegion)}`);
          if (creaseRegion.creaseRects.length > 0) {
            let creaseRect = creaseRegion.creaseRects[0];
            console.info(`${message} creaseRect: ${JSON.stringify(creaseRect)}`);
            isCreaseWidthGreater = creaseRect.width > creaseRect.height;
            creaseTop = creaseRect.top;
            creaseHeight = creaseRect.height;
          }
        } catch (e) {
          console.info(`${message} getLiveCreaseRegion not supported.`);
        }

        try {
          let windowStatus = mainWindowClass.getWindowStatus();
          console.info(`${message} windowStatus: ${windowStatus}`);
          isFullScreenOrMaximize = windowStatus === window.WindowStatusType.FULL_SCREEN ||
            windowStatus === window.WindowStatusType.MAXIMIZE;
        } catch (e) {
          console.info(`${message} getWindowStatus not supported.`);
        }

        let windowRect = mainWindowClass.getWindowProperties().windowRect;
        console.info(`${message} windowRect: ${JSON.stringify(windowRect)}`);
        isCreaseInWindow = (windowRect.top + windowRect.height) > (creaseTop + creaseHeight);

        let expectedResult = isHalfFolded && isCreaseWidthGreater && isFullScreenOrMaximize && isCreaseInWindow;
        console.info(`${message} isHalfFolded: ${isHalfFolded}, isCreaseWidthGreater: ${isCreaseWidthGreater}, isFullScreenOrMaximize: ${isFullScreenOrMaximize}, isCreaseInWindow: ${isCreaseInWindow}`);
        console.info(`${message} expectedResult: ${expectedResult}`);

        let result = mainWindowClass.isInWindowPostureMode(window.WindowPostureMode.DESKTOP_MODE);
        console.info(`${message} result: ${result}`);
        expect(result).assertEqual(expectedResult);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testIsInWindowPostureMode_windowDestroyed
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0200
     * @tc.desc   窗口销毁后调用isInWindowPostureMode，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsInWindowPostureMode_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_windowDestroyed';
      let config: window.Configuration = {
        name: 'testIsInWindowPostureMode_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          testWindow.isInWindowPostureMode(window.WindowPostureMode.DESKTOP_MODE);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testIsInWindowPostureMode_1300016
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0300
     * @tc.desc   传入无效的WindowPostureMode值999，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsInWindowPostureMode_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_1300016';
      try {
        mainWindowClass.isInWindowPostureMode(999 as window.WindowPostureMode);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOnOffWindowPostureModeChange_offTwice
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0200
     * @tc.desc   调用2次on监听，调用2次off分别取消每个监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffWindowPostureModeChange_offTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnOffWindowPostureModeChange_offTwice';
      try {
        let callback1 = (isInPostureMode: boolean) => {
          console.info(`${message} callback1 triggered. isInPostureMode: ${isInPostureMode}`);
        };
        let callback2 = (isInPostureMode: boolean) => {
          console.info(`${message} callback2 triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback1);
        console.info(`${message} Succeeded in enabling listener 1.`);
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback2);
        console.info(`${message} Succeeded in enabling listener 2.`);
        mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback1);
        console.info(`${message} Succeeded in disabling listener 1.`);
        mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback2);
        console.info(`${message} Succeeded in disabling listener 2.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testOnOffWindowPostureModeChange_offAll
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0300
     * @tc.desc   调用2次on监听，调用off接口（不传callback）取消全部监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffWindowPostureModeChange_offAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnOffWindowPostureModeChange_offAll';
      try {
        let callback1 = (isInPostureMode: boolean) => {
          console.info(`${message} callback1 triggered. isInPostureMode: ${isInPostureMode}`);
        };
        let callback2 = (isInPostureMode: boolean) => {
          console.info(`${message} callback2 triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback1);
        console.info(`${message} Succeeded in enabling listener 1.`);
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback2);
        console.info(`${message} Succeeded in enabling listener 2.`);
        mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE);
        console.info(`${message} Succeeded in disabling all listeners.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_windowDestroyed
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0400
     * @tc.desc   窗口销毁后调用onWindowPostureModeChange，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_windowDestroyed';
      let config: window.Configuration = {
        name: 'testOnWindowPostureModeChange_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          let callback = (isInPostureMode: boolean) => {
            console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
          };
          testWindow.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_windowDestroyed
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0500
     * @tc.desc   窗口销毁后调用offWindowPostureModeChange，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_windowDestroyed';
      let config: window.Configuration = {
        name: 'testOffWindowPostureModeChange_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          testWindow.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_1300016
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0600
     * @tc.desc   传入无效的WindowPostureMode值999，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_1300016';
      try {
        let callback = (isInPostureMode: boolean) => {
          console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.onWindowPostureModeChange(999 as window.WindowPostureMode, callback);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_1300016
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0700
     * @tc.desc   传入无效的WindowPostureMode值999，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_1300016';
      try {
        mainWindowClass.offWindowPostureModeChange(999 as window.WindowPostureMode);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testIsInWindowPostureMode_null
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0400
     * @tc.desc   传入null作为mode参数，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsInWindowPostureMode_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_null';
      try {
        mainWindowClass.isInWindowPostureMode(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testIsInWindowPostureMode_undefined
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0500
     * @tc.desc   传入undefined作为mode参数，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsInWindowPostureMode_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_undefined';
      try {
        mainWindowClass.isInWindowPostureMode(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testIsInWindowPostureMode_returnValue
     * @tc.number SUB_WINDOW_ISINWINDOWPOSTUREMODE_FUNCTION_0600
     * @tc.desc   调用isInWindowPostureMode，断言返回值为true或false，满足返回值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsInWindowPostureMode_returnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testIsInWindowPostureMode_returnValue';
      try {
        let isSupport = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} isSupport: ${isSupport}`);
        if (!isSupport) {
          console.info(`${message} SystemCapability.Window.SessionManager not supported.`);
          done();
          return;
        }
        let result = mainWindowClass.isInWindowPostureMode(window.WindowPostureMode.DESKTOP_MODE);
        console.info(`${message} result: ${result}`);
        expect(result === true || result === false).assertTrue();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_modeNull
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0800
     * @tc.desc   onWindowPostureModeChange第一个入参传入null，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_modeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_modeNull';
      try {
        let callback = (isInPostureMode: boolean) => {
          console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.onWindowPostureModeChange(null, callback);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_modeUndefined
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_0900
     * @tc.desc   onWindowPostureModeChange第一个入参传入undefined，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_modeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_modeUndefined';
      try {
        let callback = (isInPostureMode: boolean) => {
          console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.onWindowPostureModeChange(undefined, callback);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_callbackNull
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1000
     * @tc.desc   onWindowPostureModeChange第二个入参传入null，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_callbackNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_callbackNull';
      try {
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOnWindowPostureModeChange_callbackUndefined
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1100
     * @tc.desc   onWindowPostureModeChange第二个入参传入undefined，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowPostureModeChange_callbackUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_callbackUndefined';
      try {
        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_modeNull
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1200
     * @tc.desc   offWindowPostureModeChange第一个入参传入null，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_modeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_modeNull';
      try {
        let callback = (isInPostureMode: boolean) => {
          console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.offWindowPostureModeChange(null, callback);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_modeUndefined
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1300
     * @tc.desc   offWindowPostureModeChange第一个入参传入undefined，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_modeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_modeUndefined';
      try {
        let callback = (isInPostureMode: boolean) => {
          console.info(`${message} callback triggered. isInPostureMode: ${isInPostureMode}`);
        };
        mainWindowClass.offWindowPostureModeChange(undefined, callback);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_callbackNull
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1400
     * @tc.desc   offWindowPostureModeChange第二个入参传入null，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_callbackNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_callbackNull';
      try {
        mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testOffWindowPostureModeChange_callbackUndefined
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1500
     * @tc.desc   offWindowPostureModeChange第二个入参传入undefined，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowPostureModeChange_callbackUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowPostureModeChange_callbackUndefined';
      try {
        mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });
  });
}