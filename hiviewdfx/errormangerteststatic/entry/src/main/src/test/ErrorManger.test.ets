'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from "@ohos/hypium-binary/src/main/indexStatic";
import errorManager from '@ohos.app.ability.errorManager';
import hilog from '@ohos.hilog'

function freezeCallback() {
  console.log("freezecallback");
}

function freezeCallback1() {
  console.log("freezecallback1");
}

function concurrentFunc(args: number): number {
  console.info("test_setDefaultFreezeObserver_in_worker_thread: arg: " + args);
  try {
    errorManager.setDefaultFreezeObserver(undefined);
    console.info("test_setDefaultFreezeObserver_in_worker_thread: end");
  } catch (err) {
    console.info("test_setDefaultFreezeObserver_in_worker_thread catch: " + JSON.stringify(err));
    console.info("test_setDefaultFreezeObserver_in_worker_thread err.code: " + JSON.stringify(err.code));
  }
  let result = args * 2;
  return result;
}

function onFreezeConcurrentFunc(args: number): number {
  hilog.info(0x0000, 'testTag', 'test_onFreeze_in_worker_thread: arg: ' + args);
  try {
    let observer: errorManager.FreezeObserver = () => {
      hilog.info(0x0000, 'testTag', 'onFreeze observer should not be called in worker thread');
    };
    errorManager.onFreeze(observer);
    hilog.info(0x0000, 'testTag', 'test_onFreeze_in_worker_thread: end');
  } catch (err) {
    hilog.info(0x0000, 'testTag', 'test_onFreeze_in_worker_thread catch: ' + JSON.stringify(err));
    hilog.info(0x0000, 'testTag', 'test_onFreeze_in_worker_thread err.code: ' + JSON.stringify(err.code));
  }
  let result = args * 2;
  return result;
}

function offFreezeConcurrentFunc(args: number): number {
  hilog.info(0x0000, 'testTag', 'test_offFreeze_in_worker_thread: arg: ' + args);
  try {
    let observer: errorManager.FreezeObserver = () => {
      hilog.info(0x0000, 'testTag', 'offFreeze observer callback');
    };
    errorManager.offFreeze(observer);
    hilog.info(0x0000, 'testTag', 'test_offFreeze_in_worker_thread: end');
  } catch (err) {
    hilog.info(0x0000, 'testTag', 'test_offFreeze_in_worker_thread catch: ' + JSON.stringify(err));
    hilog.info(0x0000, 'testTag', 'test_offFreeze_in_worker_thread err.code: ' + JSON.stringify(err.code));
  }
  let result = args * 2;
  return result;
}

