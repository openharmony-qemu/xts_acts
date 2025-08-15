import HttpDeleteTest from "./HttpDelete.test";
import connection from '@ohos.net.connection';
import EmptyTest from './Empty.test';
import HttpResponseCacheTest from './HttpResponseCache.test';

let isDefaultNet: boolean = connection.hasDefaultNetSync();
export default function testsuite() {
    if(isDefaultNet){
        HttpDeleteTest();
        HttpResponseCacheTest();
    }else{
        EmptyTest();
    }
}
