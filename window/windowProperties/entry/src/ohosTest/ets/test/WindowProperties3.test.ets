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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import deviceInfo from '@ohos.deviceInfo';
import { Driver, ON, Component } from '@ohos.UiTest';
import { screenshot } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

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
        await mainWindowClass.setUIContent('testability/pages/Index');
        await sleep(1000);

        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('SystemDensity'));
        let envSystemDensityText = await button.getText();
        let envSystemDensity = Number(envSystemDensityText);
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

    /**
     * @tc.name   testOnWindowPostureModeChange_triggerByMaximize
     * @tc.number SUB_WINDOW_ONOFFWINDOWPOSTUREMODECHANGE_FUNCTION_1600
     * @tc.desc   在满足折叠状态、折痕宽度大于高度的条件下，通过maximizeWithOptions进入桌面模式，通过recover退出桌面模式，验证回调触发（条件4在瀑布模式或展开态最大化时自动满足）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnWindowPostureModeChange_triggerByMaximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testOnWindowPostureModeChange_triggerByMaximize';
      try {
        let isSupport = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} isSupport: ${isSupport}`);
        if (!isSupport || deviceType !== '2in1') {
          console.info(`${message} SystemCapability.Window.SessionManager not supported.`);
          done();
          return;
        }

        // 检查前置条件
        let isHalfFolded = false;
        let isCreaseWidthGreater = false;

        // 条件1: 检查折叠状态是否为半折叠
        try {
          let foldStatus: display.FoldStatus = display.getFoldStatus();
          console.info(`${message} foldStatus: ${foldStatus}`);
          isHalfFolded = foldStatus === display.FoldStatus.FOLD_STATUS_HALF_FOLDED;
          console.info(`${message} isHalfFolded: ${isHalfFolded}`);
        } catch (e) {
          console.info(`${message} getFoldStatus not supported.`);
        }

        // 条件2: 检查折痕宽度是否大于高度
        try {
          let defaultDisplay = display.getDefaultDisplaySync();
          let creaseRegion = defaultDisplay.getLiveCreaseRegion();
          console.info(`${message} creaseRegion: ${JSON.stringify(creaseRegion)}`);
          if (creaseRegion.creaseRects.length > 0) {
            let creaseRect = creaseRegion.creaseRects[0];
            console.info(`${message} creaseRect: ${JSON.stringify(creaseRect)}`);
            isCreaseWidthGreater = creaseRect.width > creaseRect.height;
            console.info(`${message} isCreaseWidthGreater: ${isCreaseWidthGreater}`);
          }
        } catch (e) {
          console.info(`${message} getLiveCreaseRegion not supported.`);
        }

        // 如果满足条件1、2，则继续测试（条件4在瀑布模式或展开态最大化时自动满足）
        let shouldTestContinue = isHalfFolded && isCreaseWidthGreater;
        console.info(`${message} shouldTestContinue: ${shouldTestContinue}`);

        if (!shouldTestContinue) {
          console.info(`${message} Preconditions not met. Skip test.`);
          done();
          return;
        }

        // 记录回调触发的状态
        let callbackIsInPostureMode = false;
        let callbackCount = 0;

        // 注册监听
        let callback = (isInPostureMode: boolean) => {
          callbackCount++;
          callbackIsInPostureMode = isInPostureMode;
          console.info(`${message} callback triggered. Count: ${callbackCount}, isInPostureMode: ${isInPostureMode}`);
        };

        mainWindowClass.onWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback);
        console.info(`${message} Succeeded in enabling listener.`);

        // 使用 maximizeWithOptions 进入最大化模式（满足条件3）
        try {
          let maximizeOptions: window.MaximizeOptions = {
            acrossDisplayPresentation: window.AcrossDisplayPresentation.ENTER_ACROSS_DISPLAY_MODE
          };
          console.info(`${message} Calling maximizeWithOptions with ENTER_ACROSS_DISPLAY_MODE.`);
          await mainWindowClass.maximizeWithOptions(maximizeOptions);
          console.info(`${message} Succeeded in maximizing window.`);
          await sleep(1000);

          // 验证进入桌面模式后的状态
          let windowStatus = mainWindowClass.getWindowStatus();
          console.info(`${message} windowStatus after maximize: ${windowStatus}`);
          let isFullScreenOrMaximize = windowStatus === window.WindowStatusType.FULL_SCREEN ||
            windowStatus === window.WindowStatusType.MAXIMIZE;
          console.info(`${message} isFullScreenOrMaximize: ${isFullScreenOrMaximize}`);

          // 如果满足所有条件，断言回调应该为true
          if (isFullScreenOrMaximize) {
            console.info(`${message} All conditions met. Callback should be true.`);
            await sleep(500);
            console.info(`${message} callbackCount: ${callbackCount}, callbackIsInPostureMode: ${callbackIsInPostureMode}`);
            // 断言满足所有条件时，回调参数为true
            expect(callbackIsInPostureMode).assertTrue();
            console.info(`${message} Asserted callbackIsInPostureMode is true when all conditions are met.`);
          }

          // 使用 recover 退出最大化模式（不满足条件3）
          console.info(`${message} Calling recover to exit maximize mode.`);
          await mainWindowClass.recover();
          console.info(`${message} Succeeded in recovering window.`);
          await sleep(1000);

          // 验证退出桌面模式后的状态
          windowStatus = mainWindowClass.getWindowStatus();
          console.info(`${message} windowStatus after recover: ${windowStatus}`);
          isFullScreenOrMaximize = windowStatus === window.WindowStatusType.FULL_SCREEN ||
            windowStatus === window.WindowStatusType.MAXIMIZE;
          console.info(`${message} isFullScreenOrMaximize after recover: ${isFullScreenOrMaximize}`);

          // 如果不满足条件3，断言回调应该为false
          if (!isFullScreenOrMaximize) {
            console.info(`${message} Condition 3 not met. Callback should be false.`);
            await sleep(500);
            console.info(`${message} Final callbackCount: ${callbackCount}, callbackIsInPostureMode: ${callbackIsInPostureMode}`);
            // 断言不满足条件时，回调参数为false
            expect(callbackIsInPostureMode).assertFalse();
            console.info(`${message} Asserted callbackIsInPostureMode is false when conditions are not met.`);
          }

          // 取消监听
          mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback);
          console.info(`${message} Succeeded in disabling listener.`);
          done();
        } catch (e) {
          console.error(`${message} Exception during maximize/recover. Cause: ${JSON.stringify(e)}`);
          mainWindowClass.offWindowPostureModeChange(window.WindowPostureMode.DESKTOP_MODE, callback);
          expect().assertFail();
          done();
        }
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    // ==================== setSpecificSystemBarEnabled 测试用例 ====================

    /**
     * @tc.name   testSetSpecificSystemBarEnabled_enableNull
     * @tc.number SUB_WINDOW_SETSPECIFICSYSTEMBARENABLED_PARAM_0100
     * @tc.desc   第二个入参enable传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabled_enableNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSpecificSystemBarEnabled_enableNull';
      try {
        await mainWindowClass.setSpecificSystemBarEnabled('status', null);
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
     * @tc.name   testSetSpecificSystemBarEnabled_enableUndefined
     * @tc.number SUB_WINDOW_SETSPECIFICSYSTEMBARENABLED_PARAM_0200
     * @tc.desc   第二个入参enable传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabled_enableUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSpecificSystemBarEnabled_enableUndefined';
      try {
        await mainWindowClass.setSpecificSystemBarEnabled('status', undefined);
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
     * @tc.name   testSetSpecificSystemBarEnabled_enableAnimationNull
     * @tc.number SUB_WINDOW_SETSPECIFICSYSTEMBARENABLED_PARAM_0300
     * @tc.desc   第三个入参enableAnimation传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabled_enableAnimationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSpecificSystemBarEnabled_enableAnimationNull';
      try {
        await mainWindowClass.setSpecificSystemBarEnabled('status', true, null);
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
     * @tc.name   testSetSpecificSystemBarEnabled_enableAnimationUndefined
     * @tc.number SUB_WINDOW_SETSPECIFICSYSTEMBARENABLED_PARAM_0400
     * @tc.desc   第三个入参enableAnimation传undefined，验证使用默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabled_enableAnimationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSpecificSystemBarEnabled_enableAnimationUndefined';
      try {
        await mainWindowClass.setSpecificSystemBarEnabled('status', true, undefined);
        console.info(`${message} Succeeded in setting specific system bar with undefined animation.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else if (exception.code === 401) {
          console.info(`${message} Parameter verification failed.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setGestureBackEnabled 测试用例 ====================

    /**
     * @tc.name   testSetGestureBackEnabled_null
     * @tc.number SUB_WINDOW_SETGESTUREBACKENABLED_PARAM_0100
     * @tc.desc   setGestureBackEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGestureBackEnabled_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetGestureBackEnabled_null';
      try {
        await mainWindowClass.setGestureBackEnabled(null);
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
     * @tc.name   testSetGestureBackEnabled_undefined
     * @tc.number SUB_WINDOW_SETGESTUREBACKENABLED_PARAM_0200
     * @tc.desc   setGestureBackEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetGestureBackEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetGestureBackEnabled_undefined';
      try {
        await mainWindowClass.setGestureBackEnabled(undefined);
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

    // ==================== on('displayIdChange') 测试用例 ====================

    /**
     * @tc.name   testOnDisplayIdChange_twoCallbacks
     * @tc.number SUB_WINDOW_ONDISPLAYIDCHANGE_FUNCTION_0100
     * @tc.desc   注册两个callback监听displayIdChange事件，通过moveWindowToGlobal移动窗口到另一块屏幕触发回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDisplayIdChange_twoCallbacks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnDisplayIdChange_twoCallbacks';

      // 判断是否满足触发displayIdChange的条件：PC + 折叠态 + 多屏幕
      let canMove = false;
      let isHalfFolded = false;
      let displays: Array<display.Display> = [];
      let currentDisplayId = -1;
      let targetDisplayId = -1;
      let windowRect: window.Rect = { left: 0, top: 0, width: 0, height: 0 };

      // 判断当前设备是否是PC
      if (deviceType !== '2in1') {
        console.info(`${message} Device is not PC (deviceType: ${deviceType}).`);
      } else {
        // 判断是否是折叠态（半折叠状态）
        try {
          let foldStatus: display.FoldStatus = display.getFoldStatus();
          console.info(`${message} foldStatus: ${foldStatus}`);
          isHalfFolded = foldStatus === display.FoldStatus.FOLD_STATUS_HALF_FOLDED;
          console.info(`${message} isHalfFolded: ${isHalfFolded}`);
        } catch (e) {
          console.info(`${message} getFoldStatus not supported.`);
        }

        if (isHalfFolded) {
          // 获取当前所有的屏幕ID
          try {
            displays = await display.getAllDisplays();
            console.info(`${message} All displays count: ${displays.length}`);
          } catch (e) {
            console.info(`${message} Failed to get all displays.`);
          }

          if (displays.length >= 2) {
            // 获取当前窗口在当前屏幕的位置
            windowRect = mainWindowClass.getWindowProperties().windowRect;
            currentDisplayId = display.getDefaultDisplaySync().id;

            // 已知当前窗口所在的屏幕ID，除此之后的display即为需要移动到的displayId
            for (let d of displays) {
              if (d.id !== currentDisplayId) {
                targetDisplayId = d.id;
                break;
              }
            }

            if (targetDisplayId !== -1) {
              canMove = true;
            }
          }
        }
      }

      console.info(`${message} canMove: ${canMove}`);

      let callbackATriggered = false;
      let callbackBTriggered = false;
      const callbackA = (data: number) => {
        console.info(`${message} callbackA triggered. displayId: ${JSON.stringify(data)}`);
        callbackATriggered = true;
      };
      const callbackB = (data: number) => {
        console.info(`${message} callbackB triggered. displayId: ${JSON.stringify(data)}`);
        callbackBTriggered = true;
      };

      try {
        // 注册两个callback
        mainWindowClass.on('displayIdChange', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('displayIdChange', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);

        if (canMove) {
          // 将当前窗口移动到另一块屏幕的同一位置触发监听
          let moveConfiguration: window.MoveConfiguration = {
            displayId: targetDisplayId
          };
          console.info(`${message} currentDisplayId: ${currentDisplayId}, targetDisplayId: ${targetDisplayId}, windowRect: ${JSON.stringify(windowRect)}`);
          await mainWindowClass.moveWindowToGlobal(windowRect.left, windowRect.top, moveConfiguration);
          console.info(`${message} Succeeded in moving window to another display.`);

          await sleep(3000);

          expect(callbackATriggered).assertTrue();
          expect(callbackBTriggered).assertTrue();
          console.info(`${message} Both callbacks triggered.`);

          mainWindowClass.off('displayIdChange', callbackA);
          mainWindowClass.off('displayIdChange', callbackB);
          console.info(`${message} Succeeded in unregistering both callbacks.`);

          // 将窗口移动回原屏幕
          let originalMoveConfiguration: window.MoveConfiguration = {
            displayId: currentDisplayId
          };
          await mainWindowClass.moveWindowToGlobal(windowRect.left, windowRect.top, originalMoveConfiguration);
          console.info(`${message} Succeeded in moving window back to original display.`);
          done();
        } else {
          // 不满足触发条件，验证注册监听不报错即可
          mainWindowClass.off('displayIdChange', callbackA);
          mainWindowClass.off('displayIdChange', callbackB);
          console.info(`${message} Conditions not met, succeeded in registering and unregistering callbacks.`);
          done();
        }
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          let isSupported = canIUse('SystemCapability.Window.SessionManager');
          if (isSupported) {
            console.info(`${message} SessionManager supported but got 801.`);
            expect().assertFail();
            done();
          } else {
            console.info(`${message} SessionManager not supported, expected 801.`);
            expect(exception.message != null).assertTrue();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== off('windowVisibilityChange') 测试用例 ====================

    /**
     * @tc.name   testOffWindowVisibilityChange_specificCallback
     * @tc.number SUB_WINDOW_OFFWINDOWVISIBILITYCHANGE_FUNCTION_0100
     * @tc.desc   注册两个callback后取消注册其中一个callback，验证取消成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowVisibilityChange_specificCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffWindowVisibilityChange_specificCallback';
      const callbackA = (isVisible: boolean) => {
        console.info(`${message} callbackA triggered. isVisible: ${isVisible}`);
      };
      const callbackB = (isVisible: boolean) => {
        console.info(`${message} callbackB triggered. isVisible: ${isVisible}`);
      };
      try {
        mainWindowClass.on('windowVisibilityChange', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('windowVisibilityChange', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);
        mainWindowClass.off('windowVisibilityChange', callbackA);
        console.info(`${message} Succeeded in unregistering callbackA specifically.`);
        mainWindowClass.off('windowVisibilityChange', callbackB);
        console.info(`${message} Succeeded in unregistering callbackB.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== on('screenshot') / off('screenshot') 测试用例 ====================

    /**
     * @tc.name   testOnOffScreenshot_twoCallbacksOffOneByOne
     * @tc.number SUB_WINDOW_ONOFFSCREENSHOT_FUNCTION_0100
     * @tc.desc   注册两个callback后通过screenshot.capture触发监听，挨个取消注册验证只触发未取消的callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffScreenshot_twoCallbacksOffOneByOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnOffScreenshot_twoCallbacksOffOneByOne';
      let callbackATriggered = false;
      let callbackBTriggered = false;
      const callbackA = () => {
        console.info(`${message} callbackA triggered.`);
        callbackATriggered = true;
      };
      const callbackB = () => {
        console.info(`${message} callbackB triggered.`);
        callbackBTriggered = true;
      };

      try {
        // 注册两个callback
        mainWindowClass.on('screenshot', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('screenshot', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);

        // 通过screenshot.capture触发screenshot监听
        let captureOption: screenshot.CaptureOption = {
          displayId: 0
        };
        let pixelMap = await screenshot.capture(captureOption);
        console.info(`${message} Succeeded in capturing screenshot.`);
        pixelMap.release();

        await sleep(2000);

        expect(callbackATriggered).assertTrue();
        expect(callbackBTriggered).assertTrue();
        console.info(`${message} Both callbacks triggered by first capture.`);

        // 取消注册callbackA
        mainWindowClass.off('screenshot', callbackA);
        console.info(`${message} Succeeded in unregistering callbackA.`);

        // 重置触发标志
        callbackATriggered = false;
        callbackBTriggered = false;

        // 再次触发screenshot
        let pixelMap2 = await screenshot.capture(captureOption);
        console.info(`${message} Succeeded in capturing second screenshot.`);
        pixelMap2.release();

        await sleep(2000);

        expect(callbackATriggered).assertFalse();
        expect(callbackBTriggered).assertTrue();
        console.info(`${message} Only callbackB triggered after unregistering callbackA.`);

        // 取消注册callbackB
        mainWindowClass.off('screenshot', callbackB);
        console.info(`${message} Succeeded in unregistering callbackB.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          if (deviceType === 'phone' || deviceType === '2in1' || deviceType === 'tablet') {
            console.info(`${message} Device (${deviceType}) should support screenshot.capture but got 801.`);
            expect().assertFail();
            done();
          } else {
            console.info(`${message} Device (${deviceType}) does not support screenshot.capture, expected 801.`);
            expect(exception.message != null).assertTrue();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== off('screenshotAppEvent') 测试用例 ====================

    /**
     * @tc.name   testOffScreenshotAppEvent_twoCallbacksOffAll
     * @tc.number SUB_WINDOW_OFFSCREENSHOTAPPEVENT_FUNCTION_0100
     * @tc.desc   注册两个callback后一把取消注册所有监听，验证取消成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffScreenshotAppEvent_twoCallbacksOffAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffScreenshotAppEvent_twoCallbacksOffAll';
      const callbackA = (eventType: window.ScreenshotEventType) => {
        console.info(`${message} callbackA triggered. eventType: ${JSON.stringify(eventType)}`);
      };
      const callbackB = (eventType: window.ScreenshotEventType) => {
        console.info(`${message} callbackB triggered. eventType: ${JSON.stringify(eventType)}`);
      };
      try {
        mainWindowClass.on('screenshotAppEvent', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('screenshotAppEvent', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);
        mainWindowClass.off('screenshotAppEvent');
        console.info(`${message} Succeeded in unregistering all callbacks at once.`);
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
    });

    // ==================== setColorSpace / setWindowColorSpace 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetColorSpace_callback_null
     * @tc.number SUB_WINDOW_SETCOLORSPACE_PARAM_0100
     * @tc.desc   setColorSpace callback形式第一个入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetColorSpace_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetColorSpace_callback_null';
      try {
        mainWindowClass.setColorSpace(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetColorSpace_callback_undefined
     * @tc.number SUB_WINDOW_SETCOLORSPACE_PARAM_0200
     * @tc.desc   setColorSpace callback形式第一个入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetColorSpace_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetColorSpace_callback_undefined';
      try {
        mainWindowClass.setColorSpace(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetColorSpace_promise_null
     * @tc.number SUB_WINDOW_SETCOLORSPACE_PARAM_0300
     * @tc.desc   setColorSpace promise形式入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetColorSpace_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetColorSpace_promise_null';
      try {
        await mainWindowClass.setColorSpace(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetColorSpace_promise_undefined
     * @tc.number SUB_WINDOW_SETCOLORSPACE_PARAM_0400
     * @tc.desc   setColorSpace promise形式入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetColorSpace_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetColorSpace_promise_undefined';
      try {
        await mainWindowClass.setColorSpace(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowColorSpace_callback_null
     * @tc.number SUB_WINDOW_SETWINDOWCOLORSPACE_PARAM_0100
     * @tc.desc   setWindowColorSpace callback形式第一个入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpace_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowColorSpace_callback_null';
      try {
        mainWindowClass.setWindowColorSpace(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowColorSpace_callback_undefined
     * @tc.number SUB_WINDOW_SETWINDOWCOLORSPACE_PARAM_0200
     * @tc.desc   setWindowColorSpace callback形式第一个入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpace_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowColorSpace_callback_undefined';
      try {
        mainWindowClass.setWindowColorSpace(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowColorSpace_promise_null
     * @tc.number SUB_WINDOW_SETWINDOWCOLORSPACE_PARAM_0300
     * @tc.desc   setWindowColorSpace promise形式入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpace_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowColorSpace_promise_null';
      try {
        await mainWindowClass.setWindowColorSpace(null);
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
     * @tc.name   testSetWindowColorSpace_promise_undefined
     * @tc.number SUB_WINDOW_SETWINDOWCOLORSPACE_PARAM_0400
     * @tc.desc   setWindowColorSpace promise形式入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpace_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowColorSpace_promise_undefined';
      try {
        await mainWindowClass.setWindowColorSpace(undefined);
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

    // ==================== getColorSpace 返回值WIDE_GAMUT 测试用例 ====================

    /**
     * @tc.name   testGetColorSpace_wideGamut
     * @tc.number SUB_WINDOW_GETCOLORSPACE_RETURN_0100
     * @tc.desc   设置色域为WIDE_GAMUT后获取色域，验证返回值为COLOR_SPACE_WIDE_GAMUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetColorSpace_wideGamut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let message = 'testGetColorSpace_wideGamut';
      let promise = mainWindowClass.setColorSpace(window.ColorSpace.WIDE_GAMUT);
      promise.then(async () => {
        console.info(`${message} Succeeded in setting window colorspace to WIDE_GAMUT.`);
        try {
          let colorSpace = await mainWindowClass.getColorSpace();
          console.info(`${message} Succeeded in getting window color space. Cause: ${JSON.stringify(colorSpace)}`);
          expect(colorSpace).assertEqual(window.ColorSpace.WIDE_GAMUT);
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Failed to get window colorspace. Cause: ${exception.code}, ${exception.message}`);
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.error(`${message} Failed to set window colorspace. Cause: ${err.code}, ${err.message}`);
        if (err.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(err.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    // ==================== setWindowShadowEnabled / setKeepScreenOn / setWindowKeepScreenOn / setOutsideTouchable / setWindowPrivacyMode / setPrivacyMode 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowShadowEnabled_promise_null
     * @tc.number SUB_WINDOW_SETWINDOWSHADOWENABLED_PARAM_0100
     * @tc.desc   setWindowShadowEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowShadowEnabled_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowShadowEnabled_promise_null';
      try {
        await mainWindowClass.setWindowShadowEnabled(null);
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
     * @tc.name   testSetWindowShadowEnabled_promise_undefined
     * @tc.number SUB_WINDOW_SETWINDOWSHADOWENABLED_PARAM_0200
     * @tc.desc   setWindowShadowEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowShadowEnabled_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowShadowEnabled_promise_undefined';
      try {
        await mainWindowClass.setWindowShadowEnabled(undefined);
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
     * @tc.name   testSetKeepScreenOn_callback_null
     * @tc.number SUB_WINDOW_SETKEEPSCREENON_PARAM_0100
     * @tc.desc   setKeepScreenOn callback形式第一个入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetKeepScreenOn_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetKeepScreenOn_callback_null';
      try {
        mainWindowClass.setKeepScreenOn(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetKeepScreenOn_callback_undefined
     * @tc.number SUB_WINDOW_SETKEEPSCREENON_PARAM_0200
     * @tc.desc   setKeepScreenOn callback形式第一个入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetKeepScreenOn_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetKeepScreenOn_callback_undefined';
      try {
        mainWindowClass.setKeepScreenOn(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetKeepScreenOn_promise_null
     * @tc.number SUB_WINDOW_SETKEEPSCREENON_PARAM_0300
     * @tc.desc   setKeepScreenOn promise形式入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetKeepScreenOn_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetKeepScreenOn_promise_null';
      try {
        await mainWindowClass.setKeepScreenOn(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetKeepScreenOn_promise_undefined
     * @tc.number SUB_WINDOW_SETKEEPSCREENON_PARAM_0400
     * @tc.desc   setKeepScreenOn promise形式入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetKeepScreenOn_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetKeepScreenOn_promise_undefined';
      try {
        await mainWindowClass.setKeepScreenOn(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowKeepScreenOn_callback_null
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_PARAM_0100
     * @tc.desc   setWindowKeepScreenOn callback形式第一个入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOn_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowKeepScreenOn_callback_null';
      try {
        mainWindowClass.setWindowKeepScreenOn(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowKeepScreenOn_callback_undefined
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_PARAM_0200
     * @tc.desc   setWindowKeepScreenOn callback形式第一个入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOn_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowKeepScreenOn_callback_undefined';
      try {
        mainWindowClass.setWindowKeepScreenOn(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowKeepScreenOn_promise_null
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_PARAM_0300
     * @tc.desc   setWindowKeepScreenOn promise形式入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOn_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowKeepScreenOn_promise_null';
      try {
        await mainWindowClass.setWindowKeepScreenOn(null);
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
     * @tc.name   testSetWindowKeepScreenOn_promise_undefined
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_PARAM_0400
     * @tc.desc   setWindowKeepScreenOn promise形式入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOn_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowKeepScreenOn_promise_undefined';
      try {
        await mainWindowClass.setWindowKeepScreenOn(undefined);
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
     * @tc.name   testSetOutsideTouchable_callback_null
     * @tc.number SUB_WINDOW_SETOUTSIDETOUCHABLE_PARAM_0100
     * @tc.desc   setOutsideTouchable callback形式第一个入参传null，验证抛出801错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetOutsideTouchable_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetOutsideTouchable_callback_null';
      try {
        mainWindowClass.setOutsideTouchable(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 801) {
              console.info(`${message} Expected error 801 in callback.`);
              expect(errCode).assertEqual(801);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Expected error 801.`);
          expect(exception.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetOutsideTouchable_callback_undefined
     * @tc.number SUB_WINDOW_SETOUTSIDETOUCHABLE_PARAM_0200
     * @tc.desc   setOutsideTouchable callback形式第一个入参传undefined，验证抛出801错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetOutsideTouchable_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetOutsideTouchable_callback_undefined';
      try {
        mainWindowClass.setOutsideTouchable(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 801) {
              console.info(`${message} Expected error 801 in callback.`);
              expect(errCode).assertEqual(801);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Expected error 801.`);
          expect(exception.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetOutsideTouchable_promise_null
     * @tc.number SUB_WINDOW_SETOUTSIDETOUCHABLE_PARAM_0300
     * @tc.desc   setOutsideTouchable promise形式入参传null，验证抛出801错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetOutsideTouchable_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetOutsideTouchable_promise_null';
      try {
        await mainWindowClass.setOutsideTouchable(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Expected error 801.`);
          expect(exception.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetOutsideTouchable_promise_undefined
     * @tc.number SUB_WINDOW_SETOUTSIDETOUCHABLE_PARAM_0400
     * @tc.desc   setOutsideTouchable promise形式入参传undefined，验证抛出801错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetOutsideTouchable_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetOutsideTouchable_promise_undefined';
      try {
        await mainWindowClass.setOutsideTouchable(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Expected error 801.`);
          expect(exception.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowPrivacyMode_callback_null
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_PARAM_0100
     * @tc.desc   setWindowPrivacyMode callback形式第一个入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyMode_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowPrivacyMode_callback_null';
      try {
        mainWindowClass.setWindowPrivacyMode(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowPrivacyMode_callback_undefined
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_PARAM_0200
     * @tc.desc   setWindowPrivacyMode callback形式第一个入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyMode_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowPrivacyMode_callback_undefined';
      try {
        mainWindowClass.setWindowPrivacyMode(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowPrivacyMode_promise_null
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_PARAM_0300
     * @tc.desc   setWindowPrivacyMode promise形式入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyMode_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowPrivacyMode_promise_null';
      try {
        await mainWindowClass.setWindowPrivacyMode(null);
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
     * @tc.name   testSetWindowPrivacyMode_promise_undefined
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_PARAM_0400
     * @tc.desc   setWindowPrivacyMode promise形式入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyMode_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowPrivacyMode_promise_undefined';
      try {
        await mainWindowClass.setWindowPrivacyMode(undefined);
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
     * @tc.name   testSetPrivacyMode_promise_null
     * @tc.number SUB_WINDOW_SETPRIVACYMODE_PARAM_0100
     * @tc.desc   setPrivacyMode promise形式入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPrivacyMode_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetPrivacyMode_promise_null';
      try {
        await mainWindowClass.setPrivacyMode(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetPrivacyMode_promise_undefined
     * @tc.number SUB_WINDOW_SETPRIVACYMODE_PARAM_0200
     * @tc.desc   setPrivacyMode promise形式入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetPrivacyMode_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetPrivacyMode_promise_undefined';
      try {
        await mainWindowClass.setPrivacyMode(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setWindowTouchable (callback/promise) 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowTouchable_callback_null
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_PARAM_0100
     * @tc.desc   setWindowTouchable callback形式第一个入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchable_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTouchable_callback_null';
      try {
        mainWindowClass.setWindowTouchable(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowTouchable_callback_undefined
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_PARAM_0200
     * @tc.desc   setWindowTouchable callback形式第一个入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchable_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTouchable_callback_undefined';
      try {
        mainWindowClass.setWindowTouchable(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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
     * @tc.name   testSetWindowTouchable_promise_null
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_PARAM_0300
     * @tc.desc   setWindowTouchable promise形式入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchable_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowTouchable_promise_null';
      try {
        await mainWindowClass.setWindowTouchable(null);
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
     * @tc.name   testSetWindowTouchable_promise_undefined
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_PARAM_0400
     * @tc.desc   setWindowTouchable promise形式入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchable_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowTouchable_promise_undefined';
      try {
        await mainWindowClass.setWindowTouchable(undefined);
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

    // ==================== setTouchable (deprecated) callback/promise 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetTouchable_callback_null
     * @tc.number SUB_WINDOW_SETTOUCHABLE_PARAM_0100
     * @tc.desc   setTouchable(deprecated) callback形式第一个入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchable_callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetTouchable_callback_null';
      try {
        mainWindowClass.setTouchable(null, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTouchable_callback_undefined
     * @tc.number SUB_WINDOW_SETTOUCHABLE_PARAM_0200
     * @tc.desc   setTouchable(deprecated) callback形式第一个入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchable_callback_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetTouchable_callback_undefined';
      try {
        mainWindowClass.setTouchable(undefined, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 1003) {
              console.info(`${message} Expected error 1003 in callback.`);
              expect(errCode).assertEqual(1003);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTouchable_promise_null
     * @tc.number SUB_WINDOW_SETTOUCHABLE_PARAM_0300
     * @tc.desc   setTouchable(deprecated) promise形式入参传null，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchable_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchable_promise_null';
      try {
        await mainWindowClass.setTouchable(null);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTouchable_promise_undefined
     * @tc.number SUB_WINDOW_SETTOUCHABLE_PARAM_0400
     * @tc.desc   setTouchable(deprecated) promise形式入参传undefined，验证抛出1003错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchable_promise_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchable_promise_undefined';
      try {
        await mainWindowClass.setTouchable(undefined);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1003) {
          console.info(`${message} Expected error 1003.`);
          expect(exception.code).assertEqual(1003);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setWindowDecorVisible 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowDecorVisible_null
     * @tc.number SUB_WINDOW_SETWINDOWDECORVISIBLE_PARAM_0100
     * @tc.desc   setWindowDecorVisible入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDecorVisible_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowDecorVisible_null';
      try {
        mainWindowClass.setWindowDecorVisible(null);
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
     * @tc.name   testSetWindowDecorVisible_undefined
     * @tc.number SUB_WINDOW_SETWINDOWDECORVISIBLE_PARAM_0200
     * @tc.desc   setWindowDecorVisible入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDecorVisible_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowDecorVisible_undefined';
      try {
        mainWindowClass.setWindowDecorVisible(undefined);
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

    // ==================== setWindowTitleMoveEnabled 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_null
     * @tc.number SUB_WINDOW_SETWINDOWTITLEMOVEENABLED_PARAM_0100
     * @tc.desc   setWindowTitleMoveEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTitleMoveEnabled_null';
      try {
        mainWindowClass.setWindowTitleMoveEnabled(null);
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
     * @tc.name   testSetWindowTitleMoveEnabled_undefined
     * @tc.number SUB_WINDOW_SETWINDOWTITLEMOVEENABLED_PARAM_0200
     * @tc.desc   setWindowTitleMoveEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTitleMoveEnabled_undefined';
      try {
        mainWindowClass.setWindowTitleMoveEnabled(undefined);
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

    // ==================== setWindowTitleButtonVisible 第三个入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowTitleButtonVisible_thirdParamNull
     * @tc.number SUB_WINDOW_SETWINDOWTITLEBUTTONVISIBLE_PARAM_0100
     * @tc.desc   setWindowTitleButtonVisible第三个入参isCloseButtonVisible传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleButtonVisible_thirdParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTitleButtonVisible_thirdParamNull';
      try {
        mainWindowClass.setWindowTitleButtonVisible(true, true, null);
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
     * @tc.name   testSetWindowTitleButtonVisible_thirdParamUndefined
     * @tc.number SUB_WINDOW_SETWINDOWTITLEBUTTONVISIBLE_PARAM_0200
     * @tc.desc   setWindowTitleButtonVisible第三个入参isCloseButtonVisible传undefined，验证使用默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleButtonVisible_thirdParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowTitleButtonVisible_thirdParamUndefined';
      try {
        mainWindowClass.setWindowTitleButtonVisible(true, true, undefined);
        console.info(`${message} Succeeded in setting window title button visible with undefined.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else if (exception.code === 401) {
          console.info(`${message} Parameter verification failed.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== on/off('windowTitleButtonRectChange') 两个callback挨个取消注册 测试用例 ====================

    /**
     * @tc.name   testOnOffWindowTitleButtonRectChange_twoCallbacksOffOneByOne
     * @tc.number SUB_WINDOW_ONOFFWINDOWTITLEBUTTONRECTCHANGE_FUNCTION_0100
     * @tc.desc   注册两个callback监听windowTitleButtonRectChange事件，然后off挨个取消注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffWindowTitleButtonRectChange_twoCallbacksOffOneByOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOnOffWindowTitleButtonRectChange_twoCallbacksOffOneByOne';
      const callbackA = (titleButtonRect: window.TitleButtonRect) => {
        console.info(`${message} callbackA triggered. Data: ${JSON.stringify(titleButtonRect)}`);
      };
      const callbackB = (titleButtonRect: window.TitleButtonRect) => {
        console.info(`${message} callbackB triggered. Data: ${JSON.stringify(titleButtonRect)}`);
      };
      try {
        mainWindowClass.on('windowTitleButtonRectChange', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('windowTitleButtonRectChange', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);
        mainWindowClass.off('windowTitleButtonRectChange', callbackA);
        console.info(`${message} Succeeded in unregistering callbackA.`);
        mainWindowClass.off('windowTitleButtonRectChange', callbackB);
        console.info(`${message} Succeeded in unregistering callbackB.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setImmersiveModeEnabledState 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetImmersiveModeEnabledState_null
     * @tc.number SUB_WINDOW_SETIMMERSIVEMODEENABLEDSTATE_PARAM_0100
     * @tc.desc   setImmersiveModeEnabledState入参传null，验证正常调用不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetImmersiveModeEnabledState_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetImmersiveModeEnabledState_null';
      try {
        mainWindowClass.setImmersiveModeEnabledState(null);
        console.info(`${message} Succeeded in setting immersive mode enabled state with null.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSetImmersiveModeEnabledState_undefined
     * @tc.number SUB_WINDOW_SETIMMERSIVEMODEENABLEDSTATE_PARAM_0200
     * @tc.desc   setImmersiveModeEnabledState入参传undefined，验证正常调用不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetImmersiveModeEnabledState_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetImmersiveModeEnabledState_undefined';
      try {
        mainWindowClass.setImmersiveModeEnabledState(undefined);
        console.info(`${message} Succeeded in setting immersive mode enabled state with undefined.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    // ==================== setTitleAndDockHoverShown 两个入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetTitleAndDockHoverShown_firstParamNull
     * @tc.number SUB_WINDOW_SETTITLENDDOCKHOVERSHOWN_PARAM_0100
     * @tc.desc   setTitleAndDockHoverShown第一个入参isTitleHoverShown传null，在自由多窗上正常调用不报错，在非自由多窗报801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShown_firstParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTitleAndDockHoverShown_firstParamNull';
      try {
        await mainWindowClass.setTitleAndDockHoverShown(null, false);
        console.info(`${message} Succeeded in setting title and dock hover shown with null.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTitleAndDockHoverShown_firstParamUndefined
     * @tc.number SUB_WINDOW_SETTITLENDDOCKHOVERSHOWN_PARAM_0200
     * @tc.desc   setTitleAndDockHoverShown第一个入参isTitleHoverShown传undefined，验证使用默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShown_firstParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTitleAndDockHoverShown_firstParamUndefined';
      try {
        await mainWindowClass.setTitleAndDockHoverShown(undefined, false);
        console.info(`${message} Succeeded in setting title and dock hover shown with undefined.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTitleAndDockHoverShown_secondParamNull
     * @tc.number SUB_WINDOW_SETTITLENDDOCKHOVERSHOWN_PARAM_0300
     * @tc.desc   setTitleAndDockHoverShown第二个入参isDockHoverShown传null，在自由多窗上正常调用不报错，在非自由多窗报801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShown_secondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTitleAndDockHoverShown_secondParamNull';
      try {
        await mainWindowClass.setTitleAndDockHoverShown(true, null);
        console.info(`${message} Succeeded in setting title and dock hover shown with null.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetTitleAndDockHoverShown_secondParamUndefined
     * @tc.number SUB_WINDOW_SETTITLENDDOCKHOVERSHOWN_PARAM_0400
     * @tc.desc   setTitleAndDockHoverShown第二个入参isDockHoverShown传undefined，验证使用默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShown_secondParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTitleAndDockHoverShown_secondParamUndefined';
      try {
        await mainWindowClass.setTitleAndDockHoverShown(true, undefined);
        console.info(`${message} Succeeded in setting title and dock hover shown with undefined.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setWindowDelayRaiseOnDrag 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowDelayRaiseOnDrag_null
     * @tc.number SUB_WINDOW_SETWINDOWDELAYRAISEONDRAG_PARAM_0100
     * @tc.desc   setWindowDelayRaiseOnDrag入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDelayRaiseOnDrag_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowDelayRaiseOnDrag_null';
      try {
        mainWindowClass.setWindowDelayRaiseOnDrag(null);
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
     * @tc.name   testSetWindowDelayRaiseOnDrag_undefined
     * @tc.number SUB_WINDOW_SETWINDOWDELAYRAISEONDRAG_PARAM_0200
     * @tc.desc   setWindowDelayRaiseOnDrag入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDelayRaiseOnDrag_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowDelayRaiseOnDrag_undefined';
      try {
        mainWindowClass.setWindowDelayRaiseOnDrag(undefined);
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

    // ==================== setSeparationTouchEnabled 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetSeparationTouchEnabled_null
     * @tc.number SUB_WINDOW_SETSEPARATIONTOUCHENABLED_PARAM_0100
     * @tc.desc   setSeparationTouchEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSeparationTouchEnabled_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSeparationTouchEnabled_null';
      try {
        await mainWindowClass.setSeparationTouchEnabled(null);
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
     * @tc.name   testSetSeparationTouchEnabled_undefined
     * @tc.number SUB_WINDOW_SETSEPARATIONTOUCHENABLED_PARAM_0200
     * @tc.desc   setSeparationTouchEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSeparationTouchEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetSeparationTouchEnabled_undefined';
      try {
        await mainWindowClass.setSeparationTouchEnabled(undefined);
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

    // ==================== setReceiveDragEventEnabled 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetReceiveDragEventEnabled_null
     * @tc.number SUB_WINDOW_SETRECEIVEDRAGEVENTENABLED_PARAM_0100
     * @tc.desc   setReceiveDragEventEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetReceiveDragEventEnabled_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetReceiveDragEventEnabled_null';
      try {
        await mainWindowClass.setReceiveDragEventEnabled(null);
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
     * @tc.name   testSetReceiveDragEventEnabled_undefined
     * @tc.number SUB_WINDOW_SETRECEIVEDRAGEVENTENABLED_PARAM_0200
     * @tc.desc   setReceiveDragEventEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetReceiveDragEventEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetReceiveDragEventEnabled_undefined';
      try {
        await mainWindowClass.setReceiveDragEventEnabled(undefined);
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

    // ==================== off('freeWindowModeChange') 注册一个callback后不传入入参默认取消全部 测试用例 ====================

    /**
     * @tc.name   testOffFreeWindowModeChange_offAllWithoutParam
     * @tc.number SUB_WINDOW_OFFFREEWINDOWMODECHANGE_FUNCTION_0100
     * @tc.desc   注册一个callback监听freeWindowModeChange事件，然后off不传入入参默认取消全部注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffFreeWindowModeChange_offAllWithoutParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testOffFreeWindowModeChange_offAllWithoutParam';
      const callback = (isInFreeWindowMode: boolean) => {
        console.info(`${message} callback triggered. isInFreeWindowMode: ${isInFreeWindowMode}`);
      };
      try {
        mainWindowClass.on('freeWindowModeChange', callback);
        console.info(`${message} Succeeded in registering callback.`);
        mainWindowClass.off('freeWindowModeChange');
        console.info(`${message} Succeeded in unregistering all callbacks.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });

    // ==================== setDefaultDensityEnabled (WindowStage) 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetDefaultDensityEnabled_null
     * @tc.number SUB_WINDOW_SETDEFAULTDENSITYENABLED_PARAM_0100
     * @tc.desc   setDefaultDensityEnabled入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDefaultDensityEnabled_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetDefaultDensityEnabled_null';
      try {
        windowStage.setDefaultDensityEnabled(null);
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
     * @tc.name   testSetDefaultDensityEnabled_undefined
     * @tc.number SUB_WINDOW_SETDEFAULTDENSITYENABLED_PARAM_0200
     * @tc.desc   setDefaultDensityEnabled入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDefaultDensityEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetDefaultDensityEnabled_undefined';
      try {
        windowStage.setDefaultDensityEnabled(undefined);
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

    // ==================== setCustomDensity (v20) 第二个入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetCustomDensity_v20_secondParamNull
     * @tc.number SUB_WINDOW_SETCUSTOMDENSITY_V20_PARAM_0100
     * @tc.desc   setCustomDensity(v20)第二个入参applyToSubWindow传null，验证正常调用不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetCustomDensity_v20_secondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetCustomDensity_v20_secondParamNull';
      try {
        windowStage.setCustomDensity(2.0, null);
        console.info(`${message} Succeeded in setting custom density with null second param.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetCustomDensity_v20_secondParamUndefined
     * @tc.number SUB_WINDOW_SETCUSTOMDENSITY_V20_PARAM_0200
     * @tc.desc   setCustomDensity(v20)第二个入参applyToSubWindow传undefined，验证使用默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetCustomDensity_v20_secondParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetCustomDensity_v20_secondParamUndefined';
      try {
        windowStage.setCustomDensity(2.0, undefined);
        console.info(`${message} Succeeded in setting custom density with undefined second param.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setWindowRectAutoSave (v14) 入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowRectAutoSave_v14_null
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V14_PARAM_0100
     * @tc.desc   setWindowRectAutoSave(v14)入参传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v14_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v14_null';
      try {
        await windowStage.setWindowRectAutoSave(null);
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
     * @tc.name   testSetWindowRectAutoSave_v14_undefined
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V14_PARAM_0200
     * @tc.desc   setWindowRectAutoSave(v14)入参传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v14_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v14_undefined';
      try {
        await windowStage.setWindowRectAutoSave(undefined);
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

    // ==================== setWindowRectAutoSave (v17) 两个入参null/undefined 测试用例 ====================

    /**
     * @tc.name   testSetWindowRectAutoSave_v17_firstParamNull
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V17_PARAM_0100
     * @tc.desc   setWindowRectAutoSave(v17)第一个入参enabled传null，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v17_firstParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v17_firstParamNull';
      try {
        await windowStage.setWindowRectAutoSave(null, true);
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
     * @tc.name   testSetWindowRectAutoSave_v17_firstParamUndefined
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V17_PARAM_0200
     * @tc.desc   setWindowRectAutoSave(v17)第一个入参enabled传undefined，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v17_firstParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v17_firstParamUndefined';
      try {
        await windowStage.setWindowRectAutoSave(undefined, true);
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
     * @tc.name   testSetWindowRectAutoSave_v17_secondParamNull
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V17_PARAM_0300
     * @tc.desc   setWindowRectAutoSave(v17)第二个入参isSaveBySpecifiedFlag传null，验证正常调用不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v17_secondParamNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v17_secondParamNull';
      try {
        await windowStage.setWindowRectAutoSave(true, null);
        console.info(`${message} Succeeded in setting window rect auto save with null second param.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowRectAutoSave_v17_secondParamUndefined
     * @tc.number SUB_WINDOW_SETWINDOWRECTAUTOSAVE_V17_PARAM_0400
     * @tc.desc   setWindowRectAutoSave(v17)第二个入参isSaveBySpecifiedFlag传undefined，验证正常调用不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSave_v17_secondParamUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowRectAutoSave_v17_secondParamUndefined';
      try {
        await windowStage.setWindowRectAutoSave(true, undefined);
        console.info(`${message} Succeeded in setting window rect auto save with undefined second param.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== off('occlusionStateChanged') 不传入入参取消全部监听 测试用例 ====================

    /**
     * @tc.name   testOffOcclusionStateChanged_twoCallbacksOffAll
     * @tc.number SUB_WINDOW_OFFOCCLUSIONSTATECHANGED_FUNCTION_0100
     * @tc.desc   注册两个callback监听occlusionStateChanged事件，然后off不传入入参一次性取消全部监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffOcclusionStateChanged_twoCallbacksOffAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testOffOcclusionStateChanged_twoCallbacksOffAll';
      let callbackACalled = false;
      let callbackBCalled = false;
      let occlusionStatesA: number[] = [];
      let occlusionStatesB: number[] = [];
      const callbackA = (data: window.OcclusionState) => {
        console.info(`${message} callbackA triggered. Data: ${JSON.stringify(data)}`);
        callbackACalled = true;
        occlusionStatesA.push(data);
      };
      const callbackB = (data: window.OcclusionState) => {
        console.info(`${message} callbackB triggered. Data: ${JSON.stringify(data)}`);
        callbackBCalled = true;
        occlusionStatesB.push(data);
      };
      let subWindow: window.Window | undefined;
      try {
        mainWindowClass.on('occlusionStateChanged', callbackA);
        console.info(`${message} Succeeded in registering callbackA.`);
        mainWindowClass.on('occlusionStateChanged', callbackB);
        console.info(`${message} Succeeded in registering callbackB.`);
        mainWindowClass.off('occlusionStateChanged');
        console.info(`${message} Succeeded in unregistering all callbacks.`);

        const mainWindowProperties = mainWindowClass.getWindowProperties();
        const mainWindowRect = mainWindowProperties.windowRect;
        console.info(`${message} mainWindowRect: ${JSON.stringify(mainWindowRect)}`);
        subWindow = await windowStage.createSubWindow('testOffOcclusionStateChanged_twoCallbacksOffAll');
        console.info(`${message} Succeeded in creating subWindow.`);

        // off后触发遮挡，验证监听不会被触发
        console.info(`${message} Trigger occlusion by showing subwindow to occlude main window`);
        await subWindow.resize(mainWindowRect.width / 2, mainWindowRect.height / 2);
        await subWindow.moveWindowTo(mainWindowRect.left + mainWindowRect.width / 3,
          mainWindowRect.top + mainWindowRect.height / 3);
        await subWindow.setUIContent('testability/pages/First/index2');
        await subWindow.showWindow();
        await sleep(1000);
        expect(callbackACalled).assertFalse();
        expect(occlusionStatesA.length).assertEqual(0);
        expect(callbackBCalled).assertFalse();
        expect(occlusionStatesB.length).assertEqual(0);
        console.info(`${message} Verified - callbacks not triggered after occlusion.`);

        await subWindow.destroyWindow();
        console.info(`${message} Subwindow destroyed successfully.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        await subWindow?.destroyWindow();
        if (exception.code === 801) {
          console.info(`${message} Capability not supported.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== setWindowColorSpace callback 传入不存在的ColorSpace 测试用例 ====================

    /**
     * @tc.name   testSetWindowColorSpace_callback_invalidColorSpace
     * @tc.number SUB_WINDOW_SETWINDOWCOLORSPACE_PARAM_0500
     * @tc.desc   setWindowColorSpace callback形式传入不存在的ColorSpace值3，验证抛出401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpace_callback_invalidColorSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testSetWindowColorSpace_callback_invalidColorSpace';
      try {
        mainWindowClass.setWindowColorSpace(3, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${message} Callback error. Cause: ${err.code}, ${err.message}`);
            if (errCode === 401) {
              console.info(`${message} Expected error 401 in callback.`);
              expect(errCode).assertEqual(401);
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.error(`${message} Should not succeed.`);
            expect().assertFail();
            done();
          }
        });
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

    // ==================== getWindowTransitionAnimation 传入不存在的WindowTransitionType 测试用例 ====================

    /**
     * @tc.name   testGetWindowTransitionAnimation_invalidEnum3
     * @tc.number SUB_WINDOW_GETWINDOWTRANSITIONANIMATION_PARAM_0500
     * @tc.desc   getWindowTransitionAnimation传入不存在的WindowTransitionType值3，满足自由多窗条件报401，不满足报801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowTransitionAnimation_invalidEnum3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let message = 'testGetWindowTransitionAnimation_invalidEnum3';
      let isInFreeWindowMode = false;
      try {
        isInFreeWindowMode = mainWindowClass.isInFreeWindowMode();
        console.info(`${message} isInFreeWindowMode: ${isInFreeWindowMode}`);
      } catch (e) {
        console.info(`${message} isInFreeWindowMode not supported.`);
      }
      try {
        mainWindowClass.getWindowTransitionAnimation(3 as window.WindowTransitionType);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isInFreeWindowMode && exception.code === 401) {
          console.info(`${message} Expected error 401 on free window device.`);
          expect(exception.code).assertEqual(401);
          done();
        } else if (!isInFreeWindowMode && exception.code === 801) {
          console.info(`${message} Expected error 801 on non-free window device.`);
          expect(exception.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });


  });
}