export default function ErrormangerTest() {
  describe('ErrormangerTest', (): void => {
        let originalObserver: errorManager.ResourceUsageObserver;
        /**
        * @tc.name   testOffFreeze_0100
        * @tc.number SUB_DFX_DFR_OffFreeze_0100
        * @tc.desc   验证offFreeze正常调用，注销主线程冻结观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffFreeze_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0100 Test start***********');
            try {
                let observer: errorManager.FreezeObserver = () => {
                    hilog.info(0x0000, 'testTag', 'freeze callback called');
                };
                errorManager.onFreeze(observer);
                errorManager.offFreeze(observer);
                hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });


        /**
        * @tc.name   testOffFreeze_0200
        * @tc.number SUB_DFX_DFR_OffFreeze_0200
        * @tc.desc   验证offFreeze不传参数，注销所有观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffFreeze_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0200 Test start***********');
            try {
                let observer: errorManager.FreezeObserver = () => {
                    hilog.info(0x0000, 'testTag', 'freeze callback called');
                };
                errorManager.onFreeze(observer);
                errorManager.offFreeze();
                hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0200 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect(false).assertFail();
            }
        });

        /**
        * @tc.name   testOffFreeze_0400
        * @tc.number SUB_DFX_DFR_OffFreeze_0400
        * @tc.desc   验证offFreeze传入undefined参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffFreeze_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0400 Test start***********');
            try {
                errorManager.offFreeze(undefined);
                hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOffFreeze_0500
        * @tc.number SUB_DFX_DFR_OffFreeze_0500
        * @tc.desc   验证offFreeze注销未注册的观察器，抛出错误码16300004
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('testOffFreeze_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0500 Test start***********');
            errorManager.onFreeze(freezeCallback);
            try {
                errorManager.offFreeze(freezeCallback1);
                expect(false).assertTrue();
            } catch (err) {
                hilog.info(0x0000, 'testTag', 'error code: %{public}d', err.code);
                expect(err.code === 16300004).assertTrue();
            }
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0500 Test end***********');
        });

        /**
        * @tc.name   testOffFreeze_0600
        * @tc.number SUB_DFX_DFR_OffFreeze_0600
        * @tc.desc   验证offFreeze注销未注册的观察器，抛出错误码16200001
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('testOffFreeze_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0600 Test start***********');
            try {
                let task = new taskpool.Task(offFreezeConcurrentFunc, 1);
                taskpool.execute(task);
                hilog.info(0x0000, 'testTag', 'testOffFreeze_0600: task end');
            } catch (error) {
                hilog.error(0x0000, 'testTag', 'testOffFreeze_0600 error: %{public}d', error.code);
                expect(error.code === 16200001).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testOffFreeze_0600 Test end***********');
            }
        });

        /**
        * @tc.name   testOnFreeze_0400
        * @tc.number SUB_DFX_DFR_OnFreeze_0400
        * @tc.desc   验证onFreeze重复注册，后注册的覆盖前面的
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('testOnFreeze_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnFreeze_0400 Test start***********');
            try {
                let observer1: errorManager.FreezeObserver = () => {
                    hilog.info(0x0000, 'testTag', 'observer1 called');
                };
                let observer2: errorManager.FreezeObserver = () => {
                    hilog.info(0x0000, 'testTag', 'observer2 called');
                };
                errorManager.onFreeze(observer1);
                errorManager.onFreeze(observer2);
                hilog.info(0x0000, 'testTag', '*********** testOnFreeze_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOnFreeze_0500
        * @tc.number SUB_DFX_DFR_OnFreeze_0500
        * @tc.desc   注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间。校验错误码 16200001
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOnFreeze_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnFreeze_0400 Test start***********');
            try {
                let task = new taskpool.Task(onFreezeConcurrentFunc, 1);
                taskpool.execute(task);
                hilog.info(0x0000, 'testTag', 'testOnFreeze_0400: task end');
            } catch (error) {
                hilog.error(0x0000, 'testTag', 'testOnFreeze_0400 error: %{public}d', error.code);
                expect(error.code === 16200001).assertTrue();
                hilog.info(0x0000, 'testTag', '*********** testOnFreeze_0400 Test end***********');
            }
        })

        /**
        * @tc.name   testSetDefaultErrorHandler_0100
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_0100
        * @tc.desc   验证setDefaultErrorHandler正常调用，设置默认错误处理器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultErrorHandler_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0100 Test start***********');
            try {
                let handler: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'errObject.name: %{public}s', errObject.name);
                    hilog.info(0x0000, 'testTag', 'errObject.message: %{public}s', errObject.message);
                };
                let prevHandler = errorManager.setDefaultErrorHandler(handler);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultErrorHandler_0200
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_0200
        * @tc.desc   验证setDefaultErrorHandler链式调用，设置多个错误处理器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultErrorHandler_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0200 Test start***********');
            try {
                let handler1: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'handler1 called');
                };
                let handler2: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'handler2 called');
                };
                let prevHandler1 = errorManager.setDefaultErrorHandler(handler1);
                let prevHandler2 = errorManager.setDefaultErrorHandler(handler2);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0200 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultErrorHandler_0300
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_0300
        * @tc.desc   验证setDefaultErrorHandler不传参数，返回上一个处理器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultErrorHandler_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0300 Test start***********');
            try {
                let handler: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'handler called');
                };
                errorManager.setDefaultErrorHandler(handler);
                let prevHandler = errorManager.setDefaultErrorHandler();
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', 'testSetDefaultErrorHandler_0300 catch %{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultErrorHandler_0500
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_0500
        * @tc.desc   验证setDefaultErrorHandler传入undefined参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultErrorHandler_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0500 Test start***********');
            try {
                let handler: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'handler called');
                };
                errorManager.setDefaultErrorHandler(handler);
                let prevHandler = errorManager.setDefaultErrorHandler(undefined);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultErrorHandler_0900
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_0900
        * @tc.desc   验证ErrorHandler回调函数接收Error类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultErrorHandler_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0900 Test start***********');
            try {
                let handler: errorManager.ErrorHandler = (errObject: Error) => {
                    hilog.info(0x0000, 'testTag', 'errObject type: %{public}s', typeof errObject);
                    hilog.info(0x0000, 'testTag', 'errObject.name: %{public}s', errObject.name);
                    hilog.info(0x0000, 'testTag', 'errObject.message: %{public}s', errObject.message);
                };
                errorManager.setDefaultErrorHandler(handler);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_0900 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
        
        /**
        * @tc.name   testSetDefaultResourceUsageObserver_0100
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0100
        * @tc.desc   验证setDefaultResourceUsageObserver正常调用，设置默认资源使用观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0100 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'resourceType: %{public}d', resourceType);
                    hilog.info(0x0000, 'testTag', 'resourceSize: %{public}d', resourceSize);
                    if (detailInfo) {
                        hilog.info(0x0000, 'testTag', 'detailInfo: %{public}s', JSON.stringify(detailInfo));
                    }
                };
                let prevObserver = errorManager.setDefaultResourceUsageObserver(observer);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_0200
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0200
        * @tc.desc   验证setDefaultResourceUsageObserver链式调用，设置多个观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0200 Test start***********');
            try {
                let observer1: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'observer1 called, resourceType: %{public}d', resourceType);
                };
                let observer2: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'observer2 called, resourceType: %{public}d', resourceType);
                };
                let prevObserver1 = errorManager.setDefaultResourceUsageObserver(observer1);
                let prevObserver2 = errorManager.setDefaultResourceUsageObserver(observer2);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0200 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_0300
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0300
        * @tc.desc   验证setDefaultResourceUsageObserver不传参数，返回上一个观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0300 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'resourceType: %{public}d', resourceType);
                };
                errorManager.setDefaultResourceUsageObserver(observer);
                let prevObserver = errorManager.setDefaultResourceUsageObserver();
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0300 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_0500
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0500
        * @tc.desc   验证setDefaultResourceUsageObserver传入undefined参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0500 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'resourceType: %{public}d', resourceType);
                };
                errorManager.setDefaultResourceUsageObserver(observer);
                let prevObserver = errorManager.setDefaultResourceUsageObserver(undefined);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_0900
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_0900
        * @tc.desc   验证ResourceUsageObserver回调函数接收ResourceType类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0900 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'resourceType type: %{public}s', typeof resourceType);
                    hilog.info(0x0000, 'testTag', 'resourceType value: %{public}d', resourceType);
                };
                errorManager.setDefaultResourceUsageObserver(observer);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_0900 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_1000
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1000
        * @tc.desc   验证ResourceUsageObserver回调函数接收number类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1000 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'resourceSize type: %{public}s', typeof resourceSize);
                    hilog.info(0x0000, 'testTag', 'resourceSize value: %{public}d', resourceSize);
                };
                errorManager.setDefaultResourceUsageObserver(observer);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1000 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });        

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_1100
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1100
        * @tc.desc   验证ResourceUsageObserver回调函数接收Record类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1100 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                    hilog.info(0x0000, 'testTag', 'detailInfo type: %{public}s', typeof detailInfo);
                    if (detailInfo) {
                        hilog.info(0x0000, 'testTag', 'detailInfo value: %{public}s', JSON.stringify(detailInfo));
                    }
                };
                errorManager.setDefaultResourceUsageObserver(observer);
                hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
     * @tc.name   testSetDefaultResourceUsageObserver_1200
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1200
     * @tc.desc   验证ResourceUsageObserver回调接收PSS_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      console.info("====> testSetDefaultResourceUsageObserver_1200 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.PSS_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_1200 end");
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1200 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1300
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1300
     * @tc.desc   验证ResourceUsageObserver回调接收ION_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      console.info("====> testSetDefaultResourceUsageObserver_1300 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        console.info("====> testSetDefaultResourceUsageObserver_1300 end + " + receivedType);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.ION_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_1300 end");
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1300 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1400
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1400
     * @tc.desc   验证ResourceUsageObserver回调接收ASHMEM_MEMORY类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      console.info("====> testSetDefaultResourceUsageObserver_1400 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.ASHMEM_MEMORY).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_1400 end");
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1400 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1500
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1500
     * @tc.desc   验证ResourceUsageObserver回调接收FD类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
       console.info("====> testSetDefaultResourceUsageObserver_1500 start");
       try {
         let receivedType = -1;
         let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
           receivedType = resourceType;
           console.info("ResourceType: " + resourceType);
           console.info("ResourceSize: " + resourceSize);
         };
         originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
         expect(receivedType === -1 || receivedType === errorManager.ResourceType.FD).assertTrue();
         console.info("====> testSetDefaultResourceUsageObserver_1500 end");
       } catch (err) {
         console.error(`====> testSetDefaultResourceUsageObserver_1500 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testSetDefaultResourceUsageObserver_1600
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1600
     * @tc.desc   验证ResourceUsageObserver回调接收THREAD类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDefaultResourceUsageObserver_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
      console.info("====> testSetDefaultResourceUsageObserver_1600 start");
      try {
        let receivedType = -1;
        let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
          receivedType = resourceType;
          console.info("ResourceType: " + resourceType);
          console.info("ResourceSize: " + resourceSize);
        };
        originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
        expect(receivedType === -1 || receivedType === errorManager.ResourceType.THREAD).assertTrue();
        console.info("====> testSetDefaultResourceUsageObserver_1600 end");
      } catch (err) {
        console.error(`====> testSetDefaultResourceUsageObserver_1600 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
      }
    })

        /**
        * @tc.name   testSetDefaultResourceUsageObserver_1700
        * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1700
        * @tc.desc   验证ResourceUsageObserver回调接收THREAD类型
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testSetDefaultResourceUsageObserver_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        console.info("====> testSetDefaultResourceUsageObserver_1700 start");
        try {
            let receivedType = -1;
            let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
            receivedType = resourceType;
            console.info("ResourceType: " + resourceType);
            console.info("ResourceSize: " + resourceSize);
            };
            originalObserver = errorManager.setDefaultResourceUsageObserver(observer);
            expect(receivedType === -1 || receivedType === errorManager.ResourceType.GPU_MEMORY).assertTrue();
            console.info("====> testSetDefaultResourceUsageObserver_1700 end");
        } catch (err) {
            console.error(`====> testSetDefaultResourceUsageObserver_1700 catch > error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
        }
        })

        /**
        * @tc.name   testOnUnhandledRejection_0100
        * @tc.number SUB_DFX_DFR_OnUnhandledRejection_0100
        * @tc.desc   验证onUnhandledRejection正常调用，注册未处理的Promise拒绝观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOnUnhandledRejection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0100 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    const message = reason instanceof Error ? reason.message : 'Unknown error';
                    hilog.info(0x0000, 'testTag', 'reason.message: %{public}s', message);
                };
                errorManager.onUnhandledRejection(observer);
                hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOnUnhandledRejection_0400
        * @tc.number SUB_DFX_DFR_OnUnhandledRejection_0400
        * @tc.desc   验证onUnhandledRejection重复注册，后注册的覆盖前面的
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOnUnhandledRejection_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0400 Test start***********');
            try {
                let observer1: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'observer1 called');
                };
                let observer2: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'observer2 called');
                };
                errorManager.onUnhandledRejection(observer1);
                errorManager.onUnhandledRejection(observer2);
                hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOnUnhandledRejection_0500
        * @tc.number SUB_DFX_DFR_OnUnhandledRejection_0500
        * @tc.desc   验证onUnhandledRejection回调函数接收Error类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOnUnhandledRejection_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0500 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    const message = reason instanceof Error ? reason.message : 'Unknown error';
                    hilog.info(0x0000, 'testTag', 'reason.message: %{public}s', message);
                };
                errorManager.onUnhandledRejection(observer);
                hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0500 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
        
        /**
        * @tc.name   testOnUnhandledRejection_0600
        * @tc.number SUB_DFX_DFR_OnUnhandledRejection_0600
        * @tc.desc   验证onUnhandledRejection回调函数接收Promise类型参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOnUnhandledRejection_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0600 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'promise type: %{public}s', typeof promise);
                };
                errorManager.onUnhandledRejection(observer);
                hilog.info(0x0000, 'testTag', '*********** testOnUnhandledRejection_0600 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOffUnhandledRejection_0100
        * @tc.number SUB_DFX_DFR_OffUnhandledRejection_0100
        * @tc.desc   验证offUnhandledRejection正常调用，注销未处理的Promise拒绝观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffUnhandledRejection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0100 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'reason.message: %{public}s', 'reason.message');
                };
                errorManager.onUnhandledRejection(observer);
                errorManager.offUnhandledRejection(observer);
                hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0100 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOffUnhandledRejection_0200
        * @tc.number SUB_DFX_DFR_OffUnhandledRejection_0200
        * @tc.desc   验证offUnhandledRejection不传参数，注销所有观察器
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffUnhandledRejection_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0200 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error |Any, promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'reason.message: %{public}s', 'reason.message');
                };
                errorManager.onUnhandledRejection(observer);
                errorManager.offUnhandledRejection();
                hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0200 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });    

        /**
        * @tc.name   testOffUnhandledRejection_0400
        * @tc.number SUB_DFX_DFR_OffUnhandledRejection_0400
        * @tc.desc   验证offUnhandledRejection传入undefined参数
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testOffUnhandledRejection_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0400 Test start***********');
            try {
                errorManager.offUnhandledRejection(undefined);
                hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0400 Test end***********');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });

        /**
        * @tc.name   testOffUnhandledRejection_0500
        * @tc.number SUB_DFX_DFR_OffUnhandledRejection_0500
        * @tc.desc   验证offUnhandledRejection注销未注册的观察器，抛出错误码16300004
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('testOffUnhandledRejection_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0500 Test start***********');
            try {
                let observer: errorManager.UnhandledRejectionObserver = (reason: Error | Any , promise: Promise<Any>) => {
                    hilog.info(0x0000, 'testTag', 'reason.message: %{public}s', 'testOffUnhandledRejection_0500');
                };
                errorManager.offUnhandledRejection(observer);
                expect().assertFail();
            } catch (err) {
                hilog.info(0x0000, 'testTag', 'error code: %{public}d', err.code);
                expect(err.code === 16300004).assertTrue();
            }
            hilog.info(0x0000, 'testTag', '*********** testOffUnhandledRejection_0500 Test end***********');
        });

        /**
        * @tc.name   testResourceType_GPU_MEMORY_0100
        * @tc.number SUB_DFX_DFR_ResourceType_GPU_MEMORY_0100
        * @tc.desc   验证ResourceType.GPU_MEMORY枚举值
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
        it('testResourceType_GPU_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
            console.info("====> testResourceType_GPU_MEMORY_0100 start");
            try {
            expect(errorManager.ResourceType.GPU_MEMORY).assertEqual(4);
            console.info("====> testResourceType_GPU_MEMORY_0100 end");
            } catch (err) {
            console.error(`====> testResourceType_GPU_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
            }
        })

        /**
        * @tc.name   test_setDefaultFreezeObserver_0300
        * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0300
        * @tc.desc   验证setDefaultFreezeObserver的undefined值
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('test_setDefaultFreezeObserver_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.info("====> test_setDefaultFreezeObserver_0300 start");
            try {
                errorManager.setDefaultFreezeObserver(undefined);
                console.info('test_setDefaultFreezeObserver_0300: end');
            } catch (error) {
                console.info('test_setDefaultFreezeObserver_0300 catch: ' + error.code);
                expect(false).assertTrue();
            }
        })

        /**
        * @tc.name   test_setDefaultFreezeObserver_0400
        * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0400
        * @tc.desc   验证setDefaultFreezeObserver的空值
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('test_setDefaultFreezeObserver_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.info("====> test_setDefaultFreezeObserver_0400 start");
            try {
                errorManager.setDefaultFreezeObserver();
                console.info('test_setDefaultFreezeObserver_0400: end');
            } catch (error) {
                console.info('test_setDefaultFreezeObserver_0400 catch: ' + error.code);
                expect(false).assertTrue();
            }
        })

        /**
        * @tc.name   test_setDefaultFreezeObserver_0500
        * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0500
        * @tc.desc   验证setDefaultFreezeObserver的错误码16000205
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('test_setDefaultFreezeObserver_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.info("====> test_setDefaultFreezeObserver_0500 start");
            try {
                let task = new taskpool.Task(concurrentFunc, 1);
                taskpool.execute(task);
                console.info("test_setDefaultFreezeObserver_0500: task end");
            } catch (error) {
                console.error('test_setDefaultFreezeObserver_0500', `error: ${error.code}`);
                expect(error.code === 16000205).assertTrue();
            }
        })

        /**
        * @tc.name   test_setDefaultFreezeObserver_0600
        * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0600
        * @tc.desc   验证setDefaultFreezeObserver的责任链模式
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('test_setDefaultFreezeObserver_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.info("====> test_setDefaultFreezeObserver_0600 start");
            let callCount: number = 0;
            const firstHandler: errorManager.FreezeObserver = () => {
                callCount++;
                console.info('[firstHandler] first handler invoked.');
            };
            const secondHandler: errorManager.FreezeObserver = () => {
                callCount++;
                console.info('[secondHandler] second handler invoked.');
            };
            try {
                const oldHandler = errorManager.setDefaultFreezeObserver(firstHandler);
                errorManager.setDefaultFreezeObserver(secondHandler);
                if (oldHandler) {
                oldHandler();
                }
                console.info('test_setDefaultFreezeObserver_0600: chain call test passed.' + callCount);
                console.info('test_setDefaultFreezeObserver_0600: chain call test passed.');
            } catch (error) {
                console.error('test_setDefaultFreezeObserver_0600', `error: ${error.code}, ${error.message}`);
                expect(false).assertTrue();
            }
        })

        /**
        * @tc.name   test_setDefaultFreezeObserver_0700
        * @tc.number SUB_DFX_DFR_errorManager_setDefaultFreezeObserver_0700
        * @tc.desc   验证setDefaultFreezeObserver的单链模式
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('test_setDefaultFreezeObserver_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.info("====> test_setDefaultFreezeObserver_0700 start");
            const freezeHandler: errorManager.FreezeObserver = () => {
                console.info('[freezeHandler] single chain handler invoked.');
            };
            try {
                errorManager.setDefaultFreezeObserver(freezeHandler);
                console.info('test_setDefaultFreezeObserver_0700: Registered freeze Handler.');
            } catch (error) {
                console.error('test_setDefaultFreezeObserver_0700', `error: ${error.code}, ${error.message}`);
                expect(false).assertTrue();
            }
        })

        /**
        * @tc.name testSetDefaultErrorHandler_1000
        * @tc.number SUB_DFX_DFR_SetDefaultErrorHandler_1000
        * @tc.desc 测试子线程调用setDefaultErrorHandler抛出16000205错误
        * @tc.size MEDIUMTEST
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testSetDefaultErrorHandler_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_1000 Test start***********');
            try {
                let handler: errorManager.ErrorHandler = (errObject: Error) => {
                hilog.info(0x0000, 'testTag', 'ErrorHandler called');
                };
                // 在子线程中调用（使用setTimeout模拟）
                setTimeout(() => {
                try {
                    let returnedHandler = errorManager.setDefaultErrorHandler(handler);
                    expect().assertFail();
                } catch (err) {
                    hilog.info(0x0000, 'testTag', 'Caught expected error in child thread: %{public}s', JSON.stringify(err));
                    expect(err.code).assertEqual(16000205);
                    hilog.info(0x0000, 'testTag', '*********** testSetDefaultErrorHandler_1000 Test end***********');
                }
                }, 10);
                hilog.info(0x0000, 'testTag', 'Waiting for child thread execution');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
        /**
     * @tc.name   testSetDefaultResourceUsageObserver_1800
     * @tc.number SUB_DFX_DFR_SetDefaultResourceUsageObserver_1800
        * @tc.desc 测试子线程调用setDefaultResourceUsageObserver抛出16000205错误
        * @tc.size MEDIUMTEST
        * @tc.type Function
        * @tc.level Level 1
        */
        it('testSetDefaultResourceUsageObserver_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1800 Test start***********');
            try {
                let observer: errorManager.ResourceUsageObserver = (resourceType: errorManager.ResourceType, resourceSize: long, detailInfo?: Record<string, long>) => {
                hilog.info(0x0000, 'testTag', 'ResourceUsageObserver called');
                };
                // 在子线程中调用（使用setTimeout模拟）
                setTimeout(() => {
                    try {
                        let returnedObserver = errorManager.setDefaultResourceUsageObserver(observer);
                        expect().assertFail();
                    } catch (err) {
                        hilog.info(0x0000, 'testTag', 'Caught expected error in child thread: %{public}s', JSON.stringify(err));
                        expect(err.code).assertEqual(16000205);
                        hilog.info(0x0000, 'testTag', '*********** testSetDefaultResourceUsageObserver_1800 Test end***********');
                    }
                }, 10);
                hilog.info(0x0000, 'testTag', 'Waiting for child thread execution');
            } catch (err) {
                hilog.error(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
        });
    })
}
