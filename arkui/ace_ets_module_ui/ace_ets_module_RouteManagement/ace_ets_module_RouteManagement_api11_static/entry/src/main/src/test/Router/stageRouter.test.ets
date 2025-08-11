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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
interface Data2 {
  data3: int[]
}
interface Param {
  data1: string,
  data2: Data2
}
interface Param1 {
  data1: string
}
export default function stageRouterTest() {
  describe('stageRouterTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stageRouter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get stageRouter state success " + JSON.stringify(pages));
        if (!("stageRouter" == pages.name)) {
          console.info("get stageRouter state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push stageRouter page error: " + err);
      }
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('testrouterstage0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0001 START');
      let result: Promise<void>
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/pushUrlasync.ets',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as Param
      }
      try {
        result = (routerPush.pushUrl(options) as Promise<void>)
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0001 END');
      done();
    });

    // it('testrouterstage0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0002 START');
    //   let options: router.RouterOptions = {
    //     url: 'MainAbility/pages/pushUrlasync.ets',
    //     params: {
    //       data1: 'message',
    //       data2: {
    //         data3: [123, 456, 789]
    //       }
    //     } as Param
    //   }
    //   try {
    //     let result = routerPush.pushUrl(options, (err: BusinessError<void>|null) => {
    //       if (err) {
    //         console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('pushUrl success');
    //     });
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(err));
    //   }
    //   console.info('testrouterstage0002 END');
    //   done();
    // });

    // it('testrouterstage0003', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0003 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushUrl({
    //       url: 'MainAbility/pages/pushUrlasync.ets',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         }
    //       } as Param
    //     } as router.RouterOptions, router.RouterMode.Standard)
    //       .then(() => {
    //       })
    //       .catch((err: Error) => {
    //         console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
    //       }) as Promise<void>
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0003 END');
    //   done();
    // });
    //
    // it('testrouterstage0004', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0004 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushUrl({
    //       url: 'MainAbility/pages/pushUrlasync.ets',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         }
    //       } as Param
    //     } as router.RouterOptions, router.RouterMode.Standard) as Promise<void>
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0004 END');
    //   done();
    // });
    //
    it('testrouterstage0005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0005 START');
      try {
        let result = routerPush.replaceUrl({
          url: 'MainAbility/pages/pushUrlasync.ets',
          params: {
            data1: 'message'
          } as Param1
        } as router.RouterOptions)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        // console.error("push button page error " + JSON.stringify(result));
      }
      console.info('testrouterstage0005 END');
      done();
    });
    //
    // it('testrouterstage0006', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0006 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceUrl({
    //       url: 'MainAbility/pages/pushUrlasync.ets',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.RouterOptions, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0006 END');
    //   done();
    // });
    //
    // it('testrouterstage0007', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0007 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceUrl({
    //       url: 'MainAbility/pages/pushUrlasync.ets',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.RouterOptions, router.RouterMode.Standard) as Promise<void>
    //       .then(() => {
    //       })
    //       .catch((err: Error) => {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //       })
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0007 END');
    //   done();
    // });
    //
    // it('testrouterstage0008', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0008 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceUrl({
    //       url: 'MainAbility/pages/pushUrlasync.ets',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.RouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0008 END');
    //   done();
    // });
    //
    // it('testrouterstage0009', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0009 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.back({
    //       url: 'MainAbility/pages/pushUrlasync.ets'
    //     })
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0009 END');
    //   done();
    // });
    //
    // it('testrouterstage0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0010 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.clear()
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0010 END');
    //   done();
    // });
    //
    it('testrouterstage0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0011 START');
      try {
        let result = routerPush.getLength()
        expect(typeof (result)).assertEqual('string');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testrouterstage0011 END');
      done();
    });
    //
    // it('testrouterstage0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0012 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.getState()
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0012 END');
    //   done();
    // });
    //
    it('testrouterstage0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0013 START');
      try {
        // let result = routerPush.showAlertBeforeBackPage({
        //   message: 'Message Info'
        // });
        // expect(result).assertUndefined();
        // console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testrouterstage0013 END');
      done();
    });

    it('testrouterstage0014', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0014 START');
      try {
        // let result = routerPush.hideAlertBeforeBackPage()
        // expect(result).assertUndefined();
        // console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testrouterstage0014 END');
      done();
    });

    // it('testrouterstage0015', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0015 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.getParams()
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0015 END');
    //   done();
    // });
    //
    // it('testrouterstage0016', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0016 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         }
    //       } as Param
    //     } as router.NamedRouterOptions) as Promise<void>
    //       .then(() => {
    //       })
    //       .catch((err: Error) => {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //       })
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0016 END');
    //   done();
    // });
    //
    // it('testrouterstage0017', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0017 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         } as Param
    //       }
    //     } as router.NamedRouterOptions, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0017 END');
    //   done();
    // });
    //
    // it('testrouterstage0018', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0018 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         }
    //       } as Param
    //     } as router.NamedRouterOptions, router.RouterMode.Standard) as Promise<void>
    //       .then(() => {
    //       })
    //       .catch((err: Error) => {
    //         console.error(`replaceUrl failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
    //       })
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0018 END');
    //   done();
    // });
    //
    // it('testrouterstage0019', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0019 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.pushNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message',
    //         data2: {
    //           data3: [123, 456, 789]
    //         }
    //       } as Param
    //     } as router.NamedRouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0019 END');
    //   done();
    // });
    //
    it('testrouterstage0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let routerPush = AppStorage.get<Router>("router") as Router;
      console.info('testrouterstage0020 START');
      try {
        let result = routerPush.replaceNamedRoute({
          name: 'pushUrl',
          params: {
            data1: 'message'
          } as Param1
        } as router.NamedRouterOptions)
          .then(() => {
          })
          .catch((err: Error) => {
            console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        expect(typeof (result)).assertEqual('object');
        console.info("push button page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('testrouterstage0020 END');
      done();
    });

    // it('testrouterstage0021', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0021 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.NamedRouterOptions, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0021 END');
    //   done();
    // });
    //
    // it('testrouterstage0022', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0022 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.NamedRouterOptions, router.RouterMode.Standard) as Promise<void>
    //       .then(() => {
    //       })
    //       .catch((err: Error) => {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //       })
    //     expect(typeof (result)).assertEqual('object');
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0022 END');
    //   done();
    // });
    //
    // it('testrouterstage0023', Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let routerPush = AppStorage.get<Router>("router") as Router;
    //   console.info('testrouterstage0023 START');
    //   let result: Promise<void>
    //   try {
    //     result = routerPush.replaceNamedRoute({
    //       name: 'pushUrl',
    //       params: {
    //         data1: 'message'
    //       } as Param1
    //     } as router.NamedRouterOptions, router.RouterMode.Standard, (err: BusinessError<void>|null): void => {
    //       if (err) {
    //         console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
    //         return;
    //       }
    //       console.info('replaceUrl success');
    //     }) as Promise<void>;
    //     expect(result).assertUndefined();
    //     console.info("push button page success " + JSON.stringify(result));
    //   } catch (err) {
    //     console.error("push button page error " + JSON.stringify(result));
    //   }
    //   console.info('testrouterstage0023 END');
    //   done();
    // });


  })
}