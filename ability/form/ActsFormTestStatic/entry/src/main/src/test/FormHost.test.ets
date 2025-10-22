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

import { describe, afterEach, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import formInfo from '@ohos.app.form.formInfo';
import formHost from '@ohos.app.form.formHost';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const INTERVAL_TIME = 2500;

export default function formHostTest() {
  describe('formHostTest', () => {

    /**
     * @tc.name   FormHostStaticTest001
     * @tc.number FormHostStaticTest001
     * @tc.desc   "function on(type: 'formOverflow', callback: Callback<formInfo.OverflowRequest>): void;"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("FormHostStaticTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow catch error');
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
    it("FormHostStaticTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag EntryFormAbility', 'formOverflow catch error');
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
    it("FormHostStaticTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState catch error');
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
    it("FormHostStaticTest004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
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
        hilog.info(0x0000, 'testTag EntryFormAbility', 'changeSceneAnimationState catch error');
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
    it("FormHostStaticTest005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest005 start');

      let callGetFormRect: formInfo.GetFormRectInfoCallback = (formId: string): Promise<formInfo.Rect> => {
        hilog.info(0x0000, 'testTag', `cbGetFormRect a new form`);
        return new Promise<formInfo.Rect>((resolve: (rect: formInfo.Rect) => void, reject: (rect: formInfo.Rect) => void): void => {
          hilog.info(0x0000, 'testTag', `cbGetFormRect Promise called`);
          let rect1:formInfo.Rect= {
            left:1.0,
            top:1.2,
            width:1.3,
            height:1.4
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
        hilog.info(0x0000, 'testTag EntryFormAbility', 'getFormRect catch error');
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
    it("FormHostStaticTest006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest006 start');
      try {
        formHost.offGetFormRect();
        hilog.info(0x0000, 'testTag EntryFormAbility', 'getFormRect success');
        expect().assertFail();
        done();
      } catch (error: Error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        hilog.info(0x0000, 'testTag EntryFormAbility', 'getFormRect catch error');
        expect(code).assertEqual(202);
        done();
      }
      hilog.info(DOMAIN, TAG, 'FormHostStaticTest006 end');
    })

  })
}