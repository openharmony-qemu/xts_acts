/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import windowNdkTest from 'libentry.so';
import { BusinessError } from '@ohos.base';

function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function windowProperties() {
  describe('windowProperties', () => {
    let windowStage: window.WindowStage;
    let Tag = 'ActsWindowPropertiesTest';
    let WindowClass: window.Window;
    let windowId: number;
    let context: common.UIAbilityContext;
    const WS_OK = 0;
    const WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM = 1300016;
    const WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL = 1300002;

    beforeAll(async () => {
      console.log(`${Tag}:beforeAll start...`);
      windowStage = AppStorage.get("windowStage") as window.WindowStage;
      WindowClass = await windowStage.getMainWindow();
      windowId = WindowClass.getWindowProperties().id;
      console.log(`${Tag}:windowId:${windowId}`);
      context = AppStorage.get("context") as common.UIAbilityContext;
    })

    beforeEach(() => {
      console.log(`${Tag}:beforeEach start...`);
    })

    afterEach(() => {
      console.log(`${Tag}:afterEach start...`);
    })

    afterAll(() => {
      console.log(`${Tag}:afterAll start...`);
    })

    /**
     * @tc.name   densityInfoGetDefaultDensityMainReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETDEFAULTDENSITY_RETURN_0100
     * @tc.desc   主窗获取系统默认显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetDefaultDensityMainReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetDefaultDensityMainReturn0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetDefaultDensity(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(WS_OK);
      
      let tsDensityInfo = WindowClass.getWindowDensityInfo();
      console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
      expect(result.cppDensity).assertEqual(tsDensityInfo.defaultDensity);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetDefaultDensitySubReturn0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETDEFAULTDENSITY_RETURN_0200
     * @tc.desc   子窗获取系统默认显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetDefaultDensitySubReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetDefaultDensitySubReturn0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('densityInfoGetDefaultDensitySubReturn0200');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let result = windowNdkTest.testDensityInfoGetDefaultDensity(subWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let tsDensityInfo = subWindow.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        expect(result.cppDensity).assertEqual(tsDensityInfo.defaultDensity);
        
        await subWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   densityInfoGetDefaultDensityDialogReturn0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETDEFAULTDENSITY_RETURN_0300
     * @tc.desc   Dialog窗获取系统默认显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetDefaultDensityDialogReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       let caseName = "densityInfoGetDefaultDensityDialogReturn0300";
       console.info(`${caseName}: start...`);
       
       let dialogWindow: window.Window;
       try {
         let config: window.Configuration = {
           name: "densityInfoGetDefaultDensityDialogReturn0300",
           windowType: window.WindowType.TYPE_DIALOG,
           ctx: context
         };
         dialogWindow = await window.createWindow(config);
         let dialogWindowId = dialogWindow.getWindowProperties().id;
         console.info(`${caseName}: dialogWindowId: ${dialogWindowId}`);
         
         let result = windowNdkTest.testDensityInfoGetDefaultDensity(dialogWindowId);
         console.info(`${caseName}: result: ${JSON.stringify(result)}`);
         expect(result.resultCode).assertEqual(WS_OK);
         
         let tsDensityInfo = dialogWindow.getWindowDensityInfo();
         console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
         expect(result.cppDensity).assertEqual(tsDensityInfo.defaultDensity);
         
         await dialogWindow.destroyWindow();
         console.info(`${caseName}: end...`);
         done();
       } catch (err) {
         console.error(`${caseName}: error: ${err.code}, ${err.message}`);
         expect(false).assertTrue();
         done();
       }
     })

    /**
     * @tc.name   densityInfoGetDefaultDensityError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETDEFAULTDENSITY_ERROR_0100
     * @tc.desc   info 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetDefaultDensityError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetDefaultDensityError0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetDefaultDensityWithNullInfo();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetDefaultDensityError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETDEFAULTDENSITY_ERROR_0200
     * @tc.desc   density 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetDefaultDensityError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetDefaultDensityError0200";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetDefaultDensityWithNullDensity();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetSystemDensityMainReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETSYSTEMDENSITY_RETURN_0100
     * @tc.desc   主窗获取系统显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetSystemDensityMainReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetSystemDensityMainReturn0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetSystemDensity(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(WS_OK);
      
      let tsDensityInfo = WindowClass.getWindowDensityInfo();
      console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
      expect(result.cppDensity).assertEqual(tsDensityInfo.systemDensity);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetSystemDensitySubReturn0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETSYSTEMDENSITY_RETURN_0200
     * @tc.desc   子窗获取系统显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetSystemDensitySubReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetSystemDensitySubReturn0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('densityInfoGetSystemDensitySubReturn0200');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let result = windowNdkTest.testDensityInfoGetSystemDensity(subWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let tsDensityInfo = subWindow.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        expect(result.cppDensity).assertEqual(tsDensityInfo.systemDensity);
        
        await subWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   densityInfoGetSystemDensityDialogReturn0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETSYSTEMDENSITY_RETURN_0300
     * @tc.desc   Dialog窗获取系统显示密度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetSystemDensityDialogReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetSystemDensityDialogReturn0300";
      console.info(`${caseName}: start...`);
      
      let dialogWindow: window.Window;
      try {
        let config: window.Configuration = {
          name: "densityInfoGetSystemDensityDialogReturn0300",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        dialogWindow = await window.createWindow(config);
        let dialogWindowId = dialogWindow.getWindowProperties().id;
        console.info(`${caseName}: dialogWindowId: ${dialogWindowId}`);
        
        let result = windowNdkTest.testDensityInfoGetSystemDensity(dialogWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let tsDensityInfo = dialogWindow.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        expect(result.cppDensity).assertEqual(tsDensityInfo.systemDensity);
        
        await dialogWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   densityInfoGetSystemDensityError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETSYSTEMDENSITY_ERROR_0100
     * @tc.desc   info 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetSystemDensityError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetSystemDensityError0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetSystemDensityWithNullInfo();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetSystemDensityError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETSYSTEMDENSITY_ERROR_0200
     * @tc.desc   density 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetSystemDensityError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetSystemDensityError0200";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetSystemDensityWithNullDensity();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetCustomDensityMainReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETCUSTOMDENSITY_RETURN_0100
     * @tc.desc   主窗获取自定义显示密度（未设置时返回-1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetCustomDensityMainReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetCustomDensityMainReturn0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetCustomDensity(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(WS_OK);
      
      let tsDensityInfo = WindowClass.getWindowDensityInfo();
      console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
      expect(result.cppDensity).assertEqual(tsDensityInfo.customDensity);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetCustomDensitySubReturn0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETCUSTOMDENSITY_RETURN_0200
     * @tc.desc   子窗获取自定义显示密度（未设置时返回-1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetCustomDensitySubReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       let caseName = "densityInfoGetCustomDensitySubReturn0200";
       console.info(`${caseName}: start...`);
       
       let subWindow: window.Window;
       try {
         subWindow = await windowStage.createSubWindow('densityInfoGetCustomDensitySubReturn0200');
         let subWindowId = subWindow.getWindowProperties().id;
         console.info(`${caseName}: subWindowId: ${subWindowId}`);
         
         let result = windowNdkTest.testDensityInfoGetCustomDensity(subWindowId);
         console.info(`${caseName}: result: ${JSON.stringify(result)}`);
         expect(result.resultCode).assertEqual(WS_OK);
         
         let tsDensityInfo = subWindow.getWindowDensityInfo();
         console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
         expect(result.cppDensity).assertEqual(tsDensityInfo.customDensity);
         
         await subWindow.destroyWindow();
         console.info(`${caseName}: end...`);
         done();
       } catch (err) {
         console.error(`${caseName}: error: ${err.code}, ${err.message}`);
         expect(false).assertTrue();
         done();
       }
     })

    /**
     * @tc.name   densityInfoGetCustomDensityDialogReturn0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETCUSTOMDENSITY_RETURN_0300
     * @tc.desc   Dialog窗获取自定义显示密度（未设置时返回-1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetCustomDensityDialogReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetCustomDensityDialogReturn0300";
      console.info(`${caseName}: start...`);
      
      let dialogWindow: window.Window;
      try {
        let config: window.Configuration = {
          name: "densityInfoGetCustomDensityDialogReturn0300",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        dialogWindow = await window.createWindow(config);
        let dialogWindowId = dialogWindow.getWindowProperties().id;
        console.info(`${caseName}: dialogWindowId: ${dialogWindowId}`);
        
        let result = windowNdkTest.testDensityInfoGetCustomDensity(dialogWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let tsDensityInfo = dialogWindow.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        expect(result.cppDensity).assertEqual(tsDensityInfo.customDensity);
        
        await dialogWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   densityInfoGetCustomDensityError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETCUSTOMDENSITY_ERROR_0100
     * @tc.desc   info 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetCustomDensityError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetCustomDensityError0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetCustomDensityWithNullInfo();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoGetCustomDensityError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFOGETCUSTOMDENSITY_ERROR_0200
     * @tc.desc   density 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoGetCustomDensityError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoGetCustomDensityError0200";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoGetCustomDensityWithNullDensity();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   getDensityInfoCopyMainReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_RETURN_0100
     * @tc.desc   主窗正常获取密度信息副本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopyMainReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopyMainReturn0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testGetDensityInfoCopy(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(WS_OK);
      
      let releaseResult = windowNdkTest.testDensityInfoRelease(result.info);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   getDensityInfoCopySubReturn0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_RETURN_0200
     * @tc.desc   子窗正常获取密度信息副本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopySubReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopySubReturn0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('getDensityInfoCopySubReturn0200');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let result = windowNdkTest.testGetDensityInfoCopy(subWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let releaseResult = windowNdkTest.testDensityInfoRelease(result.info);
        
        await subWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getDensityInfoCopyDialogReturn0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_RETURN_0300
     * @tc.desc   Dialog窗正常获取密度信息副本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopyDialogReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopyDialogReturn0300";
      console.info(`${caseName}: start...`);
      
      let dialogWindow: window.Window;
      try {
        let config: window.Configuration = {
          name: "getDensityInfoCopyDialogReturn0300",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        dialogWindow = await window.createWindow(config);
        let dialogWindowId = dialogWindow.getWindowProperties().id;
        console.info(`${caseName}: dialogWindowId: ${dialogWindowId}`);
        
        let result = windowNdkTest.testGetDensityInfoCopy(dialogWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WS_OK);
        
        let releaseResult = windowNdkTest.testDensityInfoRelease(result.info);
        
        await dialogWindow.destroyWindow();
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getDensityInfoCopyError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_ERROR_0100
     * @tc.desc   使用无效的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopyError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopyError0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testGetDensityInfoCopy(-1);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   getDensityInfoCopyError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_ERROR_0200
     * @tc.desc   使用已销毁窗口的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopyError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopyError0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('getDensityInfoCopyError0200');
        let subWindowId = subWindow.getWindowProperties().id;
        await subWindow.destroyWindow();
        
        let result = windowNdkTest.testGetDensityInfoCopy(subWindowId);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result.resultCode).assertEqual(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL);
        
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getDensityInfoCopyError0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_GETDENSITYINFOCOPY_ERROR_0300
     * @tc.desc   info 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityInfoCopyError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "getDensityInfoCopyError0300";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testGetDensityInfoCopyWithNullInfo();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_RETURN_0100
     * @tc.desc   正常注册密度变化回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackReturn0100";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callbackCalled = false;
        let callback = (windowId: number, info: number) => {
          console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
          callbackCalled = true;
        };
        
        let result = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: register result: ${result}`);
        expect(result).assertEqual(WS_OK);

        let tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        console.info(`${caseName}: CustomDensity: ${JSON.stringify(typeof tsDensityInfo.customDensity)}`);
        
        await sleep(100);
        windowStage.setCustomDensity(tsDensityInfo.customDensity + 0.1);
        await sleep(100);

        tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        
        console.info(`${caseName}: callbackCalled: ${callbackCalled}`);
        expect(callbackCalled).assertTrue();
        
        let unregisterResult = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: unregister result: ${unregisterResult}`);
        expect(unregisterResult).assertEqual(WS_OK);
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackReturn0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_RETURN_0200
     * @tc.desc   注册2个监听，取消注册一个，剩下的一个依然能触发监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
it('registerDensityInfoChangeCallbackReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackReturn0200";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callback1Called = false;
        let callback2Called = false;

        let subWindow = await windowStage.createSubWindow('registerDensityInfoChangeCallbackReturn0200');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let callback1 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback1 triggered, windowId: ${windowId}, info: ${info}`);
          callback1Called = true;
        };
        
        let callback2 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback2 triggered, windowId: ${windowId}, info: ${info}`);
          callback2Called = true;
        };
        
        let result1 = windowNdkTest.testRegisterDensityInfoChangeCallback(subWindowId, callback1);
        console.info(`${caseName}: register callback1 result: ${result1}`);
        expect(result1).assertEqual(WS_OK);
        
        let result2 = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback2);
        console.info(`${caseName}: register callback2 result: ${result2}`);
        expect(result2).assertEqual(WS_OK);
        
        let unregisterResult1 = windowNdkTest.testUnregisterDensityInfoChangeCallback(subWindowId, callback1);
        console.info(`${caseName}: unregister callback1 result: ${unregisterResult1}`);
        expect(unregisterResult1).assertEqual(WS_OK);
        
        await sleep(100);
        let tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        windowStage.setCustomDensity(tsDensityInfo.customDensity + 0.1);
        tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        await sleep(100);
        
        console.info(`${caseName}: callback1Called: ${callback1Called}, callback2Called: ${callback2Called}`);
        expect(callback1Called).assertFalse();
        expect(callback2Called).assertTrue();
        
        let unregisterResult2 = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback2);
        console.info(`${caseName}: unregister callback2 result: ${unregisterResult2}`);
        expect(unregisterResult2).assertEqual(WS_OK);

        await subWindow.destroyWindow();
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackReturn0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_RETURN_0300
     * @tc.desc   同一个callback对象注册两次只能触发一次回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackReturn0300";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callbackCount = 0;
        
        let callback = (windowId: number, info: number) => {
          console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
          callbackCount++;
        };
        
        let result1 = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: register first result: ${result1}`);
        expect(result1).assertEqual(WS_OK);
        
        let result2 = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: register second result: ${result2}`);
        expect(result2).assertEqual(WS_OK);
        
        await sleep(100);
        callbackCount = 0;
        let tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        windowStage.setCustomDensity(tsDensityInfo.customDensity + 0.1);
        tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        await sleep(100);
        
        console.info(`${caseName}: callbackCount: ${callbackCount}`);
        expect(callbackCount).assertEqual(1);
        
        let unregisterResult = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: unregister result: ${unregisterResult}`);
        expect(unregisterResult).assertEqual(WS_OK);
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackReturn0400
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_RETURN_0400
     * @tc.desc   注册2个监听，取消注册2个，监听无法触发
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
it('registerDensityInfoChangeCallbackReturn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackReturn0400";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callback1Called = false;
        let callback2Called = false;

        let subWindow = await windowStage.createSubWindow('registerDensityInfoChangeCallbackReturn0400');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let callback1 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback1 triggered, windowId: ${windowId}, info: ${info}`);
          callback1Called = true;
        };
        
        let callback2 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback2 triggered, windowId: ${windowId}, info: ${info}`);
          callback2Called = true;
        };
        
        let result1 = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback1);
        console.info(`${caseName}: register callback1 result: ${result1}`);
        expect(result1).assertEqual(WS_OK);
        
        let result2 = windowNdkTest.testRegisterDensityInfoChangeCallback(subWindowId, callback2);
        console.info(`${caseName}: register callback2 result: ${result2}`);
        expect(result2).assertEqual(WS_OK);
        
        let unregisterResult1 = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback1);
        console.info(`${caseName}: unregister callback1 result: ${unregisterResult1}`);
        expect(unregisterResult1).assertEqual(WS_OK);
        
        let unregisterResult2 = windowNdkTest.testUnregisterDensityInfoChangeCallback(subWindowId, callback2);
        console.info(`${caseName}: unregister callback2 result: ${unregisterResult2}`);
        expect(unregisterResult2).assertEqual(WS_OK);
        
        await sleep(100);
        callback1Called = false;
        callback2Called = false;
        let tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        windowStage.setCustomDensity(tsDensityInfo.customDensity + 0.1);
        tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        await sleep(100);
        
        console.info(`${caseName}: callback1Called: ${callback1Called}, callback2Called: ${callback2Called}`);
        expect(callback1Called).assertFalse();
        expect(callback2Called).assertFalse();

        await subWindow.destroyWindow();
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackReturn0500
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_RETURN_0500
     * @tc.desc   注册2个监听，先注册的先触发监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackReturn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackReturn0500";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callback1Called = 0;
        
        let callback1 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback1 triggered, windowId: ${windowId}, info: ${info}`);
          callback1Called = 1
        };
        
        let callback2 = (windowId: number, info: number) => {
          console.info(`${caseName}: callback2 triggered, windowId: ${windowId}, info: ${info}`);
          callback1Called = 2
        };

        let subWindow = await windowStage.createSubWindow('registerDensityInfoChangeCallbackReturn0500');
        let subWindowId = subWindow.getWindowProperties().id;
        console.info(`${caseName}: subWindowId: ${subWindowId}`);
        
        let result1 = windowNdkTest.testRegisterDensityInfoChangeCallback(subWindowId, callback1);
        console.info(`${caseName}: register callback1 result: ${result1}`);
        expect(result1).assertEqual(WS_OK);
        
        let result2 = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback2);
        console.info(`${caseName}: register callback2 result: ${result2}`);
        expect(result2).assertEqual(WS_OK);
        
        await sleep(100);
        let tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        let newCustomDensity = Math.min(tsDensityInfo.customDensity + 0.1, 4);
        if (newCustomDensity === tsDensityInfo.customDensity) {
          newCustomDensity = Math.max(tsDensityInfo.customDensity - 0.1, 0.5);
        }
        windowStage.setCustomDensity(newCustomDensity);
        tsDensityInfo = WindowClass.getWindowDensityInfo();
        console.info(`${caseName}: tsDensityInfo: ${JSON.stringify(tsDensityInfo)}`);
        await sleep(100);
        
        console.info(`${caseName}: callback1Called: ${JSON.stringify(callback1Called)}`);
        expect(callback1Called).assertEqual(2);
        
        let unregisterResult1 = windowNdkTest.testUnregisterDensityInfoChangeCallback(subWindowId, callback1);
        console.info(`${caseName}: unregister callback1 result: ${unregisterResult1}`);
        expect(unregisterResult1).assertEqual(WS_OK);
        
        let unregisterResult2 = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback2);
        console.info(`${caseName}: unregister callback2 result: ${unregisterResult2}`);
        expect(unregisterResult2).assertEqual(WS_OK);

        await subWindow.destroyWindow();
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_ERROR_0100
     * @tc.desc   使用无效的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackError0100";
      console.info(`${caseName}: start...`);
      
      let callback = (windowId: number, info: number) => {
        console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
      };
      
      let result = windowNdkTest.testRegisterDensityInfoChangeCallback(-1, callback);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_ERROR_0200
     * @tc.desc   使用已销毁窗口的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackError0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('registerDensityInfoChangeCallbackError0200');
        let subWindowId = subWindow.getWindowProperties().id;
        await subWindow.destroyWindow();
        
        let callback = (windowId: number, info: number) => {
          console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
        };
        
        let result = windowNdkTest.testRegisterDensityInfoChangeCallback(subWindowId, callback);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL);
        
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   registerDensityInfoChangeCallbackError0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_REGISTERDENSITYINFOCHANGECALLBACK_ERROR_0300
     * @tc.desc   callback 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerDensityInfoChangeCallbackError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "registerDensityInfoChangeCallbackError0300";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testRegisterDensityInfoChangeCallbackWithNullCallback(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   unregisterDensityInfoChangeCallbackReturn0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_UNREGISTERDENSITYINFOCHANGECALLBACK_RETURN_0100
     * @tc.desc   正常注销密度变化回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unregisterDensityInfoChangeCallbackReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "unregisterDensityInfoChangeCallbackReturn0100";
      console.info(`${caseName}: start...`);
      
      let isSupport = canIUse('SystemCapability.Window.SessionManager');
      console.info(`${caseName} isSupport: ${isSupport}`);
      
      if (isSupport !== true) {
        console.info(`${caseName}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        let callback = (windowId: number, info: number) => {
          console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
        };
        
        let registerResult = windowNdkTest.testRegisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: register result: ${registerResult}`);
        expect(registerResult).assertEqual(WS_OK);
        
        let unregisterResult = windowNdkTest.testUnregisterDensityInfoChangeCallback(windowId, callback);
        console.info(`${caseName}: unregister result: ${unregisterResult}`);
        expect(unregisterResult).assertEqual(WS_OK);
        
        done();
      }
      console.info(`${caseName}: end...`);
    })

    /**
     * @tc.name   unregisterDensityInfoChangeCallbackError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_UNREGISTERDENSITYINFOCHANGECALLBACK_ERROR_0100
     * @tc.desc   使用无效的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unregisterDensityInfoChangeCallbackError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "unregisterDensityInfoChangeCallbackError0100";
      console.info(`${caseName}: start...`);
      
      let callback = (windowId: number, info: number) => {
        console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
      };
      
      let result = windowNdkTest.testUnregisterDensityInfoChangeCallback(-1, callback);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   unregisterDensityInfoChangeCallbackError0200
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_UNREGISTERDENSITYINFOCHANGECALLBACK_ERROR_0200
     * @tc.desc   使用已销毁窗口的 windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unregisterDensityInfoChangeCallbackError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "unregisterDensityInfoChangeCallbackError0200";
      console.info(`${caseName}: start...`);
      
      let subWindow: window.Window;
      try {
        subWindow = await windowStage.createSubWindow('unregisterDensityInfoChangeCallbackError0200');
        let subWindowId = subWindow.getWindowProperties().id;
        await subWindow.destroyWindow();
        
        let callback = (windowId: number, info: number) => {
          console.info(`${caseName}: callback triggered, windowId: ${windowId}, info: ${info}`);
        };
        
        let result = windowNdkTest.testUnregisterDensityInfoChangeCallback(subWindowId, callback);
        console.info(`${caseName}: result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL);
        
        console.info(`${caseName}: end...`);
        done();
      } catch (err) {
        console.error(`${caseName}: error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   unregisterDensityInfoChangeCallbackError0300
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_UNREGISTERDENSITYINFOCHANGECALLBACK_ERROR_0300
     * @tc.desc   callback 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unregisterDensityInfoChangeCallbackError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "unregisterDensityInfoChangeCallbackError0300";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testUnregisterDensityInfoChangeCallbackWithNullCallback(windowId);
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

    /**
     * @tc.name   densityInfoReleaseError0100
     * @tc.number SUB_WINDOWMANAGER_WINDOWPROPERTIES_DENSITYINFORELEASE_ERROR_0100
     * @tc.desc   info 参数为 nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('densityInfoReleaseError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "densityInfoReleaseError0100";
      console.info(`${caseName}: start...`);
      
      let result = windowNdkTest.testDensityInfoReleaseWithNullInfo();
      console.info(`${caseName}: result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM);
      
      console.info(`${caseName}: end...`);
      done();
    })

  })
}
