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
import inputMethod from '@ohos.inputMethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
//日志标识,0x0000作为测试框架的业务标识
let domain: int = 0x0000;
//日志标识字符串,作为tag标识当前runner类下的测试行为
let tag: string = 'testTag';

export default function inputMethodOnErrorTest() {
  describe('inputMethodOnErrorEtsTest', () => {

    /*
    * @tc.number  SUB_Misc_inputMethod_onInsertTextError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onInsertTextError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onInsertTextError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onInsertTextError_static_0100';
      let callback1 = (text: string) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} insertText detach success`);
        inputMethodController.on('insertText',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} insertText callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
      * @tc.number  SUB_Misc_inputMethod_onDeleteLeftError_static_0100
      * @tc.name    SUB_Misc_inputMethod_onDeleteLeftError_static_0100
      * @tc.desc    12800009 Function test
      * @tc.size    MediumTest
      * @tc.type    Function
      * @tc.level   Level2
      */
    it('SUB_Misc_inputMethod_onDeleteLeftError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onDeleteLeftError_static_0100';
      let callback1 = (length: int) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} deleteLeft detach success`);
        inputMethodController.on('deleteLeft',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} deleteLeft callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onDeleteRightError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onDeleteRightError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onDeleteRightError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onDeleteRightError_static_0100';
      let callback1 = (length: int) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} deleteRight detach success`);
        inputMethodController.on('deleteRight',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} deleteRight callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onSendKeyboardStatusError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onSendKeyboardStatusError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onSendKeyboardStatusError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onSendKeyboardStatusError_static_0100';
      let callback1 = (keyboardStatus: inputMethod.KeyboardStatus) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} sendKeyboardStatus detach success`);
        inputMethodController.on('sendKeyboardStatus',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} sendKeyboardStatus callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onSendFunctionKeyError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onSendFunctionKeyError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onSendFunctionKeyError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onSendFunctionKeyError_static_0100';
      let callback1 = (functionKey: inputMethod.FunctionKey) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} sendFunctionKey detach success`);
        inputMethodController.on('sendFunctionKey',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} sendFunctionKey callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onMoveCursorError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onMoveCursorError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onMoveCursorError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onMoveCursorError_static_0100';
      let callback1 = (direction: inputMethod.Direction) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} moveCursor detach success`);
        inputMethodController.on('moveCursor',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} moveCursor callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onHandleExtendActionError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onHandleExtendActionError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onHandleExtendActionError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onHandleExtendActionError_static_0100';
      let callback1 = (action: inputMethod.ExtendAction) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
      }
      try {
        let inputMethodController = inputMethod.getController();
        await inputMethodController.detach();
        hilog.info(domain, tag, `${CASE_NAME} handleExtendAction detach success`);
        inputMethodController.on('handleExtendAction',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} handleExtendAction callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onGetLeftTextOfCursorError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onGetLeftTextOfCursorError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onGetLeftTextOfCursorError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onGetLeftTextOfCursorError_static_0100';
      let callback1 = (length: int) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        return "test";
      }
      try {
        let inputMethodController = inputMethod.getController();
        hilog.info(domain, tag, `${CASE_NAME} getLeftTextOfCursor detach success`);
        inputMethodController.on('getLeftTextOfCursor',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} getLeftTextOfCursor callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onGetRightTextOfCursorError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onGetRightTextOfCursorError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onGetRightTextOfCursorError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onGetRightTextOfCursorError_static_0100';
      let callback1 = (length: int) => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        return "test";
      }
      try {
        let inputMethodController = inputMethod.getController();
        hilog.info(domain, tag, `${CASE_NAME} getRightTextOfCursor detach success`);
        inputMethodController.on('getRightTextOfCursor',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} getRightTextOfCursor callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onGetTextIndexAtCursorError_static_0100
    * @tc.name    SUB_Misc_inputMethod_onGetTextIndexAtCursorError_static_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onGetTextIndexAtCursorError_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_onGetTextIndexAtCursorError_static_0100';
      let callback1 = () => {
        hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        return 1;
      }
      try {
        let inputMethodController = inputMethod.getController();
        hilog.info(domain, tag, `${CASE_NAME} getTextIndexAtCursor detach success`);
        inputMethodController.on('getTextIndexAtCursor',callback1 );
        hilog.info(domain, tag, `${CASE_NAME} getTextIndexAtCursor callback1 success`);
        expect().assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(12800009);
        done();
      }
    });




  })
}