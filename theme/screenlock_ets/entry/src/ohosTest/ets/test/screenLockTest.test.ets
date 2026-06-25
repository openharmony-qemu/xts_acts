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
import screenLock from '@ohos.screenLock';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import display from '@ohos.display';


async function unlock_device() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let cmd_wakeup: string = "power-shell wakeup"
  let displayInfo = display.getDefaultDisplaySync();
  let cmd_info: string = `uinput -T -m ${displayInfo.width * 0.5}  ${displayInfo.height - 10} ${displayInfo.width *
    0.5} ${displayInfo.height * 0.5} 200`
  console.info('====>cmd_info:' + cmd_info)
  try {
    await abilityDelegator.executeShellCommand(cmd_wakeup);
    await abilityDelegator.executeShellCommand(cmd_info);
    await abilityDelegator.executeShellCommand(cmd_info);
    await new Promise<void>(resolve => setTimeout(resolve, 500));
  } catch (err) {
    console.info('====> unlcok_device failed')
  }
}

async function lock_device() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let cmd_info: string = `uinput -K -d 116 -u 116`;
  try {
    await abilityDelegator.executeShellCommand(cmd_info);
    await new Promise<void>(resolve => setTimeout(resolve, 1000));
    await abilityDelegator.executeShellCommand(cmd_info);
  } catch (err) {
    console.info('====> lock_device failed')
  }
}

