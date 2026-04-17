/*
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import floatView from '@ohos.window.floatView';
import floatingBall from '@ohos.window.floatingBall';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { common, Want } from '@kit.AbilityKit';
import window from '@ohos.window';
import { image } from '@kit.ImageKit';
import { Driver, ON } from '@kit.TestKit';
import { abilityAccessCtrl, StartOptions, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import deviceInfo from '@ohos.deviceInfo';

async function getPermission() {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context: common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  let permissions: Array<Permissions> = [
    "ohos.permission.FLOAT_VIEW",
    "ohos.permission.USE_FLOAT_BALL"
  ];
  atManager.requestPermissionsFromUser(context, permissions, (err: BusinessError, data: PermissionRequestResult) => {
    if (err) {
      console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    } else {
      console.error('capture requestPermissionsFromUser success: ' + JSON.stringify(data));
    }
  })
}

async function clickButtonDriver() {
  console.error(`come in permissionClick`);
  let driver: Driver = Driver.create();
  console.error(`come in Driver create`);
  let buttonOne = await driver.findComponent(ON.text('允许'));
  console.error(`buttonOne is ${JSON.stringify(buttonOne)}`);
  if (buttonOne != null) {
    await buttonOne.click();
  }
}

async function getPixelMap(context: common.UIAbilityContext, resource: Resource, size: number = vp2px(40)) {
  try {
    const buffer: Uint8Array = context.resourceManager.getMediaContentSync(resource);
    const imageSource: image.ImageSource = image.createImageSource((buffer.buffer as ArrayBuffer));
    console.log(`createImageSource success：${JSON.stringify(imageSource)}`);
    let pixMap = imageSource.createPixelMapSync();
    console.log(`getPixelMap getPixelBytesNumber: ${pixMap.getPixelBytesNumber()}`)
    console.log(`getPixelMap size: ${JSON.stringify((await pixMap.getImageInfo()).size)}`)
    return pixMap;
  } catch (err) {
    console.error(`Failed to create pixelmap. code is ${err.code}, message is ${err.message}`);
    return err;
  }
}

export default function abilityTest() {
  describe('ActsWindowFloatViewTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let isFloatViewEnabled: boolean = false;
    let isDeviceSupportFloatView: boolean = false;
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;

    beforeAll(async () => {
      let supportDeviceTypes: string[] = ['phone', '2in1', 'pad'];
      isDeviceSupportFloatView = supportDeviceTypes.includes(deviceInfo.deviceType);
      console.info('beforeAll deviceType: ' + deviceInfo.deviceType + ', isDeviceSupportFloatView: ' + isDeviceSupportFloatView);
      isFloatViewEnabled = floatView.isFloatViewEnabled();
      console.info('beforeAll Float view enabled is: ' + isFloatViewEnabled);
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.info('beforeAll context is: ' + context);
      try {
        let driver = Driver.create();
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        console.log('findComponent allowed: ' + JSON.stringify(allowed));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent allowed failed: ' + JSON.stringify(err));
      }
      await getPermission();
      await sleep(300);
      await sleep(300);
      await sleep(300);
      await clickButtonDriver();
      await sleep(300);
      await sleep(300);
      await sleep(300);
    })

    beforeEach(() => {
    })

    afterEach(async () => {
      await sleep(800)
    })

    afterAll(() => {
    })

    /**
     * @tc.name   test_FloatViewTemplateType_Enum_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0100
     * @tc.desc   test FloatViewTemplateType enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FloatViewTemplateType_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let CaseName: string = 'test_FloatViewTemplateType_Enum';
      console.log(CaseName + ' begin.');
      console.log(CaseName + ' floatView.FloatViewTemplateType.ROUNDED_RECTANGLE: ' + floatView.FloatViewTemplateType.ROUNDED_RECTANGLE);
      expect(floatView.FloatViewTemplateType.ROUNDED_RECTANGLE).assertEqual(0);
      console.log(CaseName + ' end.');
      done();
    })

    /**
     * @tc.name   test_FloatViewState_Enum
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0200
     * @tc.desc   test FloatViewState enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FloatViewState_Enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let CaseName: string = 'test_FloatViewState_Enum';
      console.log(CaseName + ' begin.');
      console.log(CaseName + ' floatView.FloatViewState.STARTED: ' + floatView.FloatViewState.STARTED);
      console.log(CaseName + ' floatView.FloatViewState.HIDDEN: ' + floatView.FloatViewState.HIDDEN);
      console.log(CaseName + ' floatView.FloatViewState.STOPPED: ' + floatView.FloatViewState.STOPPED);
      console.log(CaseName + ' floatView.FloatViewState.IN_SIDEBAR: ' + floatView.FloatViewState.IN_SIDEBAR);
      console.log(CaseName + ' floatView.FloatViewState.IN_FLOATING_BALL: ' + floatView.FloatViewState.IN_FLOATING_BALL);
      console.log(CaseName + ' floatView.FloatViewState.ERROR: ' + floatView.FloatViewState.ERROR);
      expect(floatView.FloatViewState.STARTED).assertEqual(1);
      expect(floatView.FloatViewState.HIDDEN).assertEqual(2);
      expect(floatView.FloatViewState.STOPPED).assertEqual(3);
      expect(floatView.FloatViewState.IN_SIDEBAR).assertEqual(4);
      expect(floatView.FloatViewState.IN_FLOATING_BALL).assertEqual(5);
      expect(floatView.FloatViewState.ERROR).assertEqual(6);
      console.log(CaseName + ' end.');
      done();
    })

    /**
     * @tc.name   test_isFloatViewEnabled
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0300
     * @tc.desc   test isFloatViewEnabled function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_isFloatViewEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let CaseName: string = 'test_isFloatViewEnabled';
      console.log(CaseName + ' begin.');
      try {
        let result = floatView.isFloatViewEnabled();
        console.info(CaseName + ' isFloatViewEnabled result: ' + result);
        expect(typeof result === 'boolean').assertTrue();
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_Create_FloatView_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0400
     * @tc.desc   test create floatView with valid config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Create_FloatView_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let CaseName: string = 'test_Create_FloatView_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };

      let isSupportFloatView = floatView.isFloatViewEnabled();
      console.log(CaseName + ' isSupportFloatView: ' + isSupportFloatView);
      if (isSupportFloatView) {
        try {
          floatView.create(config).then((data: floatView.FloatViewController) => {
            let floatViewController: floatView.FloatViewController = data;
            console.info(CaseName + ' Succeeded in creating float view controller. Data: ' + data);
            expect(isSupportFloatView).assertEqual(true);
            expect(floatViewController != null).assertTrue();
            console.log(CaseName + ' end.');
            done();
          }).catch((err: BusinessError) => {
            console.error(CaseName + ' Failed to create float view controller. Cause: ' + err.code + ', message: ' + err.message);
            expect(err.message != null).assertTrue();
            if (err.code === 801 && !isDeviceSupportFloatView) {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (e) {
          console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
          expect(false).assertTrue();
          done();
        }
      } else {
        done();
      }
    })

    /**
     * @tc.name   test_Create_FloatView_1300016
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0500
     * @tc.desc   test create floatView with null config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_Create_FloatView_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_Create_FloatView_1300016';
      console.log(CaseName + ' begin.');
      try {
        floatView.create(null).then((data: floatView.FloatViewController) => {
          console.info(CaseName + ' Succeeded in creating float view controller. Data: ' + data);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to create float view controller. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed to test_Create_1300016. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.code).assertEqual(401);
        expect(e.message != null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_Create_FloatView_invalid_template
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0600
     * @tc.desc   test create floatView with invalid template type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_Create_FloatView_invalid_template', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_Create_FloatView_invalid_template';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: 10
      };
      try {
        floatView.create(config).then((data: floatView.FloatViewController) => {
          console.info(CaseName + ' Succeeded in creating float view controller. Data: ' + data);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to create float view controller. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          if (err.code === 801 && !isDeviceSupportFloatView) {
            done();
          } else if (err.code === 1300016) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 1300016) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_getFloatViewLimits
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0700
     * @tc.desc   test getFloatViewLimits function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFloatViewLimits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let CaseName: string = 'test_getFloatViewLimits';
      console.log(CaseName + ' begin.');
      try {
        let limits: floatView.FloatViewLimits = floatView.getFloatViewLimits();
        console.info(CaseName + ' FloatViewLimits: ' + JSON.stringify(limits));
        expect(limits != null).assertTrue();
        expect(limits.minSize != null).assertTrue();
        expect(limits.maxSize != null).assertTrue();
        expect(limits.ratioLimits != null).assertTrue();
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setUIContext_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0800
     * @tc.desc   test setUIContext with valid path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setUIContext_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_setUIContext_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.setUIContext("testability/pages/First/index").then(() => {
          console.info(CaseName + ' Succeeded in setting UI context.');
          
          console.log(CaseName + ' end.');
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to set UI context. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          if (err.code === 801 && !isDeviceSupportFloatView) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setUIContext_1300016
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_0900
     * @tc.desc   test setUIContext with invalid path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setUIContext_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_setUIContext_1300016';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.setUIContext('').then(() => {
          console.info(CaseName + ' Succeeded in setting UI context.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to set UI context. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(1300016);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setWindowSize_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1000
     * @tc.desc   test setWindowSize with valid size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_setWindowSize_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let limits = floatView.getFloatViewLimits();
        let size: window.Size = {
          width: limits.minSize.width + 100,
          height: limits.minSize.height + 100
        };
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.setWindowSize(size).then(() => {
          console.info(CaseName + ' Succeeded in setting window size.');
          
          console.log(CaseName + ' end.');
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to set window size. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          if (err.code === 801 && !isDeviceSupportFloatView) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setWindowSize_1300016
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1100
     * @tc.desc   test setWindowSize with invalid size (negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowSize_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_setWindowSize_1300016';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let size: window.Size = {
        width: -100,
        height: -100
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.setWindowSize(size).then(() => {
          console.info(CaseName + ' Succeeded in setting window size.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to set window size. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(1300016);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_start_FloatView_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1200
     * @tc.desc   test start float view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_start_FloatView_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let CaseName: string = 'test_start_FloatView_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let isSupportFloatView = floatView.isFloatViewEnabled();
      console.log(CaseName + ' isSupportFloatView: ' + isSupportFloatView);
      if (isSupportFloatView) {
        try {
          let floatViewController = await floatView.create(config);
          console.info(CaseName + ' Succeeded in creating float view controller.');
          await floatViewController.setUIContext('testability/pages/Index');
          console.info(CaseName + ' Succeeded in setting UI context.');
          floatViewController.start().then(async () => {
            console.info(CaseName + ' Succeeded in starting float view.');
            expect(isSupportFloatView).assertEqual(true);
            await floatViewController.stop();
            console.info(CaseName + ' Succeeded in stopping float view.');
            console.log(CaseName + ' end.');
            done();
          }).catch((err: BusinessError) => {
            console.error(CaseName + ' Failed to start float view. Cause: ' + err.code + ', message: ' + err.message);
            expect(err.message != null).assertTrue();
            if (err.code === 801 && !isDeviceSupportFloatView) {
              done();
            } else if (err.code === 201) {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (e) {
          console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
          expect(e.message != null).assertTrue();
          if (e.code === 801 && !isDeviceSupportFloatView) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      } else {
        done();
      }
    })

    /**
     * @tc.name   test_start_FloatView_1300030
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1300
     * @tc.desc   test repeated start float view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_start_FloatView_1300030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_start_FloatView_1300030';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view 1.');
        floatViewController.start().then(async () => {
          console.info(CaseName + ' Succeeded in starting 2 float view.');
          await floatViewController.stop();
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(CaseName + ' Failed to start 2 float view. Cause: ' + err.code + ', message: ' + err.message);
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping float view.');
          expect(err.code).assertEqual(1300030);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_stop_FloatView_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1400
     * @tc.desc   test stop float view after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stop_FloatView_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_stop_FloatView_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        floatViewController.stop().then(() => {
          console.info(CaseName + ' Succeeded in stopping float view.');
          
          console.log(CaseName + ' end.');
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to stop float view. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_stop_FloatView_1300031
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1500
     * @tc.desc   test stop float view without start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stop_FloatView_1300031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_stop_FloatView_1300031';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.stop().then(() => {
          console.info(CaseName + ' Succeeded in stopping float view.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to stop float view. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(1300031);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_stop_FloatView_1300030
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1600
     * @tc.desc   test repeated stop float view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stop_FloatView_1300030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_stop_FloatView_1300030';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in start float view.');
        await sleep(300);
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stop float view.');
        await sleep(300);
        floatViewController.stop().then(() => {
          console.info(CaseName + ' Succeeded in stopping 2 float view.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to stop 2 float view. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(1300030);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setFloatViewVisibilityInApp_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1700
     * @tc.desc   test setFloatViewVisibilityInApp with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setFloatViewVisibilityInApp_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_setFloatViewVisibilityInApp_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        floatViewController.setFloatViewVisibilityInApp(true).then(async () => {
          console.info(CaseName + ' Succeeded in setting visibility true.');
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping float view.');
          
          console.log(CaseName + ' end.');
          done();
        }).catch(async (err: BusinessError) => {
          console.error(CaseName + ' Failed to set visibility. Cause: ' + err.code + ', message: ' + err.message);
          await floatViewController.stop();
          expect(err.message != null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_getWindowProperties_1300031
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_1900
     * @tc.desc   test getWindowProperties without start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getWindowProperties_1300031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_getWindowProperties_1300031';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        let properties = floatViewController.getWindowProperties();
        console.info(CaseName + ' Window properties: ' + JSON.stringify(properties));
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 1300031) {
          expect(e.code).assertEqual(1300031);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_getWindowProperties_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2000
     * @tc.desc   test getWindowProperties after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getWindowProperties_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let CaseName: string = 'test_getWindowProperties_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        let onStateChange = async (info: floatView.FloatViewStateChangeInfo) => {
          console.info(CaseName + ' Float view stateChange: ' + info.state);
          if (info.state == floatView.FloatViewState.STARTED) {
            try {
              let properties = floatViewController.getWindowProperties();
              console.info(CaseName + ' Window properties: ' + JSON.stringify(properties));
              expect(properties.windowId).assertLarger(0);
              expect(properties.displayId != null).assertTrue();
              expect(properties.windowRect != null).assertTrue();
              floatViewController.offStateChange(onStateChange);
              await floatViewController.stop();
              console.info(CaseName + ' Succeeded in stopping float view.');
              console.log(CaseName + ' end.');
              done();
            } catch (e) {
              console.error(CaseName + ' Failed to get properties. Cause: ' + e.code + ', message: ' + e.message);
              await floatViewController.stop();
              expect(false).assertTrue();
              done();
            }
          }
        };
        floatViewController.onStateChange(onStateChange);
        console.info(CaseName + ' Succeeded in registering stateChange callback.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(1000);
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onStateChange_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2100
     * @tc.desc   test onStateChange callback for start and stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onStateChange_0100';
      console.log(CaseName + ' begin.');
      let floatViewState: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let onStateChange = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' Float view stateChange: ' + info.state);
        floatViewState = info.state;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onStateChange(onStateChange);
        console.info(CaseName + ' Succeeded in registering stateChange callback.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        expect(floatViewState).assertEqual(floatView.FloatViewState.STARTED);
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        await sleep(800);
        expect(floatViewState).assertEqual(floatView.FloatViewState.STOPPED);
        floatViewController.offStateChange(onStateChange);
        console.info(CaseName + ' Succeeded in unregistering stateChange callback.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onStateChange_1300030
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2200
     * @tc.desc   test repeated onStateChange callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onStateChange_1300030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onStateChange_1300030';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let onStateChange = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' Float view stateChange: ' + info.state);
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.onStateChange(onStateChange);
        console.info(CaseName + ' Succeeded in registering stateChange callback 1.');
        floatViewController.onStateChange(onStateChange);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 1300030) {
          expect(e.code).assertEqual(1300030);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onStateChange_two_callback
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2300
     * @tc.desc   test register two stateChange callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onStateChange_two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onStateChange_two_callback';
      console.log(CaseName + ' begin.');
      let time: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' callback1 Float view stateChange: ' + JSON.stringify(info));
        if (info.state === floatView.FloatViewState.STARTED || info.state === floatView.FloatViewState.STOPPED) {
          time++;
        }
      };
      let callback2 = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' callback2 Float view stateChange: ' + JSON.stringify(info));
        if (info.state === floatView.FloatViewState.STARTED || info.state === floatView.FloatViewState.STOPPED) {
          time++;
        }
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onStateChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onStateChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        console.info(CaseName + ' time1: ' + time);
        expect(time).assertEqual(2);
        floatViewController.offStateChange();
        console.info(CaseName + ' Succeeded in unregistering all callbacks.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        await sleep(800);
        console.info(CaseName + ' time2: ' + time);
        expect(time).assertEqual(2);
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_offStateChange_callback1
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2400
     * @tc.desc   test offStateChange with specific callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_offStateChange_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_offStateChange_callback1';
      console.log(CaseName + ' begin.');
      let time: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' callback1 Float view stateChange: ' + JSON.stringify(info));
        if (info.state === floatView.FloatViewState.STOPPED) {
          time++;
        }
      };
      let callback2 = (info: floatView.FloatViewStateChangeInfo) => {
        console.info(CaseName + ' callback2 Float view stateChange: ' + JSON.stringify(info));
        if (info.state === floatView.FloatViewState.STOPPED) {
          time++;
        }
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onStateChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onStateChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        console.info(CaseName + ' time1: ' + time);
        expect(time).assertEqual(0);
        floatViewController.offStateChange(callback1);
        console.info(CaseName + ' Succeeded in unregistering callback1.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        await sleep(800);
        console.info(CaseName + ' time2: ' + time);
        expect(time).assertEqual(1);
        floatViewController.offStateChange();
        console.info(CaseName + ' Succeeded in unregistering all callbacks.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onRectChange_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2500
     * @tc.desc   test onRectChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onRectChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onRectChange_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let rectChanged = false;
      let onRectChange = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' Float view rectChange: ' + JSON.stringify(info));
        rectChanged = true;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onRectChange(onRectChange);
        console.info(CaseName + ' Succeeded in registering rectChange callback.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        let limits = floatView.getFloatViewLimits();
        let size: window.Size = {
          width: limits.minSize.width + 50,
          height: limits.minSize.height + 50
        };
        await floatViewController.setWindowSize(size);
        console.info(CaseName + ' Succeeded in setting window size.');
        await sleep(300);
        floatViewController.offRectChange(onRectChange);
        console.info(CaseName + ' Succeeded in unregistering rectChange callback.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        expect(rectChanged).assertTrue();
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onRectChange_two_callback
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2600
     * @tc.desc   test register two rectChange callbacks and verify both triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onRectChange_two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onRectChange_two_callback';
      console.log(CaseName + ' begin.');
      let rectChangeCount: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback1 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      let callback2 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback2 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onRectChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onRectChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        let limits = floatView.getFloatViewLimits();
        let size: window.Size = {
          width: limits.minSize.width + 50,
          height: limits.minSize.height + 50
        };
        await floatViewController.setWindowSize(size);
        console.info(CaseName + ' Succeeded in setting window size.');
        await sleep(300);
        console.info(CaseName + ' rectChangeCount: ' + rectChangeCount);
        expect(rectChangeCount).assertEqual(2);
        floatViewController.offRectChange();
        console.info(CaseName + ' Succeeded in unregistering all callbacks.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onRectChange_off_one_callback
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2700
     * @tc.desc   test register two rectChange callbacks and unregister one callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onRectChange_off_one_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onRectChange_off_one_callback';
      console.log(CaseName + ' begin.');
      let rectChangeCount: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback1 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      let callback2 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback2 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onRectChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onRectChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        let limits = floatView.getFloatViewLimits();
        let size: window.Size = {
          width: limits.minSize.width + 50,
          height: limits.minSize.height + 50
        };
        await floatViewController.setWindowSize(size);
        console.info(CaseName + ' Succeeded in setting window size 1.');
        await sleep(300);
        console.info(CaseName + ' rectChangeCount1: ' + rectChangeCount);
        expect(rectChangeCount).assertEqual(2);
        floatViewController.offRectChange(callback1);
        console.info(CaseName + ' Succeeded in unregistering callback1.');
        rectChangeCount = 0;
        let size2: window.Size = {
          width: limits.minSize.width + 100,
          height: limits.minSize.height + 100
        };
        await floatViewController.setWindowSize(size2);
        console.info(CaseName + ' Succeeded in setting window size 2.');
        await sleep(300);
        console.info(CaseName + ' rectChangeCount2: ' + rectChangeCount);
        expect(rectChangeCount).assertEqual(1);
        floatViewController.offRectChange(callback2);
        console.info(CaseName + ' Succeeded in unregistering callback2.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onRectChange_off_all_callback
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2800
     * @tc.desc   test register two rectChange callbacks and unregister all without parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onRectChange_off_all_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onRectChange_off_all_callback';
      console.log(CaseName + ' begin.');
      let rectChangeCount: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback1 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      let callback2 = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' callback2 Float view rectChange: ' + JSON.stringify(info));
        rectChangeCount++;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.onRectChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onRectChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        let limits = floatView.getFloatViewLimits();
        let size: window.Size = {
          width: limits.minSize.width + 50,
          height: limits.minSize.height + 50
        };
        await floatViewController.setWindowSize(size);
        console.info(CaseName + ' Succeeded in setting window size 1.');
        await sleep(300);
        console.info(CaseName + ' rectChangeCount1: ' + rectChangeCount);
        expect(rectChangeCount).assertEqual(2);
        floatViewController.offRectChange();
        console.info(CaseName + ' Succeeded in unregistering all callbacks.');
        rectChangeCount = 0;
        let size2: window.Size = {
          width: limits.minSize.width + 100,
          height: limits.minSize.height + 100
        };
        await floatViewController.setWindowSize(size2);
        console.info(CaseName + ' Succeeded in setting window size 2.');
        await sleep(300);
        console.info(CaseName + ' rectChangeCount2: ' + rectChangeCount);
        expect(rectChangeCount).assertEqual(0);
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onRectChange_1300030
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_2900
     * @tc.desc   test repeated onRectChange callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onRectChange_1300030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onRectChange_1300030';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let onRectChange = (info: floatView.FloatViewRectChangeInfo) => {
        console.info(CaseName + ' Float view rectChange: ' + JSON.stringify(info));
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.onRectChange(onRectChange);
        console.info(CaseName + ' Succeeded in registering rectChange callback 1.');
        floatViewController.onRectChange(onRectChange);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 1300030) {
          expect(e.code).assertEqual(1300030);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onLimitsChange_one_0100
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3000
     * @tc.desc   test onLimitsChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onLimitsChange_one_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onLimitsChange_one_0100';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let limitsChanged = false;
      let onLimitsChange = (limits: floatView.FloatViewLimits) => {
        console.info(CaseName + ' Float view limitsChange: ' + JSON.stringify(limits));
        limitsChanged = true;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.onLimitsChange(onLimitsChange);
        console.info(CaseName + ' Succeeded in registering limitsChange callback.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        floatViewController.offLimitsChange(onLimitsChange);
        console.info(CaseName + ' Succeeded in unregistering limitsChange callback.');
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view.');
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onLimitsChange_1300030
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3100
     * @tc.desc   test repeated onLimitsChange callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onLimitsChange_1300030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onLimitsChange_1300030';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let onLimitsChange = (limits: floatView.FloatViewLimits) => {
        console.info(CaseName + ' Float view limitsChange: ' + JSON.stringify(limits));
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.onLimitsChange(onLimitsChange);
        console.info(CaseName + ' Succeeded in registering limitsChange callback 1.');
        floatViewController.onLimitsChange(onLimitsChange);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 1300030) {
          expect(e.code).assertEqual(1300030);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_onLimitsChange_two_callback
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3200
     * @tc.desc   test register two limitsChange callbacks and offLimitsChange without callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_onLimitsChange_two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_onLimitsChange_two_callback';
      console.log(CaseName + ' begin.');
      let limitsChangedCount: number = 0;
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let callback1 = (limits: floatView.FloatViewLimits) => {
        console.info(CaseName + ' callback1 Float view limitsChange: ' + JSON.stringify(limits));
        limitsChangedCount++;
      };
      let callback2 = (limits: floatView.FloatViewLimits) => {
        console.info(CaseName + ' callback2 Float view limitsChange: ' + JSON.stringify(limits));
        limitsChangedCount++;
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.onLimitsChange(callback1);
        console.info(CaseName + ' Succeeded in registering callback1.');
        floatViewController.onLimitsChange(callback2);
        console.info(CaseName + ' Succeeded in registering callback2.');
        floatViewController.offLimitsChange();
        console.info(CaseName + ' Succeeded in unregistering all callbacks.');
        console.info(CaseName + ' limitsChangedCount: ' + limitsChangedCount);
        expect(limitsChangedCount).assertEqual(0);
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_restoreMainWindow_1300031
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3300
     * @tc.desc   test restoreMainWindow without start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_1300031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_restoreMainWindow_1300031';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        floatViewController.restoreMainWindow().then(() => {
          console.info(CaseName + ' Succeeded in restoring main window.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to restore main window. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(1300031);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_restoreMainWindow_1300032
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3400
     * @tc.desc   test restoreMainWindow without click
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_1300032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_restoreMainWindow_1300032';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        floatViewController.restoreMainWindow().then(async () => {
          console.info(CaseName + ' Succeeded in restoring main window.');
          await floatViewController.stop();
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(CaseName + ' Failed to restore main window. Cause: ' + err.code + ', message: ' + err.message);
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping float view.');
          expect(err.code).assertEqual(1300032);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_start_after_stop
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3500
     * @tc.desc   test start floatView after stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_start_after_stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_start_after_stop';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view 1.');
        await sleep(200);
        await floatViewController.stop();
        console.info(CaseName + ' Succeeded in stopping float view 1.');
        await sleep(800);
        floatViewController.start().then(async () => {
          console.info(CaseName + ' Succeeded in starting 2 float view.');
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping 2 float view.');
          console.log(CaseName + ' end.');
          done();
        }).catch((err: BusinessError) => {
          console.error(CaseName + ' Failed to start 2 float view. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.message != null).assertTrue();
          if (err.code === 801 && !isDeviceSupportFloatView) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_create_multiple_floatViewController
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3600
     * @tc.desc   test create multiple floatViewController
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_create_multiple_floatViewController', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_create_multiple_floatViewController';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController1 = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating floatViewController1.');
        let floatViewController2 = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating floatViewController2.');
        let floatViewController3 = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating floatViewController3.');
        console.info(CaseName + ' floatViewController1: ' + floatViewController1 + ', floatViewController2: ' + floatViewController2 + ', floatViewController3: ' + floatViewController3);
        expect((floatViewController1 != null) && (floatViewController2 != null) && (floatViewController3 != null)).assertTrue();
        console.log(CaseName + ' end.');
        done();
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_restoreMainWindow_with_parameters
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_3900
     * @tc.desc   test restoreMainWindow with wantParameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_with_parameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_restoreMainWindow_with_parameters';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      let wantParams: Record<string, Object> = {
        'key1': 'value1',
        'key2': 123
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        await floatViewController.start();
        console.info(CaseName + ' Succeeded in starting float view.');
        await sleep(200);
        floatViewController.restoreMainWindow(wantParams).then(async () => {
          console.info(CaseName + ' Succeeded in restoring main window with parameters.');
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping float view.');
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(CaseName + ' Failed to restore main window. Cause: ' + err.code + ', message: ' + err.message);
          await floatViewController.stop();
          console.info(CaseName + ' Succeeded in stopping float view.');
          expect(err.code).assertEqual(1300032);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}