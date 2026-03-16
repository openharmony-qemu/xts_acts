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
import { BusinessError } from '@ohos.base';
import InputMethodMethod from '@ohos.InputMethodSubtype';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';

const INVALID_INPUT_PARAMETER: int = 401;
const INVALID_INPUT_METHOD_SERVICE_ERROR: int = 12800008;
const INVALID_BUNDLE_MANAGER_ERROR: int = 12800001;

export default function inputMethodSettingTest() {
    describe('inputMethod_setting', () => {
        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100
         * @tc.desc   Test getInputMethods interface with callback, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getInputMethods(true, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200
         * @tc.desc   Test getInputMethods interface with callback, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getInputMethods(false, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100
         * @tc.desc   Test getInputMethods interface with promise, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getInputMethods(true);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200
         * @tc.desc   Test getInputMethods interface with promise, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getInputMethods(false);
                console.info(`${CASE_NAME} execution: success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100
         * @tc.desc   Test getInputMethodsSync interface, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getInputMethodsSync(true);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200
         * @tc.desc   Test getInputMethodsSync interface, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getInputMethodsSync(false);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100
         * @tc.desc   Test getAllInputMethods interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getAllInputMethods(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100
         * @tc.desc   Test getAllInputMethods interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getAllInputMethods();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100
         * @tc.desc   Test getAllInputMethodsSync interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getAllInputMethodsSync();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100
         * @tc.desc   Test listInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let CallBack = (error: BusinessError | null, data: InputMethodMethod[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.listInputMethodSubtype(inputM, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test listInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            try {
                let data: InputMethodMethod[] = await inputMethodSetting.listInputMethodSubtype(inputM);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100
         * @tc.desc   Test listCurrentInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: InputMethodMethod[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.listCurrentInputMethodSubtype(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test listCurrentInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: InputMethodMethod[] = await inputMethodSetting.listCurrentInputMethodSubtype();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_onImeChange_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_onImeChange_static_0100
         * @tc.desc   Test onImeChange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_onImeChange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_onImeChange_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let callback: inputMethod.ImeChangeCallback = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodMethod): void => {
                console.info(`${CASE_NAME} imeChange callback triggered`);
            };
            try {
                inputMethodSetting.onImeChange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_offImeChange_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_offImeChange_static_0100
         * @tc.desc   Test offImeChange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_offImeChange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_offImeChange_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let callback: inputMethod.ImeChangeCallback = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodMethod): void => {
                console.info(`${CASE_NAME} imeChange callback triggered`);
            };
            try {
                inputMethodSetting.onImeChange(callback);
                inputMethodSetting.offImeChange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });
    })
}
