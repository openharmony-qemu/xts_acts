'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as session_test from '../ets/session_test';
import {PhotoSession, VideoSession, session_type} from '../ets/session_test';

export default function sessionTypeTest(): void {
  describe("ActsSessionTypeTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Session_TypeGetPhoto_STATIC_0100
     * @tc.name      test_getSession_photo
     * @tc.desc      Test getSession(1) returns PhotoSession instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_getSession_photo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_getSession_photo start');
      let ps: session_type = session_test.getSession(1);
      expect(ps instanceof PhotoSession).assertTrue();
      console.log('test_getSession_photo done');
      done();
      console.log('test_getSession_photo end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypeGetVideo_STATIC_0200
     * @tc.name      test_getSession_video
     * @tc.desc      Test getSession(0) returns VideoSession instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_getSession_video", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_getSession_video start');
      let vs: session_type = session_test.getSession(0);
      expect(vs instanceof VideoSession).assertTrue();
      console.log('test_getSession_video done');
      done();
      console.log('test_getSession_video end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypePhotoBeginconfig_STATIC_0300
     * @tc.name      test_photoSession_beginConfig
     * @tc.desc      Test PhotoSession.beginConfig() succeeds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_photoSession_beginConfig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_photoSession_beginConfig start');
      let ps = session_test.getSession(1);
      let caught: boolean = true;
      try {
        if (ps instanceof PhotoSession) {
          ps.beginConfig();
        }
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_photoSession_beginConfig done');
      done();
      console.log('test_photoSession_beginConfig end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypePhotoCanpreconfig_STATIC_0400
     * @tc.name      test_photoSession_canPreconfig
     * @tc.desc      Test PhotoSession.canPreconfig() returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_photoSession_canPreconfig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_photoSession_canPreconfig start');
      let ps = session_test.getSession(1);
      if (ps instanceof PhotoSession) {
      let result: boolean = ps.canPreconfig();
      expect(result).assertTrue();
      }
      console.log('test_photoSession_canPreconfig done');
      done();
      console.log('test_photoSession_canPreconfig end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypePhotoFuncA_STATIC_0500
     * @tc.name      test_photoSession_func_a
     * @tc.desc      Test PhotoSession.func_a() returns "psa"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_photoSession_func_a", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_photoSession_func_a start');
      let ps = session_test.getSession(1);
      if (ps instanceof PhotoSession) {
      let result: string = ps.func_a();
      expect(result).assertEqual("psa");
      }
      console.log('test_photoSession_func_a done');
      done();
      console.log('test_photoSession_func_a end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypePhotoFuncC_STATIC_0600
     * @tc.name      test_photoSession_func_c
     * @tc.desc      Test PhotoSession.func_c() returns "psc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_photoSession_func_c", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_photoSession_func_c start');
      let ps = session_test.getSession(1);
      if (ps instanceof PhotoSession) {
      let result: string = ps.func_c();
      expect(result).assertEqual("psc");
      }
      console.log('test_photoSession_func_c done');
      done();
      console.log('test_photoSession_func_c end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypeVideoBeginconfig_STATIC_0700
     * @tc.name      test_videoSession_beginConfig
     * @tc.desc      Test VideoSession.beginConfig() succeeds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_videoSession_beginConfig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_videoSession_beginConfig start');
      let vs = session_test.getSession(0);
      let caught: boolean = true;
      try {
        if (vs instanceof VideoSession) {
          vs.beginConfig();
        }
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_videoSession_beginConfig done');
      done();
      console.log('test_videoSession_beginConfig end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypeVideoCanpreconfig_STATIC_0800
     * @tc.name      test_videoSession_canPreconfig
     * @tc.desc      Test VideoSession.canPreconfig() returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_videoSession_canPreconfig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_videoSession_canPreconfig start');
      let vs = session_test.getSession(0);
      if (vs instanceof VideoSession) {
      let result: boolean = vs.canPreconfig();
      expect(result).assertTrue();
      }
      console.log('test_videoSession_canPreconfig done');
      done();
      console.log('test_videoSession_canPreconfig end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypeVideoFuncA_STATIC_0900
     * @tc.name      test_videoSession_func_a
     * @tc.desc      Test VideoSession.func_a() returns "vsa"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_videoSession_func_a", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_videoSession_func_a start');
      let vs = session_test.getSession(0);
      if (vs instanceof VideoSession) {
      let result: string = vs.func_a();
      expect(result).assertEqual("vsa");
      }
      console.log('test_videoSession_func_a done');
      done();
      console.log('test_videoSession_func_a end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_TypeVideoFuncC_STATIC_1000
     * @tc.name      test_videoSession_func_c
     * @tc.desc      Test VideoSession.func_c() returns "vsc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_videoSession_func_c", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_videoSession_func_c start');
      let vs = session_test.getSession(0);
      if (vs instanceof VideoSession) {
      let result: string = vs.func_c();
      expect(result).assertEqual("vsc");
      }
      console.log('test_videoSession_func_c done');
      done();
      console.log('test_videoSession_func_c end');

    });
  });
}