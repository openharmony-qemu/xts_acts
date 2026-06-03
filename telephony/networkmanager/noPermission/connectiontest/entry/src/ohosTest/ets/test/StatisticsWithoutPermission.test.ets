import { describe, it, expect,TestType, Size, Level } from '@ohos/hypium';
import { statistics } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`expectTrue failed err: ${JSON.stringify(err)}`);
  };
};
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

export default function StatisticsErrorCodeTest() {
  describe('statisticsNoPermissionTest', () => {

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytesErrCo0900
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_0900
     * @tc.desc   Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytesErrCo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytesErrCo0900';
      console.info(`${caseName} test start`);
      try {
        let uid: number = 1010;
        statistics.getUidRxBytes(uid, (error: BusinessError, stats: number) => {
          if(error){
            console.info(`${caseName} err in `,JSON.stringify(error));
            ExpectTrue(error.code === 201);
          }
          else{
            console.info(`${caseName} GetUidRxBytes success `,JSON.stringify(stats));
            ExpectFail();
          }
          done();
        });
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytesErrCo1000
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_ErrCo_1000
     * @tc.desc   Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytesErrCo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytesErrCo1000';
      console.info(`${caseName} test start`);
      try {
        let uid: number = 1010;
        let stats: number = await statistics.getUidRxBytes(uid);
        console.info(`${caseName} get stats success`,JSON.stringify(stats));
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} err in`,JSON.stringify(err));
        ExpectTrue(err.code === 201);
      }
      done();
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytesErrCo1100
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_1100
     * @tc.desc   Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytesErrCo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytesErrCo1100';
      console.info(`${caseName} test start`);
      try {
        let uid: number = 1010;
        statistics.getUidTxBytes(uid, (error: BusinessError, stats: number) => {
          if(error){
            console.info(`${caseName} err in `,JSON.stringify(error));
            ExpectTrue(error.code === 201);
          }
          else{
            console.info(`${caseName} GetUidTxBytes success `,JSON.stringify(stats));
            ExpectFail();
          }
          done();
        });
      }catch (err){
        console.info(`${caseName} try catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytesErrCo1200
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_ErrCo_1200
     * @tc.desc   Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytesErrCo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytesErrCo1200';
      console.info(`${caseName} test start`);
      try {
        let uid: number = 1010;
        let stats: number = await statistics.getUidTxBytes(uid);
        console.info(`${caseName} get stats success`,JSON.stringify(stats));
        ExpectFail();
      } catch (err) {
        console.info(`${caseName} err in`,JSON.stringify(err));
        ExpectTrue(err.code === 201);
      }
      done();
    });

  })
}


