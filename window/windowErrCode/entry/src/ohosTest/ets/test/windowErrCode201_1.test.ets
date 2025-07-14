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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import floatingBall from '@ohos.window.floatingBall';

export default function windowErrCode201_1() {
  describe('windowErrCode201_1', () => {
    console.log('describe windowErrCode201_1 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })

    /**
     * @tc.number     : testsetWindowTopmostErrCode201_0100
     * @tc.name       : testsetWindowTopmostErrCode201_0100
     * @tc.desc       : testsetWindowTopmostErrCode201_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testsetWindowTopmostErrCode201_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "testsetWindowTopmostErrCode201_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        let isWindowTopmost: boolean = true;
        let promiseTopmost = windowClass.setWindowTopmost(isWindowTopmost);
        promiseTopmost.then(() => {
          console.info(msgStr +'Succeeded in setting the main window to be topmost.');
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(msgStr +`Failed to set the main window to be topmost. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowTopmost. Cause:' + JSON.stringify(exception));
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done()
        }

      }
    })

    /**
     * @tc.number    : test_startFloatingBall_ErrorCode_201
     * @tc.name      : test_startFloatingBall_ErrorCode_201
     * @tc.desc      : test_startFloatingBall_ErrorCode_201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_startFloatingBall_ErrorCode_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let CaseName:string = 'test_startFloatingBall_ErrorCode_201';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
          let floatingBallController: floatingBall.FloatingBallController = data;
          console.info(CaseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);

          floatingBallController.startFloatingBall(startParams).then(() => {
            console.info(CaseName+' Succeeded in starting floating ball.');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(CaseName+ ` Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(CaseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
          if(err.code == 801){
            done()
          }else {
            expect(false).assertTrue();
            done();
          }

        });
      } catch(e) {
        console.error( CaseName+  `Failed to test_Create_1300019. Cause:${e.code}, message:${e.message}`);
        expect(e.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number    : test_restoreMainWindow_ErrorCode_201
     * @tc.name      : test_restoreMainWindow_ErrorCode_201
     * @tc.desc      : test_restoreMainWindow_ErrorCode_201
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_restoreMainWindow_ErrorCode_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let CaseName:string = 'test_restoreMainWindow_ErrorCode_201';
      let driver:Driver = Driver.create();
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let want: Want = {
        bundleName: 'com.example.floatballtest',
        abilityName: 'TestAbility'
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let floatingBallController:floatingBall.FloatingBallController;
      try {
        floatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        //点击闪控球
        let button = await driver.findComponent(ON.id('FloatingBallSimpleTemplate'));
        console.info(CaseName+ ' button: ' + button);
        let Bounds = await  button.getBounds();
        console.info(CaseName+ ' Bounds: ' + JSON.stringify(Bounds));
        await driver.click(Bounds.left,Bounds.top);
        await sleep(200);
        try{
          floatingBallController.restoreMainWindow(want).then(async () => {
            console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
            await floatingBallController.stopFloatingBall();
            expect(true).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }catch (err) {
          console.error( CaseName+  `Failed to restore. Cause:${err.code}, message:${err.message}`);
          await floatingBallController.stopFloatingBall();
          if(err.code == 201){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        }

      } catch(e) {
        console.error( CaseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        if(e.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

  })
}