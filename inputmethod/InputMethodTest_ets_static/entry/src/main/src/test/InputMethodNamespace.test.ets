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
const INVALID_INPUT_METHOD_CLIENT_DETACHED: int = 12800009;
const INVALID_INPUT_METHOD_CLIENT_ERROR: int = 12800003;
const INVALID_INPUT_METHOD_SERVICE_ERROR: int = 12800008;
const INVALID_INPUT_METHOD_CONFIG_ERROR: int = 12800005;

export default function inputMethodNamespaceTest() {
    describe('inputMethod_namespace', () => {
        /**
         * @tc.name   SUB_Misc_inputMethod_getController_static_0100
         * @tc.number SUB_Misc_inputMethod_getController_static_0100
         * @tc.desc   Test getController interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getController_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getController_static_0100';
            try {
                let controller: inputMethod.InputMethodController = inputMethod.getController();
                console.info(`${CASE_NAME} getController success`);
                expect(controller != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getSetting_static_0100
         * @tc.number SUB_Misc_inputMethod_getSetting_static_0100
         * @tc.desc   Test getSetting interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getSetting_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getSetting_static_0100';
            try {
                let setting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info(`${CASE_NAME} getSetting success`);
                expect(setting != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getDefaultInputMethod_static_0100
         * @tc.number SUB_Misc_inputMethod_getDefaultInputMethod_static_0100
         * @tc.desc   Test getDefaultInputMethod interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getDefaultInputMethod_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getDefaultInputMethod_static_0100';
            try {
                let defaultIme: inputMethod.InputMethodProperty = inputMethod.getDefaultInputMethod();
                console.info(`${CASE_NAME} getDefaultInputMethod success: ${JSON.stringify(defaultIme)}`);
                expect(defaultIme.name != null).assertTrue();
                expect(defaultIme.id != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100
         * @tc.number SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100
         * @tc.desc   Test getSystemInputMethodConfigAbility interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100';
            try {
                let config = inputMethod.getSystemInputMethodConfigAbility();
                console.info(`${CASE_NAME} getSystemInputMethodConfigAbility success: ${JSON.stringify(config)}`);
                expect(config != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getCurrentInputMethod_static_0100
         * @tc.number SUB_Misc_inputMethod_getCurrentInputMethod_static_0100
         * @tc.desc   Test getCurrentInputMethod interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getCurrentInputMethod_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getCurrentInputMethod_static_0100';
            try {
                let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
                console.info(`${CASE_NAME} getCurrentInputMethod success: ${JSON.stringify(currentIme)}`);
                expect(currentIme.name != null).assertTrue();
                expect(currentIme.id != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100
         * @tc.number SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100
         * @tc.desc   Test getCurrentInputMethodSubtype interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100';
            try {
                let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
                console.info(`${CASE_NAME} getCurrentInputMethodSubtype success: ${JSON.stringify(subtype)}`);
                expect(subtype != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchInputMethod_Async_static_0100
         * @tc.desc   Test switchInputMethod interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchInputMethod_Async_static_0100';
            let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchInputMethod(currentIme, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100
         * @tc.desc   Test switchInputMethod interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100';
            let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            try {
                let result: boolean = await inputMethod.switchInputMethod(currentIme);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100
         * @tc.desc   Test switchCurrentInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100';
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let extra: Record<string, string> = {};
            let target: InputMethodMethod = {
                id: subtype.id,
                label: subtype.label,
                name: subtype.name,
                mode: subtype.mode,
                locale: subtype.locale,
                language: subtype.language,
                icon: subtype.icon,
                iconId: subtype.iconId,
                extra: extra
            };
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchCurrentInputMethodSubtype(target, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test switchCurrentInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100';
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let extra: Record<string, string> = {};
            let target: InputMethodMethod = {
                id: subtype.id,
                label: subtype.label,
                name: subtype.name,
                mode: subtype.mode,
                locale: subtype.locale,
                language: subtype.language,
                icon: subtype.icon,
                iconId: subtype.iconId,
                extra: extra
            };
            try {
                let result: boolean = await inputMethod.switchCurrentInputMethodSubtype(target);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100
         * @tc.desc   Test switchCurrentInputMethodAndSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100';
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchCurrentInputMethodAndSubtype(inputM, subtype, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100
         * @tc.desc   Test switchCurrentInputMethodAndSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100';
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            try {
                let result: boolean = await inputMethod.switchCurrentInputMethodAndSubtype(inputM, subtype);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100
         * @tc.number SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100
         * @tc.desc   Test setSimpleKeyboardEnabled interface with enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100';
            try {
                inputMethod.setSimpleKeyboardEnabled(true);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200
         * @tc.number SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200
         * @tc.desc   Test setSimpleKeyboardEnabled interface with enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200';
            try {
                inputMethod.setSimpleKeyboardEnabled(false);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_onAttachmentDidFail_static_0100
         * @tc.number SUB_Misc_inputMethod_onAttachmentDidFail_static_0100
         * @tc.desc   Test onAttachmentDidFail interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_onAttachmentDidFail_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_onAttachmentDidFail_static_0100';
            let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
            };
            try {
                inputMethod.onAttachmentDidFail(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_offAttachmentDidFail_static_0100
         * @tc.number SUB_Misc_inputMethod_offAttachmentDidFail_static_0100
         * @tc.desc   Test offAttachmentDidFail interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_offAttachmentDidFail_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_offAttachmentDidFail_static_0100';
            let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
            };
            try {
                inputMethod.onAttachmentDidFail(callback);
                inputMethod.offAttachmentDidFail(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100
         * @tc.number SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100
         * @tc.desc   Test MAX_TYPE_NUM constant
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100';
            console.info(`${CASE_NAME} MAX_TYPE_NUM: ${inputMethod.MAX_TYPE_NUM}`);
            expect(inputMethod.MAX_TYPE_NUM === 128).assertTrue();
            done();
        });
    })
}
