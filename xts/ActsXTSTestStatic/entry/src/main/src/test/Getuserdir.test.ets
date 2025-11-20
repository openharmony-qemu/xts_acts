/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import environment from '@ohos.file.environment';
import { BusinessError } from '@ohos.base';
import inputMethod from '@ohos.inputMethod';
import inputMethodSubtype from '@ohos.InputMethodSubtype';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function getUserDir() {
  describe("environment_getUserDir_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'environment_getUserDir_test start');
        beforeAll(() => {
            console.info('%{public}s', 'beforeAll start');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    testAbilityContext = abilitys.context
                    console.info('%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError | null) : void => {
                if (err != null ) {
                    console.info('%{public}s', '-----'+ err.code);
                }
                console.info('%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.inputmethodauthority.test.static")
            await Utils.msSleep(2000)
            console.info('%{public}s', 'beforeAll end');
        })
		
        /*
         * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.name    inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.desc    Switch current input method subtype.
         * @tc.level   2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));

            inputMethod.switchCurrentInputMethodSubtype(inputMS, (err : BusinessError | null, data : boolean | undefined) => {
                try {
                    if (err != null) {
                        hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_001 data: " + JSON.stringify(data));
                    expect(data == true).assertTrue();
                    done();
                } catch (error) {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 catch error: ' + JSON.stringify(error));
                    done();
                }
            });
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test end*************");
        });

		
        /**
         * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0100', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0100 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0100 getCurrentInputMethod: " + JSON.stringify(inputM));
            try {
                hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod permission fail')
                let result = await inputMethod.switchInputMethod(inputM);
                expect(result == true).assertTrue();
                done();
                hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0100 end");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDesktopDir_0100
     * @tc.name environment_test_getUserDesktopDir_Static_001
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_test_getUserDesktopDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDesktopDir_Static_001 start');
      try {
        let path = environment.getUserDesktopDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDesktopDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });
	
        /*
         * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.name    inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.desc    Switch current input method subtype.
         * @tc.level   2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_002', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
            let extras: Record<string, string> ={}
            let inputMethodSubProperty: inputMethodSubtype = {
                id: inputMS.id,
                label: "",
                labelId: 123,
                name: inputMS.name,
                mode: "lower",
                locale: "",
                language: "",
                icon: "",
                iconId: 0,
                extra: extras
            };
            try {
                inputMethod.switchCurrentInputMethodSubtype(inputMS).then((data: boolean) => {
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_002 data: " + JSON.stringify(data));
                    expect(data == true).assertTrue();
                    done();
                }).catch((err: Error):void => {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 err: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 catch error: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            };
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test end*************");
        });
	
         * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_0200
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0200', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0200 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0200 getCurrentInputMethod: " + JSON.stringify(inputM));
            inputMethod.switchInputMethod(inputM, (err : BusinessError | null, data : boolean | undefined) => {
                try {
                    if (err != null && err.code != 0) {
                        hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 switchInputMethod permission fail: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0200 success: ' + data);
                        expect(data == true).assertTrue();
                        done();
                    }
                } catch (err) {
                    err = err as BusinessError;
                    hilog.error(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0100
     * @tc.name environment_test_getUserDocumentDir_Static_001
     * @tc.desc Test getUserDocumentDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_test_getUserDocumentDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDocumentDir_Static_001 start');
      try {
        let path = environment.getUserDocumentDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDocumentDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });
	
        /*
         * @tc.number  inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.name    inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.desc    Test Indicates the input method which will hide softboard with calback.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_001', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_001 start************");
            let inputMethodCtrl = inputMethod.getController()
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            try {
                let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 execution success, data: ${JSON.stringify(data)}`);
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
            inputMethodCtrl.hideSoftKeyboard((error : BusinessError | null) => {
                try {
                    if (error != null) {
                        hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 hideSoftKeyboard permission fail: " + JSON.stringify(error));
                        expect(error?.code == 0).assertTrue();
                    } else {
                        hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_001 success: ');
                        expect(true).assertTrue();
                    }
                    done();
                } catch (err) {
                    err = err as BusinessError;
                    hilog.error(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 end");
                }
            });
        });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0100
     * @tc.name environment_test_getUserDownloadDir_Static_001
     * @tc.desc Test getUserDownloadDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_test_getUserDownloadDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDownloadDir_Static_001 start');
      try {
        let path = environment.getUserDownloadDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDownloadDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });
	
        /*
         * @tc.number  inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.name    inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.desc    Test Indicates the input method which will hide softboard with Promise.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_002', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_002 start************");
            let inputMethodCtrl = inputMethod.getController()
            try {
                const ATTRIBUTE: inputMethod.TextConfig = {
                    inputAttribute: {
                        textInputType: inputMethod.TextInputType.TEXT,
                        enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                    }
                }
                try {
                    let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 execution success, data: ${JSON.stringify(data)}`);
                } catch (error) {
                    error = error as BusinessError;
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 catch error, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                    done();
                }
                hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard permission fail')
                await inputMethodCtrl.hideSoftKeyboard();
                expect(true).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
                hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_002 end");
            }
        });
  })
  hilog.info(domain, tag, '%{public}s', 'environment_getUserDir_test end');

}