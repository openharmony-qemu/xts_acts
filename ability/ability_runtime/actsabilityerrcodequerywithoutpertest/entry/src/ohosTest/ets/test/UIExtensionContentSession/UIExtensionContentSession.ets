/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Want, UIExtensionAbility, UIExtensionContentSession, common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { uiExtension } from '@kit.ArkUI';

let TAG: string = 'UIExtensionContentSession UIExtAbility';
let caseTag: string = 'Sub_UIExtensionContentSession_errorCode_0100';

export default class UIExtensionProvider extends UIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`);
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    console.log(TAG, `onBackground`);
  }

  onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    caseTag = want.action ?? ''
    TAG = caseTag
    console.log(`${caseTag} onSessionCreate, want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_0900') {
      try {
        session.setWindowPrivacyMode(false)
          .then(() => {
            console.info(caseTag + `Successed in setting window to privacy mode.`);
            console.error(caseTag + `Test case execution results do not match expected outcomes.`);
            commonEventManager.publish('ACTS_TEST_DESTROY', () => {
              console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
            });
          })
          .catch((err: BusinessError) => {
            console.error(caseTag + `Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
          });
      } catch (error) {
        console.error(caseTag + `session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 201) {
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': error.code
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(caseTag + `Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(caseTag + `Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1000') {
      try {
        session.setWindowPrivacyMode(false, (err: BusinessError) => {
          if (err) {
            console.error(caseTag + `Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
            return;
          }
          console.info(caseTag + `Successed in setting window to privacy mode.`);
          console.error(caseTag + `Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': 0
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(caseTag + `session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 201) {
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': error.code
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(caseTag + `Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(caseTag + `Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1100') {
      try {
        session.setWindowPrivacyMode(true)
          .then(() => {
            console.info(caseTag + `Successed in setting window to privacy mode.`);
            console.error(caseTag + `Test case execution results do not match expected outcomes.`);
            commonEventManager.publish('ACTS_TEST_DESTROY', { 
             parameters: {
               'result': 0
             }
           }, () => {
             console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
           });
          })
          .catch((err: BusinessError) => {
            console.error(caseTag + `Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
          });
      } catch (error) {
        console.error(caseTag + `session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 201) {
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': error.code
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(caseTag + `Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(caseTag + `Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1200') {
      try {
        session.setWindowPrivacyMode(true, (err: BusinessError) => {
          if (err) {
            console.error(caseTag + `Failed to set window to privacy mode, code: ${err.code}, msg: ${err.message}`);
            return;
          }
          console.info(caseTag + `Successed in setting window to privacy mode.`);
          console.error(caseTag + `Test case execution results do not match expected outcomes.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': 0
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      } catch (error) {
        console.error(caseTag + `session.setWindowPrivacyMode fail, error: ${JSON.stringify(error)}`);
        if (error.code == 201) {
          commonEventManager.publish('ACTS_TEST_DESTROY', { 
            parameters: {
              'result': error.code
            }
          }, () => {
            console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(caseTag + `Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(caseTag + `Successed in terminating self.`);
              });
            },500)
          });
        }
      }
    }
    if (want.action == 'Sub_UIExtensionContentSession_errorCode_1300') {
      const publishRect = (left: number, top: number, width: number, height: number) => {
        commonEventManager.publish('ACTS_TEST_DESTROY', {
          parameters: {
            'result': 0,
            'left': left,
            'top': top,
            'width': width,
            'height': height
          }
        }, () => {
          console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY with rect values`);
        });
      };
      const publishFail = (result: number) => {
        commonEventManager.publish('ACTS_TEST_DESTROY', {
          parameters: {
            'result': result
          }
        }, () => {
          console.info(caseTag + `${caseTag} publish ACTS_TEST_DESTROY`);
        });
      };
      const queryRect = (retryCount: number) => {
        try {
          let windowProxy = session.getUIExtensionWindowProxy();
          if (windowProxy && windowProxy.properties && windowProxy.properties.uiExtensionHostWindowProxyRect) {
            let rect = windowProxy.properties.uiExtensionHostWindowProxyRect;
            console.info(caseTag + `Window rect: left=${rect.left}, top=${rect.top}, width=${rect.width}, height=${rect.height}`);
            if (rect.left > 0 && rect.top > 0 && rect.width > 0 && rect.height > 0) {
              publishRect(rect.left, rect.top, rect.width, rect.height);
              return;
            }
          }
        } catch (error) {
          console.error(caseTag + `session.getUIExtensionWindowProxy fail, error: ${JSON.stringify(error)}`);
          if (error.code == 16000050) {
            publishFail(error.code);
            setTimeout(() => {
              session?.terminateSelf((err: BusinessError) => {
                if (err) {
                  console.error(caseTag + `Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
                  return;
                }
                console.info(caseTag + `Successed in terminating self.`);
              });
            }, 500)
            return;
          }
        }
        if (retryCount < 30) {
          setTimeout(() => {
            queryRect(retryCount + 1);
          }, 100);
        } else {
          console.error(caseTag + `Window rect is not ready after waiting, publish fail`);
          publishFail(-1);
        }
      };
      queryRect(0);
    }
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}
