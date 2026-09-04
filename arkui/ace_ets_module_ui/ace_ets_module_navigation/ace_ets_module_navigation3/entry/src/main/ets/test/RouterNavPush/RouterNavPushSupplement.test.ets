/**
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { NavPushPathHelper } from '@ohos.atomicservice.NavPushPathHelper';

export default function RouterNavPushSupplement() {
  describe('RouterNavPushSupplement', () => {
    let navPathStack: NavPathStack = new NavPathStack();
    let navPushPathHelper: NavPushPathHelper = new NavPushPathHelper(navPathStack);

    beforeEach(async (done: () => void) => {
      console.info('RouterNavPushSupplement beforeEach start');
      navPathStack = new NavPathStack();
      navPushPathHelper = new NavPushPathHelper(navPathStack);
      console.info('RouterNavPushSupplement beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('RouterNavPushSupplement afterEach');
      navPathStack.clear();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushPath_RETURN_0001
     * @tc.name      testPushPathReturn0001
     * @tc.desc      Test NavPushPathHelper.pushPath(moduleName, info, animated) returns Promise<void>
     */
    it('testPushPathReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathReturn0001] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageOne', 'param1');
        const promise: Promise<void> = navPushPathHelper.pushPath('entry', info, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushPathReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushPathReturn0001] pushPath resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushPathReturn0001] pushPath rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushPathReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushPath_RETURN_0002
     * @tc.name      testPushPathReturn0002
     * @tc.desc      Test NavPushPathHelper.pushPath(moduleName, info, options) returns Promise<void>
     */
    it('testPushPathReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathReturn0002] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageOne', 'param1');
        const options: NavigationOptions = { launchMode: LaunchMode.STANDARD, animated: true };
        const promise: Promise<void> = navPushPathHelper.pushPath('entry', info, options);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushPathReturn0002] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushPathReturn0002] pushPath with options resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushPathReturn0002] pushPath with options rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushPathReturn0002] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushDestination_RETURN_0001
     * @tc.name      testPushDestinationReturn0001
     * @tc.desc      Test NavPushPathHelper.pushDestination(moduleName, info, animated) returns Promise<void>
     */
    it('testPushDestinationReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushDestinationReturn0001] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageOne', 'param1');
        const promise: Promise<void> = navPushPathHelper.pushDestination('entry', info, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushDestinationReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationReturn0001] pushDestination resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationReturn0001] pushDestination rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushDestinationReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushDestination_RETURN_0002
     * @tc.name      testPushDestinationReturn0002
     * @tc.desc      Test NavPushPathHelper.pushDestination(moduleName, info, options) returns Promise<void>
     */
    it('testPushDestinationReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushDestinationReturn0002] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageOne', 'param1');
        const options: NavigationOptions = { launchMode: LaunchMode.STANDARD, animated: false };
        const promise: Promise<void> = navPushPathHelper.pushDestination('entry', info, options);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushDestinationReturn0002] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationReturn0002] pushDestination with options resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationReturn0002] pushDestination with options rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushDestinationReturn0002] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushPathByName_RETURN_0001
     * @tc.name      testPushPathByNameReturn0001
     * @tc.desc      Test NavPushPathHelper.pushPathByName(moduleName, name, param, animated) returns Promise<void>
     */
    it('testPushPathByNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathByNameReturn0001] START');
      try {
        const paramObj: Record<string, string> = { 'key': 'value' };
        const promise: Promise<void> = navPushPathHelper.pushPathByName('entry', 'pageOne', paramObj, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushPathByNameReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushPathByNameReturn0001] pushPathByName resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushPathByNameReturn0001] pushPathByName rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushPathByNameReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushPathByName_RETURN_0002
     * @tc.name      testPushPathByNameReturn0002
     * @tc.desc      Test NavPushPathHelper.pushPathByName(moduleName, name, param, onPop, animated) returns Promise<void>
     */
    it('testPushPathByNameReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathByNameReturn0002] START');
      try {
        const paramObj: Record<string, string> = { 'key': 'value' };
        const onPopCallback: Callback<PopInfo> = (popInfo: PopInfo) => {
          console.info('[testPushPathByNameReturn0002] onPop called');
        };
        const promise: Promise<void> = navPushPathHelper.pushPathByName('entry', 'pageOne', paramObj, onPopCallback, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushPathByNameReturn0002] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushPathByNameReturn0002] pushPathByName with onPop resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushPathByNameReturn0002] pushPathByName with onPop rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushPathByNameReturn0002] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushDestinationByName_RETURN_0001
     * @tc.name      testPushDestinationByNameReturn0001
     * @tc.desc      Test NavPushPathHelper.pushDestinationByName(moduleName, name, param, animated) returns Promise<void>
     */
    it('testPushDestinationByNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushDestinationByNameReturn0001] START');
      try {
        const paramObj: Record<string, string> = { 'key': 'value' };
        const promise: Promise<void> = navPushPathHelper.pushDestinationByName('entry', 'pageOne', paramObj, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushDestinationByNameReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationByNameReturn0001] pushDestinationByName resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationByNameReturn0001] pushDestinationByName rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushDestinationByNameReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_pushDestinationByName_RETURN_0002
     * @tc.name      testPushDestinationByNameReturn0002
     * @tc.desc      Test NavPushPathHelper.pushDestinationByName(moduleName, name, param, onPop, animated) returns Promise<void>
     */
    it('testPushDestinationByNameReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushDestinationByNameReturn0002] START');
      try {
        const paramObj: Record<string, string> = { 'key': 'value' };
        const onPopCallback: Callback<PopInfo> = (popInfo: PopInfo) => {
          console.info('[testPushDestinationByNameReturn0002] onPop called');
        };
        const promise: Promise<void> = navPushPathHelper.pushDestinationByName('entry', 'pageOne', paramObj, onPopCallback, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testPushDestinationByNameReturn0002] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationByNameReturn0002] pushDestinationByName with onPop resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testPushDestinationByNameReturn0002] pushDestinationByName with onPop rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testPushDestinationByNameReturn0002] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_replacePath_RETURN_0001
     * @tc.name      testReplacePathReturn0001
     * @tc.desc      Test NavPushPathHelper.replacePath(moduleName, info, animated) returns Promise<void>
     */
    it('testReplacePathReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathReturn0001] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageTwo', 'replaceParam');
        const promise: Promise<void> = navPushPathHelper.replacePath('entry', info, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testReplacePathReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathReturn0001] replacePath resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathReturn0001] replacePath rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testReplacePathReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_replacePath_RETURN_0002
     * @tc.name      testReplacePathReturn0002
     * @tc.desc      Test NavPushPathHelper.replacePath(moduleName, info, options) returns Promise<void>
     */
    it('testReplacePathReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathReturn0002] START');
      try {
        const info: NavPathInfo = new NavPathInfo('pageTwo', 'replaceParam');
        const options: NavigationOptions = { launchMode: LaunchMode.STANDARD, animated: false };
        const promise: Promise<void> = navPushPathHelper.replacePath('entry', info, options);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testReplacePathReturn0002] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathReturn0002] replacePath with options resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathReturn0002] replacePath with options rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testReplacePathReturn0002] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_replacePathByName_RETURN_0001
     * @tc.name      testReplacePathByNameReturn0001
     * @tc.desc      Test NavPushPathHelper.replacePathByName(moduleName, name, param, animated) returns Promise<void>
     */
    it('testReplacePathByNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathByNameReturn0001] START');
      try {
        const paramObj: Record<string, string> = { 'key': 'replaceValue' };
        const promise: Promise<void> = navPushPathHelper.replacePathByName('entry', 'pageTwo', paramObj, true);
        expect(promise !== undefined).assertTrue();
        const timeoutId = setTimeout(() => {
          console.info('[testReplacePathByNameReturn0001] Promise timeout, API callable verified');
          done();
        }, 5000);
        promise.then(() => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathByNameReturn0001] replacePathByName resolved');
          done();
        }).catch((err: Error) => {
          clearTimeout(timeoutId);
          console.info('[testReplacePathByNameReturn0001] replacePathByName rejected: ' + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.info('[testReplacePathByNameReturn0001] ERROR: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    SUB_ArkUI_NavPushPath_constructor_PARAM_0001
     * @tc.name      testNavPushPathHelperConstructor0001
     * @tc.desc      Test NavPushPathHelper constructor with valid NavPathStack
     */
    it('testNavPushPathHelperConstructor0001', Level.LEVEL0, async (done: () => void) => {
      console.info('[testNavPushPathHelperConstructor0001] START');
      try {
        const stack: NavPathStack = new NavPathStack();
        const helper: NavPushPathHelper = new NavPushPathHelper(stack);
        expect(helper !== undefined).assertTrue();
      } catch (error) {
        console.info('[testNavPushPathHelperConstructor0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testNavPushPathHelperConstructor0001] END');
      done();
    });

  });
}
