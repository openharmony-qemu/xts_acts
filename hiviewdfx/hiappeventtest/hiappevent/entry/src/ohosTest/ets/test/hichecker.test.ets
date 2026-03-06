import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, Level } from '@ohos/hypium'
import hichecker from '@ohos.hichecker';

export default function Hichecker() {
  describe('Hichecker', () => {
    /**
     * @tc.name   Hichecker-null
     * @tc.number SUB_Hichecker-null
     * @tc.desc   addRule&contains&removeRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hichecker-null', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Hichecke-rnull  start")
        hichecker.addRule(null);
        console.info("====>Hichecke-rnull  end 01");
        hichecker.contains(null);
        console.info("====>Hichecker-null  end 02");
        hichecker.removeRule(null);
        console.info("====>Hichecker-null  end 03");
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })
    /**
     * @tc.name   Hichecker-undefind
     * @tc.number SUB_Hichecker-undefind
     * @tc.desc   addRule&contains&removeRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker-undefind', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker-undefind  start")
        hichecker.addRule(undefined);
        console.info("====>Hichecker-undefind  end 01");
        hichecker.contains(undefined);
        console.info("====>Hichecker-undefind  end 02");
        hichecker.removeRule(undefined);
        console.info("====>Hichecker-undefind  end 03");
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })
    /**
     * @tc.name   Hichecker01-unll
     * @tc.number SUB_Hichecker01-unll
     * @tc.desc   addCheckRule&removeCheckRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */

    it('Hichecker01', Level.LEVEL2, async (done: Function) => {


      try {
        console.info("====>Hichecker01  start");
        hichecker.addCheckRule(null);
        console.info("====>Hichecker01 end 01");
        hichecker.getRule();
        console.info("====>Hichecker01  end 02");
        hichecker.removeCheckRule(null);
        console.info("====>Hichecker01  end 03");
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }

    })
    /**
     * @tc.name   Hichecker01-undefined
     * @tc.number SUB_Hichecker01-undefined
     * @tc.desc   addCheckRule&removeCheckRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */

    it('Hichecker01-undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01-undefined  start");
        hichecker.addCheckRule(undefined);
        console.info("====>Hichecker01-undefined end 01");
        hichecker.removeCheckRule(undefined);
        console.info("====>Hichecker01-undefined  end 02");
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }

    })

    /**
     * @tc.name   Hichecker02
     * @tc.number SUB_Hichecker02
     * @tc.desc   RULE_CAUTION_TRIGGER_CRASH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker02', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker02  start")
        hichecker.addRule(hichecker.RULE_CAUTION_TRIGGER_CRASH);
        console.info("====>Hichecker02  end 01");
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })
    /**
     * @tc.name   Hichecker03
     * @tc.number SUB_Hichecker03
     * @tc.desc  containsCheckRule函数覆盖 null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker03', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker03  start")
        hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
        console.info("====>Hichecker03  end 01");
        hichecker.containsCheckRule(null);
        console.info("====>Hichecker03  end 01");
        hichecker.containsCheckRule(undefined);
        console.info("====>Hichecker03  end 01");
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })

  })
}