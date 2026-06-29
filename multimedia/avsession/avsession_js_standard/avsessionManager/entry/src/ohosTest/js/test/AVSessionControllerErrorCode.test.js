/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionControllerErrorCode() {
    describe('AVSessionControllerErrorCode', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
        let event = { action: 2, key: keyItem, keys: [keyItem] };
        let errEvent = { action: 3, key: keyItem, keys: [keyItem] };
        const COMMON_COMMAND_STRING = "common_command";
		const COMMON_COMMAND_PARAMS = {
			command: "This is my command"
		};
        const QUEUE_ITEM_ID = 666;
        const INVALID_STRING = "invalid string";
        let context = featureAbility.getContext();

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function invalidSession(validFunc) {
            await session.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
                session = null;
            }).catch(err => {
                console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        async function invalidSessionState(validFunc) {
            await session.deactivate().then(async () => {
                console.info('TestLog: session deactivate success');
                await validFunc();
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        async function invalidController(validFunc) {
            await controller.destroy().then(async () => {
                console.info('TestLog: controller destroy success');
                await validFunc();
                controller = null;
            }).catch(err => {
                console.info(`TestLog: controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        function callback1() { }
        function callback2() { }

        function offCallbackInvalidParam(eventName) {
            try {
                controller.off(eventName, callback1, callback2);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        async function offCallbackInvalidController(eventName) {
			await invalidController(() => {
                try {
                    controller.off(eventName);
                    expect().assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(6600103);
                }
            });
		}

        async function offCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.off(eventName)
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        async function onCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.on(eventName, callback1);
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        async function onCallbackInvalidController(eventName) {
			await invalidController(() => {
                try {
                    controller.on(eventName, callback1);
                    expect().assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(6600103);
                }
            });
		}

        function onCallbackInvalidParam(eventName) {
            try {
                controller.on(eventName);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            if (!session) {
                await avSession.createAVSession(context, tag, type).then((data) => {
                    session = data;
                }).catch((err) => {
                    expect(err.code == 6600101).assertTrue();
                    console.info(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION);
                    console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });

            controller = await session.getController();
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            if (session) {
                await session.destroy().then(() => {
                    console.info('TestLog: Session destroy success');
                    session = null;
                }).catch((err) => {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            if (controller) {
                await controller.destroy().then(() => {
                    console.info('TestLog: Controller destroy success');
                    controller = null;
                }).catch((err) => {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0100
         * @tc.desc   test sendAVKeyEvent(callback) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.sendAVKeyEvent(err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0200
         * @tc.desc   test sendAVKeyEvent(callback) errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.sendAVKeyEvent(event, err => {
                        if (err) {
                            console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('sendAVKeyEvent Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0300
         * @tc.desc   test sendAVKeyEvent(callback) errcode 6600105
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.sendAVKeyEvent(errEvent, async err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(6600105);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0400
         * @tc.desc   test sendAVKeyEvent(callback) errcode 6600106
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: session deactivate success');
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });
            try {
                controller.sendAVKeyEvent(event, async err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(6600106);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0500
         * @tc.desc   test sendAVKeyEvent(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.sendAVKeyEvent().then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0600
         * @tc.desc   test sendAVKeyEvent(promise) errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(async () => {
                await controller.sendAVKeyEvent(event).then(() => {
                    console.info('sendAVKeyEvent Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0700
         * @tc.desc   test sendAVKeyEvent(promise) errcode 6600105
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.sendAVKeyEvent(errEvent).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0800
         * @tc.desc   test sendAVKeyEvent(promise) errcode 6600106
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: session deactivate success');
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });
            await controller.sendAVKeyEvent(event).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600106);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_0100
         * @tc.desc   test getRealPlaybackPositionSync errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getRealPlaybackPositionSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0100
         * @tc.desc   test getValidCommands(promise) errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(async () => {
                await controller.getValidCommands().then(() => {
                    console.info(`TestLog: getValidCommands Successfully.`);
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0200
         * @tc.desc   test getValidCommands(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await controller.getValidCommands().then((data) => {
                    console.info(`TestLog: getValidCommands Successfully.`);
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0300
         * @tc.desc   test getValidCommands(callback) errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getValidCommands(err => {
                        if (err) {
                            console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info(`TestLog: getValidCommands Successfully.`);
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0400
         * @tc.desc   test getValidCommands(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getValidCommands(err => {
                        if (err) {
                            console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info(`TestLog: getValidCommands Successfully.`);
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
            
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0100
         * @tc.desc   test on('sessionEvent') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('sessionEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0200
         * @tc.desc   test on('sessionEvent') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('sessionEvent', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0300
         * @tc.desc   test on('sessionEvent') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('sessionEvent', INVALID_STRING);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0400
         * @tc.desc   test on('sessionEvent') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('sessionEvent')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_ERRORCODE_0100
   * @tc.desc   test off('sessionEvent') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('sessionEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0100
   * @tc.desc   test sendCommonCommand(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.sendCommonCommand(COMMON_COMMAND_STRING).then(() => {
                console.info('sendCommonCommand Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0200
   * @tc.desc   test sendCommonCommand(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.sendCommonCommand(COMMON_COMMAND_PARAMS, COMMON_COMMAND_PARAMS).then(() => {
                console.info('sendCommonCommand Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0300
   * @tc.desc   test sendCommonCommand(promise) errcode 6600106
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSessionState(async () => {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).then(() => {
                    console.info('sendCommonCommand Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600106);
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0400
   * @tc.desc   test sendCommonCommand(promise) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(async () => {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).then(() => {
                    console.info('sendCommonCommand Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0500
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0500
   * @tc.desc   test sendCommonCommand(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.sendCommonCommand(COMMON_COMMAND_STRING, err => {
                    if (err) {
                        console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendCommonCommand Successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0600
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0600
   * @tc.desc   test sendCommonCommand(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.sendCommonCommand(COMMON_COMMAND_PARAMS, COMMON_COMMAND_PARAMS, err => {
                    if (err) {
                        console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendCommonCommand Successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0700
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0700
   * @tc.desc   test sendCommonCommand(callback) errcode 6600106
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSessionState(() => {
                try {
                    controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, err => {
                        if (err) {
                            console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600106);
                        } else {
                            console.info('sendCommonCommand Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0800
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0800
   * @tc.desc   test sendCommonCommand(callback) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, err => {
                        if (err) {
                            console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('sendCommonCommand Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0100
   * @tc.desc   test getExtras(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(async () => {
                await controller.getExtras().then(() => {
                    console.info('getExtras Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0200
   * @tc.desc   test getExtras(promise) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(async () => {
                await controller.getExtras().then(() => {
                    console.info('getExtras Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0300
   * @tc.desc   test getExtras(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getExtras(err => {
                        if (err) {
                            console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getExtras Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0400
   * @tc.desc   test getExtras(callback) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getExtras(err => {
                        if (err) {
                            console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getExtras Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0100
   * @tc.desc   test on('extrasChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('extrasChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0200
   * @tc.desc   test on('extrasChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			try {
				controller.on('extrasChange', callback1, callback2);
                expect().assertFail();
			} catch (err) {
				expect(err.code == 401).assertTrue();
			}
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0300
   * @tc.desc   test on('extrasChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('extrasChange', INVALID_STRING);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0400
   * @tc.desc   test on('extrasChange') errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('extrasChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_ERRORCODE_0100
   * @tc.desc   test off('extrasChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('extrasChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0100
   * @tc.desc   test on('queueItemsChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('queueItemsChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0200
   * @tc.desc   test on('queueItemsChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('queueItemsChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0300
   * @tc.desc   test on('queueItemsChange') errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('queueItemsChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_ERRORCODE_0100
   * @tc.desc   test off('queueItemsChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('queueItemsChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0100
   * @tc.desc   test on('queueTitleChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('queueTitleChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0200
   * @tc.desc   test on('queueTitleChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('queueTitleChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0300
   * @tc.desc   test on('queueTitleChange') errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('queueTitleChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_ERRRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_ERRRORCODE_0100
   * @tc.desc   test off('queueTitleChange') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_ERRRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('queueTitleChange');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0100
   * @tc.desc   test skipToQueueItem(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await controller.skipToQueueItem('invalid param').then(() => {
                console.info('skipToQueueItem Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0200
   * @tc.desc   test skipToQueueItem(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await controller.skipToQueueItem(QUEUE_ITEM_ID).then(() => {
                    console.info('skipToQueueItem Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0300
   * @tc.desc   test skipToQueueItem(promise) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(async () => {
                await controller.skipToQueueItem(QUEUE_ITEM_ID).then(() => {
                    console.info('skipToQueueItem Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0400
   * @tc.desc   test skipToQueueItem(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.skipToQueueItem('invalid param', err => {
                    if (err) {
                        console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('skipToQueueItem Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0500
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0500
   * @tc.desc   test skipToQueueItem(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.skipToQueueItem(QUEUE_ITEM_ID, err => {
                        if (err) {
                            console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('skipToQueueItem Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0600
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0600
   * @tc.desc   test skipToQueueItem(callback) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.skipToQueueItem(QUEUE_ITEM_ID, err => {
                        if (err) {
                            console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('skipToQueueItem Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0100
   * @tc.desc   test getAVQueueItems(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await controller.getAVQueueItems().then(() => {
                    console.info('getAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0200
   * @tc.desc   test getAVQueueItems(promise) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(async () => {
                await controller.getAVQueueItems().then(() => {
                    console.info('getAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0300
   * @tc.desc   test getAVQueueItems(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(() => {
                try {
                    controller.getAVQueueItems(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getAVQueueItems Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0400
   * @tc.desc   test getAVQueueItems(callback) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getAVQueueItems(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getAVQueueItems Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0100
   * @tc.desc   test getAVQueueTitle(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await controller.getAVQueueTitle().then(() => {
                    console.info('getAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0200
   * @tc.desc   test getAVQueueTitle(promise) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(async () => {
                await controller.getAVQueueTitle().then(() => {
                    console.info('getAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0300
   * @tc.desc   test getAVQueueTitle(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(() => {
                try {
                    controller.getAVQueueTitle(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getAVQueueTitle Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0400
   * @tc.desc   test getAVQueueTitle(callback) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getAVQueueTitle(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getAVQueueTitle Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0100
   * @tc.desc   test getAVPlaybackStateSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVPlaybackStateSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0200
   * @tc.desc   test getAVPlaybackStateSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVPlaybackStateSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0100
   * @tc.desc   test getAVMetadataSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVMetadataSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0200
   * @tc.desc   test getAVMetadataSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVMetadataSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0100
   * @tc.desc   test getAVQueueTitleSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVQueueTitleSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0200
   * @tc.desc   test getAVQueueTitleSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVQueueTitleSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0100
   * @tc.desc   test getAVQueueItemsSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVQueueItemsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0200
   * @tc.desc   test getAVQueueItemsSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVQueueItemsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_0100
   * @tc.desc   test getOutputDeviceSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getOutputDeviceSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getOutputDeviceSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0100
   * @tc.desc   test isActiveSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.isActiveSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0200
   * @tc.desc   test isActiveSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.isActiveSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0100
   * @tc.desc   test getValidCommandsSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getValidCommandsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0200
   * @tc.desc   test getValidCommandsSync(async) errcode 6600103
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getValidCommandsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0200
         * @tc.desc   test on('activeStateChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('activeStateChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0300
         * @tc.desc   test on('activeStateChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHAGE_CALLBACK_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('activeStateChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0100
         * @tc.desc   test off('activeStateChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.off('activeStateChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0200
         * @tc.desc   test off('activeStateChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHAGE_CALLBACK_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidController('activeStateChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0100
         * @tc.desc   test on('validCommandChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('validCommandChange', INVALID_STRING);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0200
         * @tc.desc   test on('validCommandChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidController('validCommandChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0300
         * @tc.desc   test on('validCommandChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_CALLBACK_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.on('validCommandChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0100
         * @tc.desc   test off('validCommandChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.off('validCommandChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0200
         * @tc.desc   test off('validCommandChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_CALLBACK_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidController('validCommandChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0100
         * @tc.desc   test off('metadataChange') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                controller.off('metadataChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0200
         * @tc.desc   test off('metadataChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_CALLBACK_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidController('metadataChange')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHANGE_0101
         * @tc.name      : ONACTIVESTATECHANGE_0100
         * @tc.desc      : Testing active State callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHANGE_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let flag = false;
            controller.on('activeStateChange', (callback) => {
                if (callback) {
                    console.info('TestLog: Active state change successful');
                    flag = true;
                } else {
                    console.info('TestLog: Active state change error');
                }
            });
            
            await session.deactivate().then(() => {
                console.info('TestLog: session deactivate success');
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: ActiveStateChange callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: ActiveStateChange callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0101
         * @tc.name      : OFFACTIVESTATECHANGE_0101
         * @tc.desc      : Testing active State callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let flag = true;

            function callback1(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration2 success');
                    flag = false;
                }
            }

            controller.on('activeStateChange', callback1);

            controller.on('activeStateChange', callback2);

            controller.off('activeStateChange');

            await sleep(500);

            if (flag) {
                console.info('TestLog: activeStateChange command unRegistration success')
                expect(true).assertTrue();
            } else {
                console.info('TestLog: activeStateChange command unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0200
         * @tc.name      : OFFACTIVESTATECHANGE_0200
         * @tc.desc      : Testing active State callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    expect(true).assertTrue();
                }
            }

            controller.on('activeStateChange', callback1);

            controller.on('activeStateChange', callback2);

            controller.off('activeStateChange', callback1);
            await sleep(500);

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_0101
         * @tc.name      : ONVALIDCOMMANDCHANGE_0101
         * @tc.desc      : Testing valid command change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let flag = false;
            controller.on('validCommandChange', (callback) => {
                if (callback.length > 0 && callback[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    flag = true;
                } else {
                    console.info('TestLog: Get valid command failed');
                    console.info(`TestLog: Valid command size is:${callback.length}`);
                    for(var i = 0; i < callback.length; i++) {
                        console.info(callback[i]);
                    }
                    console.info('TestLog: Valid Command change error');
                }
            });

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: ValidCommandChange callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: ValidCommandChange callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0201
         * @tc.name      : OFFVALIDCOMMANDCHANGE_0201
         * @tc.desc      : Testing valid command change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            function callback1(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    expect(false).assertTrue();
                }
            }

            controller.on('validCommandChange', callback1);

            controller.on('validCommandChange', callback2);

            controller.off('validCommandChange', callback1);

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            await sleep(500);
            done();
        })
        
    /* *
      * @tc.number    : SUB_MULTIMEDIA_AVSESSION_MANAGER_OFFSESSIONDESTROY_0101
      * @tc.name      : OFFSESSIONDESTROY_0101
      * @tc.desc      : Testing session destroy Callback unRegistration
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level2
      */
    it('SUB_MULTIMEDIA_AVSESSION_MANAGER_OFFSESSIONDESTROY_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let flag = true;
        function callback1(callback) {
            console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
            flag = false;
        }

        function callback2(callback) {
            console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
            flag = false;
        }

        controller.on('sessionDestroy', callback1);

        controller.on('sessionDestroy', callback2);

        controller.off('sessionDestroy');

        await sleep(500);

        if (flag) {
            console.info('TestLog: Session destroy callback unRegistration successful');
            expect(true).assertTrue();
        } else {
            console.info('TestLog: Session destroy callback unRegistration failed');
            expect(false).assertTrue();
        }
        done();
    })
    })
}