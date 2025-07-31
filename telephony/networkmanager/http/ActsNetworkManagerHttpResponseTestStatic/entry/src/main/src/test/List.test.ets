import HttpResponseCodeTest from "./HttpResponseCode.test";
import HttpResponsePropertiesTest from "./HttpResponseProperties.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    if(isDefaultNet){
        HttpResponseCodeTest();
        HttpResponsePropertiesTest();
    }else{
        EmptyTest();
    }

}
