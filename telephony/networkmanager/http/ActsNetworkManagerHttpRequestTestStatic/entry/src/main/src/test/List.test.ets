import HttpRequestMethodTest from "./HttpRequestMethod.test";
import HttpRequestOptionsTest from "./HttpRequestOptions.test";
import HttpRequestDestroyTest from './HttpRequestDestroy.test';
import HttpRequestErrorCodeTest from "./HttpRequestErrorCode.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import HttpRequestTestStatic from './HttpRequestTestStatic.test';
import HttpRequestOnOffTest from "./HttpRequestOn.test";
import HttpRequestOffTest from "./HttpRequestOff.test";

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    if(isDefaultNet){
        HttpRequestMethodTest(); 
        HttpRequestOptionsTest();
        HttpRequestDestroyTest();
        HttpRequestErrorCodeTest();
        HttpRequestTestStatic();
        HttpRequestOnOffTest();
        HttpRequestOffTest();
    }else{
        EmptyTest();
    }

}