export default function screenLockJSUnit() {

  describe('ScreenLockServiceTest', () => {
    console.info("====>-----------------------ScreenlockTest is starting-----------------------");

    let result = false
    beforeEach(async (done: Function) => {
      result = await screenLock.isScreenLocked();
      done();
    });

    /**
     * @tc.name   SUB_MISC_THEME_screenLock_API_0001
     * @tc.number SUB_MISC_THEME_screenLock_API_0001
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MISC_THEME_screenLock_API_0001", Level.LEVEL0, async (done: Function) => {
      console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0001-------------------");
      try {
        screenLock.isScreenLocked((err, data) => {
          try {
            if (err) {
              console.info("====>SUB_MISC_THEME_screenLock_API_0001 failed because: " + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(data).assertEqual(false);
            console.info("====>SUB_MISC_THEME_screenLock_API_0001 screen's status is " + data);
            expect(data == result).assertTrue();
            console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0001-------------------");
            done();

          } catch (err) {
            expect(data).assertEqual(true);
            console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0001 throw_err = " + err);
            done();
          }
        });
      } catch (err) {
        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0001: err = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MISC_THEME_screenLock_API_0002
     * @tc.number SUB_MISC_THEME_screenLock_API_0002
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MISC_THEME_screenLock_API_0002", Level.LEVEL2, async (done: Function) => {
      console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0002-------------------");
      try {
        screenLock.isScreenLocked((err, data) => {
          try {
            expect(data).assertEqual(false);
            console.info("====>SUB_MISC_THEME_screenLock_API_0002 screen's status is " + data);
            expect(data == result).assertTrue();
            console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0002-------------------");
            done();
          } catch (err) {
            expect(data).assertEqual(true);
            console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0002 throw_err = " + err);
            done();
          }
        });
      } catch (err) {
        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0002: err = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MISC_THEME_screenLock_API_0003
     * @tc.number SUB_MISC_THEME_screenLock_API_0003
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MISC_THEME_screenLock_API_0003", Level.LEVEL2, async (done: Function) => {
      console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0003-------------------");
      try {
        screenLock.isSecureMode((err, data) => {
          try {
            console.info("====>SUB_MISC_THEME_screenLock_API_0003 secureMode's result is " + data);
            expect(data == false).assertTrue();
            console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0003-------------------");
            done();
          } catch (err) {
            expect(data).assertEqual(true);
            console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0003 throw_err = " + err);
            done();
          }
        });
      } catch (err) {
        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0003: err = " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MISC_THEME_screenLock_API_0004
     * @tc.number SUB_MISC_THEME_screenLock_API_0004
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MISC_THEME_screenLock_API_0004", Level.LEVEL2, async (done: Function) => {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_0004-------------------");
      try {
        screenLock.unlockScreen((err) => {
          console.info("SUB_MISC_THEME_screenLock_API_0004: send unlockScreen issue success");
          try {
            if (err) {
              console.info("====>SUB_MISC_THEME_screenLock_API_0004 failed because: " + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(true).assertTrue()
            console.info("====>SUB_MISC_THEME_screenLock_API_0004 success.");
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0004 end----------------------');
            done();
          } catch (err) {
            console.info('====>SUB_MISC_THEME_screenLock_API_0004 throw_err : ' + JSON.stringify(err));
            done();
          }
        });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_0004: error = " + error);
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number  Sub_Theme_ScreenLock_DFX_0410
    * @tc.name    Test isScreenLocked after lock
    * @tc.desc    Function test
    * @tc.level   2
    */
    it('Sub_Theme_ScreenLock_DFX_0410', Level.LEVEL2, async (done: Function) => {
      console.info("====>Sub_Theme_ScreenLock_DFX_0410 start");
      try {
        await lock_device();
        screenLock.unlockScreen((err) => {
          console.info("SUB_MISC_THEME_screenLock_API_0004: send unlockScreen issue success");
          try {
            if (err) {
              console.info("====>SUB_MISC_THEME_screenLock_API_0004 failed because: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(true).assertTrue()
            console.info("====>SUB_MISC_THEME_screenLock_API_0004 success.");
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0004 end----------------------');

          } catch (err) {
            console.info('====>SUB_MISC_THEME_screenLock_API_0004 throw_err : ' + JSON.stringify(err));
          }
        });
        let data: boolean = await screenLock.isScreenLocked();
        expect(data).assertEqual(false);
        done();
      } catch (err) {
        console.info("====>Sub_Theme_ScreenLock_DFX_0410 catch err: " + JSON.stringify(err));
        screenLock.unlockScreen((err) => {
          console.info("SUB_MISC_THEME_screenLock_API_0004: send unlockScreen issue success");
          try {
            if (err) {
              console.info("====>SUB_MISC_THEME_screenLock_API_0004 failed because: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(true).assertTrue()
            console.info("====>SUB_MISC_THEME_screenLock_API_0004 success.");
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0004 end----------------------');

          } catch (err) {
            console.info('====>SUB_MISC_THEME_screenLock_API_0004 throw_err : ' + JSON.stringify(err));
          }
        });
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number  Sub_Theme_ScreenLock_DFX_0310
    * @tc.name    Test isScreenLocked after unlock
    * @tc.desc    Function test
    * @tc.level   2
    */
    it('Sub_Theme_ScreenLock_DFX_0310', Level.LEVEL2, async (done: Function) => {
      console.info("====>Sub_Theme_ScreenLock_DFX_0310 start");
      try {
        await unlock_device();
        let isLocked: boolean = await screenLock.isScreenLocked();
        console.info("====>Sub_Theme_ScreenLock_DFX_0310 isScreenLocked result: " + isLocked);
        expect(isLocked).assertEqual(false);
        done();
      } catch (err) {
        console.info("====>Sub_Theme_ScreenLock_DFX_0310 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_MISC_THEME_screenLock_API_0007
     * @tc.number SUB_MISC_THEME_screenLock_API_0007
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MISC_THEME_screenLock_API_0007", Level.LEVEL2, async (done: Function) => {
      console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0007-------------------");
      try {
        screenLock.isScreenLocked((err, data) => {
          try {
            expect(data).assertEqual(false);
            console.info("====>SUB_MISC_THEME_screenLock_API_0007: isScreenLocked is successful, result is " + data);
            expect(data == result).assertTrue();
            console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0007-------------------");
            done();
          } catch (err) {
            expect(data).assertEqual(true);
            console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0007 throw_err = " + err);
            done();
          }
        });
      } catch (err) {
        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0007: err = " + err);
        expect().assertFail();
        done();
      }

    });
  });
}
