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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import systemRouter from '@system.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function RouterSupplementTest() {
  describe('RouterSupplementTest', () => {
    beforeEach(async (done: () => void) => {
      console.info("RouterSupplementTest beforeEach start");
      try {
        router.clear();
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("RouterSupplementTest beforeEach clear error:" + err);
      }
      console.info("RouterSupplementTest beforeEach end");
      done();
    });

    afterEach(async () => {
      try {
        router.clear();
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error("RouterSupplementTest afterEach clear error:" + err);
      }
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushUrl_0100
     * @tc.number SUB_ArkUI_Router_PushUrl_0100
     * @tc.desc   Test router.pushUrl with RouterMode and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushUrl_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushUrl_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      router.pushUrl(options, router.RouterMode.Standard, (err: Error) => {
        if (err) {
          console.error('SUB_ArkUI_Router_PushUrl_0100 pushUrl callback error:' + err.message);
          expect(false).assertTrue();
        } else {
          console.info('SUB_ArkUI_Router_PushUrl_0100 pushUrl callback success');
          let state = router.getState();
          expect(state.name).assertEqual('GetStateByIndexPage');
        }
        done();
      });
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushUrl_0200
     * @tc.number SUB_ArkUI_Router_PushUrl_0200
     * @tc.desc   Test router.pushUrl with RouterMode.Single and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushUrl_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushUrl_0200 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/PushNameRouterPage'
      };
      router.pushUrl(options, router.RouterMode.Single, (err: Error) => {
        if (err) {
          console.error('SUB_ArkUI_Router_PushUrl_0200 pushUrl callback error:' + err.message);
          expect(false).assertTrue();
        } else {
          console.info('SUB_ArkUI_Router_PushUrl_0200 pushUrl callback success');
          let state = router.getState();
          expect(state.name).assertEqual('PushNameRouterPage');
        }
        done();
      });
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ReplaceUrl_0100
     * @tc.number SUB_ArkUI_Router_ReplaceUrl_0100
     * @tc.desc   Test router.replaceUrl with recoverable field in params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ReplaceUrl_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ReplaceUrl_0100 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('SUB_ArkUI_Router_ReplaceUrl_0100 pushUrl error:' + err);
      }
      let replaceOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/PushNameRouterPage',
        params: {
          data1: 'test',
          recoverable: false
        }
      };
      try {
        await router.replaceUrl(replaceOptions);
        await CommonFunc.sleep(1000);
        console.info('SUB_ArkUI_Router_ReplaceUrl_0100 replaceUrl success');
        let state = router.getState();
        expect(state.name).assertEqual('PushNameRouterPage');
      } catch (err) {
        console.error('SUB_ArkUI_Router_ReplaceUrl_0100 replaceUrl error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ReplaceUrl_0200
     * @tc.number SUB_ArkUI_Router_ReplaceUrl_0200
     * @tc.desc   Test router.replaceUrl with recoverable true in params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ReplaceUrl_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ReplaceUrl_0200 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('SUB_ArkUI_Router_ReplaceUrl_0200 pushUrl error:' + err);
      }
      let replaceOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/RouterPageUpdatePage',
        params: {
          data1: 'recoverable',
          recoverable: true
        }
      };
      try {
        await router.replaceUrl(replaceOptions);
        await CommonFunc.sleep(1000);
        console.info('SUB_ArkUI_Router_ReplaceUrl_0200 replaceUrl success');
        let state = router.getState();
        expect(state.name).assertEqual('RouterPageUpdatePage');
      } catch (err) {
        console.error('SUB_ArkUI_Router_ReplaceUrl_0200 replaceUrl error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_GetStateByUrl_0100
     * @tc.number SUB_ArkUI_Router_GetStateByUrl_0100
     * @tc.desc   Test router.getStateByUrl with valid url returns array with items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_GetStateByUrl_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_GetStateByUrl_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        let states: router.RouterState[] = router.getStateByUrl('MainAbility/pages/UIObserver/GetStateByIndexPage');
        console.info('SUB_ArkUI_Router_GetStateByUrl_0100 states length:' + states.length);
        expect(states.length > 0).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_Router_GetStateByUrl_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_GetStateByUrl_0200
     * @tc.number SUB_ArkUI_Router_GetStateByUrl_0200
     * @tc.desc   Test router.getStateByUrl with empty string returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_GetStateByUrl_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_GetStateByUrl_0200 START');
      try {
        let states: router.RouterState[] = router.getStateByUrl('');
        console.info('SUB_ArkUI_Router_GetStateByUrl_0200 states length:' + states.length);
        expect(states.length === 0).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_Router_GetStateByUrl_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100
     * @tc.number SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100
     * @tc.desc   Test router.enableAlertBeforeBackPage with message param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        router.enableAlertBeforeBackPage({
          message: 'Confirm to exit?'
        });
        console.info('SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100 enable success');
      } catch (err) {
        console.error('SUB_ArkUI_Router_EnableAlertBeforeBackPage_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100
     * @tc.number SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100
     * @tc.desc   Test router.showAlertBeforeBackPage with message param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        router.showAlertBeforeBackPage({
          message: 'Are you sure you want to go back?'
        });
        console.info('SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100 showAlert success');
      } catch (err) {
        console.error('SUB_ArkUI_Router_ShowAlertBeforeBackPage_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100
     * @tc.number SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100
     * @tc.desc   Test router.disableAlertBeforeBackPage after enabling alert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        router.enableAlertBeforeBackPage({
          message: 'Confirm to exit?'
        });
        await CommonFunc.sleep(500);
        router.disableAlertBeforeBackPage();
        console.info('SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100 disable success');
      } catch (err) {
        console.error('SUB_ArkUI_Router_DisableAlertBeforeBackPage_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_GetParams_0100
     * @tc.number SUB_ArkUI_Router_GetParams_0100
     * @tc.desc   Test router.getParams returns undefined when no params passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_GetParams_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_GetParams_0100 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        let params = router.getParams();
        console.info('SUB_ArkUI_Router_GetParams_0100 params:' + JSON.stringify(params));
        expect(params).assertEqual(undefined);
      } catch (err) {
        console.error('SUB_ArkUI_Router_GetParams_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_GetParams_0200
     * @tc.number SUB_ArkUI_Router_GetParams_0200
     * @tc.desc   Test router.getParams returns params when params passed via pushUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_GetParams_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_GetParams_0200 START');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage',
        params: {
          key1: 'value1',
          key2: 123
        }
      };
      try {
        await router.pushUrl(options);
        await CommonFunc.sleep(1000);
        let params = router.getParams();
        console.info('SUB_ArkUI_Router_GetParams_0200 params:' + JSON.stringify(params));
        expect(params !== undefined && params !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_Router_GetParams_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushNamedRoute_0100
     * @tc.number SUB_ArkUI_Router_PushNamedRoute_0100
     * @tc.desc   Test router.pushNamedRoute with callback overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushNamedRoute_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushNamedRoute_0100 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        router.pushNamedRoute(namedOptions, (err: Error) => {
          if (err) {
            console.info('SUB_ArkUI_Router_PushNamedRoute_0100 expected error for non-existent route:' + err.message);
            expect(err !== undefined && err !== null).assertTrue();
          } else {
            console.info('SUB_ArkUI_Router_PushNamedRoute_0100 unexpected success');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info('SUB_ArkUI_Router_PushNamedRoute_0100 catch error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushNamedRoute_0200
     * @tc.number SUB_ArkUI_Router_PushNamedRoute_0200
     * @tc.desc   Test router.pushNamedRoute promise overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushNamedRoute_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushNamedRoute_0200 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        await router.pushNamedRoute(namedOptions);
        console.info('SUB_ArkUI_Router_PushNamedRoute_0200 unexpected success');
        expect(false).assertTrue();
      } catch (err) {
        console.info('SUB_ArkUI_Router_PushNamedRoute_0200 expected error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushNamedRoute_0300
     * @tc.number SUB_ArkUI_Router_PushNamedRoute_0300
     * @tc.desc   Test router.pushNamedRoute with RouterMode and callback overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushNamedRoute_0300', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushNamedRoute_0300 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        router.pushNamedRoute(namedOptions, router.RouterMode.Standard, (err: Error) => {
          if (err) {
            console.info('SUB_ArkUI_Router_PushNamedRoute_0300 expected error for non-existent route:' + err.message);
            expect(err !== undefined && err !== null).assertTrue();
          } else {
            console.info('SUB_ArkUI_Router_PushNamedRoute_0300 unexpected success');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info('SUB_ArkUI_Router_PushNamedRoute_0300 catch error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_ArkUI_Router_PushNamedRoute_0400
     * @tc.number SUB_ArkUI_Router_PushNamedRoute_0400
     * @tc.desc   Test router.pushNamedRoute with RouterMode promise overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_PushNamedRoute_0400', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_PushNamedRoute_0400 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        await router.pushNamedRoute(namedOptions, router.RouterMode.Standard);
        console.info('SUB_ArkUI_Router_PushNamedRoute_0400 unexpected success');
        expect(false).assertTrue();
      } catch (err) {
        console.info('SUB_ArkUI_Router_PushNamedRoute_0400 expected error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ReplaceNamedRoute_0100
     * @tc.number SUB_ArkUI_Router_ReplaceNamedRoute_0100
     * @tc.desc   Test router.replaceNamedRoute with callback overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ReplaceNamedRoute_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0100 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        router.replaceNamedRoute(namedOptions, (err: Error) => {
          if (err) {
            console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0100 expected error for non-existent route:' + err.message);
            expect(err !== undefined && err !== null).assertTrue();
          } else {
            console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0100 unexpected success');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0100 catch error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ReplaceNamedRoute_0200
     * @tc.number SUB_ArkUI_Router_ReplaceNamedRoute_0200
     * @tc.desc   Test router.replaceNamedRoute promise overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ReplaceNamedRoute_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0200 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        await router.replaceNamedRoute(namedOptions);
        console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0200 unexpected success');
        expect(false).assertTrue();
      } catch (err) {
        console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0200 expected error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_Router_ReplaceNamedRoute_0300
     * @tc.number SUB_ArkUI_Router_ReplaceNamedRoute_0300
     * @tc.desc   Test router.replaceNamedRoute with RouterMode promise overload
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_Router_ReplaceNamedRoute_0300', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0300 START');
      let namedOptions: router.NamedRouterOptions = {
        name: 'nonExistentRoute',
        params: {
          data1: 'test'
        }
      };
      try {
        await router.replaceNamedRoute(namedOptions, router.RouterMode.Standard);
        console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0300 unexpected success');
        expect(false).assertTrue();
      } catch (err) {
        console.info('SUB_ArkUI_Router_ReplaceNamedRoute_0300 expected error for non-existent route:' + err);
        expect(err !== undefined && err !== null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_Back_0100
     * @tc.number SUB_ArkUI_SysRouter_Back_0100
     * @tc.desc   Test system.router.back with url option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_Back_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_Back_0100 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        let pushOptions2: router.RouterOptions = {
          url: 'MainAbility/pages/UIObserver/PushNameRouterPage'
        };
        await router.pushUrl(pushOptions2);
        await CommonFunc.sleep(1000);
        systemRouter.back({ uri: 'MainAbility/pages/UIObserver/GetStateByIndexPage' });
        await CommonFunc.sleep(1000);
        let state = router.getState();
        console.info('SUB_ArkUI_SysRouter_Back_0100 state name:' + state.name);
        expect(state.name).assertEqual('GetStateByIndexPage');
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_Back_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_GetParams_0100
     * @tc.number SUB_ArkUI_SysRouter_GetParams_0100
     * @tc.desc   Test system.router.getParams returns empty when no params passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_GetParams_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_GetParams_0100 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        let params = systemRouter.getParams();
        console.info('SUB_ArkUI_SysRouter_GetParams_0100 params:' + JSON.stringify(params));
        expect(params === null || params === undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_GetParams_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_GetParams_0200
     * @tc.number SUB_ArkUI_SysRouter_GetParams_0200
     * @tc.desc   Test system.router.getParams returns params when passed via pushUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_GetParams_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_GetParams_0200 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage',
        params: {
          key1: 'sysRouterValue',
          key2: 456
        }
      };
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        let params = systemRouter.getParams();
        console.info('SUB_ArkUI_SysRouter_GetParams_0200 params:' + JSON.stringify(params));
        expect(params !== undefined && params !== null).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_GetParams_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100
     * @tc.number SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100
     * @tc.desc   Test system.router.enableAlertBeforeBackPage with message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        systemRouter.enableAlertBeforeBackPage({
          message: 'System router: confirm exit?'
        });
        console.info('SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100 enable success');
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_EnableAlertBeforeBackPage_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100
     * @tc.number SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100
     * @tc.desc   Test system.router.disableAlertBeforeBackPage after enabling alert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        systemRouter.enableAlertBeforeBackPage({
          message: 'System router: confirm exit?'
        });
        await CommonFunc.sleep(500);
        systemRouter.disableAlertBeforeBackPage();
        console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100 disable success');
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200
     * @tc.number SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200
     * @tc.desc   Test system.router.disableAlertBeforeBackPage with options callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 START');
      let pushOptions: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage'
      };
      let noError = true;
      try {
        await router.pushUrl(pushOptions);
        await CommonFunc.sleep(1000);
        systemRouter.enableAlertBeforeBackPage({
          message: 'System router: confirm exit?'
        });
        await CommonFunc.sleep(500);
        systemRouter.disableAlertBeforeBackPage({
          success: () => {
            console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 disable success callback');
          },
          cancel: () => {
            console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 disable cancel callback');
          },
          complete: () => {
            console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 disable complete callback');
          }
        });
        console.info('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 disable called');
      } catch (err) {
        console.error('SUB_ArkUI_SysRouter_DisableAlertBeforeBackPage_0200 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });
  })
}
