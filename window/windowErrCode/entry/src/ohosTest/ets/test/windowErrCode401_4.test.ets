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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import pipWindow from '@ohos.PiPWindow';
import { screenshot } from '@kit.ArkUI';
import { bundleManager } from '@kit.AbilityKit';
import floatingBall from '@ohos.window.floatingBall';

export default function windowErrCode401_4() {
  describe('windowErrCode401_4', () => {
    console.log('describe windowErrCode401_4 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })

    /**
     * @tc.name   testSetWindowSystemBarProperties_0100
     * @tc.number testSetWindowSystemBarProperties_0100
     * @tc.desc   testSetWindowSystemBarProperties_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowSystemBarProperties_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarProperties_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowSystemBarProperties(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowSystemBarProperties(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetStatusBarColor_0100
     * @tc.number testSetStatusBarColor_0100
     * @tc.desc   testSetStatusBarColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStatusBarColor_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetStatusBarColor_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setStatusBarColor(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setStatusBarColor(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContent_0100
     * @tc.number testLoadContent_0100
     * @tc.desc   testLoadContent_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0100";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContent(null, null,  async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContent(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContent_0200
     * @tc.number testLoadContent_0200
     * @tc.desc   testLoadContent_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.loadContent(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.loadContent(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContent_0300
     * @tc.number testLoadContent_0300
     * @tc.desc   testLoadContent_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0300";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContent(null,  async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContent(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContent_0400
     * @tc.number testLoadContent_0400
     * @tc.desc   testLoadContent_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0400', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0400";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.loadContent(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.loadContent(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetUIContent_0100
     * @tc.number testSetUIContent_0100
     * @tc.desc   testSetUIContent_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetUIContent_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetUIContent_0100";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setUIContent(null,  async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.setUIContent(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetUIContent_0200
     * @tc.number testSetUIContent_0200
     * @tc.desc   testSetUIContent_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetUIContent_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetUIContent_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setUIContent(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setUIContent(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContentByName_0100
     * @tc.number testLoadContentByName_0100
     * @tc.desc   testLoadContentByName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0100";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContentByName(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0200
     * @tc.number testLoadContentByName_0200
     * @tc.desc   testLoadContentByName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContentByName(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0300
     * @tc.number testLoadContentByName_0300
     * @tc.desc   testLoadContentByName_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.loadContentByName(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.loadContentByName(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetBackgroundColor_0100
     * @tc.number testSetBackgroundColor_0100
     * @tc.desc   testSetBackgroundColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetBackgroundColor_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetBackgroundColor_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setBackgroundColor(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setBackgroundColor(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetBackgroundColor_0200
     * @tc.number testSetBackgroundColor_0200
     * @tc.desc   testSetBackgroundColor_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetBackgroundColor_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetBackgroundColor_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setBackgroundColor(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.setBackgroundColor(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_0100
     * @tc.number testSetWindowBackgroundColor_0100
     * @tc.desc   testSetWindowBackgroundColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowBackgroundColor_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowBackgroundColor_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setWindowBackgroundColor(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.setWindowBackgroundColor(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetContentAspectRatio_0100
     * @tc.number testSetContentAspectRatio_0100
     * @tc.desc   testSetContentAspectRatio_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetContentAspectRatio_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetContentAspectRatio_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setContentAspectRatio(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setContentAspectRatio(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowLimits_0100
     * @tc.number testSetWindowLimits_0100
     * @tc.desc   testSetWindowLimits_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowLimits_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLimits_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowLimits(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowLimits(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowLimits_0200
     * @tc.number testSetWindowLimits_0200
     * @tc.desc   testSetWindowLimits_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowLimits_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLimits_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowLimits(null, false);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowLimits(undefined, false);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testRestoreMainWindow_0100
     * @tc.number testRestoreMainWindow_0100
     * @tc.desc   testRestoreMainWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRestoreMainWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRestoreMainWindow_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.restoreMainWindow(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.restoreMainWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowTitle_0100
     * @tc.number testSetWindowTitle_0100
     * @tc.desc   testSetWindowTitle_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitle_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitle_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowTitle(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowTitle(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowDecorHeight_0100
     * @tc.number testSetWindowDecorHeight_0100
     * @tc.desc   testSetWindowDecorHeight_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDecorHeight_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowDecorHeight_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setWindowDecorHeight(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.setWindowDecorHeight(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_0100
     * @tc.number testSetDecorButtonStyle_0100
     * @tc.desc   testSetDecorButtonStyle_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDecorButtonStyle_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetDecorButtonStyle_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setDecorButtonStyle(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.setDecorButtonStyle(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowTransitionAnimation_0100
     * @tc.number testSetWindowTransitionAnimation_0100
     * @tc.desc   testSetWindowTransitionAnimation_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTransitionAnimation_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTransitionAnimation_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowTransitionAnimation(ohosWindow.WindowTransitionType.DESTROY, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowTransitionAnimation(ohosWindow.WindowTransitionType.DESTROY, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowMask_0100
     * @tc.number testSetWindowMask_0100
     * @tc.desc   testSetWindowMask_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMask_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowMask_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowMask(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setWindowMask(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testClientToGlobalDisplay_0100
     * @tc.number testClientToGlobalDisplay_0100
     * @tc.desc   testClientToGlobalDisplay_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClientToGlobalDisplay_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClientToGlobalDisplay_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.clientToGlobalDisplay(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.clientToGlobalDisplay(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testGlobalDisplayToClient_0100
     * @tc.number testGlobalDisplayToClient_0100
     * @tc.desc   testGlobalDisplayToClient_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGlobalDisplayToClient_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGlobalDisplayToClient_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.globalDisplayToClient(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.globalDisplayToClient(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreateSubWindowWithOptions_0100
     * @tc.number testCreateSubWindowWithOptions_0100
     * @tc.desc   testCreateSubWindowWithOptions_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindowWithOptions_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptions_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.createSubWindowWithOptions(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.createSubWindowWithOptions(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetParentWindow_0100
     * @tc.number testSetParentWindow_0100
     * @tc.desc   testSetParentWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetParentWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetParentWindow_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setParentWindow(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setParentWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowContainerColor_0100
     * @tc.number testSetWindowContainerColor_0100
     * @tc.desc   testSetWindowContainerColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerColor_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowContainerColor_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setWindowContainerColor(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.setWindowContainerColor(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetSubWindowZLevel_0100
     * @tc.number testSetSubWindowZLevel_0100
     * @tc.desc   testSetSubWindowZLevel_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSubWindowZLevel_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSubWindowZLevel_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setSubWindowZLevel(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setSubWindowZLevel(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetDragKeyFramePolicy_0100
     * @tc.number testSetDragKeyFramePolicy_0100
     * @tc.desc   testSetDragKeyFramePolicy_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetDragKeyFramePolicy_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setDragKeyFramePolicy(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setDragKeyFramePolicy(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testConvertOrientationAndRotation_0100
     * @tc.number testConvertOrientationAndRotation_0100
     * @tc.desc   testConvertOrientationAndRotation_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertOrientationAndRotation_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertOrientationAndRotation_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.convertOrientationAndRotation(ohosWindow.RotationInfoType.WINDOW_ORIENTATION, ohosWindow.RotationInfoType.DISPLAY_ORIENTATION, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        windowClass.convertOrientationAndRotation(ohosWindow.RotationInfoType.WINDOW_ORIENTATION, ohosWindow.RotationInfoType.DISPLAY_ORIENTATION, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreateSubWindow_0100
     * @tc.number testCreateSubWindow_0100
     * @tc.desc   testCreateSubWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindow_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.createSubWindow(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.createSubWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreateSubWindow_0200
     * @tc.number testCreateSubWindow_0200
     * @tc.desc   testCreateSubWindow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindow_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindow_0200";
      try {
        windowStage.createSubWindow(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowStage.createSubWindow(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreateSubWindowWithOptions_0200
     * @tc.number testCreateSubWindowWithOptions_0200
     * @tc.desc   testCreateSubWindowWithOptions_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindowWithOptions_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptions_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.createSubWindowWithOptions(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.createSubWindowWithOptions(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContent_0500
     * @tc.number testLoadContent_0500
     * @tc.desc   testLoadContent_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0500', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0500";
      try {
        windowStage.loadContent(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowStage.loadContent(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContent_0600
     * @tc.number testLoadContent_0600
     * @tc.desc   testLoadContent_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0600', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0600";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.loadContent(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.loadContent(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContent_0700
     * @tc.number testLoadContent_0700
     * @tc.desc   testLoadContent_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0700', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0700";
      try {
        windowStage.loadContent(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowStage.loadContent(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0400
     * @tc.number testLoadContentByName_0400
     * @tc.desc   testLoadContentByName_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0400', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0400";
      try {
        windowStage.loadContentByName(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowStage.loadContentByName(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0500
     * @tc.number testLoadContentByName_0500
     * @tc.desc   testLoadContentByName_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0500', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0500";
      try {
        windowStage.loadContentByName(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowStage.loadContentByName(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0600
     * @tc.number testLoadContentByName_0600
     * @tc.desc   testLoadContentByName_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0600', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0600";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.loadContentByName(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.loadContent(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModes_0100
     * @tc.number testSetSupportedWindowModes_0100
     * @tc.desc   testSetSupportedWindowModes_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSupportedWindowModes_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSupportedWindowModes_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.setSupportedWindowModes(null, bundleManager.SupportWindowMode.SPLIT);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.setSupportedWindowModes(undefined, bundleManager.SupportWindowMode.SPLIT);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModes_0200
     * @tc.number testSetSupportedWindowModes_0200
     * @tc.desc   testSetSupportedWindowModes_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSupportedWindowModes_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSupportedWindowModes_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.setSupportedWindowModes(null, true);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowStage.setSupportedWindowModes(undefined, false);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreate_0200
     * @tc.number testCreate_0200
     * @tc.desc   testCreate_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreate_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreate_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await floatingBall.create(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await floatingBall.create(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testStartFloatingBall_0100
     * @tc.number testStartFloatingBall_0100
     * @tc.desc   testStartFloatingBall_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartFloatingBall_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testStartFloatingBall_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let floatingBallController: floatingBall.FloatingBallController | undefined
      try {
        floatingBallController = await floatingBall.create(config)
        await floatingBallController.startFloatingBall(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await floatingBallController?.startFloatingBall(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   testUpdateFloatingBall_0100
     * @tc.number testUpdateFloatingBall_0100
     * @tc.desc   testUpdateFloatingBall_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUpdateFloatingBall_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testUpdateFloatingBall_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title'
      };
      let floatingBallController: floatingBall.FloatingBallController | undefined;
      try {
        floatingBallController = await floatingBall.create(config)
        await floatingBallController.startFloatingBall(startParams);
        await floatingBallController.updateFloatingBall(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          await floatingBallController?.stopFloatingBall();
        }
      }
      let floatingBallController2: floatingBall.FloatingBallController | undefined;
      try {
        floatingBallController2 = await floatingBall.create(config)
        await floatingBallController2?.startFloatingBall(startParams);
        await floatingBallController2.updateFloatingBall(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          await floatingBallController2?.stopFloatingBall();
          done();
        }
      }
    })

    /**
     * @tc.name   testRestoreMainWindow_0200
     * @tc.number testRestoreMainWindow_0200
     * @tc.desc   testRestoreMainWindow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRestoreMainWindow_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRestoreMainWindow_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title'
      };
      let floatingBallController: floatingBall.FloatingBallController | undefined
      try {
        floatingBallController = await floatingBall.create(config)
        await floatingBallController.startFloatingBall(startParams);
        await floatingBallController.restoreMainWindow(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          await floatingBallController?.stopFloatingBall();
        }
      }
      let floatingBallController2: floatingBall.FloatingBallController | undefined
      try {
        await floatingBallController2?.startFloatingBall(startParams);
        await floatingBallController2?.restoreMainWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          await floatingBallController2?.stopFloatingBall();
          done();
        }
      }
    })
  })
}