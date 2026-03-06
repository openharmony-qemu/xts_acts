import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, Level,expect } from '@ohos/hypium'
import hilog from '@ohos.hilog';
export default function Hilog() {
  describe('Hilog', () => {
    /**
     * @tc.name   Hilog-test1
     * @tc.number SUB_Hilog-test1
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilog-test1', Level.LEVEL0, async (done: Function) => {
      let ret = hilog.debug(null, ' ', ' ', null);
      console.error("====>Hilog-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog2-test2
     * @tc.number SUB_Hilog2-test2
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilog-test2', Level.LEVEL0, async (done: Function) => {
      let ret = hilog.debug(undefined, null, null, undefined);
      console.error("====>Hilog-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog-test3
     * @tc.number SUB_Hilog3-test3
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilog-test3', Level.LEVEL0, async (done: Function) => {
      let ret = hilog.debug(undefined, undefined, undefined, undefined);
      console.error("====>Hilog-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog01-test1
     * @tc.number SUB_Hilog01-test1
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.info(null, ' ', ' ', "hello");
      console.error("====>Hilog01-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog01-test2
     * @tc.number SUB_Hilog01-test2
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.info(undefined, null, null, "hello");
      console.error("====>Hilog01-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog01-test3
     * @tc.number SUB_Hilog01-test3
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.info(undefined, undefined, undefined, "hello");
      console.error("====>Hilog01-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog02-test1
     * @tc.number SUB_Hilog02-test1
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.warn(null, '', '', null);
      console.error("====>Hilog02-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog02-test2
     * @tc.number SUB_Hilog02-test2
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.warn(undefined, null, null, undefined);
      console.error("====>Hilog02-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog02-test3
     * @tc.number SUB_Hilog02-test3
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.warn(undefined, undefined, undefined, undefined);
      console.error("====>Hilog02-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog03-test1
     * @tc.number SUB_Hilog03-test1
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.error(null, '', '', null);
      console.error("====>Hilog03-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog03-test2
     * @tc.number SUB_Hilog03-test2
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.error(undefined, null, null, undefined);
      console.error("====>Hilog03-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog03-test3
     * @tc.number SUB_Hilog03-test3
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.error(undefined, undefined, undefined, undefined);
      console.error("====>Hilog03-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog04-test1
     * @tc.number SUB_Hilog04-test1
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.fatal(null, '', '', null);
      console.error("====>Hilog04-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog04-test2
     * @tc.number SUB_Hilog04-test2
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.fatal(undefined, null, null, undefined);
      console.error("====>Hilog04-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog04-test3
     * @tc.number SUB_Hilog04-test3
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.fatal(undefined, undefined, undefined, undefined);
      console.error("====>Hilog04-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog05-test1
     * @tc.number SUB_Hilog05-test1
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.isLoggable(null, '', null);
      console.error("====>Hilog05-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog05-test2
     * @tc.number SUB_Hilog05-test2
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.isLoggable(undefined, null, null);
      console.error("====>Hilog05-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog05-test3
     * @tc.number SUB_Hilog05-test3
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.isLoggable(undefined, undefined, null);
      console.error("====>Hilog05-test3 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog06
     * @tc.number SUB_Hilog06
     * @tc.desc   setMinLogLevel函数覆盖枚举‘DEBUG’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog06', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.setMinLogLevel(hilog.LogLevel.DEBUG);
      console.error("====>Hilog06 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog07-test1
     * @tc.number SUB_Hilog07-test1
     * @tc.desc   setLogLevel函数覆盖枚举‘DEBUG’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07-test1', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.setLogLevel(hilog.LogLevel.DEBUG, hilog.PreferStrategy.PREFER_OPEN_LOG);
      console.error("====>Hilog07-test1 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog07-test2
     * @tc.number SUB_Hilog07-test2
     * @tc.desc   setLogLevel函数覆盖枚举‘INFO’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07-test2', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.setLogLevel(hilog.LogLevel.INFO, hilog.PreferStrategy.PREFER_OPEN_LOG);
      console.error("====>Hilog07-test2 err: " + ret)
      done()
    })
    /**
     * @tc.name   Hilog07-test3
     * @tc.number SUB_Hilog07-test3
     * @tc.desc   setLogLevel函数覆盖枚举‘FATAL’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07-test3', Level.LEVEL2, async (done: Function) => {
      let ret = hilog.setLogLevel(hilog.LogLevel.FATAL, hilog.PreferStrategy.PREFER_OPEN_LOG);
      console.error("====>Hilog07-test3 err: " + ret)
      done()
    })



  })
}