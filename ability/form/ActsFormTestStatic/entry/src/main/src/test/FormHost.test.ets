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

import { describe, afterEach, beforeAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import formInfo from '@ohos.app.form.formInfo';
import formHost from '@ohos.app.form.formHost';
import { EventIdMap, FormHostTestController } from '../../ets/testform/controller/FormHostTestController';
import Utils from './Util.test';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const EXPECTED_FALSE = '{"isSuccess":false}';
const EXPECTED_TRUE = '{"isSuccess":true}';
const BOOL_TRUE = true;

export default function formHostTest() {
  describe('formHostTest', () => {
    hilog.info(DOMAIN, TAG, 'formHostTest describe start');
    let formHostTestController = new FormHostTestController();

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'Before all, open the test page');
      Utils.startAbility(
        'TestFormAbility',
        'com.example.actsformtest.static',
        'testform/pages/XtsFormHost',
      )
      await Utils.msSleep(3000); // wait for page to open, and register events, create formComponents.
    })

    afterEach(async () => {
      await Utils.msSleep(200);
    })

    /**
     * @tc.name   FormHostStaticTest001
     * @tc.number FormHostStaticTest001
     * @tc.desc   "function on(type: 'formOverflow', callback: Callback<formInfo.OverflowRequest>): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest001 start');

      let callback = (data: formInfo.OverflowRequest) => {
        hilog.info(0x0000, 'testTag', `OverflowRequest, data: ${JSON.stringify(data)}`);
        hilog.info(0x0000, 'testTag', `OverflowRequest, data.formId: ${data.formId}`);
        hilog.info(0x0000, 'testTag', `OverflowRequest, data.isOverflow: ${data.isOverflow}`);
        hilog.info(0x0000, 'testTag', `OverflowRequest, data.overflowInfo: ${data.overflowInfo}`);
        expect().assertFail();
        done();
      }

      try {
        formHost.onFormOverflow(callback);
        hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow success');
        expect().assertFail();
        done();
      } catch (error: BusinessError) {
        hilog.error(0x0000, 'testTag EntryFormAbility', 'formOverflow catch error');
        expect(error?.code).assertEqual(202);
        done();
      }

      hilog.info(DOMAIN, TAG, 'FormHostStaticTest001 end');
    })

    /**
     * @tc.name   FormHostStaticTest002
     * @tc.number FormHostStaticTest002
     * @tc.desc   function off(type: 'formOverflow', callback?: Callback<formInfo.OverflowRequest>): void;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest002 start');

      let callback = (data: formInfo.OverflowRequest) => {
        hilog.info(0x0000, 'testTag', `OverflowRequest, data: ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      }

      try {
        formHost.offFormOverflow(callback);
        hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow success');
        expect().assertFail();
        done();
      } catch (error: BusinessError) {
        hilog.error(0x0000, 'testTag EntryFormAbility', 'formOverflow catch error');
        expect(error?.code).assertEqual(202);
        done();
      }

      hilog.info(DOMAIN, TAG, 'FormHostStaticTest002 end');
    })

    /**
     * @tc.name   FormHostStaticTest003
     * @tc.number FormHostStaticTest003
     * @tc.desc   "function on(type: 'changeSceneAnimationState', callback: Callback<formInfo.ChangeSceneAnimationStateRequest>): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest003 start');

      let callback = (data: formInfo.ChangeSceneAnimationStateRequest) => {
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data: ${JSON.stringify(data)}`);
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data.formId: ${data.formId}`);
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data.state: ${data.state}`);
        expect().assertFail();
        done();
      }

      try {
        formHost.onChangeSceneAnimationState(callback);
        hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState success');
        expect().assertFail();
        done();
      } catch (error: BusinessError) {
        hilog.error(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState catch error');
        expect(error?.code).assertEqual(202);
        done();
      }

      hilog.info(DOMAIN, TAG, 'FormHostStaticTest003 end');
    })

    /**
     * @tc.name   FormHostStaticTest004
     * @tc.number FormHostStaticTest004
     * @tc.desc   "function off(type: 'changeSceneAnimationState', callback?: Callback<formInfo.ChangeSceneAnimationStateRequest>): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest004 start');

      let callback = (data: formInfo.ChangeSceneAnimationStateRequest) => {
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data: ${JSON.stringify(data)}`);
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data.formId: ${data.formId}`);
        hilog.info(0x0000, 'testTag', `ChangeSceneAnimationStateRequest, data.state: ${data.state}`);
        expect().assertFail();
        done();
      }

      try {
        formHost.offChangeSceneAnimationState(callback);
        hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState success');
        expect().assertFail();
        done();
      } catch (error: BusinessError) {
        hilog.error(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState catch error');
        expect(error?.code).assertEqual(202);
        done();
      }

      hilog.info(DOMAIN, TAG, 'FormHostStaticTest004 end');
    })

    /**
     * @tc.name   FormHostStaticTest005
     * @tc.number FormHostStaticTest005
     * @tc.desc   "function onGetFormRect(callback: formInfo.GetFormRectInfoCallback): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest005 start');

      let callGetFormRect: formInfo.GetFormRectInfoCallback = (formId: string): Promise<formInfo.Rect> => {
        hilog.info(0x0000, 'testTag', `cbGetFormRect a new form`);
        return new Promise<formInfo.Rect>((resolve: (rect: formInfo.Rect) => void, reject: (rect: formInfo.Rect) => void): void => {
          hilog.info(0x0000, 'testTag', `cbGetFormRect Promise called`);
          let rect1: formInfo.Rect = {
            left: 1.0,
            top: 1.2,
            width: 1.3,
            height: 1.4
          }
        });
      }

      try {
        formHost.onGetFormRect(callGetFormRect);
        hilog.info(0x0000, 'testTag EntryFormAbility', 'getFormRect success');
        expect().assertFail();
        done();
      } catch (error: Error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        hilog.error(0x0000, 'testTag EntryFormAbility', 'getFormRect catch error');
        expect(code).assertEqual(202);
        done();
      }

      hilog.info(DOMAIN, TAG, 'FormHostStaticTest005 end');
    })

    /**
     * @tc.name   FormHostStaticTest006
     * @tc.number FormHostStaticTest006
     * @tc.desc   "function offGetFormRect(callback?: formInfo.GetFormRectInfoCallback): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest006 start');
      try {
        formHost.offGetFormRect();
        hilog.info(0x0000, 'testTag EntryFormAbility', 'getFormRect success');
        expect().assertFail();
        done();
      } catch (error: Error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        hilog.error(0x0000, 'testTag EntryFormAbility', 'getFormRect catch error');
        expect(code).assertEqual(202);
        done();
      }
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest006 end');
    })

    /**
     * @tc.number: AddFormWithPromiseStaticTest001
     * @tc.name: AddFormWithPromiseStaticTest001
     * @tc.desc: check AddFormWithPromise
     */
    it("AddFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AddFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AddFormWithPromise);
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: AddFormWithPromiseStaticTest002
     * @tc.name: AddFormWithPromiseStaticTest002
     * @tc.desc: check AddFormWithPromise
     */
    it("AddFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AddFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AddFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'AddFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: DeleteFormWithCallbackStaticTest001
     * @tc.name: DeleteFormWithCallbackStaticTest001
     * @tc.desc: check DeleteFormWithCallback
     */
    it("DeleteFormWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteFormWithCallback);
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: DeleteFormWithCallbackStaticTest002
     * @tc.name: DeleteFormWithCallbackStaticTest002
     * @tc.desc: check DeleteFormWithCallback
     */
    it("DeleteFormWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteFormWithCallback, true);
      hilog.info(DOMAIN, TAG, 'DeleteFormWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: DeleteFormWithPromiseStaticTest001
     * @tc.name: DeleteFormWithPromiseStaticTest001
     * @tc.desc: check DeleteFormWithPromise
     */
    it("DeleteFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteFormWithPromise);
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: DeleteFormWithPromiseStaticTest002
     * @tc.name: DeleteFormWithPromiseStaticTest002
     * @tc.desc: check DeleteFormWithPromise
     */
    it("DeleteFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'DeleteFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: ReleaseFormWithPromiseStaticTest001
     * @tc.name: ReleaseFormWithPromiseStaticTest001
     * @tc.desc: check ReleaseFormWithPromise
     */
    it("ReleaseFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithPromise);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: ReleaseFormWithPromiseStaticTest002
     * @tc.name: ReleaseFormWithPromiseStaticTest002
     * @tc.desc: check ReleaseFormWithPromise
     */
    it("ReleaseFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: ReleaseFormWithCacheCallbackStaticTest001
     * @tc.name: ReleaseFormWithCacheCallbackStaticTest001
     * @tc.desc: check ReleaseFormWithCacheCallback
     */
    it("ReleaseFormWithCacheCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithCacheCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithCacheCallback);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest001 end');
    })

    /**
     * @tc.number: ReleaseFormWithCacheCallbackStaticTest002
     * @tc.name: ReleaseFormWithCacheCallbackStaticTest002
     * @tc.desc: check ReleaseFormWithCacheCallback
     */
    it("ReleaseFormWithCacheCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithCacheCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithCacheCallback, true);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCacheCallbackStaticTest002 end');
    })

    /**
     * @tc.number: ReleaseFormWithCallbackStaticTest001
     * @tc.name: ReleaseFormWithCallbackStaticTest001
     * @tc.desc: check ReleaseFormWithCallback
     */
    it("ReleaseFormWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithCallback);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: ReleaseFormWithCallbackStaticTest002
     * @tc.name: ReleaseFormWithCallbackStaticTest002
     * @tc.desc: check ReleaseFormWithCallback
     */
    it("ReleaseFormWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ReleaseFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ReleaseFormWithCallback, true);
      hilog.info(DOMAIN, TAG, 'ReleaseFormWithCallbackStaticTest002 end');
    })

    /**
    * @tc.number: RequestFormWithPromiseStaticTest001
    * @tc.name: RequestFormWithPromiseStaticTest001
    * @tc.desc: check RequestFormWithPromise
    */
    it("RequestFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithPromise);
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: RequestFormWithPromiseStaticTest002
     * @tc.name: RequestFormWithPromiseStaticTest002
     * @tc.desc: check RequestFormWithPromise
     */
    it("RequestFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'RequestFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: RequestFormWithCallbackStaticTest001
     * @tc.name: RequestFormWithCallbackStaticTest001
     * @tc.desc: check RequestFormWithCallback
     */
    it("RequestFormWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithCallback);
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: RequestFormWithCallbackStaticTest002
     * @tc.name: RequestFormWithCallbackStaticTest002
     * @tc.desc: check RequestFormWithCallback
     */
    it("RequestFormWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithCallback, true);
      hilog.info(DOMAIN, TAG, 'RequestFormWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: RequestFormWithParamsPromiseStaticTest001
     * @tc.name: RequestFormWithParamsPromiseStaticTest001
     * @tc.desc: check RequestFormWithParamsPromise
     */
    it("RequestFormWithParamsPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithParamsPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithParamsPromise);
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest001 end');
    })

    /**
     * @tc.number: RequestFormWithParamsPromiseStaticTest002
     * @tc.name: RequestFormWithParamsPromiseStaticTest002
     * @tc.desc: check RequestFormWithParamsPromise
     */
    it("RequestFormWithParamsPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RequestFormWithParamsPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RequestFormWithParamsPromise, true);
      hilog.info(DOMAIN, TAG, 'RequestFormWithParamsPromiseStaticTest002 end');
    })

    /**
     * @tc.number: CastToNormalFormWithCallbackStaticTest001
     * @tc.name: CastToNormalFormWithCallbackStaticTest001
     * @tc.desc: check CastToNormalFormWithCallback
     */
    it("CastToNormalFormWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.CastToNormalFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.CastToNormalFormWithCallback);
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: CastToNormalFormWithCallbackStaticTest002
     * @tc.name: CastToNormalFormWithCallbackStaticTest002
     * @tc.desc: check CastToNormalFormWithCallback
     */
    it("CastToNormalFormWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.CastToNormalFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.CastToNormalFormWithCallback, true);
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: CastToNormalFormWithPromiseStaticTest001
     * @tc.name: CastToNormalFormWithPromiseStaticTest001
     * @tc.desc: check CastToNormalFormWithPromise
     */
    it("CastToNormalFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.CastToNormalFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.CastToNormalFormWithPromise);
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: CastToNormalFormWithPromiseStaticTest002
     * @tc.name: CastToNormalFormWithPromiseStaticTest002
     * @tc.desc: check CastToNormalFormWithPromise
     */
    it("CastToNormalFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.CastToNormalFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.CastToNormalFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'CastToNormalFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: NotifyVisibleFormsWithPromiseStaticTest001
     * @tc.name: NotifyVisibleFormsWithPromiseStaticTest001
     * @tc.desc: check NotifyVisibleFormsWithPromise
     */
    it("NotifyVisibleFormsWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyVisibleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyVisibleFormsWithPromise);
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest001 end');
    })

    /**
 * @tc.number: NotifyVisibleFormsWithPromiseStaticTest002
 * @tc.name: NotifyVisibleFormsWithPromiseStaticTest002
 * @tc.desc: check NotifyVisibleFormsWithPromise
 */
    it("NotifyVisibleFormsWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyVisibleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyVisibleFormsWithPromise, true);
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithPromiseStaticTest002 end');
    })


    /**
     * @tc.number: NotifyVisibleFormsWithCallbackStaticTest001
     * @tc.name: NotifyVisibleFormsWithCallbackStaticTest001
     * @tc.desc: check NotifyVisibleFormsWithCallback
     */
    it("NotifyVisibleFormsWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyVisibleFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyVisibleFormsWithCallback);
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: NotifyVisibleFormsWithCallbackStaticTest002
     * @tc.name: NotifyVisibleFormsWithCallbackStaticTest002
     * @tc.desc: check NotifyVisibleFormsWithCallback
     */
    it("NotifyVisibleFormsWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyVisibleFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyVisibleFormsWithCallback, true);
      hilog.info(DOMAIN, TAG, 'NotifyVisibleFormsWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: NotifyInvisibleFormsWithPromiseStaticTest001
     * @tc.name: NotifyInvisibleFormsWithPromiseStaticTest001
     * @tc.desc: check NotifyInvisibleFormsWithPromise
     */
    it("NotifyInvisibleFormsWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyInvisibleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyInvisibleFormsWithPromise);
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: NotifyInvisibleFormsWithPromiseStaticTest002
     * @tc.name: NotifyInvisibleFormsWithPromiseStaticTest002
     * @tc.desc: check NotifyInvisibleFormsWithPromise
     */
    it("NotifyInvisibleFormsWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyInvisibleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyInvisibleFormsWithPromise, true);
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: NotifyInvisibleFormsWithCallbackStaticTest001
     * @tc.name: NotifyInvisibleFormsWithCallbackStaticTest001
     * @tc.desc: check NotifyInvisibleFormsWithCallback
     */
    it("NotifyInvisibleFormsWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyInvisibleFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyInvisibleFormsWithCallback);
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: NotifyInvisibleFormsWithCallbackStaticTest002
     * @tc.name: NotifyInvisibleFormsWithCallbackStaticTest002
     * @tc.desc: check NotifyInvisibleFormsWithCallback
     */
    it("NotifyInvisibleFormsWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyInvisibleFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyInvisibleFormsWithCallback, true);
      hilog.info(DOMAIN, TAG, 'NotifyInvisibleFormsWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: EnableFormsUpdateWithCallbackStaticTest001
     * @tc.name: EnableFormsUpdateWithCallbackStaticTest001
     * @tc.desc: check EnableFormsUpdateWithCallback
     */
    it("EnableFormsUpdateWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.EnableFormsUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.EnableFormsUpdateWithCallback);
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: EnableFormsUpdateWithCallbackStaticTest002
     * @tc.name: EnableFormsUpdateWithCallbackStaticTest002
     * @tc.desc: check EnableFormsUpdateWithCallback
     */
    it("EnableFormsUpdateWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.EnableFormsUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.EnableFormsUpdateWithCallback, true);
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: EnableFormsUpdateWithPromiseStaticTest001
     * @tc.name: EnableFormsUpdateWithPromiseStaticTest001
     * @tc.desc: check EnableFormsUpdateWithPromise
     */
    it("EnableFormsUpdateWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.EnableFormsUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.EnableFormsUpdateWithPromise);
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: EnableFormsUpdateWithPromiseStaticTest002
     * @tc.name: EnableFormsUpdateWithPromiseStaticTest002
     * @tc.desc: check EnableFormsUpdateWithPromise
     */
    it("EnableFormsUpdateWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.EnableFormsUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.EnableFormsUpdateWithPromise, true);
      hilog.info(DOMAIN, TAG, 'EnableFormsUpdateWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: DisableFormsUpdateWithPromiseStaticTest001
     * @tc.name: DisableFormsUpdateWithPromiseStaticTest001
     * @tc.desc: check DisableFormsUpdateWithPromise
     */
    it("DisableFormsUpdateWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DisableFormsUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DisableFormsUpdateWithPromise);
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: DisableFormsUpdateWithPromiseStaticTest002
     * @tc.name: DisableFormsUpdateWithPromiseStaticTest002
     * @tc.desc: check DisableFormsUpdateWithPromise
     */
    it("DisableFormsUpdateWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DisableFormsUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DisableFormsUpdateWithPromise, true);
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: DisableFormsUpdateWithCallbackStaticTest001
     * @tc.name: DisableFormsUpdateWithCallbackStaticTest001
     * @tc.desc: check DisableFormsUpdateWithCallback
     */
    it("DisableFormsUpdateWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DisableFormsUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DisableFormsUpdateWithCallback);
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: DisableFormsUpdateWithCallbackStaticTest002
     * @tc.name: DisableFormsUpdateWithCallbackStaticTest002
     * @tc.desc: check DisableFormsUpdateWithCallback
     */
    it("DisableFormsUpdateWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DisableFormsUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DisableFormsUpdateWithCallback, true);
      hilog.info(DOMAIN, TAG, 'DisableFormsUpdateWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: IsSystemReadyWithCallbackStaticTest001
     * @tc.name: IsSystemReadyWithCallbackStaticTest001
     * @tc.desc: check IsSystemReadyWithCallback
     */
    it("IsSystemReadyWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.IsSystemReadyWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.IsSystemReadyWithCallback);
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: IsSystemReadyWithPromiseStaticTest001
     * @tc.name: IsSystemReadyWithPromiseStaticTest001
     * @tc.desc: check IsSystemReadyWithPromise
     */
    it("IsSystemReadyWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.IsSystemReadyWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.IsSystemReadyWithPromise);
      hilog.info(DOMAIN, TAG, 'IsSystemReadyWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: GetAllFormsInfoWithPromiseStaticTest001
     * @tc.name: GetAllFormsInfoWithPromiseStaticTest001
     * @tc.desc: check GetAllFormsInfoWithPromise
     */
    it("GetAllFormsInfoWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetAllFormsInfoWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetAllFormsInfoWithPromise);
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: GetAllFormsInfoWithCallbackStaticTest001
     * @tc.name: GetAllFormsInfoWithCallbackStaticTest001
     * @tc.desc: check GetAllFormsInfoWithCallback
     */
    it("GetAllFormsInfoWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetAllFormsInfoWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetAllFormsInfoWithCallback);
      hilog.info(DOMAIN, TAG, 'GetAllFormsInfoWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: GetFormsInfoWithFilterPromiseStaticTest001
     * @tc.name: GetFormsInfoWithFilterPromiseStaticTest001
     * @tc.desc: check GetFormsInfoWithFilterPromise
     */
    it("GetFormsInfoWithFilterPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithFilterPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithFilterPromise);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithFilterPromiseStaticTest001 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleModuleCallbackStaticTest001
     * @tc.name: GetFormsInfoWithBundleModuleCallbackStaticTest001
     * @tc.desc: check GetFormsInfoWithBundleModuleCallback
     */
    it("GetFormsInfoWithBundleModuleCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleModuleCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleModuleCallback);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest001 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleModuleCallbackStaticTest002
     * @tc.name: GetFormsInfoWithBundleModuleCallbackStaticTest002
     * @tc.desc: check GetFormsInfoWithBundleModuleCallback
     */
    it("GetFormsInfoWithBundleModuleCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleModuleCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleModuleCallback, true);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModuleCallbackStaticTest002 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleModulePromiseStaticTest001
     * @tc.name: GetFormsInfoWithBundleModulePromiseStaticTest001
     * @tc.desc: check GetFormsInfoWithBundleModulePromise
     */
    it("GetFormsInfoWithBundleModulePromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleModulePromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleModulePromise);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest001 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleModulePromiseStaticTest002
     * @tc.name: GetFormsInfoWithBundleModulePromiseStaticTest002
     * @tc.desc: check GetFormsInfoWithBundleModulePromise
     */
    it("GetFormsInfoWithBundleModulePromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleModulePromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleModulePromise, true);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleModulePromiseStaticTest002 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleCallbackStaticTest001
     * @tc.name: GetFormsInfoWithBundleCallbackStaticTest001
     * @tc.desc: check GetFormsInfoWithBundleCallback
     */
    it("GetFormsInfoWithBundleCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleCallback);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest001 end');
    })

    /**
     * @tc.number: GetFormsInfoWithBundleCallbackStaticTest002
     * @tc.name: GetFormsInfoWithBundleCallbackStaticTest002
     * @tc.desc: check GetFormsInfoWithBundleCallback
     */
    it("GetFormsInfoWithBundleCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.GetFormsInfoWithBundleCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.GetFormsInfoWithBundleCallback, true);
      hilog.info(DOMAIN, TAG, 'GetFormsInfoWithBundleCallbackStaticTest002 end');
    })


    /**
     * @tc.number: SetRouterProxyWithPromiseStaticTest001
     * @tc.name: SetRouterProxyWithPromiseStaticTest001
     * @tc.desc: check SetRouterProxyWithPromise
     */
    it("SetRouterProxyWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetRouterProxyWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetRouterProxyWithPromise);
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: SetRouterProxyWithPromiseStaticTest002
     * @tc.name: SetRouterProxyWithPromiseStaticTest002
     * @tc.desc: check SetRouterProxyWithPromise
     */
    it("SetRouterProxyWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetRouterProxyWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetRouterProxyWithPromise, true);
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: SetRouterProxyWithCallbackStaticTest001
     * @tc.name: SetRouterProxyWithCallbackStaticTest001
     * @tc.desc: check SetRouterProxyWithCallback
     */
    it("SetRouterProxyWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetRouterProxyWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetRouterProxyWithCallback);
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: SetRouterProxyWithCallbackStaticTest002
     * @tc.name: SetRouterProxyWithCallbackStaticTest002
     * @tc.desc: check SetRouterProxyWithCallback
     */
    it("SetRouterProxyWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetRouterProxyWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetRouterProxyWithCallback, true);
      hilog.info(DOMAIN, TAG, 'SetRouterProxyWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: ClearRouterProxyWithCallbackStaticTest001
     * @tc.name: ClearRouterProxyWithCallbackStaticTest001
     * @tc.desc: check ClearRouterProxyWithCallback
     */
    it("ClearRouterProxyWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ClearRouterProxyWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ClearRouterProxyWithCallback);
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: ClearRouterProxyWithCallbackStaticTest002
     * @tc.name: ClearRouterProxyWithCallbackStaticTest002
     * @tc.desc: check ClearRouterProxyWithCallback
     */
    it("ClearRouterProxyWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ClearRouterProxyWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ClearRouterProxyWithCallback, true);
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: ClearRouterProxyWithPromiseStaticTest001
     * @tc.name: ClearRouterProxyWithPromiseStaticTest001
     * @tc.desc: check ClearRouterProxyWithPromise
     */
    it("ClearRouterProxyWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ClearRouterProxyWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ClearRouterProxyWithPromise);
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: ClearRouterProxyWithPromiseStaticTest002
     * @tc.name: ClearRouterProxyWithPromiseStaticTest002
     * @tc.desc: check ClearRouterProxyWithPromise
     */
    it("ClearRouterProxyWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ClearRouterProxyWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ClearRouterProxyWithPromise, true);
      hilog.info(DOMAIN, TAG, 'ClearRouterProxyWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: DeleteInvalidFormsWithPromiseStaticTest001
     * @tc.name: DeleteInvalidFormsWithPromiseStaticTest001
     * @tc.desc: check DeleteInvalidFormsWithPromise
     */
    it("DeleteInvalidFormsWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteInvalidFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteInvalidFormsWithPromise);
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: DeleteInvalidFormsWithPromiseStaticTest002
     * @tc.name: DeleteInvalidFormsWithPromiseStaticTest002
     * @tc.desc: check DeleteInvalidFormsWithPromise
     */
    it("DeleteInvalidFormsWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteInvalidFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteInvalidFormsWithPromise, true);
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: DeleteInvalidFormsWithCallbackStaticTest001
     * @tc.name: DeleteInvalidFormsWithCallbackStaticTest001
     * @tc.desc: check DeleteInvalidFormsWithCallback
     */
    it("DeleteInvalidFormsWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteInvalidFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteInvalidFormsWithCallback);
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: DeleteInvalidFormsWithCallbackStaticTest002
     * @tc.name: DeleteInvalidFormsWithCallbackStaticTest002
     * @tc.desc: check DeleteInvalidFormsWithCallback
     */
    it("DeleteInvalidFormsWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.DeleteInvalidFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.DeleteInvalidFormsWithCallback, true);
      hilog.info(DOMAIN, TAG, 'DeleteInvalidFormsWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: AcquireFormStateWithPromiseStaticTest001
     * @tc.name: AcquireFormStateWithPromiseStaticTest001
     * @tc.desc: check AcquireFormStateWithPromise
     */
    it("AcquireFormStateWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormStateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormStateWithPromise);
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: AcquireFormStateWithPromiseStaticTest002
     * @tc.name: AcquireFormStateWithPromiseStaticTest002
     * @tc.desc: check AcquireFormStateWithPromise
     */
    it("AcquireFormStateWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormStateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormStateWithPromise, true);
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: OnFormUninstallWithoutStringStaticTest001
     * @tc.name: OnFormUninstallWithoutStringStaticTest001
     * @tc.desc: check OnFormUninstallWithoutStringStaticTest001
     */
    it("OnFormUninstallWithoutStringStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OnFormUninstallWithoutStringStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.OnFormUninstallWithoutString), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'OnFormUninstallWithoutStringStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'OnFormUninstallWithoutStringStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.OnFormUninstallWithoutString);
      hilog.info(DOMAIN, TAG, 'OnFormUninstallWithoutStringStaticTest001 end');
    })

    /**
 * @tc.number: AcquireFormStateWithCallbackStaticTest001
 * @tc.name: AcquireFormStateWithCallbackStaticTest001
 * @tc.desc: check AcquireFormStateWithCallback
 */
    it("AcquireFormStateWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormStateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormStateWithCallback);
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: OffFormUninstallWithoutStringStaticTest001
     * @tc.name: OffFormUninstallWithoutStringStaticTest001
     * @tc.desc: check OffFormUninstallWithoutStringStaticTest001
     */
    it("OffFormUninstallWithoutStringStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'OffFormUninstallWithoutStringStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.OffFormUninstallWithoutString), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'OffFormUninstallWithoutStringStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'OffFormUninstallWithoutStringStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.OffFormUninstallWithoutString);
      hilog.info(DOMAIN, TAG, 'OffFormUninstallWithoutStringStaticTest001 end');
    })

    /**
     * @tc.number: AcquireFormStateWithCallbackStaticTest002
     * @tc.name: AcquireFormStateWithCallbackStaticTest002
     * @tc.desc: check AcquireFormStateWithCallback
     */
    it("AcquireFormStateWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormStateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormStateWithCallback, true);
      hilog.info(DOMAIN, TAG, 'AcquireFormStateWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: NotifyFormsVisibleWithCallbackStaticTest001
     * @tc.name: NotifyFormsVisibleWithCallbackStaticTest001
     * @tc.desc: check NotifyFormsVisibleWithCallback
     */
    it("NotifyFormsVisibleWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsVisibleWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsVisibleWithCallback);
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: NotifyFormsVisibleWithCallbackStaticTest002
     * @tc.name: NotifyFormsVisibleWithCallbackStaticTest002
     * @tc.desc: check NotifyFormsVisibleWithCallback
     */
    it("NotifyFormsVisibleWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsVisibleWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsVisibleWithCallback, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: NotifyFormsVisibleWithPromiseStaticTest001
     * @tc.name: NotifyFormsVisibleWithPromiseStaticTest001
     * @tc.desc: check NotifyFormsVisibleWithPromise
     */
    it("NotifyFormsVisibleWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsVisibleWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsVisibleWithPromise);
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: NotifyFormsVisibleWithPromiseStaticTest002
     * @tc.name: NotifyFormsVisibleWithPromiseStaticTest002
     * @tc.desc: check NotifyFormsVisibleWithPromise
     */
    it("NotifyFormsVisibleWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsVisibleWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsVisibleWithPromise, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsVisibleWithPromiseStaticTest002 end');
    })

    /**
      * @tc.number: NotifyFormsEnableUpdateWithPromiseStaticTest001
      * @tc.name: NotifyFormsEnableUpdateWithPromiseStaticTest001
      * @tc.desc: check NotifyFormsEnableUpdateWithPromise
      */
    it("NotifyFormsEnableUpdateWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsEnableUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsEnableUpdateWithPromise);
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest001 end');
    })

    /**
      * @tc.number: NotifyFormsEnableUpdateWithPromiseStaticTest002
      * @tc.name: NotifyFormsEnableUpdateWithPromiseStaticTest002
      * @tc.desc: check NotifyFormsEnableUpdateWithPromise
      */
    it("NotifyFormsEnableUpdateWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsEnableUpdateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsEnableUpdateWithPromise, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: NotifyFormsEnableUpdateWithCallbackStaticTest001
     * @tc.name: NotifyFormsEnableUpdateWithCallbackStaticTest001
     * @tc.desc: check NotifyFormsEnableUpdateWithCallback
     */
    it("NotifyFormsEnableUpdateWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsEnableUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsEnableUpdateWithCallback);
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: NotifyFormsEnableUpdateWithCallbackStaticTest002
     * @tc.name: NotifyFormsEnableUpdateWithCallbackStaticTest002
     * @tc.desc: check NotifyFormsEnableUpdateWithCallback
     */
    it("NotifyFormsEnableUpdateWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsEnableUpdateWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsEnableUpdateWithCallback, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsEnableUpdateWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: ShareFormWithPromiseStaticTest001
     * @tc.name: ShareFormWithPromiseStaticTest001
     * @tc.desc: check ShareFormWithPromise
     */
    it("ShareFormWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ShareFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ShareFormWithPromise);
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: ShareFormWithPromiseStaticTest002
     * @tc.name: ShareFormWithPromiseStaticTest002
     * @tc.desc: check ShareFormWithPromise
     */
    it("ShareFormWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ShareFormWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ShareFormWithPromise, true);
      hilog.info(DOMAIN, TAG, 'ShareFormWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: ShareFormWithCallbackStaticTest001
     * @tc.name: ShareFormWithCallbackStaticTest001
     * @tc.desc: check ShareFormWithCallback
     */
    it("ShareFormWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ShareFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ShareFormWithCallback);
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: ShareFormWithCallbackStaticTest002
     * @tc.name: ShareFormWithCallbackStaticTest002
     * @tc.desc: check ShareFormWithCallback
     */
    it("ShareFormWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.ShareFormWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.ShareFormWithCallback, true);
      hilog.info(DOMAIN, TAG, 'ShareFormWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: NotifyFormsPrivacyProtectedWithCallbackStaticTest001
     * @tc.name: NotifyFormsPrivacyProtectedWithCallbackStaticTest001
     * @tc.desc: check NotifyFormsPrivacyProtectedWithCallback
     */
    it("NotifyFormsPrivacyProtectedWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsPrivacyProtectedWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsPrivacyProtectedWithCallback);
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: NotifyFormsPrivacyProtectedWithCallbackStaticTest002
     * @tc.name: NotifyFormsPrivacyProtectedWithCallbackStaticTest002
     * @tc.desc: check NotifyFormsPrivacyProtectedWithCallback
     */
    it("NotifyFormsPrivacyProtectedWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsPrivacyProtectedWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsPrivacyProtectedWithCallback, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: NotifyFormsPrivacyProtectedWithPromiseStaticTest001
     * @tc.name: NotifyFormsPrivacyProtectedWithPromiseStaticTest001
     * @tc.desc: check NotifyFormsPrivacyProtectedWithPromise
     */
    it("NotifyFormsPrivacyProtectedWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsPrivacyProtectedWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsPrivacyProtectedWithPromise);
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: NotifyFormsPrivacyProtectedWithPromiseStaticTest002
     * @tc.name: NotifyFormsPrivacyProtectedWithPromiseStaticTest002
     * @tc.desc: check NotifyFormsPrivacyProtectedWithPromise
     */
    it("NotifyFormsPrivacyProtectedWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.NotifyFormsPrivacyProtectedWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.NotifyFormsPrivacyProtectedWithPromise, true);
      hilog.info(DOMAIN, TAG, 'NotifyFormsPrivacyProtectedWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: AcquireFormDataWithCallbackStaticTest001
     * @tc.name: AcquireFormDataWithCallbackStaticTest001
     * @tc.desc: check AcquireFormDataWithCallback
     */
    it("AcquireFormDataWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormDataWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormDataWithCallback);
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: AcquireFormDataWithCallbackStaticTest002
     * @tc.name: AcquireFormDataWithCallbackStaticTest002
     * @tc.desc: check AcquireFormDataWithCallback
     */
    it("AcquireFormDataWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormDataWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormDataWithCallback, true);
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: AcquireFormDataWithPromiseStaticTest001
     * @tc.name: AcquireFormDataWithPromiseStaticTest001
     * @tc.desc: check AcquireFormDataWithPromise
     */
    it("AcquireFormDataWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormDataWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormDataWithPromise);
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: AcquireFormDataWithPromiseStaticTest002
     * @tc.name: AcquireFormDataWithPromiseStaticTest002
     * @tc.desc: check AcquireFormDataWithPromise
     */
    it("AcquireFormDataWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.AcquireFormDataWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.AcquireFormDataWithPromise, true);
      hilog.info(DOMAIN, TAG, 'AcquireFormDataWithPromiseStaticTest002 end');
    })


    /**
     * @tc.number: SetPublishFormResultStaticTest001
     * @tc.name: SetPublishFormResultStaticTest001
     * @tc.desc: check SetPublishFormResult
     */
    it("SetPublishFormResultStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetPublishFormResult), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetPublishFormResult);
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest001 end');
    })

    /**
     * @tc.number: SetPublishFormResultStaticTest002
     * @tc.name: SetPublishFormResultStaticTest002
     * @tc.desc: check SetPublishFormResult
     */
    it("SetPublishFormResultStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetPublishFormResult), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetPublishFormResult, true);
      hilog.info(DOMAIN, TAG, 'SetPublishFormResultStaticTest002 end');
    })

    /**
     * @tc.number: SetFormsRecyclableWithPromiseStaticTest001
     * @tc.name: SetFormsRecyclableWithPromiseStaticTest001
     * @tc.desc: check SetFormsRecyclableWithPromise
     */
    it("SetFormsRecyclableWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetFormsRecyclableWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetFormsRecyclableWithPromise);
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: SetFormsRecyclableWithPromiseStaticTest002
     * @tc.name: SetFormsRecyclableWithPromiseStaticTest002
     * @tc.desc: check SetFormsRecyclableWithPromise
     */
    it("SetFormsRecyclableWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetFormsRecyclableWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetFormsRecyclableWithPromise, true);
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: SetFormsRecyclableWithCallbackStaticTest001
     * @tc.name: SetFormsRecyclableWithCallbackStaticTest001
     * @tc.desc: check SetFormsRecyclableWithCallback
     */
    it("SetFormsRecyclableWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetFormsRecyclableWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetFormsRecyclableWithCallback);
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: SetFormsRecyclableWithCallbackStaticTest002
     * @tc.name: SetFormsRecyclableWithCallbackStaticTest002
     * @tc.desc: check SetFormsRecyclableWithCallback
     */
    it("SetFormsRecyclableWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.SetFormsRecyclableWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.SetFormsRecyclableWithCallback, true);
      hilog.info(DOMAIN, TAG, 'SetFormsRecyclableWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: RecycleFormsWithPromiseStaticTest001
     * @tc.name: RecycleFormsWithPromiseStaticTest001
     * @tc.desc: check RecycleFormsWithPromise
     */
    it("RecycleFormsWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecycleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecycleFormsWithPromise);
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: RecycleFormsWithPromiseStaticTest002
     * @tc.name: RecycleFormsWithPromiseStaticTest002
     * @tc.desc: check RecycleFormsWithPromise
     */
    it("RecycleFormsWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecycleFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecycleFormsWithPromise, true);
      hilog.info(DOMAIN, TAG, 'RecycleFormsWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: RecoverFormsWithPromiseStaticTest001
     * @tc.name: RecoverFormsWithPromiseStaticTest001
     * @tc.desc: check RecoverFormsWithPromise
     */
    it("RecoverFormsWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecoverFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecoverFormsWithPromise);
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: RecoverFormsWithPromiseStaticTest002
     * @tc.name: RecoverFormsWithPromiseStaticTest002
     * @tc.desc: check RecoverFormsWithPromise
     */
    it("RecoverFormsWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecoverFormsWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecoverFormsWithPromise, true);
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithPromiseStaticTest002 end');
    })

    /**
     * @tc.number: RecoverFormsWithCallbackStaticTest001
     * @tc.name: RecoverFormsWithCallbackStaticTest001
     * @tc.desc: check RecoverFormsWithCallback
     */
    it("RecoverFormsWithCallbackStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecoverFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecoverFormsWithCallback);
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest001 end');
    })

    /**
     * @tc.number: RecoverFormsWithCallbackStaticTest002
     * @tc.name: RecoverFormsWithCallbackStaticTest002
     * @tc.desc: check RecoverFormsWithCallback
     */
    it("RecoverFormsWithCallbackStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.RecoverFormsWithCallback), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.RecoverFormsWithCallback, true);
      hilog.info(DOMAIN, TAG, 'RecoverFormsWithCallbackStaticTest002 end');
    })

    /**
     * @tc.number: UpdateFormLocationStaticTest001
     * @tc.name: UpdateFormLocationStaticTest001
     * @tc.desc: check UpdateFormLocation
     */
    it("UpdateFormLocationStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.UpdateFormLocation), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.UpdateFormLocation);
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest001 end');
    })

    /**
     * @tc.number: UpdateFormLocationStaticTest002
     * @tc.name: UpdateFormLocationStaticTest002
     * @tc.desc: check UpdateFormLocation
     */
    it("UpdateFormLocationStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.UpdateFormLocation), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.UpdateFormLocation, true);
      hilog.info(DOMAIN, TAG, 'UpdateFormLocationStaticTest002 end');
    })

    /**
     * @tc.number: UpdateFormLockedStateWithPromiseStaticTest001
     * @tc.name: UpdateFormLockedStateWithPromiseStaticTest001
     * @tc.desc: check UpdateFormLockedStateWithPromise
     */
    it("UpdateFormLockedStateWithPromiseStaticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest001 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.UpdateFormLockedStateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest001 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest001 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.UpdateFormLockedStateWithPromise);
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest001 end');
    })

    /**
     * @tc.number: UpdateFormLockedStateWithPromiseStaticTest002
     * @tc.name: UpdateFormLockedStateWithPromiseStaticTest002
     * @tc.desc: check UpdateFormLockedStateWithPromise
     */
    it("UpdateFormLockedStateWithPromiseStaticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest002 start');
      emitter.once(formHostTestController.getFinishEvent(EventIdMap.UpdateFormLockedStateWithPromise), (eventData: emitter.EventData) => {
        hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest002 listening for finished event');
        expect(EXPECTED_FALSE).assertEqual(JSON.stringify(eventData.data));
        done();
      })
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest002 emitting for finished event');
      formHostTestController.emitStart(EventIdMap.UpdateFormLockedStateWithPromise, true);
      hilog.info(DOMAIN, TAG, 'UpdateFormLockedStateWithPromiseStaticTest002 end');
    })
  })
}