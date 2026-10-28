'use static';
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

import eap from '@ohos.net.eap';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'wifiManagerEapErrorCodeTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiEapErrorTest(): void {
  let eapDataArr = new Uint8Array(5);
  eapDataArr[0] = 1;
  eapDataArr[1] = 2;
  eapDataArr[2] = 3;
  eapDataArr[3] = 4;
  eapDataArr[4] = 5;
  const eapData: eap.EapData = {
    msgId: 1,
    eapBuffer: eapDataArr,
    bufferLen: 1
  }
  describe('wifiEapErrorTest', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called');
      done();
    })
    beforeEach(() => {
      hilog.info(domain, tag, 'beforeEach called');
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called');
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called');
      done();
    })

    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0100
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0100
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const invalidNetType = 3;
          const validEapCode = 1;
          const validEapType = 1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData failed : ",
                  error);
              } finally {
                try {
                  eap.unregCustomEapHandler(invalidNetType, validEapCode, validEapType,
                    (eapData: eap.EapData): void => {
                      hilog.info(domain, tag,
                        "SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback eapData : " +
                          JSON.stringify(eapData));
                      setTimeout(() => {
                        try {
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0100 callback replyCustom");
                          eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData success");
                        } catch (error) {
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0100 replyCustomEapData failed : ",
                            error);
                        }
                      }, 1 * 1000);
                    });
                  hilog.info(domain, tag,
                    "SUB_Communication_Netmanager_Eap_ErrorCode_0100 unregCustomEapHandler success");
                } catch (error) {
                  hilog.info(domain, tag,
                    `SUB_Communication_Netmanager_Eap_ErrorCode_0100 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                }
              }
            }, 1 * 1000);
          }
          eap.regCustomEapHandler(invalidNetType, validEapCode, validEapType, getEapData);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0100 regCustomEapHandler success");
          expect().assertFail();
          done();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0100 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid NetType`);
            expect(true).assertTrue();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid EapCode`);
            expect().assertFail();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register invalid EapType`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0100 eap register undefined errorcode`);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0200
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0200
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const validNetType = 1;
          const invalidEapCode = 0;
          const validEapType = 1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag,
                  `SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData failed :,code is ${error.code}, message is ${error.message}`);
              } finally {
                try {
                  eap.unregCustomEapHandler(validNetType, invalidEapCode, validEapType,
                    (eapData: eap.EapData): void => {
                      hilog.info(domain, tag,
                        "SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback eapData : " +
                          JSON.stringify(eapData));
                      setTimeout(() => {
                        try {
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0200 callback replyCustom");
                          eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData success");
                        } catch (error) {
                          hilog.info(domain, tag,
                            `SUB_Communication_Netmanager_Eap_ErrorCode_0200 replyCustomEapData failed :,code is ${error.code}, message is ${error.message}`);
                        }
                      }, 1 * 1000);
                    });
                  hilog.info(domain, tag,
                    "SUB_Communication_Netmanager_Eap_ErrorCode_0200 unregCustomEapHandler success");
                } catch (error) {
                  hilog.info(domain, tag,
                    `SUB_Communication_Netmanager_Eap_ErrorCode_0200 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                }
              }
            }, 1 * 1000);
          }
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler start");
          eap.regCustomEapHandler(validNetType, invalidEapCode, validEapType, getEapData);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler success");
          expect().assertFail();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0200 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid NetType`);
            expect().assertFail();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid EapCode`);
            expect(true).assertTrue();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register invalid EapType`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0200 eap register undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0300
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0300
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const validNetType = 1;
          const validEapCode = 1;
          const invalidEapType = -1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData failed : ",
                  error);
              } finally {
                try {
                  eap.unregCustomEapHandler(validNetType, validEapCode, invalidEapType,
                    (eapData: eap.EapData): void => {
                      hilog.info(domain, tag,
                        "SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback eapData : " +
                          JSON.stringify(eapData));
                      setTimeout(() => {
                        try {
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0300 callback replyCustom");
                          eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData success");
                        } catch (error) {
                          hilog.info(domain, tag,
                            "SUB_Communication_Netmanager_Eap_ErrorCode_0300 replyCustomEapData failed : ",
                            error);
                        }
                      }, 1 * 1000);
                    });
                  hilog.info(domain, tag,
                    "SUB_Communication_Netmanager_Eap_ErrorCode_0300 unregCustomEapHandler success");
                } catch (error) {
                  hilog.info(domain, tag,
                    `SUB_Communication_Netmanager_Eap_ErrorCode_0300 unregCustomEapHandler failed :,code is ${error.code}, message is ${error.message}`);
                }
              }
            }, 1 * 1000);
          }
          eap.regCustomEapHandler(validNetType, validEapCode, invalidEapType, getEapData);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0300 regCustomEapHandler success");
          expect().assertFail();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0300 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid NetType`);
            expect().assertFail();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid EapCode`);
            expect().assertFail();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register invalid EapType`);
            expect(true).assertTrue();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0300 eap register undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0400
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0400
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const invalidNetType = 3;
          const validEapCode = 1;
          const validEapType = 1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0400 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0400 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0400 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0400 replyCustomEapData failed : ",
                  error);
              }
              done();
            }, 1 * 1000);
          }
          eap.unregCustomEapHandler(invalidNetType, validEapCode, validEapType, getEapData)
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0400 unregCustomEapHandler success");
          expect().assertFail();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0400 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid NetType`);
            expect(true).assertTrue();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid EapCode`);
            expect().assertFail();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister invalid EapType`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_ErrorCode_0400 eap unregister undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })
    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0500
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0500
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const validNetType = 1;
          const invalidEapCode = 5;
          const validEapType = 1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0500 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0500 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0500 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0500 replyCustomEapData failed : ",
                  error)
              }
              done();
            }, 1 * 1000);
          }
          eap.unregCustomEapHandler(validNetType, invalidEapCode, validEapType, getEapData)
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0500 unregCustomEapHandler success");
          expect().assertFail();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0500 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid NetType`);
            expect().assertFail();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid EapCode`);
            expect(true).assertTrue();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister invalid EapType`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_ErrorCode_0500 eap unregister undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })
    /**
     * @tc.name SUB_Communication_Netmanager_Eap_ErrorCode_static_0600
     * @tc.number SUB_Communication_Netmanager_EapErrorCode_0600
     * @tc.desc   Test eap unregister api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_Netmanager_Eap_ErrorCode_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const validNetType = 1;
          const validEapCode = 1;
          const invalidEapType = -1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_ErrorCode_0600 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0600 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0600 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0600 replyCustomEapData failed : ",
                  error)
              }
              done();
            }, 1 * 1000);
          }
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler start");
          eap.unregCustomEapHandler(validNetType, validEapCode, invalidEapType, getEapData);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler success");
          expect().assertFail();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_ErrorCode_0600 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid NetType`);
            expect().assertFail();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid EapCode`);
            expect().assertFail();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister invalid EapType`);
            expect(true).assertTrue();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_ErrorCode_0600 eap unregister undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })
  })
}