'use static';
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import pipWindow from '@ohos.PiPWindow';
import { canIUse } from '@internal.full.global';
import { XComponent, XComponentType, XComponentOptions, XComponentController } from '@ohos.arkui.component';
import deviceInfo from '@ohos.deviceInfo';
import display from '@ohos.display';
import window from '@ohos.window';
import settings from '@ohos.settings';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions';
import { Driver, ON } from '@ohos.UiTest';
import { typeNode } from 'arkui.FrameNode';
import { TextNodeController } from './CustomNode.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function isPipWindowSupport() {
  switch (deviceInfo.deviceType) {
    case 'warable':
    case 'car':
      return false
    case 'tv':
    case '2in1':
    case 'tablet':
    case 'phone':
      return true;
    default:
      return true;
  }
}

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
  return new Promise<window.WindowStage>((resolve, reject) => {
      let want: Want = {
          bundleName: "com.example.actswindowtest.static",
          abilityName: 'StartAbility'
      };
      if (options) {
          context.startAbility(want, options).then(() => {
              hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
          }).catch((err: Error):PromiseLike<void>|undefined => {
              hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
          });
      } else {
          context.startAbility(want).then(() => {
              hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
          }).catch((err: Error):PromiseLike<void>|undefined => {
              hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
          });
      }
      waitForCompletion(async () => {await Utils.msSleep(1000)})
      let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
      resolve(windowStageStart);
  })
}
async function terminateAbility(caseName: string) {
  let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
  try {
      console.log(`${caseName} terminateSelf begin`);
      pageContext.terminateSelf().then(() => {
          console.log(`${caseName} terminateSelf success`);
      }).catch((err: Error):PromiseLike<void>|undefined => {
          console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
      });
  } catch (e) {
      console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
  }
  await Utils.msSleep(1000)
}

