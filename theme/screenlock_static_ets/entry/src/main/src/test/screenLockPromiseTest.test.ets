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
import screenLock from '@ohos.screenLock';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";


export default function ScreenLockPromiseTest(){
  describe('ScreenLockServicePromiseTest', () => {
    console.info("-----------------------ScreenlockPromiseTest is starting-----------------------");

    let result = false
    beforeEach(async (done: () => void) => {
        result = await screenLock.isScreenLocked();
        done();
    });   

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_Static_001
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_Static_001", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_Static_001-------------------");
      try {
        let data = await screenLock.isScreenLocked();
        console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_001 isScreenLocked result is " + data);
        expect(data == result).assertTrue()
        console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_Static_001-------------------");
        done();
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_001 test_setScreenLocked : error = " + error);
        expect().assertFail();
        done();
      }
      
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_Static_002
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_Static_002", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_Static_002-------------------");
      try {
        let data = await screenLock.isScreenLocked();
        console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_002 isScreenLocked result is " + data);
        expect(data == result).assertTrue()
        console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_Static_002-------------------");
        done();
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_002 test_setScreenLocked : error = " + error);
        expect().assertFail();
        done();
      }
      
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_Static_003
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_Static_003", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_Static_003-------------------");
      try {
        screenLock.isSecureMode((err, data) => {
          try{
              console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_003 isScreenLocked result is " + data);
              expect(data == false).assertTrue()
              console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_Static_003-------------------");
              done();
          }catch(err){
              expect(data).assertEqual(true);
              console.info("====>logMessage SUB_MISC_THEME_screenLock_API_Promise_Static_003 throw_err = " + err);
              done();
          }                    
      });
      } catch (error) {
        console.info("SUB_MISC_THEME_screenLock_API_Promise_Static_003 isScreenLocked TRUE: error = " + error);
        expect().assertFail();
        done();
      }      
    });

    /*
     * @tc.number    SUB_MISC_THEME_screenLock_API_Promise_Static_004
     * @tc.name      Set to locked screen, query the lock screen state is locked state
     * @tc.desc      Test ScreenLock API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MISC_THEME_screenLock_API_Promise_Static_004", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_THEME_screenLock_API_Promise_Static_004-------------------");
      try {
        await screenLock.unlockScreen();
        console.info("====>SUB_MISC_THEME_screenLock_API_Promise_Static_004 success.");
        expect(true).assertTrue()
        console.info('====>-------------SUB_MISC_THEME_screenLock_API_Promise_Static_004 end----------------------');
        done();
      } catch (error) {
        console.info("====>SUB_MISC_THEME_screenLock_API_Promise_Static_004: error = " + error);
        expect().assertFail();
        done();
      }
      console.info("------------------end SUB_MISC_THEME_screenLock_API_Promise_Static_004-------------------");
    });
  })
}
