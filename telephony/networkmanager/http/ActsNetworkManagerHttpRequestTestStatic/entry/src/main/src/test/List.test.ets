import httpRequestMethodTest from "./HttpRequestMethod.test";
import httpRequestOptionsTest from "./HttpRequestOptions.test";
import httpRequestDestroyTest from './HttpRequestDestroy.test';
import httpRequestErrorCodeTest from "./HttpRequestErrorCode.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import HttpRequestTestStatic from './HttpRequestTestStatic.test';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    if(isDefaultNet){
        httpRequestMethodTest();
        httpRequestDestroyTest();
        httpRequestErrorCodeTest();
        HttpRequestTestStatic();
    }else{
        EmptyTest();
    }

}
