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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import fs from '@ohos.file.fs';
import Utils from './Util.test';

let domain: int = 0xA8A8; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'configEventPolicyTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function configEventPolicyTest() {
  describe('configEventPolicyTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testHiAppEventconfigEventPolicy001
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventconfigEventPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy001 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy001 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy002
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-policy为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 start`);
      let policy: hiAppEvent.EventPolicy = {};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy002 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy002 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy003
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-EventPolicy参数为空调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{}
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy003 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy003 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy004
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-存在多个policy调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 0,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 11,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `testHiAppEventconfigEventPolicy004 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue();
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy004 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy005
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-logType范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 100,
        },
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy005 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy006
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-sampleIntervale范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleInterval": 501,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy006 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy007
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "ignoreStartupTime": 2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy007 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy008
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-ignoreStartupTime范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "sampleCount": 0,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy008 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy009
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-reportTimesPerApp范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 1,
          "reportTimesPerApp": 4,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy009 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy010
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_1900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-多个policy的范围异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": 3,
        },
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 configEventPolicy call successful`);
        expect(false).assertEqual(true);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 configEventPolicy call fail`);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy010 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy011
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- CPU_USAGE_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 11,
          "backgroundLoadThreshold": 22,
          "threadLoadThreshold": 33,
          "perfLogCaptureCount": 44,
          "threadLoadInterval": 55,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy011 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy012
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "foregroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy012 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy013
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- backgroundLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "backgroundLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy013 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy014
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadThreshold范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadThreshold": 101,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy014 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy015
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- perfLogCaptureCount范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "perfLogCaptureCount": -2,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy015 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy016
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- threadLoadInterval范围异常去默认值调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": 3601,
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy016 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy017
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- foregroundLoadThreshold为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy017 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy018
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-cpuUsageHighPolicy- 传入undefied调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': {
          "logType": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy018 end`);
    })

    /**
     * @tc.name   testHiAppEventconfigEventPolicy019
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicyStatic_2800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank- 传入undefied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventconfigEventPolicy019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 start`);
      let policy: hiAppEvent.EventPolicy = {
        'cpuUsageHighPolicy': {
          "threadLoadInterval": undefined
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 configEventPolicy call successful`);
        done();
      }).catch(() => {
        hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 configEventPolicy call fail`);
        expect(false).assertEqual(true);
        done();
      });
      hilog.info(domain, tag, `testHiAppEventconfigEventPolicy019 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000 start`);
      hiAppEvent.configEventPolicy({}).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100 start`);
      let policy: hiAppEvent.EventPolicy = {
        'mainThreadJankPolicy': undefined
        };
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: undefined, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: 1, sampleInterval: undefined, ignoreStartupTime: undefined, sampleCount: undefined, reportTimesPerApp: undefined, autoStopSampling: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {foregroundLoadThreshold: -11}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_1900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-参数正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-cpuUsageHighPolicy所有阈值undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {foregroundLoadThreshold: undefined, backgroundLoadThreshold: undefined, threadLoadThreshold:undefined, perfLogCaptureCount: undefined, threadLoadInterval:undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-cpuUsageHighPolicy仅设置foregroundLoadThreshold=11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: undefined, threadLoadThreshold:undefined, perfLogCaptureCount: undefined, threadLoadInterval:undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy完整配置(logFileCutoffSzBytes=1024)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: 1024}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy完整配置(logFileCutoffSzBytes=-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: -1}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy仅logFileCutoffSzBytes=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {logFileCutoffSzBytes: 0}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy仅logFileCutoffSzBytes=5242880
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {logFileCutoffSzBytes: 5242880}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy设置pageSwitchLogEnable为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_2900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy所有字段为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: undefined, simplifyVmaPrinting: undefined, logFileCutoffSzBytes: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy仅pageSwitchLogEnable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: undefined, simplifyVmaPrinting: undefined, logFileCutoffSzBytes: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy仅extendPcLrPrinting=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: undefined, logFileCutoffSzBytes: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy设置extendPcLrPrinting=true, simplifyVmaPrinting=true, logFileCutoffSzBytes=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: undefined, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: -1}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appFreezePolicy空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appFreezePolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appFreezePolicy为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appFreezePolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appFreezePolicy设置pageSwitchLogEnable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appFreezePolicy: {pageSwitchLogEnable: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appFreezePolicy设置pageSwitchLogEnable为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appFreezePolicy: {pageSwitchLogEnable: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_3900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置pageSwitchLogEnable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置jsHeapLogtype="event"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {jsHeapLogtype: "event"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置jsHeapLogtype="event_rawheap"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {jsHeapLogtype: "event_rawheap"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置pageSwitchLogEnable=true和jsHeapLogtype="event"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置pageSwitchLogEnable为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置pageSwitchLogEnable=undefined和jsHeapLogtype="event"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: "event"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy设置pageSwitchLogEnable=true和jsHeapLogtype=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-addressSanitizerPolicy空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {addressSanitizerPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-addressSanitizerPolicy为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {addressSanitizerPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-addressSanitizerPolicy设置pageSwitchLogEnable=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {addressSanitizerPolicy: {pageSwitchLogEnable: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_4900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-addressSanitizerPolicy设置pageSwitchLogEnable为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {addressSanitizerPolicy: {pageSwitchLogEnable: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-完整配置所有策略（非默认值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: 1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}, cpuUsageHighPolicy: {foregroundLoadThreshold: 11, backgroundLoadThreshold: 22, threadLoadThreshold:33, perfLogCaptureCount: 44, threadLoadInterval:55}, appCrashPolicy: {pageSwitchLogEnable: true, extendPcLrPrinting: true, simplifyVmaPrinting: true, logFileCutoffSzBytes: 1024}, appFreezePolicy: {pageSwitchLogEnable: true}, resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event"}, addressSanitizerPolicy: {pageSwitchLogEnable: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-所有策略为空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-所有策略为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: undefined, appCrashPolicy: undefined, appFreezePolicy: undefined, resourceOverlimitPolicy: undefined, addressSanitizerPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-mainThreadJankPolicy仅logType为undefined，其余策略空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: undefined}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-mainThreadJankPolicy中logType为-1（非法值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: -1, sampleInterval: 100, ignoreStartupTime: 11, sampleCount: 21, reportTimesPerApp: 3, autoStopSampling: false}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy中logFileCutoffSzBytes为-1（非法值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {logFileCutoffSzBytes: -1}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy中logFileCutoffSzBytes为5242881（超出范围）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {logFileCutoffSzBytes: 5242881}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy中pageSwitchLogEnable=true且logFileCutoffSzBytes=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: true, logFileCutoffSzBytes: -1}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-appCrashPolicy中pageSwitchLogEnable=true且logFileCutoffSzBytes=5242881
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {appCrashPolicy: {pageSwitchLogEnable: true, logFileCutoffSzBytes: 5242881}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_5900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy中jsHeapLogtype为"invalid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {jsHeapLogtype: "invalid"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-resourceOverlimitPolicy中pageSwitchLogEnable=true且jsHeapLogtype="invalid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "invalid"}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-mainThreadJankPolicy中logType=-1，其余策略空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: {logType: -1}, cpuUsageHighPolicy: {}, appCrashPolicy: {}, appFreezePolicy: {}, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-混合策略：mainThreadJankPolicy=undefined，appCrashPolicy含非法logFileCutoffSzBytes=-1，appFreezePolicy=undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: {}, appCrashPolicy: {logFileCutoffSzBytes: -1}, appFreezePolicy: undefined, resourceOverlimitPolicy: {}, addressSanitizerPolicy: {}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6300 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-多个策略为undefined，resourceOverlimitPolicy含非法jsHeapLogtype="invalid"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {mainThreadJankPolicy: undefined, cpuUsageHighPolicy: undefined, appCrashPolicy: undefined, appFreezePolicy: undefined, resourceOverlimitPolicy: {jsHeapLogtype: "invalid"}, addressSanitizerPolicy: undefined};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400 configEventPolicy call successful`);
        expect(false).assertTrue()
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400 Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6400 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName为true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {useRefinedLogFileName: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6500 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName为false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {useRefinedLogFileName: false}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6600 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true, useRefinedLogFileName: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6700 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {jsHeapLogtype: "event", useRefinedLogFileName: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6800 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {jsHeapLogtype: "event_rawheap", useRefinedLogFileName: false}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_6900 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: true, jsHeapLogtype: "event", useRefinedLogFileName: false}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7000 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: false, jsHeapLogtype: "event", useRefinedLogFileName: true}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7100 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {useRefinedLogFileName: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7200 end`);
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300
     * @tc.number SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-useRefinedLogFileName组合场景7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let policy: hiAppEvent.EventPolicy = {resourceOverlimitPolicy: {pageSwitchLogEnable: undefined, jsHeapLogtype: undefined, useRefinedLogFileName: undefined}};
      hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        hilog.error(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300 Code: ${err?.code}, message: ${err?.message}`);
        expect(false).assertTrue()
        done();
      });
      hilog.info(domain, tag, `SUB_DFX_DFT_HiviewKit_HiAppEvent_configEventPolicySuccessStatic_7300 end`);
    })

  })
  hilog.info(domain, tag, 'configureTest end');
}