export default function PiPWindowTest() {

    describe("PiPWindowTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowZindexTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let tempWnd: window.Window | undefined;
        let subWin: window.Window | undefined;
        let context1: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let windowclassArr:Array<window.Window>;
        let windowClass: window.Window | undefined;
        let isPipWindowEnabled: boolean = false;
        let isFreeWindowMode: boolean = false;
        let deviceType: string = deviceInfo.deviceType;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        let isPCStatus: string = '';

        let initConfig = (PiPTemplateType: pipWindow.PiPTemplateType): pipWindow.PiPConfiguration => {
          let config: pipWindow.PiPConfiguration;
          config = {
            context: context1 as common.BaseContext,
            componentController: new XComponentController(),
            templateType: PiPTemplateType,
            contentWidth: 400,
            contentHeight: 600,
          };
          return config;
        }

        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                windowClass = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context1 = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage!.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            isPipWindowEnabled = isPipWindowSupport();
            hilog.info(domain, tag, 'isPiPWindowSupport' + isPipWindowEnabled);

            isFreeWindowMode = windowClass!.isInFreeWindowMode();

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            isPCStatus = settings.getValueSync(context1!, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY);
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            try{
                windowclassArr = await windowStage!.getSubWindow();
                hilog.info(domain, tag,`brforeAll getSubWindow success. Cause: ${JSON.stringify(windowclassArr)}`);
                if(windowclassArr.length!=0){
                    for(let i = 0;i<windowclassArr.length;i++){
                        await windowclassArr[i].destroyWindow();
                        hilog.info(domain, tag,`brforeAll destroyWindow windowclassArr ${i} success`);
                    }
                }
            }catch (err) {
                hilog.error(domain, tag,`brforeAll destroyWindow failed`+ err);
            }
        })

        beforeEach(async () => {
          await Utils.msSleep(1000)
        })


         /**
     * @tc.name   OH_PictureInPicture_On_ActiveStatusChange_0100
     * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0100
     * @tc.desc   OH_PictureInPicture_On_ActiveStatusChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_On_ActiveStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_On_ActiveStatusChange_0100 ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          if (!isFreeWindowMode) {
            let pipController: pipWindow.PiPController | undefined = undefined;
            let mXComponentController = new XComponentController();
            let navId = "";
            let contentWidth = 400;
            let contentHeight = 600;
            let config: pipWindow.PiPConfiguration = {
              context: context1 as common.BaseContext,
              componentController: mXComponentController,
              navigationId: navId,
              templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
              contentWidth: contentWidth,
              contentHeight: contentHeight,
            };
            try {
              let callbackIndex = 0;
              const callback = (res: boolean) => {
                console.log(`${msgStr}callback res: ${res}`)
                callbackIndex = callbackIndex + 1;
                console.log(`${msgStr}callback callbackIndex: ${callbackIndex}`)
                expect(res).assertEqual(false)
              }
              let driver = Driver.create();
              pipController = await pipWindow.create(config)
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController !== undefined).assertTrue();
              pipController!.onActiveStatusChange(callback);
              await pipController!.startPiP();
              await Utils.msSleep(1000)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              console.log(`${msgStr} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
              await Utils.msSleep(1000)
              let pipWindowCenter = await pipWindowComponent!.getBoundsCenter();
              console.log(`${msgStr} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
              let displayInfo = display.getDefaultDisplaySync();
              console.log(`${msgStr} displayInfo: ${JSON.stringify(displayInfo)}`);
              let dragToX = pipWindowCenter.x + displayInfo.width;
              let dragToY = pipWindowCenter.y;
              await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX.toInt(), dragToY);
              await Utils.msSleep(3000);
              let expectValue = deviceType == 'tv' ? 0 : 1
              expect(callbackIndex).assertEqual(expectValue);
              pipController!.stopPiP();
              await Utils.msSleep(3000);
              pipController?.offActiveStatusChange();
              done();
            } catch (error) {
              console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                expect(error.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            }
          } else {
            done()
          }
        }
      })
  
      /**
       * @tc.name   OH_PictureInPicture_On_ActiveStatusChange_0200
       * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0200
       * @tc.desc   OH_PictureInPicture_On_ActiveStatusChange_0200
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_On_ActiveStatusChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_On_ActiveStatusChange_0200 ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          if (!isFreeWindowMode) {
            let pipController: pipWindow.PiPController | undefined = undefined;
            let mXComponentController = new XComponentController();
            let navId = "";
            let contentWidth = 400;
            let contentHeight = 600;
            let config: pipWindow.PiPConfiguration = {
              context: context1 as common.BaseContext,
              componentController: mXComponentController,
              navigationId: navId,
              templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
              contentWidth: contentWidth,
              contentHeight: contentHeight,
            };
            try {
              let callbackIndex1 = 0;
              let callbackIndex2 = 0;
              const callback = (res: boolean) => {
                console.log(`${msgStr}callback res: ${res}`)
                callbackIndex1 = callbackIndex1 + 1;
                console.log(`${msgStr} callback callbackIndex1: ${callbackIndex1}`)
                expect(res).assertEqual(false)
              }
              const callback2 = (res: boolean) => {
                console.log(`${msgStr} callback2 res: ${res}`)
                callbackIndex2 = callbackIndex2 + 1;
                console.log(`${msgStr} callback2 callbackIndex2: ${callbackIndex2}`)
                expect(res).assertEqual(false)
              }
              let driver = Driver.create();
              pipController = await pipWindow.create(config)
                
                console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
                expect(pipController!= null).assertTrue();
                pipController!.onActiveStatusChange(callback);
                pipController!.onActiveStatusChange(callback2);
                await pipController!.startPiP();
                await Utils.msSleep(1000)
                let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
                await Utils.msSleep(1000)
                let pipWindowCenter = await pipWindowComponent!.getBoundsCenter();
                console.log(`${msgStr} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
                let displayInfo = display.getDefaultDisplaySync();
                console.log(`${msgStr} displayInfo: ${JSON.stringify(displayInfo)}`);
                let dragToX = pipWindowCenter.x + displayInfo.width;
                let dragToY = pipWindowCenter.y;
                await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX.toInt(), dragToY);
                await Utils.msSleep(3000);
                let expectValue = deviceType == 'tv' ? 0 : 1
                expect(callbackIndex1).assertEqual(expectValue);
                expect(callbackIndex2).assertEqual(expectValue);
                pipController?.stopPiP();
                await Utils.msSleep(3000);
                pipController?.offActiveStatusChange();
                done();
            } catch (error) {
              console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                expect(error.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            }
          } else {
            done()
          }
        }
      })
  
      /**
       * @tc.name   OH_PictureInPicture_Off_ActiveStatusChange_0100
       * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0300
       * @tc.desc   OH_PictureInPicture_Off_ActiveStatusChange_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_Off_ActiveStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_Off_ActiveStatusChange_0100 ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          if (!isFreeWindowMode) {
            let pipController: pipWindow.PiPController | undefined = undefined;
            let mXComponentController = new XComponentController();
            let navId = "";
            let contentWidth = 400;
            let contentHeight = 600;
            let config: pipWindow.PiPConfiguration = {
              context: context1 as common.BaseContext,
              componentController: mXComponentController,
              navigationId: navId,
              templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
              contentWidth: contentWidth,
              contentHeight: contentHeight
            };
            try {
              let callbackIndex = 0;
              const callback = (res: boolean) => {
                console.log(`${msgStr}callback res: ${res}`)
                callbackIndex = callbackIndex + 1;
                console.log(`${msgStr} callback callbackIndex1: ${callbackIndex}`)
                expect(res).assertEqual(false)
              }
              let driver = Driver.create();
              pipController = await pipWindow.create(config)
                
                console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
                expect(pipController!= null).assertTrue();
                pipController!.onActiveStatusChange(callback);
                pipController?.offActiveStatusChange(callback);
                await pipController!.startPiP();
                await Utils.msSleep(3000)
                let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
                await Utils.msSleep(1000)
                let pipWindowCenter = await pipWindowComponent!.getBoundsCenter();
                console.log(`${msgStr} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
                let displayInfo = display.getDefaultDisplaySync();
                console.log(`${msgStr} displayInfo: ${JSON.stringify(displayInfo)}`);
                let dragToX = pipWindowCenter.x + displayInfo.width;
                let dragToY = pipWindowCenter.y;
                await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX.toInt(), dragToY);
                await Utils.msSleep(3000);
                expect(callbackIndex).assertEqual(0);
                pipController!.stopPiP();
                await Utils.msSleep(3000);
                done();
            } catch (error) {
              console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                  expect(error.message != null).assertTrue();
                  done();
                }
                else {
                  expect().assertFail();
                  done();
                }
            }
          } else {
            done()
          }
        }
      })
  
      /**
       * @tc.name   OH_PictureInPicture_Off_ActiveStatusChange_0200
       * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0400
       * @tc.desc   OH_PictureInPicture_Off_ActiveStatusChange_0200
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_Off_ActiveStatusChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_Off_ActiveStatusChange_0200 ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          if (!isFreeWindowMode) {
            let pipController: pipWindow.PiPController | undefined = undefined;
            let mXComponentController = new XComponentController();
            let navId = "";
            let contentWidth = 400;
            let contentHeight = 600;
            let config: pipWindow.PiPConfiguration = {
              context: context1 as common.BaseContext,
              componentController: mXComponentController,
              navigationId: navId,
              templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
              contentWidth: contentWidth,
              contentHeight: contentHeight
            };
            try {
              let callbackIndex = 0;
              const callback = (res: boolean) => {
                console.log(`${msgStr}callback res: ${res}`)
                callbackIndex = callbackIndex + 1;
                console.log(`${msgStr} callback callbackIndex2: ${callbackIndex}`)
                expect(res).assertEqual(false)
              }
              let driver = Driver.create();
              pipController = await pipWindow.create(config)
                
                console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
                expect(pipController!= null).assertTrue();
                pipController!.onActiveStatusChange(callback);
                pipController?.offActiveStatusChange();
                await pipController!.startPiP();
                await Utils.msSleep(3000)
                let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
                await Utils.msSleep(1000)
                let pipWindowCenter = await pipWindowComponent!.getBoundsCenter();
                console.log(`${msgStr} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
                let displayInfo = display.getDefaultDisplaySync();
                console.log(`${msgStr} displayInfo: ${JSON.stringify(displayInfo)}`);
                let dragToX = pipWindowCenter.x + displayInfo.width;
                let dragToY = pipWindowCenter.y;
                await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX.toInt(), dragToY);
                await Utils.msSleep(3000);
                expect(callbackIndex).assertEqual(0);
                pipController!.stopPiP();
                await Utils.msSleep(3000);
                done();
            } catch (error) {
              console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                  expect(error.message != null).assertTrue();
                  done();
                }
                else {
                  expect().assertFail();
                  done();
                }
            }
          } else {
            done()
          }
        }
      })
  
      /**
       * @tc.name   isPiPEnabled_test
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
       * @tc.desc   To test the function of isPiPEnabled
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('isPiPEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'isPiPEnabled_test '
        console.log(msgStr + 'begin')
        try {
          let enable = pipWindow.isPiPEnabled();
          console.info(msgStr + 'isPipEnabled:' + enable)
          console.log(msgStr + 'Succeeded in isPipEnabled ' + enable)
          expect(enable != null).assertTrue();
          expect(enable == true || enable == false).assertTrue();
          done();
        } catch (error) {
          console.log(msgStr + 'Succeeded in isPipEnabled ' + error)
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   create_Function_Promise
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
       * @tc.desc   To test the function of create
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('create_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'create_Function_Promise '
        console.log(msgStr + 'begin')
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          let promise = pipWindow.create(config);
          promise.then((data: pipWindow.PiPController) => {
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${data}`)
            expect(data!= null).assertTrue();
            done();
          }).catch((err: Error) => {
            console.log(msgStr + 'Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(msgStr + ' Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   startPiP_Function_Promise
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
       * @tc.desc   To test the function of startPiP
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('startPiP_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'startPiP_Function_Promise '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(msgStr + 'begin')
          let promise = pipController!.startPiP();
          promise.then(() => {
            console.log(msgStr + 'Succeeded in starting pip')
            done();
          }).catch((err: Error) => {
            console.log(msgStr + 'Failed1 to start pip. Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.log(msgStr + 'Failed2 to start pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
  
      /**
       * @tc.name   stopPiP_Function_Promise
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
       * @tc.desc   To test the function of stopPiP
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('stopPiP_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'stopPiP_Function_Promise '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(msgStr + 'stopPiP_Function_Promise begin ')
          await pipController!.startPiP()
          let promise = pipController!.stopPiP()
          promise.then(() => {
            console.log(msgStr + 'Succeeded in stopping pip')
  
            done();
          }).catch((err: Error) => {
            if (err.code == 1300015) {
              console.log(msgStr + 'window is stopping:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
              expect(err.message != null).assertTrue();
              done()
            } else {
              console.log(msgStr + 'Failed1 to stop pip in stopPiP . Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(msgStr + 'Failed2 to stop pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   setAutoStartEnabled_test
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
       * @tc.desc   To test the function of setAutoStartEnabled
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('setAutoStartEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'setAutoStartEnabled_test '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + 'setAutoStartEnabled_test begin')
          let enable = true;
          pipController!.setAutoStartEnabled(enable);
          console.log(msgStr + 'Succeeded in setAutoStartEnabled_test')
  
          done();
        } catch (error) {
          console.log(msgStr + 'Failed to setAutoStartEnabled_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   updateContentSize_test
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
       * @tc.desc   To test the function of updateContentSize
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('updateContentSize_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'updateContentSize_test '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + 'updateContentSize_test begin');
          let width = 540;
          let height = 960;
          pipController!.updateContentSize(width, height);
          console.log(msgStr + ' Succeeded in updateContentSize_test');
  
          done();
        } catch (error) {
          console.log(msgStr + ' Failed to updateContentSize_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   stateChange_Function_Callback
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
       * @tc.desc   To test the function of stateChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('stateChange_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'stateChange_Function_Callback '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + ' stateChange_Function_ Callback begin');
          pipController!.onStateChange((state, reason) => {
            let curState = '';
            switch (state) {
              case pipWindow.PiPState.ABOUT_TO_START:
                curState = 'ABOUT_TO_START';
                break;
              case pipWindow.PiPState.STARTED:
                curState = 'STARTED';
                break;
              case pipWindow.PiPState.ABOUT_TO_STOP:
                curState = 'ABOUT_TO_STOP';
                break;
              case pipWindow.PiPState.STOPPED:
                curState = 'STOPPED';
                break;
              case pipWindow.PiPState.ABOUT_TO_RESTORE:
                curState = 'ABOUT_TO_RESTORE';
                break;
              case pipWindow.PiPState.ERROR:
                curState = 'ERROR';
                break;
              default:
                break;
            }
            console.log(msgStr + ' Succeeded in stateChange_Function_ Callback' + curState)
            console.log(msgStr + ' Succeeded in stateChange_Function_ Callback' + reason)
          });
  
          done();
        } catch (err) {
          console.log(msgStr + ' Failed to stateChange_Function_ Callback' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   stateChange_test
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
       * @tc.desc   To test the function of stateChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('stateChange_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'stateChange_test '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + ' stateChange_test begin');
          pipController!.onStateChange((state, reason) => {
            let curState = '';
            switch (state) {
              case pipWindow.PiPState.ABOUT_TO_START:
                curState = 'ABOUT_TO_START';
                break;
              case pipWindow.PiPState.STARTED:
                curState = 'STARTED';
                break;
              case pipWindow.PiPState.ABOUT_TO_STOP:
                curState = 'ABOUT_TO_STOP';
                break;
              case pipWindow.PiPState.STOPPED:
                curState = 'STOPPED';
                break;
              case pipWindow.PiPState.ABOUT_TO_RESTORE:
                curState = 'ABOUT_TO_RESTORE';
                break;
              case pipWindow.PiPState.ERROR:
                curState = 'ERROR';
                break;
              default:
                break;
            }
            console.log(msgStr + ' Succeeded in stateChange_Function_ Callback' + curState)
            console.log(msgStr + ' Succeeded in stateChange_Function_ Callback' + reason)
          });
          try {
            pipController!.offStateChange();
            console.log(msgStr + ' Succeeded in stateChange_test')
  
            done()
          } catch (error) {
            console.log(msgStr + ' Failed1 to stateChange_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.log(msgStr + ' Failed2 to stateChange_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   controlPanelActionEvent_Function_Callback
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
       * @tc.desc   To test the function of controlPanelActionEvent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('controlPanelActionEvent_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'controlPanelActionEvent_Function_Callback '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + ' controlPanelActionEvent_Function_Callback begin');
          pipController!.onControlPanelActionEvent((event) => {
            switch (event) {
              case 'playbackStateChanged':
                break;
              case 'nextVideo':
                break;
              case 'previousVideo':
                break;
              default:
                break;
            }
            console.log(msgStr + ' Succeeded in registerActionEventCallback , event:' + event)
          });
  
          done();
        } catch (error) {
          console.log(msgStr + ' Failed to registerActionEventCallback , event:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   controlPanelActionEvent_test
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
       * @tc.desc   To test the function of controlPanelActionEvent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('controlPanelActionEvent_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'controlPanelActionEvent_test '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          pipController = await pipWindow.create(config);
          console.log(msgStr + ' controlPanelActionEvent_test begin');
          pipController!.onControlPanelActionEvent((event) => {
            switch (event) {
              case 'playbackStateChanged':
                break;
              case 'nextVideo':
                break;
              case 'previousVideo':
                break;
              default:
                break;
            }
            console.log(msgStr + ' Succeeded in registerActionEventCallback , event:' + event)
          });
          try {
            pipController!.offControlPanelActionEvent();
            console.log(msgStr + ' Succeeded in controlPanelActionEvent_test')
  
            done();
          } catch (error) {
            console.log(msgStr + ' Failed1 to controlPanelActionEvent_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.log(msgStr + ' Failed2 to registerActionEventCallback , event:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   testPiPTemplateType
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
       * @tc.desc   To test the function of testPiPTemplateType
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPTemplateType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = "testPiPTemplateType"
        try {
          expect(pipWindow.PiPTemplateType.VIDEO_PLAY).assertEqual(0);
          expect(pipWindow.PiPTemplateType.VIDEO_CALL).assertEqual(1);
          expect(pipWindow.PiPTemplateType.VIDEO_MEETING).assertEqual(2);
          expect(pipWindow.PiPTemplateType.VIDEO_LIVE).assertEqual(3);
          done()
        } catch (error) {
          expect().assertFail()
          done()
        }
      })
      /**
       * @tc.name   testPiPEvent
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
       * @tc.desc   To test the function of testPiPEvent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = "testPiPEvent"
        try {
          let event: pipWindow.PiPActionEventType = "playbackStateChanged";
          let event2: pipWindow.PiPVideoActionEvent = "playbackStateChanged";
          let event3: pipWindow.PiPCallActionEvent = "hangUp";
          let event4: pipWindow.PiPMeetingActionEvent = "hangUp";
          let event5: pipWindow.PiPLiveActionEvent = "playbackStateChanged";
          expect(pipWindow.PiPState.ABOUT_TO_START).assertEqual(1);
          expect(pipWindow.PiPState.STARTED).assertEqual(2);
          expect(pipWindow.PiPState.ABOUT_TO_STOP).assertEqual(3);
          expect(pipWindow.PiPState.STOPPED).assertEqual(4);
          expect(pipWindow.PiPState.ABOUT_TO_RESTORE).assertEqual(5);
          expect(pipWindow.PiPState.ERROR).assertEqual(6);
          done();
        } catch (error) {
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   create_Function_Promise_2
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
       * @tc.desc   To test the function of create
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('create_Function_Promise_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'create_Function_Promise_2 '
        console.log(msgStr + 'begin')
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          let promise = pipWindow.create(config);
          promise.then((data: pipWindow.PiPController) => {
            
            console.log(msgStr + 'Succeeded in creating pip controller. Data:' + data)
            expect(data!= null).assertTrue();
            done();
          }).catch((err: Error) => {
            console.log(msgStr + 'Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(msgStr + 'Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   create_Function_Promise_3
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
       * @tc.desc   To test the function of create
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('create_Function_Promise_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'create_Function_Promise_3 '
        console.log(msgStr + 'begin')
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          let promise = pipWindow.create(config);
          promise.then((data: pipWindow.PiPController) => {
            
            console.log(msgStr + 'Succeeded in creating pip controller. Data:' + data)
            expect(data!= null).assertTrue();
            done();
          }).catch((err: Error) => {
            console.log(msgStr + ' Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(msgStr + ' Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   create_Function_Promise_4
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
       * @tc.desc   To test the function of create
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('create_Function_Promise_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'create_Function_Promise_4 '
        console.log(msgStr + 'begin')
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
        };
        try {
          let promise = pipWindow.create(config);
          promise.then((data: pipWindow.PiPController) => {
            
            console.log(msgStr + 'Succeeded in creating pip controller. Data:' + data)
            expect(data!= null).assertTrue();
            done();
          }).catch((err: Error) => {
            console.log(msgStr + ' Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(msgStr + ' Failed2 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          expect().assertFail();
          done();
        }
      })
      /**
       * @tc.name   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1600
       * @tc.desc   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT]
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          expect(pipController!= null).assertTrue();
          done();
        } catch (error) {
          console.log(`${msgStr} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
  
      /**
       * @tc.name   test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1700
       * @tc.desc   test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          expect(pipController!= null).assertTrue();
          done();
        } catch (error) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
  
  
      /**
       * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1900
       * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_MICROPHONE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_MICROPHONE_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)            
          console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          expect(pipController!= null).assertTrue();
          done();
        } catch (error) {
          console.log(`${msgStr} test_VideoCallControlGroup_MICROPHONE_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   test_VideoCallControlGroup_HANG_UP_BUTTON
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2000
       * @tc.desc   test_VideoCallControlGroup_HANG_UP_BUTTON
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_HANG_UP_BUTTON '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          expect(pipController!= null).assertTrue();
          done();
        } catch (error) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              expect(error.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoCallControlGroup_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2100
       * @tc.desc   test_VideoCallControlGroup_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
          console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          expect(pipController!= null).assertTrue();
          done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2200
       * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
     
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2300
       * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
          
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
  
      /**
       * @tc.name   test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2400
       * @tc.desc   test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.HANG_UP_BUTTON, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
         
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2500
       * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.HANG_UP_BUTTON, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
  
      /**
       * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2600
       * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_HANG_UP_BUTTON '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
          
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoMeetingControlGroup_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2700
       * @tc.desc   test_VideoMeetingControlGroup_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
  
      /**
       * @tc.name   test_VideoMeetingControlGroup_MUTE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2800
       * @tc.desc   test_VideoMeetingControlGroup_MUTE_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_MUTE_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2900
       * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3000
       * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3100
       * @tc.desc   test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.MUTE_SWITCH, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3200
       * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH '
        console.log(msgStr + 'begin');
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: contentWidth,
          contentHeight: contentHeight,
          controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.MUTE_SWITCH, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config)
            
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController!= null).assertTrue();
            done();
        } catch (err) {
          console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
  
              done();
            }
            else {
              expect().assertFail();
              done();
            }
        }
      })
      /**
       * @tc.name   TestUpdatePiPControlStatusInVideoPlay
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3300
       * @tc.desc   TestUpdatePiPControlStatusInVideoPlay
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestUpdatePiPControlStatusInVideoPlay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestUpdatePiPControlStatusInVideoPlay ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await pipController!.startPiP()
          let count = 0;
          pipController!.onControlPanelActionEvent((event: pipWindow.PiPActionEventType, status?: int) => {
            switch (event) {
              case 'playbackStateChanged':
                if (status === 0) {
                  count--;
                } else if (status === 1) {
                  count++;
                }
                break;
              default:
                break;
            }
          })
          try {
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PLAY);
            console.info(`${msgStr} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PLAY`);
            await Utils.msSleep(1000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PAUSE);
            console.info(`${msgStr} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PAUSE`);

            console.info(`${msgStr} count is�?{count}`);
            expect(0).assertEqual(count);
            pipController!.offControlPanelActionEvent();
            done();
          } catch (error) {
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to updatePiPControlStatus`);

              done();
            } else {
              console.error(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
  
            done();
          } else {
            console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestUpdatePiPControlStatelessType
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3400
       * @tc.desc   TestUpdatePiPControlStatelessType
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestUpdatePiPControlStatelessType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestUpdatePiPControlStatelessType ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await pipController!.startPiP()
          try {
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.FAST_FORWARD, pipWindow.PiPControlStatus.PLAY);
            await Utils.msSleep(1000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.FAST_BACKWARD, pipWindow.PiPControlStatus.PAUSE);

            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PREVIOUS, pipWindow.PiPControlStatus.PLAY);
            await Utils.msSleep(1000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_NEXT, pipWindow.PiPControlStatus.PAUSE);

            await Utils.msSleep(1000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.HANG_UP_BUTTON, pipWindow.PiPControlStatus.PAUSE);


            done();
          } catch (error) {
            console.error(`${msgStr} Params error. Cause:${error.code}, message:${error.message}`);
            if (error.code == 801) {
              expect(error.message != null).assertTrue();
              console.info(`${msgStr} The current device type does not support to updatePiPControlStatus`);

              done();
            } else {
              console.error(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              expect().assertFail();
              done();
            }
          }

        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
            console.info(`${msgStr} The current device type does not support to create pipController`);
  
            done();
          } else {
            console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestUpdatePiPControlStatusInVideoCall
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3500
       * @tc.desc   TestUpdatePiPControlStatusInVideoCall
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestUpdatePiPControlStatusInVideoCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestUpdatePiPControlStatusInVideoCall ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_CALL);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await pipController!.startPiP()

          let count = 0;
          pipController!.onControlPanelActionEvent((event: pipWindow.PiPActionEventType, status?: int) => {
            switch (event) {
              case 'videoStateChanged':
                if (status === 0) {
                  count--;
                } else if (status === 1) {
                  count++;
                }
                break;
              default:
                break;
            }
          })
          try {
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.OPEN);
            console.info(`${msgStr} Succeeded updatePiPControlStatus CAMERA_SWITCH to OPEN`);
            await Utils.msSleep(2000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.CLOSE);
            console.info(`${msgStr} Succeeded updatePiPControlStatus CAMERA_SWITCH to CLOSE`);
            await Utils.msSleep(2000)
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.MUTE_SWITCH, pipWindow.PiPControlStatus.OPEN);
            console.info(`${msgStr} Succeeded updatePiPControlStatus MUTE_SWITCH to OPEN`);
            await Utils.msSleep(2000)
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.MUTE_SWITCH, pipWindow.PiPControlStatus.CLOSE);
            console.info(`${msgStr} Succeeded updatePiPControlStatus MUTE_SWITCH to CLOSE`);
            await Utils.msSleep(2000)
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.MICROPHONE_SWITCH, pipWindow.PiPControlStatus.OPEN);
            console.info(`${msgStr} Succeeded updatePiPControlStatus MICROPHONE_SWITCH to OPEN`);

            console.info(`${msgStr} count is�?{count}`);
            expect(0).assertEqual(count);
            done();
          } catch (error) {
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to updatePiPControlStatus`);

              done();
            } else {
              console.info(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              expect().assertFail();
              done();
            }
          }

        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            expect(error.message != null).assertTrue();
            console.info(`${msgStr} The current device type does not support to create pipController`);
  
            done();
          } else {
            console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        }
      })
  
      /**
       * @tc.name   TestUpdatePiPControlStatusInVideoMeeting
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3600
       * @tc.desc   TestUpdatePiPControlStatusInVideoMeeting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestUpdatePiPControlStatusInVideoMeeting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestUpdatePiPControlStatusInVideoMeeting ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_MEETING);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await  pipController!.startPiP()

          let count = 0;
          pipController!.onControlPanelActionEvent((event: pipWindow.PiPActionEventType, status?: int) => {
            switch (event) {
              case 'videoStateChanged':
                if (status === 0) {
                  count--;
                } else if (status === 1) {
                  count++;
                }
                break;
              default:
                break;
            }
          })
          try {
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.OPEN);
            console.info(`${msgStr} Succeeded updatePiPControlStatus CAMERA_SWITCH to OPEN`);
            await Utils.msSleep(2000);
            pipController!.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.CLOSE);
            console.info(`${msgStr} Succeeded updatePiPControlStatus CAMERA_SWITCH to CLOSE`);

            console.info(`${msgStr} count is�?{count}`);
            expect(0).assertEqual(count);
            done();
          } catch (error) {
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to updatePiPControlStatus`);

              done();
            } else {
              console.error(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestUpdatePiPControlStatusInVideoLive
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3700
       * @tc.desc   TestUpdatePiPControlStatusInVideoLive
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestUpdatePiPControlStatusInVideoLive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestUpdatePiPControlStatusInVideoLive ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_LIVE);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await pipController!.startPiP()
          let count = 0;
            pipController!.onControlPanelActionEvent((event: pipWindow.PiPActionEventType, status?: int) => {
              switch (event) {
                case 'playbackStateChanged':
                  if (status === 0) {
                    count--;
                  } else if (status === 1) {
                    count++;
                  }
                  break;
                default:
                  break;
              }
            })
            try {
              pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PLAY);
              console.info(`${msgStr} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PLAY`);
              await Utils.msSleep(2000);
              pipController!.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PAUSE);
              console.info(`${msgStr} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PAUSE`);

              console.info(`${msgStr} count is�?{count}`);
              expect(0).assertEqual(count);
              done();
            } catch (error) {
              console.info(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                console.info(`${msgStr} The current device type does not support to updatePiPControlStatus`);
                expect(error.message != null).assertTrue();

                done();
              } else {
                expect().assertFail();
                done();
              }
            }
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestSetPiPControlEnabledInVideoPlay
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3800
       * @tc.desc   TestSetPiPControlEnabledInVideoPlay
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestSetPiPControlEnabledInVideoPlay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestSetPiPControlEnabledInVideoPlay ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await  pipController!.startPiP()

          try {
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, false);
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_PLAY_PAUSE false`);
            await Utils.msSleep(1000);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, true);
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_PLAY_PAUSE true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PREVIOUS, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_PREVIOUS true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PREVIOUS, false)
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_PREVIOUS false`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_NEXT, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_NEXT true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_NEXT, false)
            console.info(`${msgStr} Succeeded setPiPControlEnabled VIDEO_NEXT false`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.FAST_FORWARD, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled FAST_FORWARD true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.FAST_FORWARD, false)
            console.info(`${msgStr} Succeeded setPiPControlEnabled FAST_FORWARD false`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.FAST_BACKWARD, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled FAST_BACKWARD true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.FAST_BACKWARD, false)
            console.info(`${msgStr} Succeeded setPiPControlEnabled FAST_BACKWARD false`);
            

            done();
          } catch (error) {
            console.info(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to setPiPControlEnabled`);
              expect(error.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestSetPiPControlEnabledInVideoCall
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3900
       * @tc.desc   TestSetPiPControlEnabledInVideoCall
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestSetPiPControlEnabledInVideoCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestSetPiPControlEnabledInVideoCall ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_CALL);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await pipController!.startPiP()
          try {
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.MICROPHONE_SWITCH, false);
            console.info(`${msgStr} Succeeded setPiPControlEnabled MICROPHONE_SWITCH false`);
            await Utils.msSleep(1000);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.MICROPHONE_SWITCH, true);
            console.info(`${msgStr} Succeeded setPiPControlEnabled MICROPHONE_SWITCH true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.HANG_UP_BUTTON, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled HANG_UP_BUTTON true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.HANG_UP_BUTTON, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled HANG_UP_BUTTON true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.CAMERA_SWITCH, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled CAMERA_SWITCH true`);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.CAMERA_SWITCH, true)
            console.info(`${msgStr} Succeeded setPiPControlEnabled CAMERA_SWITCH true`);
            

            done();
          } catch (error) {
            console.info(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to setPiPControlEnabled`);
              expect(error.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   TestSetPiPControlEnabledInVideoMeeting
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4000
       * @tc.desc   TestSetPiPControlEnabledInVideoMeeting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('TestSetPiPControlEnabledInVideoMeeting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'TestSetPiPControlEnabledInVideoMeeting ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_MEETING);
        let pipController: pipWindow.PiPController;
        try {
          pipController = await pipWindow.create(config)
            
          await  pipController!.startPiP()
          try {
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.MUTE_SWITCH, false);
            console.info(`${msgStr} Succeeded setPiPControlEnabled MUTE_SWITCH false`);
            await Utils.msSleep(1000);
            pipController!.setPiPControlEnabled(pipWindow.PiPControlType.MUTE_SWITCH, true);
            console.info(`${msgStr} Succeeded setPiPControlEnabled MUTE_SWITCH true`);

            done();
          } catch (error) {
            console.info(`${msgStr} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              console.info(`${msgStr} The current device type does not support to setPiPControlEnabled`);
              expect(error.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   testPiPControlCustomUI
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4100
       * @tc.desc   testPiPControlCustomUI
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testPiPControlCustomUI', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPControlCustomUI ';
        console.log(`${msgStr} testPiPControlCustomUI begin`);
        let nodeController: TextNodeController = new TextNodeController('this is custom UI');
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: new XComponentController(),
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 400,
          contentHeight: 600,
          customUIController: nodeController
        };
        try {
          let pipController = await pipWindow.create(config)
          console.log(`${msgStr}} Succeeded to creat pip controller. PiPControllerData�?{pipController}`)
          done();
        } catch (error) {
          console.info(`${msgStr} Failed to create pipController!. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to create pipController`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
      /**
       * @tc.name   testCreateArgsContentNode
       * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4200
       * @tc.desc   testCreateArgsContentNode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testCreateArgsContentNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testCreateArgsContentNode ';
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let uiContext = windowClass.getUIContext();
          let xComponentController: XComponentController = new XComponentController();
          let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: xComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
    
          let contentWidth: int = 800;
          let contentHeight: int = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: xComponentController,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight
          };
          pipWindow.create(config, xComponent).then((data: pipWindow.PiPController) => {
            console.info(`${msgStr} Succeeded in creating pip controller. Data:${data}`);
            expect(data !== null).assertTrue();
            done();
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            if (err.code === 801) {
              console.error(`${msgStr} The current device Capability not supported.`);
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.error(`${msgStr} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          if (exception.code == 1300002) {
            console.info(`${msgStr}: This window state is abnormal.`);
            expect(exception.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   testgetPiPWindowInfo
       * @tc.number SUB_BASIC_WMS_PIP_GET_PIP_WINDOW_INFO_0100
       * @tc.desc   testgetPiPWindowInfo
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testgetPiPWindowInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testgetPiPWindowInfo ';
        let pipWindowInfo: pipWindow.PiPWindowInfo | undefined = undefined;
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let pipController: pipWindow.PiPController;
          let xComponentController: XComponentController = new XComponentController();
          let uiContext = windowClass.getUIContext(); // 可传入UIContext或在布局中通过this.getUIContext()为context赋有效�?
          let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: xComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
          let contentWidth: int = 800; // 假设当前内容宽度800px�?
          let contentHeight: int = 600; // 假设当前内容高度600px�?
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: xComponentController,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight
          };
  
          let promise1: Promise<pipWindow.PiPController> = pipWindow.create(config, xComponent);
          promise1.then((data: pipWindow.PiPController) => {
            pipController = data;
            console.info(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            let promise2: Promise<void> = pipController!.startPiP();
            promise2.then(() => {
              console.info(`${msgStr} Succeeded in starting pip.`);
              let promise3: Promise<pipWindow.PiPWindowInfo> = pipController!.getPiPWindowInfo();
              promise3.then((data: pipWindow.PiPWindowInfo) => {
                pipWindowInfo = data;
                console.info(msgStr + ' Success in get pip window info. Info windowId: ' + JSON.stringify(pipWindowInfo!.windowId) + ' windowSize: ' + JSON.stringify(pipWindowInfo!.size));
                expect(pipWindowInfo!.windowId).assertLargerOrEqual(0);
                expect(pipWindowInfo!.size!.width).assertLargerOrEqual(0);
                expect(pipWindowInfo!.size!.height).assertLargerOrEqual(0);
                expect(pipWindowInfo!.size!.scale).assertLargerOrEqual(0);
                done();
              }).catch((err: Error) => {
                console.error(`${msgStr} Failed to get pip window info. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              });
            }).catch((err: Error) => {
              console.error(`${msgStr} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
  
  
        } catch (exception) {
          console.error(`${msgStr} Failed to get pip window info. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.name   testGetPiPWindowInfoErrCode1300014_0100
       * @tc.number testGetPiPWindowInfoErrCode1300014_0100
       * @tc.desc   testGetPiPWindowInfoErrCode1300014_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetPiPWindowInfoErrCode1300014_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'testGetPiPWindowInfoErrCode1300014_0100 ';
        const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
        let pipController: pipWindow.PiPController | null = null;
        try {
          pipController = await pipWindow.create(config)
          pipController!.getPiPWindowInfo().then(() => {
            console.error(`${msgStr} Succeeded to getPiPWindowInfo.`);
            expect().assertFail();
            done();
          }).catch((err: Error) => {
            if (err.code == 801) {
              console.info(`${msgStr} The current device type does not support to getPiPWindowInfo`);
  
              expect(err.message != null).assertTrue();
              done();
            } else {
              console.error(`${msgStr} Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
              expect(err.code).assertEqual(1300014);
              expect(err.message != null).assertTrue();
              done();
            }
          });
        } catch (error) {
          if (error.code == 801) {
            console.info(`${msgStr} The current device type does not support to getPiPWindowInfo`);
            expect(error.message != null).assertTrue();
  
            done();
          } else {
            console.info(`${msgStr} Failed2 to getPiPWindowInfo. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
          done();
        }
      })
  
      /**
       * @tc.name   test_pipWindowSizeChange
       * @tc.number SUB_BASIC_WMS_ON_PIP_WINDOW_SIZE_CHANGE_0100
       * @tc.desc   验证updateContentSize后获取pipWindow宽高正确
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_pipWindowSizeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_pipWindowSizeChange '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let pipSize: pipWindow.PiPWindowSize = { width: 1, height: 1, scale: 1 };
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 500,
          contentHeight: 500
        };
        let callback = (size: pipWindow.PiPWindowSize) => {
          console.info(`${msgStr} success in callback, size: ${size}`)
          pipSize = size
        }
        try {
          pipController = await pipWindow.create(config);
            if (!pipController!.isPiPSupported()) {
              done();
            } else {
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`)
              await pipController!.startPiP();
              await Utils.msSleep(1000);
              pipController!.onPipWindowSizeChange(callback);
              pipController!.updateContentSize(800, 600);
              await Utils.msSleep(1000);
              let pipWindowInfo = await pipController!.getPiPWindowInfo();
              let pipInfoSize = pipWindowInfo.size
              console.log(`${msgStr} pipWindowInfo width is ${pipInfoSize.width}, pipWindowInfo height is ${pipInfoSize.height}, pipWindowInfo scale is ${pipInfoSize.scale}`)
              console.log(`${msgStr} callback width is ${pipSize.width}, callback height is ${pipSize.height}, callback scale is ${pipSize.scale}`)
              expect(pipSize.width).assertEqual(pipInfoSize.width);
              expect(pipSize.height).assertEqual(pipInfoSize.height);
              expect(Math.abs(pipSize.scale - pipInfoSize.scale)).assertLessOrEqual(0.01)
              pipController!.offPipWindowSizeChange(callback);
              pipController!.stopPiP();
              await Utils.msSleep(1000);
              done();
            }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}Cause:${JSON.stringify(err.message)}`)
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   test_videoCallControlGroup_MUTE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0100
       * @tc.desc   验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_videoCallControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_videoCallControlGroup_MUTE_SWITCH '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoCallControlGroup.MUTE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config);
          if (!pipController!.isPiPSupported()) {
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`)
            let promise = pipController!.startPiP();
            promise.then(() => {
              console.log(`${msgStr} Succeeded in starting pip`)

            }).catch((err: Error) => {
              console.error(`${msgStr} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await Utils.msSleep(1000);
            pipController!.stopPiP();
            await Utils.msSleep(1000);
            done();
          }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   test_VideoMeetingControlGroup_MICROPHONE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0200
       * @tc.desc   验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_VideoMeetingControlGroup_MICROPHONE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoMeetingControlGroup_MICROPHONE_SWITCH '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoMeetingControlGroup.MICROPHONE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config);
            if (!pipController!.isPiPSupported()) {
  
              done();
            } else {
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`)
              let promise = pipController!.startPiP();
              promise.then(() => {
                console.log(`${msgStr} Succeeded in starting pip`)
  
              }).catch((err: Error) => {
                console.error(`${msgStr} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
                expect().assertFail();
              });
              await Utils.msSleep(1000);
              pipController!.stopPiP();
              await Utils.msSleep(1000);
              done();
            }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0300
       * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoLiveControlGroup.VIDEO_PLAY_PAUSE]
        };
        try {
          pipController = await pipWindow.create(config);
          
          if (!pipController!.isPiPSupported()) {
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`)
            let promise = pipController!.startPiP();
            promise.then(() => {
              console.log(`${msgStr} Succeeded in starting pip`)

            }).catch((err: Error) => {
              console.error(`${msgStr} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await Utils.msSleep(1000);
            pipController!.stopPiP();
            await Utils.msSleep(1000);
            done();
          }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   test_VideoLiveControlGroup_MUTE_SWITCH
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0400
       * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_VideoLiveControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoLiveControlGroup_MUTE_SWITCH '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoLiveControlGroup.MUTE_SWITCH]
        };
        try {
          pipController = await pipWindow.create(config);
            if (!pipController!.isPiPSupported()) {
              done();
            } else {
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`)
              let promise = pipController!.startPiP();
              promise.then(() => {
                console.log(`${msgStr} Succeeded in starting pip`)
  
              }).catch((err: Error) => {
                console.error(`${msgStr} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
                expect().assertFail();
              });
              await Utils.msSleep(1000);
              pipController!.stopPiP();
              await Utils.msSleep(1000);
              done();
            }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0500
       * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoLiveControlGroup.MUTE_SWITCH, pipWindow.VideoLiveControlGroup.VIDEO_PLAY_PAUSE]
        };
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {

            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            let promise = pipController!.startPiP();
            promise.then(() => {
              console.log(`${msgStr} Succeeded in starting pip`);

            }).catch((err: Error) => {
              console.error(`${msgStr} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
              expect().assertFail();
            });
            await Utils.msSleep(1000);
            pipController!.stopPiP();
            await Utils.msSleep(1000);
            done();
          }
          
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
      * @tc.name test_on_controlEvent
      * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0100
      * @tc.desc 验证on_controlEvent
      * @tc.type FUNCTION
      * @tc.size MEDIUMTEST
      * @tc.level LEVEL3
      */
      it('test_on_controlEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_on_controlEvent '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let controlParam: pipWindow.ControlEventParam = { controlType: pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, 
          status: pipWindow.PiPControlStatus.PAUSE };
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 500,
          contentHeight: 500
        };
        let callback = (control: pipWindow.ControlEventParam) => {
          console.info(`${msgStr} success in callback, control: ${JSON.stringify(control)}`)
          controlParam = control
        }
        let driver: Driver = Driver.create();
        try {
          pipController = await pipWindow.create(config);
          if (!pipController!.isPiPSupported()) {
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            await pipController!.startPiP();
            await Utils.msSleep(1000);
            pipController!.onControlEvent(callback);
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1!.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1!.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${msgStr} BoundsCenter x: ${x}, bottom: ${bottom}`);
            let component = await driver.findComponent(ON.id('SCBPipSceneOverlay'))
            await component!.click();
            await Utils.msSleep(1000);
            let button2 = await driver.findComponent(ON.id('control_play'));
            console.log(`${msgStr} button2: ${JSON.stringify(button2)}`);
            await button2!.click();
            await Utils.msSleep(2000);
            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE);
            expect(controlParam.status).assertEqual(pipWindow.PiPControlStatus.PAUSE);


            await Utils.msSleep(1000);
            let button3 = await driver.findComponent(ON.id('control_play'));
            console.log(`${msgStr} button3: ${JSON.stringify(button3)}`);
            await button3!.click();

            await Utils.msSleep(1000);

            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE);
            expect(controlParam.status).assertEqual(pipWindow.PiPControlStatus.PLAY);
            pipController!.stopPiP();
            await Utils.msSleep(2000)
            pipController!.offControlEvent(callback);
            done();
          }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          expect().assertFail();
          done();
        }
  
  
      });
  
      /**
       * @tc.name   test_off_controlEvent
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0200
       * @tc.desc   验证on_controlEvent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_off_controlEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_off_controlEvent '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let controlParam: pipWindow.ControlEventParam = { controlType: pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, 
          status: pipWindow.PiPControlStatus.PAUSE };
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 500,
          contentHeight: 500
        };
        let callback = (control: pipWindow.ControlEventParam) => {
          console.error(`${msgStr} success in callback, control: ${control}`)
          controlParam = control
        }
        let driver: Driver = Driver.create();
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {

            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            await pipController!.startPiP();
            await Utils.msSleep(1000);
            pipController!.onControlEvent(callback);
            pipController!.offControlEvent();
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1!.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1!.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${msgStr} BoundsCenter x: ${x}, bottom: ${bottom}`);
            let component = await driver.findComponent(ON.id('SCBPipSceneOverlay'))
            await component!.click();
            await Utils.msSleep(1000);
            let button2 = await driver.findComponent(ON.id('control_play'));
            console.log(`${msgStr} button2: ${JSON.stringify(button2)}`);
            await button2!.click();

            await Utils.msSleep(1000);
            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE);
            expect(controlParam.status).assertEqual(pipWindow.PiPControlStatus.PAUSE);
            pipController!.stopPiP();
            await Utils.msSleep(1000)
            done();
          }
        } catch (err) {
          console.log(`${msgStr} Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
          expect().assertFail();
          done();
        }
      });
      /**
      * @tc.name   test_on_controlEvent_VIDEO_PLAY_01
      * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0300
      * @tc.desc   test_on_controlEvent_VIDEO_PLAY
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
      it('test_on_controlEvent_VIDEO_PLAY_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_on_controlEvent_VIDEO_PLAY_01 '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let controlParam: pipWindow.ControlEventParam = { controlType: pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, 
          status: pipWindow.PiPControlStatus.PAUSE };
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT]
        };
        let callback = (control: pipWindow.ControlEventParam) => {
          console.info(`${msgStr} success in callback, control: ${JSON.stringify(control)}`)
          controlParam = control
        }
        let driver: Driver =
          Driver.create();
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {
  
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            await pipController!.startPiP();
            await Utils.msSleep(1000);
            pipController!.onControlEvent(callback);
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1!.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1!.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${msgStr} BoundsCenter x: ${x}, bottom: ${bottom}`);
            let component = await driver.findComponent(ON.id('SCBPipSceneOverlay'))
            await component!.click();
              await Utils.msSleep(1000);
              let button2 = await driver.findComponent(ON.id('control_play_last'));
              console.log(`${msgStr} button2: ${JSON.stringify(button2)}`);
              await button2!.click();
            await Utils.msSleep(1000);
            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_PREVIOUS);
            expect(controlParam.status).assertEqual(-1);

            await Utils.msSleep(1000);
            let button3 = await driver.findComponent(ON.id('control_play_next'));
            console.log(`${msgStr} button3: ${JSON.stringify(button3)}`);
            await button3!.click();

            await Utils.msSleep(1000);

            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_NEXT);
            expect(controlParam.status).assertEqual(-1);
            pipController!.stopPiP();
            await Utils.msSleep(2000)
            pipController!.offControlEvent(callback);
            done();
          }

        } catch (err) {
          console.log(`${msgStr} promise Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          pipController?.offControlEvent(callback);
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
  
  
      });
      /**
       * @tc.name   test_on_controlEvent_VIDEO_PLAY_02
       * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0400
       * @tc.desc   test_on_controlEvent_VIDEO_PLAY_02
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_on_controlEvent_VIDEO_PLAY_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_on_controlEvent_VIDEO_PLAY_02 '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let controlParam: pipWindow.ControlEventParam = { controlType: pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, 
          status: pipWindow.PiPControlStatus.PAUSE };
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: 500,
          contentHeight: 500,
          controlGroups: [pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
        };
        let callback = (control: pipWindow.ControlEventParam) => {
          console.info(`${msgStr} success in callback, control: ${JSON.stringify(control)}`)
          controlParam = control
        }
        let driver: Driver =
          Driver.create();
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {
  
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            await pipController!.startPiP();
            await Utils.msSleep(1000);
            pipController!.onControlEvent(callback);
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1!.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1!.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${msgStr} BoundsCenter x: ${x}, bottom: ${bottom}`);
            let component = await driver.findComponent(ON.id('SCBPipSceneOverlay'))
            await component!.click();
              await Utils.msSleep(1000);
              let button2 = await driver.findComponent(ON.id('control_fast_backward'));
              console.log(`${msgStr} button2: ${JSON.stringify(button2)}`);
              await button2!.click();
            await Utils.msSleep(1000);
            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.FAST_BACKWARD);
            expect(controlParam.status).assertEqual(-1);

            await Utils.msSleep(1000);
            let button3 = await driver.findComponent(ON.id('control_fast_forward'));
            console.log(`${msgStr} button3: ${JSON.stringify(button3)}`);
            await button3!.click();

            await Utils.msSleep(1000);

            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.FAST_FORWARD);
            expect(controlParam.status).assertEqual(-1);
            pipController!.stopPiP();
            await Utils.msSleep(2000)
            pipController!.offControlEvent(callback);
            done();
          }
        } catch (err) {
          console.log(`${msgStr} promise Failed to create pipController!.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
            pipController?.offControlEvent(callback);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
        }
  
  
      });
  

  
      /**
       * @tc.name   test_updateContentNode_ErrorCode_801
       * @tc.number SUB_BASIC_WMS_updateContentNode_ErrorCode_0200
       * @tc.desc   验证updateContentNode接口801
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_updateContentNode_ErrorCode_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_updateContentNode_ErrorCode_801 '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500
        };
        let windowClass = windowStage!.getMainWindowSync();
        let uiContext = windowClass.getUIContext();
        let options: XComponentOptions = {
          type: XComponentType.SURFACE,
          controller: mXComponentController
        } 
        let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            try {
              await pipController!.startPiP();
              console.log(`${msgStr} Succeeded startPiP`);
              await Utils.msSleep(1000);
              await pipController!.updateContentNode(xComponent);
              console.log(`${msgStr} Succeeded updateContentNode`);

              pipController!.stopPiP();
              await Utils.msSleep(1000)
              done();
            } catch (err) {
              console.error(`${msgStr} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
        } catch (err) {
          console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        }
      });
  
      /**
       * @tc.name   test_updateContentNode1
       * @tc.number SUB_BASIC_WMS_updateContentNode_0100
       * @tc.desc   验证先updateContentNode后startPIP
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_updateContentNode1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_updateContentNode1 '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500
        };
        let windowClass = windowStage!.getMainWindowSync();
        let uiContext = windowClass.getUIContext();
        let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: mXComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);;
        try {
          pipController = await pipWindow.create(config);

          if (!pipController!.isPiPSupported()) {
  
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            try {
              await pipController!.updateContentNode(xComponent);
              await Utils.msSleep(1000);
              console.log(`${msgStr} Succeeded updateContentNode`);
              await pipController!.startPiP();
              await Utils.msSleep(1000);
              console.log(`${msgStr} Succeeded startPiP`);

              pipController!.stopPiP();
              await Utils.msSleep(1000)
              done();
            } catch (err) {
              console.error(`${msgStr} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
        } catch (err) {
          console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        }
      });
  
      /**
       * @tc.name   test_updateContentNode2
       * @tc.number SUB_BASIC_WMS_updateContentNode_0200
       * @tc.desc   验证先startPIP后updateContentNode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_updateContentNode2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_updateContentNode2 '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500
        };
        let windowClass = windowStage!.getMainWindowSync();
        let uiContext = windowClass.getUIContext();
        let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: mXComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);;
        try {
          pipController = await pipWindow.create(config);
            
          if (!pipController!.isPiPSupported()) {

            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            try {
              await pipController!.startPiP();
              await Utils.msSleep(1000);
              console.log(`${msgStr} Succeeded startPiP`);
              await pipController!.updateContentNode(xComponent);
              console.log(`${msgStr} Succeeded updateContentNode`);

              pipController!.stopPiP();
              await Utils.msSleep(1000)
              done();
            } catch (err) {
              console.error(`${msgStr} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
     
        } catch (err) {
          console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        }
      });
  
  
      /**
       * @tc.name   test_pip_create_with_localstorage
       * @tc.number SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0100
       * @tc.desc   验证pipwindow.create带localstorage参数
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_pip_create_with_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_pip_create_with_localstorage '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let para: Record<string, number> = { 'PropA': 47 };
        let storage: LocalStorage = new LocalStorage(para)
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          localStorage: storage
        };
        try {
          pipController = await pipWindow.create(config);
          if (!pipController!.isPiPSupported()) {

            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            try {
              await pipController!.startPiP();
              await Utils.msSleep(1000);
              console.log(`${msgStr} Succeeded startPiP`);
              pipController!.stopPiP();
              await Utils.msSleep(1000)

              done();
            } catch (err) {
              console.error(`${msgStr} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              expect(err.message != null).assertTrue();
              done();
            }
          }
        } catch (err) {
          console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        }
      });
  
      
      /**
       * @tc.name   test_pip_create_undefined_localstorage
       * @tc.number SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0300
       * @tc.desc   验证pipwindow.create带localstorage参数为undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('test_pip_create_undefined_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let msgStr = 'test_pip_create_undefined_localstorage '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          localStorage: undefined
        };
        try {
          pipController = await pipWindow.create(config);     
          if (!pipController!.isPiPSupported()) {
            done();
          } else {
            console.log(`${msgStr} Succeeded in creating pip controller, Data:${pipController}`)
            try {
              await pipController!.startPiP();
              await Utils.msSleep(1000);
              console.log(`${msgStr} Succeeded startPiP`);
              pipController!.stopPiP();
              await Utils.msSleep(1000)

              done();
            } catch (err) {
              console.error(`${msgStr} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              done();
            }
          }
        } catch (err) {
          console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
      }
      });
  
      /**
       * @tc.name   testGetPiPSettingSwitchStatus
       * @tc.number SUB_BASIC_WMS_GETPIPSETTINGSWITCH_0100
       * @tc.desc   验证支持画中画的设备调用getpipsettingswitch接口，获取设置中自动启动画中画按钮状�?
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetPiPSettingSwitchStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testGetPiPSettingSwitchStatus '
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: navId,
          templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
          contentWidth: 500,
          contentHeight: 500,
          localStorage: undefined
        };
        try {
          let promise = pipWindow.create(config);
          promise.then((data: pipWindow.PiPController) => {
            
            if (!pipController!.isPiPSupported()) {
  
              done();
            } else {
              console.log(`${msgStr} Succeeded in creating pip controller, Data:${data}`)
              pipController!.getPiPSettingSwitch().then((result: boolean) => {
                console.log(`${msgStr} result: ${result}`)
                expect(result).assertEqual(true);
                done();
              }).catch((err: Error) => {
                console.error(`${msgStr} promise Failed getPiPSettingSwitch, Cause code ${err.code}, message ${err.message}`);
                expect(err.code).assertEqual(801);
                expect(err.message != null).assertTrue();
                done();
              });
            }
          }).catch((err: Error) => {
            console.error(`${msgStr} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
            expect(err.code).assertEqual(801);
            expect(err.message != null).assertTrue();
            done();
          });
        } catch (err) {
          console.error(`${msgStr} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
        }
      });
  
      /**
       * @tc.name   testPipHandleId
       * @tc.number SUB_BASIC_WMS_PIP_HANDLEID_0100
       * @tc.desc   testPipHandleId
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPipHandleId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPipHandleId '
        try {
          if (!isPipWindowEnabled) {
            done();
          } else {
            let pipController: pipWindow.PiPController | undefined = undefined;
            let mXComponentController = new XComponentController();
            let navId = "";
            let config: pipWindow.PiPConfiguration = {
              context: context1 as common.BaseContext,
              componentController: mXComponentController,
              navigationId: navId,
              templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
              contentWidth: 500,
              contentHeight: 500,
              handleId: 1
            };
            pipController = await pipWindow.create(config);
  
            done();
          }
        } catch (err) {
          console.error(`${msgStr} Failed, Cause code ${err.code}, message ${err.message}`);
          if (err.code === 801) {
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      });
  
      /**
       * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined
       * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0100
       * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: undefined
          };
          try {
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              pipController!.stopPiP();
              done();
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        }
      })
  
  
      /**
       * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false
       * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0200
       * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: false
          };
          try {
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              pipController!.stopPiP();
              done();
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        }
      })
  
  
      /**
       * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true
       * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0300
       * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              pipController!.stopPiP();
              await Utils.msSleep(5000);
              done();
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        }
      })
  
      /**
       * @tc.name   testPiPStateChangeRequestStart
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_REQUESTSTART_0100
       * @tc.desc   testPiPStateChangeRequestStart
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangeRequestStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangeRequestStart ';
        console.log(msgStr + 'begin');
        if (!isPipWindowEnabled) {
          done()
        } else {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('requestStart');
              pipController?.offStateChange()
              pipController!.stopPiP();
              done();
            }
            pipController = await pipWindow.create(config)
              
              pipController!.onStateChange(callback)
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              await Utils.msSleep(3000);
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.offStateChange()
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        }
      })
  
      /**
       * @tc.name   testPiPStateChangeAutoStart
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_AUTOSTART_0100
       * @tc.desc   testPiPStateChangeAutoStart
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangeAutoStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangeAutoStart ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled && isPCStatus != '') {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            let windowClass = windowStage!.getMainWindowSync();
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('autoStart')
              pipController?.offStateChange()
              pipController!.stopPiP();
              windowClass.restore();
              done();
            }
            pipController = await pipWindow.create(config)
              
              pipController!.onStateChange(callback)
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              pipController!.setAutoStartEnabled(true)
              await windowClass.minimize();
              await Utils.msSleep(1000);
            
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause + JSON.stringify(err.code)+':msg:'+JSON.stringify(err.message)`);
            pipController?.offStateChange()
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPStateChangeRequestDelete
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_REQUESTDELETE_0100
       * @tc.desc   testPiPStateChangeRequestDelete
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangeRequestDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangeRequestDelete ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('requestDelete')
              pipController?.offStateChange()
              done();
            }
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP()
              pipController!.onStateChange(callback)
              pipController!.stopPiP();
              await Utils.msSleep(3000);
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.offStateChange()
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPStateChangePanelActionDelete
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_PANELACTIONDELETE_0100
       * @tc.desc   testPiPStateChangePanelActionDelete
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangePanelActionDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangePanelActionDelete ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          let driver = Driver.create();
          try {
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('panelActionDelete');
              pipController?.offStateChange()
              done();
            }
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              console.log(`${msgStr} Succeeded in start pip controller.`);
              await Utils.msSleep(1000)
              pipController!.onStateChange(callback)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              console.log(`${msgStr} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
              await pipWindowComponent!.click();
              await Utils.msSleep(1000)
              let exit = await driver.findComponent(ON.id('control_exit'));
              await Utils.msSleep(1000)
              await exit!.click();
              await Utils.msSleep(1000);
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.offStateChange()
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
  
      /**
       * @tc.name   testPiPStateChangePanelActionRestore
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_PANELACTIONRESTORE_0100
       * @tc.desc   testPiPStateChangePanelActionRestore
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangePanelActionRestore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangePanelActionRestore ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          let driver = Driver.create();
          try {
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('panelActionRestore')
              pipController?.offStateChange()
              done();
            }
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP()
              pipController!.onStateChange(callback)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              console.log(`${msgStr} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
              await pipWindowComponent!.click();
              await Utils.msSleep(1000)
              let restore = await driver.findComponent(ON.id('control_restore'));
              await Utils.msSleep(1000)
              await restore!.click();
              await Utils.msSleep(1000);
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.offStateChange()
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
  
      /**
       * @tc.name   testPiPStateChangeOtherwithTwoPiP
       * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_OTHER_0200
       * @tc.desc   testPiPStateChangeOtherwithTwoPiP
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPStateChangeOtherwithTwoPiP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPStateChangeOtherwithTwoPiP ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let pipController2: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            const callback = (state: pipWindow.PiPState, reason: string) => {
              console.log(msgStr + ' callback state: ' + state);
              console.log(msgStr + ' callback reason: ' + reason);
              expect(reason).assertEqual('other')
              pipController?.offStateChange()
              pipController2?.stopPiP();
              done();
            }
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP()
              pipController!.onStateChange(callback)
              pipController2 = await pipWindow.create(config);
              pipController2!.startPiP()
              await Utils.msSleep(3000);
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPisPiPActiveStarted
       * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0100
       * @tc.desc   testPiPisPiPActiveStarted
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPisPiPActiveStarted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPisPiPActiveStarted ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              await pipController!.startPiP();
              let isPipActive = await pipController!.isPiPActive();
              console.log(msgStr + ' isPipActive: ' + isPipActive);
              expect(isPipActive).assertEqual(true);
              pipController!.stopPiP();
              await Utils.msSleep(5000);
              done();
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPisPiPActiveBeforeStart
       * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0200
       * @tc.desc   testPiPisPiPActiveBeforeStart
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPisPiPActiveBeforeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPisPiPActiveBeforeStart ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            pipController = await pipWindow.create(config)
              
              console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
              expect(pipController!= null).assertTrue();
              let isPipActive = await pipController!.isPiPActive();
              console.log(msgStr + ' isPipActive: ' + isPipActive);
              expect(isPipActive).assertEqual(false);
              await Utils.msSleep(5000);
              done();
          } catch (err) {
            console.log(`${msgStr} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPisPiPActiveStoped
       * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0300
       * @tc.desc   testPiPisPiPActiveStoped
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPisPiPActiveStoped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPisPiPActiveStoped ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          try {
            pipController = await pipWindow.create(config)
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController != null).assertTrue();
            await pipController!.startPiP();
            pipController!.stopPiP();
            let isPipActive = await pipController!.isPiPActive();
            console.log(msgStr + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(false);
            await Utils.msSleep(5000);
            done();
            
          } catch (error) {
            console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              expect(error.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   testPiPisPiPActiveSidebar
       * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0400
       * @tc.desc   testPiPisPiPActiveSidebar
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testPiPisPiPActiveSidebar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'testPiPisPiPActiveSidebar ';
        console.log(msgStr + 'begin');
        if (isPipWindowEnabled && isFreeWindowMode == false) {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController = new XComponentController();
          let navId = "";
          let contentWidth = 400;
          let contentHeight = 600;
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled: true
          };
          let driver = Driver.create();
          try {
            pipController = await pipWindow.create(config);
            console.log(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            expect(pipController != null).assertTrue();
            await pipController!.startPiP();
            // 3、画中画拉到侧边�?
            let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            console.log(`${msgStr} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
            await Utils.msSleep(1000)
            let pipWindowCenter = await pipWindowComponent!.getBoundsCenter();
            console.log(`${msgStr} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${msgStr} displayInfo: ${JSON.stringify(displayInfo)}`);
            let dragToX = pipWindowCenter.x + displayInfo.width;
            let dragToY = pipWindowCenter.y;
            await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX.toInt(), dragToY);
            await Utils.msSleep(3000);
            let expectValue = deviceType == 'tv' ? true : false;
            let isPipActive = await pipController!.isPiPActive();
            console.log(msgStr + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(expectValue);
            pipController!.stopPiP();
            await Utils.msSleep(1000);
            done();
          } catch (error) {
            console.log(`${msgStr} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            if (error.code == 801) {
              expect(error.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          }
        } else {
          done()
        }
      })
  
      /**
       * @tc.name   tesCreate_null_undefined2
       * @tc.number SUB_WMS_CREATE_PARAMETER_0200
       * @tc.desc   tesCreate_null_undefined2
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('tesCreate_null_undefined2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'tesCreate_null_undefined2 ';
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          controlGroups: []
        };
        if (isPipWindowEnabled) {
          try {
            await pipWindow.create(config);
            
            done();
          } catch (err) {
            console.error(`${msgStr} Failed2, Cause code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          done();
        }
      });
  
      /**
       * @tc.name   tesCreate_navigation_null
       * @tc.number SUB_WMS_CREATE_PARAMETER_0500
       * @tc.desc   tesCreate_navigation_null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('tesCreate_navigation_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'tesCreate_navigation_null ';
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: ''
        };
        if (isPipWindowEnabled) {
          try {
            await pipWindow.create(config);
            
            done();
          } catch (err) {
            console.error(`${msgStr} Failed2, Cause code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          done();
        }
      });
  
  
      /**
       * @tc.name   tesupdateContentNode_null_undefined
       * @tc.number SUB_WMS_SETAUTOSTARTENABLED_PARAMETER_0100
       * @tc.desc   tesupdateContentNode_null_undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('tesupdateContentNode_null_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = 'tesupdateContentNode_null_undefined ';
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let config: pipWindow.PiPConfiguration = {
          context: context1 as common.BaseContext,
          componentController: mXComponentController,
          navigationId: ''
        };
        if (isPipWindowEnabled) {
          try {
            pipController = await pipWindow.create(config);
            pipController!.setAutoStartEnabled(false);
            
            done();
          } catch (err) {
            console.error(`${msgStr} Failed2, Cause code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          done();
        }
      });
  
      /**
       * @tc.name   testCreatePiPWindow_01
       * @tc.number SUB_BASIC_WMS_PIP_CREATE_0100
       * @tc.desc   testCreatePiPWindow_01
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testCreatePiPWindow_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testCreatePiPWindow_01 ';
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let pipController: pipWindow.PiPController;
          let xComponentController: XComponentController = new XComponentController();
          let uiContext = windowClass.getUIContext(); // 可传入UIContext或在布局中通过this.getUIContext()为context赋有效�?
          let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: xComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
          let contentWidth: int = 800; // 假设当前内容宽度800px�?
          let contentHeight: int = 600; // 假设当前内容高度600px�?
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            navigationId:'',
            componentController: xComponentController,
            templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
            controlGroups:[],
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled:true,
            defaultWindowSizeType: 0
          };
  
          let promise1: Promise<pipWindow.PiPController> = pipWindow.create(config, xComponent);
          promise1.then((data: pipWindow.PiPController) => {
            pipController = data;
            console.info(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
            let promise2: Promise<void> = pipController!.startPiP();
            promise2.then(() => {
              console.info(`${msgStr} Succeeded in starting pip.`);
              let promise3 : Promise<void> = pipController!.stopPiP();
              promise3.then(() => {
                console.info(msgStr + ' Succeeded in stopping pip');
                
                done();
              }).catch((err: Error) => {
                console.error(`${msgStr} Failed to stop window . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              });
            }).catch((err: Error) => {
              console.error(`${msgStr} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
  
  
        } catch (exception) {
          console.error(`${msgStr} Failed to get pip window info. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })
      /**
       * @tc.name   testCreatePiPWindow_02
       * @tc.number SUB_BASIC_WMS_PIP_CREATE_0200
       * @tc.desc   testCreatePiPWindow_02
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testCreatePiPWindow_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testCreatePiPWindow_02 ';
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let pipController: pipWindow.PiPController;
          let xComponentController: XComponentController = new XComponentController();
          let uiContext = windowClass.getUIContext(); // 可传入UIContext或在布局中通过this.getUIContext()为context赋有效�?
          let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: xComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
          let contentWidth: int = 800; // 假设当前内容宽度800px�?
          let contentHeight: int = 600; // 假设当前内容高度600px�?
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            navigationId:'',
            componentController: xComponentController,
            templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
            controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.MUTE_SWITCH, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH],
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled:false,
            defaultWindowSizeType: 1
          };
  
          pipController = await pipWindow.create(config, xComponent);
          console.info(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          let promise2: Promise<void> = pipController!.startPiP();
          promise2.then(() => {
            console.info(`${msgStr} Succeeded in starting pip.`);
            let promise3 : Promise<void> = pipController!.stopPiP();
            promise3.then(() => {
              console.info(msgStr + ' Succeeded in stopping pip');
              done();
            }).catch((err: Error) => {
              console.error(`${msgStr} Failed to stop window . Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
  
  
        } catch (exception) {
          console.error(`${msgStr} Failed to get pip window info. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.name   testCreatePiPWindow_03
       * @tc.number SUB_BASIC_WMS_PIP_CREATE_0300
       * @tc.desc   testCreatePiPWindow_03
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testCreatePiPWindow_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msgStr = 'testCreatePiPWindow_03 ';
        await Utils.msSleep(1000)
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let pipController: pipWindow.PiPController;
          let xComponentController: XComponentController = new XComponentController();
          let uiContext = windowClass.getUIContext(); // 可传入UIContext或在布局中通过this.getUIContext()为context赋有效�?
          let options: XComponentOptions = {
            type: XComponentType.SURFACE,
            controller: xComponentController
          } 
          let xComponent = typeNode.createXComponentNodeWithOptions(uiContext, options);
          let contentWidth: int = 800; // 假设当前内容宽度800px�?
          let contentHeight: int = 600; // 假设当前内容高度600px�?
          let config: pipWindow.PiPConfiguration = {
            context: context1 as common.BaseContext,
            navigationId:'',
            componentController: xComponentController,
            templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
            controlGroups: [pipWindow.VideoLiveControlGroup.VIDEO_PLAY_PAUSE, pipWindow.VideoLiveControlGroup.MUTE_SWITCH],
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            cornerAdsorptionEnabled:false,
            defaultWindowSizeType: 2
          };
  
          pipController = await pipWindow.create(config, xComponent);
          console.info(`${msgStr} Succeeded in creating pip controller. Data:${pipController}`);
          let promise2: Promise<void> = pipController!.startPiP();
          promise2.then(() => {
            console.info(`${msgStr} Succeeded in starting pip.`);
            let promise3 : Promise<void> = pipController!.stopPiP();
            promise3.then(() => {
              console.info(msgStr + ' Succeeded in stopping pip');
              
              done();
            }).catch((err: Error) => {
              console.error(`${msgStr} Failed to stop window . Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (err) {
          console.error(`${msgStr} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
        }
      })
        
       /**
     * @tc.name   createPiP_templateType_videoDrive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_VIDEO_DRIVE_0100
     * @tc.desc   To test the function of startPiP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('createPiP_templateType_videoDrive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let msgStr = 'createPiP_templateType_videoDrive '
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1 as common.BaseContext,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_DRIVE,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      let testSupport = async () => {
        try {
          pipController = await pipWindow.create(config)
          console.log(msgStr + ' startPiP_Function_Promise begin')
          let promise = pipController!.startPiP();
          promise.then(() => {
            console.log(msgStr + ' Succeeded in starting pip')
            pipController!.stopPiP()
            done();
          }).catch((err: Error) => {
            console.log(msgStr + ' Failed1 to start pip. Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.log(msgStr + ' Failed2 to start pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }

      let testNotSupport = async () => {
        try {
          pipController = await pipWindow.create(config)
          console.log(msgStr + ' startPiP_Function_Promise begin')
          let promise = pipController!.startPiP();
          promise.then(() => {
            console.log(msgStr + ' Succeeded in starting pip')
            done();
          }).catch((err: Error) => {
            console.log(msgStr + ' Failed1 to start pip. Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.log(msgStr + ' Failed2 to start pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          if (canIUse("SystemCapability.Window.SessionManager")) {
            expect(error.code).assertEqual(401);
            done();
          } else {
            expect(error.code).assertEqual(801);
            done();
          }
        }
      }

      if (deviceType == 'car') {
        testSupport()
      } else {
        testNotSupport()
      }
    })


    /**
     * @tc.name   test_createPiP_multi
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_CREATE_MULTI_PIP_0200
     * @tc.desc   test_createPiP_multi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createPiP_multi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let msgStr = 'test_createPiP_multi '
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1 as common.BaseContext,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_DRIVE,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      let STOPPED: boolean = false;
      try {
        let pipController = await pipWindow.create(config);
        if (deviceInfo.deviceType !== 'car') expect().assertFail();
        console.log(msgStr + 'create pip1');
        pipController.onStateChange((state, reason) => {
          console.log(msgStr + 'pip1 stateChange state : ' + state);
          if (state === pipWindow.PiPState.STOPPED) {
            STOPPED = true
          }
        });
        await pipController.startPiP()
        console.log(msgStr + 'start pip1');
        await Utils.msSleep(1000)

        let pipController2 = await pipWindow.create(config);
        console.log(msgStr + 'create pip2');
        pipController2.onStateChange((state, reason) => {
          console.log(msgStr + 'pip2 stateChange state : ' + state);
          if (state === pipWindow.PiPState.STOPPED) {
            STOPPED = true
          }
        });
        await pipController2.startPiP()
        console.log(msgStr + 'start pip2');
        await Utils.msSleep(1000)

        // car不会触发画中画关闭回调
        expect(STOPPED).assertFalse();

        let pipController3 = await pipWindow.create(config);
        console.log(msgStr + 'create pip3');
        pipController3.onStateChange((state, reason) => {
          console.log(msgStr + 'pip3 stateChange state : ' + state);
          if (state === pipWindow.PiPState.STOPPED) {
            STOPPED = true
          }
        });
        await pipController3.startPiP()
        console.log(msgStr + 'start pip3');
        await Utils.msSleep(1000)
        expect(STOPPED).assertTrue();
        await pipController2.stopPiP()
        await pipController3.stopPiP()
        done();
      } catch (err) {
        console.log(msgStr + 'www data Failed to stateChange_Function_ Callback' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
        if (canIUse("SystemCapability.Window.SessionManager")) {
          expect(err.code).assertEqual(401);
          done();
        } else {
          expect(err.code).assertEqual(801);
          done();
        }
      }
    })
        

      
    })

}