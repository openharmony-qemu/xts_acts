import statisticsHasNetTest from "./StatisticsPublic.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';

let netHandle = connection.getDefaultNetSync();

export default function testsuite() {
    if(netHandle.netId !=0 &&  netHandle.netId > 100){
        statisticsHasNetTest();
    }else{
        EmptyTest();
    }

}
